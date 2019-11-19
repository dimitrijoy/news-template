<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/f923eb3594.js"></script>
		<title>Become a source</title>
		<style type="text/css">
			@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro&display=swap');
			@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

			html, body {
				margin: 0;
				padding: 0;
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

			/** SOURCE CSS **/
			#container {
				position: relative;
				min-height: 100%;
			}

			.source-caption-container {
				width: 100%;
			}

			.source-caption {
				padding-bottom: 1.0rem;
			}

			.source-caption h1 {
				text-align: center;
				font-family: 'Montserrat', sans-serif;
				font-size: 1.6rem;
				font-weight: 700;
				color: {{primary_color}};
			}

			.source-container {
				position: absolute;
				top: 12.5rem;
				left: 0;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
				text-align: center;
			}

			#inputSource {
				height: 10.0rem;
			}

			#form {
				width: 30.0rem;
				display: inline-block;
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
			/** END SOURCE CSS **/

			/** SMALL MONITORS **/
			@media only screen and (max-width: 1023px) {
				.source-container {
					padding-left: 10%;
					padding-right: 10%;
				}

				#form {
					width: 25.0rem;
				}
			}

			/** TABLETS (and mobile phones) **/
			@media only screen and (max-width: 799px) {
				.source-container {
					padding-left: 5%;
					padding-right: 5%;
				}

				#form {
					width: 100%;
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

		<!-- SOURCE -->
		<div id="container">
			<div class="source-container">
				<div class="source-caption-container">
					<div class="source-caption">
						<h1>Have insider knowledge of a pressing issue? Let us know anonymously here.</h1>
					</div>
				</div>
				<div class="form-group">
					<textarea name="source" id="inputSource" class="form-control" form="form" required autofocus></textarea>
				</div>
				<form id="form" action="/source" method="post">
              		<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
            	</form>
			</div>
		</div>
		<!-- END SOURCE -->

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>