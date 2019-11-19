from bottle import get, post, redirect, request, response, route, run, static_file, template
import datetime, hashlib, os, sqlite3, uuid

### GLOBALS ###

# news categories
categories = [["Politics", "http://localhost:8080/politics"], ["U. S.", "http://localhost:8080/us"],
	["World", "http://localhost:8080/world"], ["Opinion", "http://localhost:8080/opinion"],
	["Analysis", "Fact Check", "http://localhost:8080/analysis/fact-check","Polling",
	"http://localhost:8080/analysis/polling"]]
# standard colors
colors = {"primary_color": "#111111", "secondary_color": "#b969ff",
	"tertiary_color": "#ffffff", "date_color": "#aaaaaa", "body_color": "#333333"}
cookie_secret = str(uuid.uuid4()) # cookie protection
footer_links = [["Become a source", "/source"], ["Leave a suggestion", "/suggestion"], ["Privacy", "http://localhost:8080/privacy"]]
static_image_path = "img/categories/"

### END GLOBALS ###

# index()
# front page of site
@route("/")
def index():
	# connects to database and pulls most recent articles
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles ORDER BY id DESC")
	fetched_articles = cur.fetchmany(9)

	# pulls corresponding authors
	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	main_story = fetched_articles[0]
	main_author = fetched_authors[0]

	showcase_stories = fetched_articles[1:4]
	showcase_authors = fetched_authors[1:4]

	side_stories = fetched_articles[4:]
	side_authors = fetched_authors[4:]

	del fetched_articles
	del fetched_authors

	return template("index.tpl", colors, categories=categories, footer_links=footer_links, main=main_story,
		main_auth=main_author, showcase=showcase_stories, showcase_auths=showcase_authors,
		side=side_stories, side_auths=side_authors)
# end index()

# get_login()
# allows user to login and upload/edit articles
@get("/login")
def get_login():
	return template("login.tpl", colors, categories=categories)
# end get_login()

# post_login()
# allows user to login and upload/edit articles
@post("/login")
def post_login():
	# retrieves login information
	email = request.forms.get("email")
	password = request.forms.get("password")
	password = hashlib.sha1(password.encode("utf-8")).hexdigest()

	# connects to database and validates login information
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM editors WHERE email = ? AND password = ?", (email, password))
	editor = cur.fetchone()
	conn.close()

	if editor: # login information valid
		response.set_cookie("COOKIEID", email, secret=cookie_secret, httponly=True)
		redirect("/account")
	else: # invalid
		redirect("/login")
# end post_login()

# account()
# displays user account information
@route("/account")
def account():
	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	if editor: # ensure user is logged in
		# connects database and pulls user information
		conn = sqlite3.connect("app.db")
		cur = conn.cursor()

		cur.execute("SELECT * FROM editors WHERE email = ?", (editor,))
		editor_data = cur.fetchone()
		conn.close()

		return template("account.tpl", colors, categories=categories, editor=editor_data)
	else: # user not logged in
		redirect("/login")
# end account()

# get_upload()
# allows user to upload article
@get("/account/upload")
def get_upload():
	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	if editor: # ensures user is logged in
		return template("upload.tpl", colors, categories=categories)
	else: # user not logged in
		return redirect("/login")
# end get_upload()

