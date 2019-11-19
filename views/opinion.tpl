<!DOCTYPE html>
<html lang="en">

	<head>
		<script src="https://kit.fontawesome.com/f923eb3594.js"></script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Opinion</title>
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

			/** OPINION CSS **/
			#container {
				position: relative;
				min-height: 100%;
			}

			.cat-caption {
				position: absolute;
				top: 0;
				left: 0;
				display: flex;
				width: 100%;
				height: 10.0rem;
				background-color: {{primary_color}};
			}

			.cat-caption h1 {
				padding: 1.0rem;
				padding-left: 20%;
				align-self: flex-end;
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				font-size: 3.5rem;
				font-weight: 700;
				color: {{tertiary_color}};
			}

			.cat-story-container {
				position: absolute;
				top: 10.0rem;
				left: 0;
				padding-top: 2.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
			}

			.cat-story-container a {
				text-decoration: none;
			}

			.cat-story {
				width: 100%;
			}

			.cat-story-caption {
				padding-right: 1.0rem;
				width: 50%;
				height: 20.0rem;
				float: left;
			}

			.cat-story-caption h1 {
				text-transform: uppercase;
				font-size: 1.6rem;
				font-weight: 700;
				color: {{primary_color}};
			}

			.cat-story-caption h6 {
				font-family: 'Source Code Pro', monospace;
				font-size: 0.9rem;
				color: {{secondary_color}};
			}

			.cat-story-caption h5 {
				font-family: 'Roboto', sans-serif;
				font-size: 1.0rem;
				line-height: 1.5rem;
				color: {{primary_color}};
			}

			.cat-story-thumbnail img {
				width: 50%;
				height: 20.0rem;
				float: right;
				object-fit: cover;
				border: 0.25rem solid;
				border-radius: 0;
				border-color: {{secondary_color}};
			}

			.cat-story-divider {
				margin-bottom: 2.0rem;
				width: 100%;
				height: 2.0rem;
				float: left;
				border-bottom: 1px solid {{primary_color}};
			}
			/** END OPINION CSS **/

			/** FOOTER CSS **/
			#footer {
				position: absolute;
				top: calc({{len(articles)}} * 24.0rem + 12.0rem);
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

			/** SMALL MONITORS **/
			@media only screen and (max-width: 1023px) {
				.cat-caption h1 {
					padding-left: 15%;
				}

				.cat-story-container {
					padding-left: 15%;
					padding-right: 15%;
				}

				.cat-story-caption {
					width: 60%;
				}

				.cat-story-thumbnail img {
					width: 40%;
					height: 15.0rem;
				}
			}

			/** TABLETS **/
			@media only screen and (max-width: 799px) {
				.cat-caption h1 {
					padding-left: 10%;
				}

				.cat-story-container {
					padding-left: 10%;
					padding-right: 10%;
				}

				.cat-story-caption {
					width: 70%;
				}

				.cat-story-thumbnail img {
					width: 30%;
					height: 10.0rem;
				}
			}

			/** MOBILE PHONES **/
			@media only screen and (max-width: 767px) {
				.cat-caption h1 {
					padding-left: 5%;
				}

				.cat-story-container {
					padding-left: 5%;
					padding-right: 5%;
				}

				.cat-story-caption {
					width: 100%;
				}

				.cat-story-thumbnail img {
					display: none;
				}

				.cat-story-divider {
					height: 0;
				}

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

		<!-- OPINION -->
		<div id="container">
			<div class="cat-caption">
				<h1>Opinion</h1>
			</div>
			<div class="cat-story-container">
				% for article, author in zip(articles, authors):
				<div class="cat-story">
					<div class="cat-story-caption">
						<a href={{article[1]}}><h1>{{article[2]}}</h1></a>
						<h6>{{author[3]}} {{author[4]}} &#8212; {{article[4]}}</h6>
						<h5>{{article[5]}}</h5>
					</div>
					<div class="cat-story-thumbnail">
						<a href={{article[1]}}>
							<img src={{article[9]}}>
						</a>
					</div>
					<div class="cat-story-divider"></div>
				</div>
				% end
			</div>
			<!-- FOOTER -->
			<footer id="footer" class="page-footer">
	  			<div id="footer-content" class="container-fluid text-center">
					<div class="row">
				    	<div id="footer-logo" class="col-md-6 mt-md-0 mt-3">
				        	<a href="http://localhost:8080/">
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
		<!-- END OPINION -->

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>