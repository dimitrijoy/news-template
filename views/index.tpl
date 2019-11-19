<!DOCTYPE html>
<html lang="en">

	<head>
		<script src="https://kit.fontawesome.com/f923eb3594.js"></script>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>News</title>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

			html, body {
				margin: 0;
				padding: 0;
				height: 100%;
				min-height: 100%;
			}

			body {
				font-family: 'Montserrat', sans-serif;
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

			/** MAIN STORY CSS **/
			#container {
				position: relative;
  				min-height: 100%;
			}

			.ms-container {
				position: absolute;
				top: 0;
				left: 0;
			  	width: 100%;
			  	height: 35.0rem;
			}

			.ms-wrap {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				clip: rect(0, auto, auto, 0);
			}

			.ms-inner {
				position: absolute;
  				top: 0;
  				left: 0;
  				width: 100%;
  				height: 100%;
  				background-position: center center;
  				background-size: cover;
				background-image: linear-gradient(rgba(0,0,0,0), rgba(0,0,0,1)), url({{main[9]}});
			}

			.caption {
				position: absolute;
				bottom: 0;
				left: 0;
				padding-bottom: 2.0rem;
				padding-left: 10%;
				padding-right: 10%;
				max-width: 60%;
				max-height: 100%;
				text-transform: uppercase;
			}

			.caption .nav-link h1 {
				font-size: 2.2rem;
				font-weight: 700;
				color: {{tertiary_color}};
			}

			.caption h6 {
				padding-left: 1.0rem;
				font-family: 'Source Code Pro', monospace;
				font-size: 1.0rem;
				color: {{secondary_color}};
			}
			/** END MAIN STORY CSS **/

			/** TOP STORIES CSS **/
			.ts-caption {
				position: absolute;
				top: 35.0rem;
				left: 0;
				padding-top: 1.0rem;
				padding-left: 10%;
				padding-right: 10%;
				width: 100%;
				height: 3.5rem;
				text-transform: uppercase;
			}

			.ts-caption h1 {
				text-align: left;
				font-size: 3.5rem;
				font-weight: 700;
				color: {{primary_color}};
			}

			.ts-container {
				position: absolute;
				top: 41.0rem;
				left: 0;
				padding-left: 10%;
				padding-right: 10%;
				width: 100%;
				height: 100%;
			}

			.ts-showcase-container {
				width: 75%;
				height: 100%;
				float: left;
			}

			.ts-showcase {
				margin-bottom: 2.0rem;
				width: 100%;
				height: 20.0rem;
			}

			.ts-showcase a {
				text-decoration: none;
			}

			.ts-showcase-thumbnail img {
				object-fit: cover;
				width: 50%;
				max-width: 50%;
				height: 20.0rem;
				float: left;
				border: 0.25rem solid;
				border-radius: 0;
				border-color: {{secondary_color}};
			}

			.ts-showcase-caption {
				width: 50%;
				height: 20.0rem;
				padding-left: 1.0rem;
				float: left;
			}

			.ts-showcase-caption h1 {
				font-size: 1.7rem;
				font-weight: 700;
				text-transform: uppercase;
				color: {{primary_color}};
			}

			.ts-showcase-caption h6 {
				font-family: 'Source Code Pro', monospace;
				font-size: 0.9rem;
				text-transform: uppercase;
				color: {{secondary_color}};
			}

			.ts-showcase-caption h5 {
				line-height: 1.5rem;
				font-family: 'Roboto', sans-serif;
				font-size: 1.0rem;
				color: {{primary_color}};
			}

			.ts-side-container {
				padding-left: 1.0rem;
				width: 25%;
				float: right;
			}

			.ts-side {
				padding-bottom: 1.0rem;
				width: 100%;
				height: 100%;
			}

			.ts-side a {
				text-decoration: none;
			}

			.ts-side-thumbnail {
				padding-bottom: 0.5rem;
			}

			.ts-side-thumbnail img {
				width: 10.0rem;
				height: 7.0rem;
				object-fit: cover;
				border: 0.125rem solid;
				border-radius: 0;
				border-color: {{secondary_color}};
			}

			.ts-side-caption {
				padding-bottom: 0.5rem;
			}

			.ts-side-caption h1 {
				font-size: 1.0rem;
				font-weight: 700;
				color: {{primary_color}};
			}

			.ts-side-caption h6 {
				font-family: 'Source Code Pro', monospace;
				font-size: 0.8rem;
				color: {{secondary_color}};
			}
			/** TOP STORIES CSS END **/

			/** FOOTER CSS **/
			#footer {
				position: absolute;
				top: calc({{len(showcase)}} * 22.0rem + 41.0rem);
				left: 0;
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

			#footer-mobile {
				width: 100vw;
			}
			/** END FOOTER CSS **/

			/** MEDIUM MONITORS **/
			@media only screen and (max-width: 1367px) {
				.ts-side-container {
					display: none;
				}

				.ts-showcase-container {
					width: 100%;
				}

				#footer-mobile {
					margin-left: -12.5%;
					display: inline-block;
				}
			}

			/** HANDLES MOBILE FOOTER **/
			@media only screen and (min-width: 1024px) {
				#footer-mobile {
					display: none;
				}
			}

			/** SMALL MONITORS **/
			@media only screen and (max-width: 1023px) {
				.caption {
					max-width: 100%;
				}

				.ts-caption h1 {
					text-align: center;
				}

				.ts-showcase {
					height: auto;
				}

				.ts-showcase-thumbnail img {
					margin-bottom: 0.5rem;
					width: 100%;
					max-width: 100%;
				}

				.ts-showcase-caption {
					padding-left: 0;
					padding-bottom: 2.0rem;
					width: 100%;
					height: 100%;
				}

				#footer {
		        	display: none;
		        }
			}

			/** MOBILE PHONES **/
			@media only screen and (max-width: 767px) {
			    .caption {
			        padding-left: 2.5%;
			        padding-right: 2.5%;
			    }

			    .ts-caption {
			        padding-left: 2.5%;
			        padding-right: 2.5%;
			    }

			    .ts-caption h1 {
			        font-size: 3.25rem;
			    }

			    .ts-container {
			        padding-left: 5%;
			        padding-right: 5%;
		        }

		        #footer-mobile {
		        	margin-left: -5.625%;
		        }
		    }
		</style>

	</head>

	<body>

		<!-- NAVIGATION -->
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
			<a class="navbar-brand" href="http://localhost:8080/">
    			<img src="/static/img/logos/header_logo.png" width="256" height="32" alt="">
  			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
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
		<!-- END NAVIGATION -->

		<div id="container">
			<!-- MAIN STORY -->
			<div class="ms-container">
				<div class="ms-wrap">
					<div class="ms-inner">
						<div class="caption text-left">
							<a class="nav-link" href={{main[1]}}><h1>{{main[2]}}</h1></a>
							<h6>{{main_auth[3]}} {{main_auth[4]}}</h6>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN STORY -->

			<!-- TOP STORIES -->
			<div class="ts-caption">
				<h1>Top Stories</h1>
			</div>
			<div class="ts-container">
				<div class="ts-showcase-container">
					% for story, auth in zip(showcase, showcase_auths):
					<div class="ts-showcase">
						<div class="ts-showcase-thumbnail">
							<a href={{story[1]}}>
								<img src={{story[9]}}>
							</a>
						</div>
						<div class="ts-showcase-caption">
								<a href={{story[1]}}><h1>{{story[2]}}</h1></a>
								<h6>{{auth[3]}} {{auth[4]}}</h6>
								<h5>{{story[5]}}</h5>
						</div>
					</div>
					% end
					<div id="footer-mobile" class="footer-copyright text-center py-3">© 2019 News</div>
				</div>
				<div class="ts-side-container">
					% for story, auth in zip(side, side_auths):
					<div class="ts-side">
						<div class="ts-side-thumbnail">
							<a href={{story[1]}}>
								<img src={{story[9]}}>
							</a>
						</div>
						<div class="ts-side-caption">
							<a href={{story[1]}}><h1>{{story[2]}}</h1></a>
							<h6>{{auth[3]}} {{auth[4]}}</h6>
						</div>
					</div>
					% end
				</div>
			</div>
			<!-- END TOP STORIES -->
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

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>