# post_upload()
# allows user to upload article
@post("/account/upload")
def post_upload():
	# retrieves article information
	cat = request.forms.get("cat")
	title = request.forms.get("title")
	preview = request.forms.get("preview")
	body = request.forms.get("body")
	attribution = request.forms.get("attribution")
	image = request.files.get("image")

	# strips title of whitespace and ensures url contains no invalid characters
	title.strip()
	punctuations = '''!()[]{};:'"\,<>./?@#$%^&*_~'''
	url = ""
	for char in title:
	   if char not in punctuations:
	       url = url + char
	url = url.replace(" ", "-")
	url = url.lower()
	url_legacy = url

	### HANDLES URL (and image path) ###
	save_path = static_image_path
	if cat == "polling" or cat == "fact-check":
		url = "http://localhost:8080/" + "analysis/" + cat + "/" + url
		save_path = save_path + "analysis/"
	else:
		url = "http://localhost:8080/" + cat + "/" + url
	### URL HANDLED ###

	### UPLOADS IMAGE ###
	save_path = save_path + cat
	name, ext = os.path.splitext(image.filename)
	if ext not in ('.png', '.jpg', '.jpeg'):
		return "ERROR: Upload failed. Invalid file extension."
	file_path = "{path}/{file}".format(path=save_path, file=image.filename)
	image.save(file_path)
	old_path = save_path + "/" + name + ext
	name = url_legacy
	new_path = save_path + "/" + name + ext
	os.rename(old_path, new_path)
	image_path = "/static/" + new_path
    ### IMAGE SUCCESSFULLY UPLOADED ###

    ### SETS DATE ###
	date = "{:%B %d, %Y}".format(datetime.datetime.now())
	### DATE SET ###

	### DATABASE HANDLING ###
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	cur.execute("SELECT * FROM editors WHERE email = ?", (editor,))
	editor_data = cur.fetchone()

	editor_id = editor_data[0]
	new_article = (url, title, editor_id, date, preview, body, cat, attribution, image_path)
	del editor_data

	cur.execute("INSERT INTO articles (url, title, id_editor, date, preview, body, cat, attribution, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", new_article)
	conn.commit()
	conn.close()
	### DATABASE HANDLED ###

	return "Upload successful."
# end post_upload()

# edit()
# allows user to select an article to edit
@route("/account/edit")
def edit():
	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	if editor: # ensures user is logged in
		# connects database and pulls user article information
		conn = sqlite3.connect("app.db")
		cur = conn.cursor()

		cur.execute("SELECT * FROM editors WHERE email = ?", (editor,))
		editor_data = cur.fetchone()

		editor_id = editor_data[0]
		cur.execute("SELECT * FROM articles WHERE id_editor = ? ORDER BY id DESC", (editor_id,))
		fetched_articles = cur.fetchall()
		conn.close()

		return template("edit.tpl", colors, categories=categories, articles=fetched_articles)
	else: # user is not logged in
		redirect("/login")
# end edit()

# get_edit_article()
# allows user to edit article
@get("/account/edit/<filename>")
def get_edit_article(filename):
	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	if editor: # ensures user is logged in
		conn = sqlite3.connect("app.db")
		cur = conn.cursor()

		cur.execute("SELECT * FROM articles WHERE id = ?", (filename,))
		fetched_article = cur.fetchone()
		conn.close()

		return template("edit_article.tpl", colors, categories=categories, article=fetched_article)
	else: # user is not logged in
		redirect("/login")
# end get_edit_article()

# post_edit_article()
# allows user to edit article
@post("/account/edit/<filename>")
def post_edit_article(filename):
	editor = request.get_cookie("COOKIEID", secret=cookie_secret)
	if editor: # ensures user is logged in
		title = request.forms.get("title")
		preview = request.forms.get("preview")
		body = request.forms.get("body")
		attribution = request.forms.get("attribution")

		### DOCUMENTATION SAME AS post_upload() ###
		title.strip()
		punctuations = '''!()[]{};:'"\,<>./?@#$%^&*_~'''
		url = ""
		for char in title:
		   if char not in punctuations:
		       url = url + char
		url = url.replace(" ", "-")
		url = url.lower()

		conn = sqlite3.connect("app.db")
		cur = conn.cursor()

		cur.execute("SELECT * FROM articles WHERE id = ?", (filename,))
		fetched_article = cur.fetchone()
		old_path = fetched_article[9].replace("/static/", "")
		extension = old_path[old_path.index("."):]
		new_path = old_path.replace(fetched_article[7] + "/", "")
		new_path = new_path[0:len(static_image_path)] + fetched_article[7] + "/" + url + extension
		os.rename(old_path, new_path)
		image_path = "/static/" + new_path

		if fetched_article[7] == "polling" or fetched_article[7] == "fact-check":
			url = "http://localhost:8080/" + "analysis/" + fetched_article[7] + "/" + url
		else:
			url = "http://localhost:8080/" + fetched_article[7] + "/" + url

		cur.execute("UPDATE articles SET url = ?, title = ?, preview = ?, body = ?, attribution = ?, image = ? WHERE id = ?", (url, title, preview, body, attribution, image_path, filename))
		conn.commit()
		conn.close()

		return "Update successful."
	else: # user not logged in
		redirect("/login")
# end post_edit_article()

### NEWS CATEGORIES ###

