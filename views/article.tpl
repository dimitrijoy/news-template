<!DOCTYPE html>
<html lang="en">

	<head>
		<script src="https://kit.fontawesome.com/f923eb3594.js"></script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>{{article[2]}}</title>
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

			/** ARTICLE CSS **/
			#container {
				position: relative;
				min-height: 100%;
			}

			.article-caption-container {
				position: absolute;
				top: 0;
				left: 0;
				display: flex;
				width: 100%;
				height: 20.0rem;
				background-color: {{primary_color}}
			}

			.article-caption {
				padding-left: 20%;
				padding-right: 20%;
				padding-bottom: 1.0rem;
				width: 100%;
				align-self: flex-end;
			}

			.article-caption h1 {
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				font-size: 2.0rem;
				font-weight: 700;
				color: {{tertiary_color}};
			}

			.article-caption h6 {
				font-family: 'Source Code Pro', monospace;
				font-size: 1.0rem;
				color: {{secondary_color}};
			}

			.article-caption h5 {
				font-family: 'Source Code Pro', monospace;
				font-size: 1.0rem;
				color: {{date_color}};
			}

			.article-container {
				position: absolute;
				top: 20.0rem;
				left: 0;
				width: 100%;
				height: 100%;
			}

			#share-bar {
				padding-top: 2.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
			}

			#share-bar a {
				margin-right: 0.5rem;
				width: 3.0rem;
			  	height: 3.0rem;
			  	display: inline-block;
			  	vertical-align: middle;
			  	border-radius: 50%;
			  	opacity: 0.75;
				transition: opacity 0.15s linear;
			  	text-align: center;
			  	font-size: 1.5rem;
			  	line-height: 3.0rem;
			  	color: {{tertiary_color}};
			}

			#share-bar a:hover {
				opacity: 1;
			}

			#share-bar i {
				line-height: inherit;
			}

			.facebook {
			 	background: #3b5998;
			}

			.twitter {
			  	background: #55acee;
			}

			.article-img img {
				object-fit: cover;
				padding-top: 1.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
				height: 25.0rem;
			}

			.article-img h6 {
				padding-top: 0.25rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
				font-family: 'Source Code Pro', monospace;
				font-size: 0.9rem;
				color: {{date_color}};
			}

			.article-body {
				padding-top: 1.0rem;
				padding-bottom: 2.0rem;
				padding-left: 20%;
				padding-right: 20%;
			}

			.article-body h5 {
				line-height: 1.5;
				font-family: 'Roboto', sans-serif;
				font-size: 1.25rem;
				color: {{body_color}};
			}
			/** END ARTICLE CSS **/

			/** COMMENT SECTION CSS **/
			#comment-section-container {
				margin-top: 2.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
			}

			#comment-section-container h2 {
				font-family: 'Montserrat', sans-serif;
				font-weight: 700;
				color: {{primary_color}};
			}

			.comment-divider {
				margin-top: 1.0rem;
				border-bottom: 1px solid {{primary_color}};
			}

			.comment {
				padding: 1.0rem;
				padding-bottom: 0;
			}

			.name-date-container {
				width: 100%;
			}

			.comment h6 {
				font-size: 1.2rem;
			}

			.comment h5 {
				font-family: "Source Code Pro", monospace;
				font-size: 0.75rem;
				color: {{secondary_color}};
			}

			.comment p {
				font-family: 'Roboto', sans-serif;
			}

			#inputName {
				height: 2.25rem;
			}

			#inputComment {
				height: 5.5rem;
			}

			#form {
				width: 10.0rem;
			}

			.btn-primary {
				font-family: 'Montserrat', sans-serif;
				font-weight: 700;
				font-size: 0.95rem;
				border-color:  {{primary_color}};
    			background-color: {{primary_color}};
			}

			.btn-primary:hover, .btn-primary:active, .btn-primary:focus {
				border-color: {{secondary_color}} !important;
				background-color: {{secondary_color}} !important;
			}
			/** END COMMENT SECTION CSS **/

			/** FOOTER CSS **/
			#footer {
				margin-top: 2.0rem;
				width: 100%;
				height: 14.0rem;
				background-color: #f2f2f2;
				font-family: 'Montserrat', sans-serif;
			}

			#logo {
				margin-top: 4.0rem;
			}

			#footer-share-bar {
				padding-top: 0.6rem;
				width: 100%;
			}

			#footer-share-bar a {
				margin-right: 0.5rem;
				text-decoration: none;
			  	font-size: 1.5rem;
			  	color: {{primary_color}};
			}

			#footer-share-bar a:hover {
				color: {{secondary_color}};
			}

			#footer-categories, #footer-links {
				padding: 1.5rem;
				text-align: left;
				font-family: 'Source Pro Code', monospace;
				font-size: 0.9rem;
			}

			#footer-categories a, #footer-links a {
				text-decoration: none;
				color: {{secondary_color}};
			}

			.footer-copyright {
				background-color: {{primary_color}};
				color: {{tertiary_color}};
			}
			/** END FOOTER CSS **/

			/** TABLETS **/
			@media only screen and (max-width: 799px) {
				.article-caption-container {
					height: 30.0rem;
				}

				.article-caption {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				.article-container {
					top: 30.0rem;
				}

				#share-bar {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				.article-img img {
					padding: 0;
					padding-top: 1.0rem;
				}

				.article-img h6 {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				.article-body {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				#comment-section-container {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				#form {
					width: 100%;
				}
			}

			/** MOBILE PHONES **/
			@media only screen and (max-width: 767px) {
				#footer {
					margin-top: 0;
					height: auto;
				}

				#footer-content {
					display: none;
				}
			}
		</style>
	</head>

	<body>
		
		<!-- NAVIGATION -->
		<nav class="navbar fixed-top navbar-dark">
			<a class="navbar-brand" href="/">
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

		<!-- ARTICLE -->
		<div id="container">
			<div class="article-caption-container">
				<div class="article-caption">
					<h1>{{article[2]}}</h1>
					<h6>{{author[3]}} {{author[4]}}</h6>
					<h5>{{article[4]}}</h5>
				</div>
			</div>
			<div class="article-container">
				<div id="share-bar">
					<a class="facebook" href="https://www.facebook.com" target="blank">
						<i class="fab fa-facebook-f"></i>
					</a>
  					<a class="twitter" href="https://twitter.com" target="blank">
  						<i class="fab fa-twitter"></i>
  					</a>
				</div>
				<div class="article-img">
					<img src={{article[9]}}>
					<h6>{{article[8]}}</h6>
				</div>
				<div class="article-body">
					<h5>{{!article[6]}}</h5>
				</div>
				<!-- COMMENT SECTION -->
				<div id="comment-section-container">
					<h2>Comments</h2>
					<div class="comment-divider"></div>
					<div id="comment-input-container">
						<div class="form-group">
		            		<label for="inputComment">Name</label>
		            		<textarea name="name" id="inputName" class="form-control" form="form" required></textarea>
		            	</div>
						<div class="form-group">
		            		<label for="inputComment">Comment</label>
		            		<textarea name="comment" id="inputComment" class="form-control" form="form" required></textarea>
		            	</div>
						<form id="form" action="/comment" method="post" enctype="multipart/form-data">
							<input type="hidden" name="article_id" value={{article[0]}}>
		          			<button class="btn btn-lg btn-primary btn-block" type="submit">Comment</button>
						</form>
					</div>
					<div id="comment-container">
						% for comment in comments:
						<div class="comment-divider"></div>
						<div class="comment">
							<h6>{{comment[2]}}</h6>
							<h5>{{comment[4]}}</h5>
							<p>{{comment[3]}}</p>	
						</div>
						% end
					</div>
				</div>
				<!-- END COMMENT SECTION -->
				<!-- FOOTER -->
				<footer id="footer" class="page-footer">
		  			<div id="footer-content" class="container-fluid text-center">
						<div class="row">
					    	<div id="footer-logo" class="col-md-6 mt-md-0 mt-3">
					        	<a href="/">
			        				<img id="logo" src="/static/img/logos/footer_logo.png" width="256" height="32">
			        			</a>
			        			<div id="footer-share-bar">
									<a href="https://www.instagram.com">
										<i class="fab fa-instagram"></i>
									</a>
				  					<a href="https://twitter.com">
				  						<i class="fab fa-twitter"></i>
				  					</a>
				  					<a href="/">
				  						<i class="fas fa-envelope"></i>
				  					</a>
								</div>
					      	</div>
					      	<div id="footer-categories" class="col-md-3 mb-md-0 mb-3">
						        <ul class="list-unstyled">
						        	% for category in categories:
						        	% if category[0] == "Analysis":
						        	<li>
						            	<a href={{category[2]}}>{{category[1]}}</a>
						          	</li>
						          	<li>
						            	<a href={{category[4]}}>{{category[3]}}</a>
						          	</li>
						          	% else:
						          	<li>
						            	<a href={{category[1]}}>{{category[0]}}</a>
						          	</li>
						          	% end
						          	% end
						        </ul>
					      	</div>
					      	<div id="footer-links" class="col-md-3 mb-md-0 mb-3">
						        <ul class="list-unstyled">
						        	% for link in footer_links:
						          	<li>
						            	<a href={{link[1]}}>{{link[0]}}</a>
						          	</li>
						          	% end
						        </ul>
					      	</div>
					    </div>
					</div>
					<div class="footer-copyright text-center py-3">© 2019 News</div>
				</footer>
				<!-- END FOOTER -->
			</div>		
		</div>
		<!-- END ARTICLE -->

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>