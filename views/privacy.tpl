<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://kit.fontawesome.com/f923eb3594.js"></script>
		<title>Privacy Policy</title>
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

			/** PRIVACY CSS **/
			#container {
				position: relative;
				min-height: 100%;
			}

			#privacy-caption {
				position: absolute;
				top: 0;
				left: 0;
				display: flex;
				width: 100%;
				height: 10.0rem;
				background-color: {{primary_color}};
			}

			#privacy-caption h1 {
				padding: 1.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
				align-self: flex-end;
				text-transform: uppercase;
				font-family: 'Montserrat', sans-serif;
				font-size: 2.8rem;
				font-weight: 700;
				color: {{tertiary_color}};
			}

			#privacy-content {
				position: absolute;
				top: 10.0rem;
				left: 0;
				padding-top: 1.0rem;
				padding-left: 20%;
				padding-right: 20%;
				width: 100%;
				font-family: 'Roboto', sans-serif;
			}
			/** END PRIVACY CSS **/

			/** SMALL MONITORS **/
			@media only screen and (max-width: 1023px) {
				#privacy-caption h1 {
					padding-left: 5%;
					padding-right: 5%;
				}

				#privacy-content {
					padding-left: 5%;
					padding-right: 5%;
				}
			}

			/** TABLETS **/
			@media only screen and (max-width: 799px) {
				#privacy-caption h1 {
					padding-left: 2.5%;
					padding-right: 2.5%;
				}

				#privacy-content {
					padding-left: 2.5%;
					padding-right: 2.5%;
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

		<!-- PRIVACY -->
		<div id="container">
			<div id="privacy-caption">
				<h1>Privacy Policy</h1>
			</div>
			<div id="privacy-content">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac felis donec et odio pellentesque diam volutpat commodo. Aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat. Justo eget magna fermentum iaculis. Id diam vel quam elementum pulvinar etiam non quam lacus. Pellentesque sit amet porttitor eget dolor morbi. Arcu bibendum at varius vel. Nec dui nunc mattis enim ut. Varius morbi enim nunc faucibus a pellentesque sit. Scelerisque purus semper eget duis at tellus at. Vitae proin sagittis nisl rhoncus mattis rhoncus. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis. Consequat mauris nunc congue nisi vitae suscipit tellus. Vel quam elementum pulvinar etiam non. Ac orci phasellus egestas tellus. Dui nunc mattis enim ut tellus.</p>

				<h2>Pellentesque elit</h2>
				<p>Tempor nec feugiat nisl pretium fusce id velit. Sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Diam sit amet nisl suscipit adipiscing. Id consectetur purus ut faucibus pulvinar. Dolor sit amet consectetur adipiscing elit ut. Eget sit amet tellus cras. Diam in arcu cursus euismod quis viverra nibh cras pulvinar. Lobortis feugiat vivamus at augue eget.</p>
				
				<h2>Aliquam</h2>
				<p>Molestie nunc non blandit massa enim nec dui. Tempor nec feugiat nisl pretium fusce id velit ut. Potenti nullam ac tortor vitae purus faucibus ornare suspendisse. Egestas sed tempus urna et pharetra pharetra massa massa ultricies. Sit amet facilisis magna etiam tempor orci. Venenatis cras sed felis eget velit. Viverra adipiscing at in tellus integer feugiat scelerisque. Nunc congue nisi vitae suscipit. Donec pretium vulputate sapien nec sagittis aliquam malesuada bibendum. Nibh ipsum consequat nisl vel pretium lectus quam id. Diam sollicitudin tempor id eu nisl.</p>

				<h2>Quis vel eros</h2>
				<p>Sed augue lacus viverra vitae congue eu consequat ac felis. Elementum nisi quis eleifend quam adipiscing vitae. Tellus molestie nunc non blandit massa enim. Sit amet tellus cras adipiscing enim eu turpis egestas. Et malesuada fames ac turpis egestas. Tempor nec feugiat nisl pretium. Et malesuada fames ac turpis egestas. Pretium lectus quam id leo. Tortor vitae purus faucibus ornare suspendisse sed. Amet mattis vulputate enim nulla aliquet porttitor. Scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Nisi quis eleifend quam adipiscing vitae. Non curabitur gravida arcu ac. Pulvinar sapien et ligula ullamcorper malesuada proin. Eget gravida cum sociis natoque penatibus et. Quam vulputate dignissim suspendisse in est ante in. Urna duis convallis convallis tellus. Facilisi morbi tempus iaculis urna id volutpat. Nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus.</p>
				
				<h2>Quam elementum</h2>
				<p>Vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra. Enim ut tellus elementum sagittis vitae et leo duis. Nec sagittis aliquam malesuada bibendum arcu vitae elementum. At quis risus sed vulputate odio ut. Posuere morbi leo urna molestie at elementum eu. Malesuada fames ac turpis egestas integer eget. Orci a scelerisque purus semper eget duis at. Nunc lobortis mattis aliquam faucibus purus. Eget duis at tellus at. Erat nam at lectus urna duis.</p>
			</div>
		</div>
		<!-- END PRIVACY -->

		<!-- START SCRIPTS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<!-- END SCRIPTS -->

	</body>

</html>
					