# politics()
@route("/politics")
def politics():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('politics',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("politics.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end politics()

# politics_article()
@route("/politics/<filename>")
def politics_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[0][1] + '/' + filename, 'politics'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/politics")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end politics_article()

# us()
@route("/us")
def us():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('us',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("us.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end us()

# us_article()
@route("/us/<filename>")
def us_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[1][1] + '/' + filename, 'us'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/us")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end us_article()

# world()
@route("/world")
def world():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('world',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("world.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end world()

# world_article()
@route("/world/<filename>")
def world_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[2][1] + '/' + filename, 'world'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/world")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end world_article()

# opinion()
@route("/opinion")
def opinion():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('opinion',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("opinion.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end opinion()

# opinion_article()
@route("/opinion/<filename>")
def opinion_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[3][1] + '/' + filename, 'opinion'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/opinion")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end opinion_article()

# fact_check()
@route("/analysis/fact-check")
def fact_checker():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('fact-check',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("fact_check.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end fact_check()

# fact_check_article()
@route("/analysis/fact-check/<filename>")
def fact_checker_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[4][2] + '/' + filename, 'fact-check'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/fact-check")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end fact_check_article()

# polling()
@route("/analysis/polling")
def polling():
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE cat = ? ORDER BY id DESC", ('polling',))
	fetched_articles = cur.fetchall()

	fetched_authors = []
	for fetched_article in fetched_articles:
		cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
		fetched_authors.append(cur.fetchone())
	fetched_authors = tuple(fetched_authors)
	conn.close()

	return template("polling.tpl", colors, categories=categories, footer_links=footer_links, articles=fetched_articles, authors=fetched_authors)
# end polling()

# polling_article()
@route("/analysis/polling/<filename>")
def polling_article(filename):
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("SELECT * FROM articles WHERE url = ? AND cat = ?", (categories[4][4] + '/' + filename, 'polling'))
	fetched_article = cur.fetchone()

	cur.execute("SELECT * FROM editors WHERE id = ?", (fetched_article[3],))
	fetched_author = cur.fetchone()

	cur.execute("SELECT * FROM comments WHERE id_article = ? ORDER BY id DESC", (fetched_article[0],))
	fetched_comments = cur.fetchall()
	conn.close()

	if fetched_article == None:
		redirect("/polling")
	else:
		return template("article.tpl", colors, categories=categories, footer_links=footer_links, article=fetched_article, author=fetched_author, comments=fetched_comments)
# end poling_article()

# comment()
# allows user to comment on article
@post("/comment")
def comment():
	article_id = request.forms.get("article_id")
	name = request.forms.get("name")
	comment = request.forms.get("comment")
	date = "{:%B %d, %Y}".format(datetime.datetime.now())
	
	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("INSERT INTO comments (id_article, name, comment, date) VALUES (?, ?, ?, ?)", (article_id, name, comment, date))
	conn.commit()

	cur.execute("SELECT * FROM articles WHERE id = ?", (article_id,))
	article = cur.fetchone()
	conn.close()

	redirect(article[1])
# end comment()

# privacy()
@route("/privacy")
def privacy():
	return template("privacy.tpl", colors, categories=categories)
# end privacy()

# get_source()
@get("/source")
def get_source():
	return template("source.tpl", colors, categories=categories)
# end get_source()

# post_source()
@post("/source")
def post_source():
	raw_source = request.forms.get("source")

	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("INSERT INTO sources (source) VALUES (?)", (raw_source,))
	conn.commit()
	conn.close()

	return "Thank you!"
# end post_source()

# get_suggestion()
@get("/suggestion")
def get_suggestion():
	return template("suggestion.tpl", colors, categories=categories)
# end get_suggestion()

# post_suggestion()
@post("/suggestion")
def post_suggestion():
	raw_suggestion = request.forms.get("suggestion")

	conn = sqlite3.connect("app.db")
	cur = conn.cursor()

	cur.execute("INSERT INTO suggestions (suggestion) VALUES (?)", (raw_suggestion,))
	conn.commit()
	conn.close()

	return "Thank you!"
# end post_suggestion()

# server_static()
# handles static files
@route("/static/<filepath:path>")
def server_static(filepath):
	return static_file(filepath, root="./")
# end server_static()

# run site
run(host="localhost", port=8080)