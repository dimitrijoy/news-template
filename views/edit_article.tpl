<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Edit article</title>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

			html, body {
				margin: 0;
				height: 100%;
			}

			/** NAVIGATION CSS **/
			.navbar {
				text-transform: uppercase;
				font-weight: 700;
				letter-spacing: 0.01rem;
				background-color: {{primary_color}};
			}

			.navbar-nav li {
				padding: 0.7rem;
			}

			.navbar-dark .navbar-nav .nav-link {
				color: {{tertiary_color}};
			}

			.navbar-dark .navbar-nav .nav-link:hover {
				color: {{secondary_color}};
			}

			.navbar-dark .navbar-nav .dropdown-menu {
				background-color: {{primary_color}};
 			}

 			.navbar-dark .navbar-nav .dropdown-menu .dropdown-item {
 				font-weight: 700;
 				color: {{tertiary_color}};
 			}

 			.navbar-dark .navbar-nav .dropdown-menu .dropdown-item:hover {
 				color: {{primary_color}};
 			}
			/** END NAVIGATION CSS **/

			/** EDIT ARTICLE CSS **/
			#container {
				position: relative;
				min-height: 100%;
			}

			.edit-article-caption {
				position: absolute;
				top: 0;
				left: 0;
				display: flex;
				width: 100%;
				height: 10.0rem;
				background-color: {{primary_color}};
			}

			.edit-article-caption h1 {
				padding: 1.0rem;
				padding-left: 30%;
				width: 100%;
				align-self: flex-end;
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				font-size: 3.5rem;
				font-weight: 700;
				color: {{tertiary_color}};
			}

			.edit-article-container {
				position: absolute;
				top: 10.0rem;
				left: 0;
				padding-top: 1.5rem;
				padding-bottom: 2.0rem;
				padding-left: 30%;
				padding-right: 30%;
				width: 100%;
			}

			#form {
				padding-top: 0.75rem;
				width: 100%;
			}

			.form-group {
				padding-top: 1.0rem;
				width: 100%;
			}

			label {
				font-family: 'Montserrat', sans-serif;
				font-size: 1.2rem;
				font-weight: 700;
				color: {{primary_color}};
			}

			.form-group textarea {
				min-height: 2.25rem;
				overflow-y: scroll;
				resize: vertical;
				font-family: 'Roboto', sans-serif;
				color: {{body_color}};
			}

			.form-control {
				width: 100%;
			}

			#inputURL {
				height: 2.25rem;
			}

			#inputCat {
				height: 2.25rem;
			}

			#inputTitle {
				height: 2.25rem;
			}

			#inputPreview {
				height: 4.0rem;
			}

			#inputBody {
				height: 5.5rem;
			}

			#uploadImage {
				padding-bottom: 1.5rem;
			}

			#inputAttribution {
				height: 2.25rem;
			}

			.btn-primary {
				font-family: 'Montserrat', sans-serif;
				font-weight: 700;
				border-color:  {{primary_color}};
    			background-color: {{primary_color}};
			}

			.btn-primary:hover, .btn-primary:active, .btn-primary:focus {
				border-color: {{secondary_color}} !important;
				background-color: {{secondary_color}} !important;
			}
			/** END EDIT ARTICLE CSS **/

			/** SMALL MONITORS **/
			@media only screen and (max-width: 1023px) {
				.edit-article-caption h1 {
					padding-left: 20%;
					padding-right: 20%;
				}

				.edit-article-container {
					padding-left: 20%;
					padding-right: 20%;
				}
			}

			/** TABLETS **/
			@media only screen and (max-width: 799px) {
				.edit-article-caption h1 {
					padding-left: 5%;
					padding-right: 5%;
				}

				.edit-article-container {
					padding-left: 5%;
					padding-right: 5%;
				}
			}
		</style>
	</head>

	<body>

		<!-- NAVIGATION -->
		<nav class="navbar fixed-top navbar-dark">
			<a class="navbar-brand" href="http://localhost:8080/">
    			<img src="/static/img/logos/header_logo.png" width="256" height="32" alt="">
  			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					% for category in categories:
					% if category[0] == "Analysis":
					<li class="nav-item dropdown">
        				<a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{category[0]}}</a>
        				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          					<a class="dropdown-item" href={{category[2]}}>{{category[1]}}</a>
          					<a class="dropdown-item" href={{category[4]}}>{{category[3]}}</a>
        				</div>
      				</li>
					% else:
					<li class="nav-item">
						<a class="nav-link" href={{category[1]}}>{{category[0]}}</a>
					</li>
					% end
					% end
				</ul>
			</div>
		</nav>
		<!-- END NAVIATION -->

		<!-- EDIT ARTICLE -->
		<div id="container">
			<div class="edit-article-caption">
				<h1>Edit article</h1>
			</div>
			<div class="edit-article-container">
				<div class="form-group">
					<label for="inputTitle">Title</label>
					<textarea name="title" id="inputTitle" class="form-control" form="form" required>{{article[2]}}</textarea>
				</div>
				<div class="form-group">
					<label for="inputPreview">Preview</label>
            		<textarea name="preview" id="inputPreview" class="form-control" form="form" required>{{article[5]}}</textarea>
            	</div>
            	<div class="form-group">
            		<label for="inputBody">Body</label>
            		<textarea name="body" id="inputBody" class="form-control" form="form" required>{{article[6]}}</textarea>
            	</div>
            	<div class="form-group">
            		<label for="inputAttribution">Image Attribution</label>
            		<textarea name="attribution" id="inputAttribution" class="form-control" form="form" required>{{article[8]}}</textarea>
            	</div>
            	% link = "http://localhost:8080/account/edit/" + str(article[0])
          		<form id="form" action={{link}} method="post" enctype="multipart/form-data">
          			<button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
				</form>
			</div>
		</div>
		<!-- END EDIT ARTICLE -->

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>