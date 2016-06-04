<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link href="templatemo_style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="js/jquery.localscroll-min.js"></script>
<script type="text/javascript" src="js/init.js"></script>

<link rel="stylesheet" href="style/slimbox2.css" type="text/css"
	media="screen" />
<script type="text/JavaScript" src="js/slimbox2.js"></script>

<link rel="stylesheet" href="style/default.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="style/nivo-slider.css" type="text/css"
	media="screen" />

<link rel="stylesheet" href="style/styles.css" type="text/css" />
</head>
<body>

	<div id="templatemo_wrapper">

		<div id="templatemo_header">
			<div id="site_title">
				<a title="Secure Mail"> Secure Mail</a>
			</div>
		</div>

		<div id="templatemo_menu">
			<ul class="nav_menu">
				<li><a href="#home">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
			<div id="tabs">
				<ul>
					<li><a
						href="<%=response.encodeUrl(request.getContextPath()
					+ "/Controller?action=login")%>"><span>Login</span></a></li>
					<li><a
						href="<%=response.encodeUrl(request.getContextPath()
					+ "/Controller?action=adminlogin")%>"><span>Admin</span></a></li>
				</ul>
			</div>

			<div class="clear h10"></div>
			<div id="templatemo_footer">
				Copyright © 2014 <a href="#">UCET,IUB, Bahawalpur</a>
			</div>
		</div>

		<div id="templatemo_main">
			<div id="content">
				<div id="home" class="section">
					<div class="slider-wrapper theme-orman">
						<div class="ribbon"></div>
						<div id="slider" class="nivoSlider">
							<img src="images/slider/1.jpg" alt="photo 1"
								title="Welcome to Secure Mail" /> <img
								src="images/slider/2.jpg" alt="photo 2"
								title="Transfering Emails in safe way" /> <img
								src="images/slider/3.jpg" alt="photo 3"
								title="Easy Emails coverage" /> <img src="images/slider/4.jpg"
								alt="photo 4" title="Block Malicious Emails" /> <img
								src="images/slider/5.jpg" alt="photo 5"
								title="Filtering Email Contents" />
						</div>
						<div id="htmlcaption1" class="nivo-html-caption">
							Credit goes to <a href="http://dev7studios.com/nivo-slider"
								target="_blank">Nivo Slider</a>
						</div>
						<div id="htmlcaption2" class="nivo-html-caption">
							Download <a href="http://www.templatemo.com/page/2">Free
								Templates</a> for your websites!
						</div>
					</div>
					<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
					<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
					<script type="text/javascript">
						$(window).load(function() {
							$('#slider').nivoSlider({
								directionNav : false,
								controlNav : false,
								duration : 800
							});
						});
					</script>
				</div>
				<div class="section section_with_padding" id="about">
					<div class="h20"></div>
					<h2>About Us</h2>
					<div class="half left">
						<p align="justify">
							<em> Meet with Developers Team using following links:<br />
								Rao Muhammad Umer: engr.raoumer943@gmail.com<br /> Hussain
								Ahmad Madni: <br /> Tayyab Islam: <br /> Awais Anwar: <br />

							</em>
						</p>
					</div>
					<div class="half right">
						<ul id="social_links">
							<li><a href="https://www.facebook.com" class="facebook">Facebook</a></li>
							<li><a href="https://www.flickr.com" class="flickr">Flickr</a></li>
							<li><a href="https://www.skype.com" class="skype">Skype</a></li>
							<li><a href="https://www.twitter.com" class="twitter">Twitter</a></li>
							<li><a href="https://www.youtube.com" class="youtube">Youtube</a></li>
							<li><a href="https://vimeo.com" class="vimeo">Vimeo</a></li>
						</ul>
					</div>
					<a href="#home" class="home_btn">home</a> <a href="#home"
						class="page_nav_btn previous">Previous</a> <a href="#services"
						class="page_nav_btn next">Next</a>
				</div>
				<div class="section section_with_padding" id="services">
					<h1>Services</h1>

					<div class="half left">
						<p>The objectives of Secure Mail are to suspect the E-mails
							which consist of offensive, harmful, anti-social elements and
							block them which help in identifying the suspicious user.</p>
						<p>
							<b><h2>
									<i>Key features:</i>
								</h2></b> <b><h3>Easy-to-use web-based email:</h3></b>Read & compose
							email on the web using your computer. <b><h3>No
									third-party advertising:</h3></b> We don't scan your emails to sell
							advertising to other companies.
						</p>
					</div>

					<div class="half right">
						<ul class="list_bullet">
							<li>Security of the your system</li>
							<li>Security of your personal emails infomation</li>
							<li>Reduce Anti-social activites</li>
							<li>Discard useless emails</li>
						</ul>

					</div>

					<a href="#home" class="home_btn">home</a> <a href="#about"
						class="page_nav_btn previous">Previous</a> <a href="#contact"
						class="page_nav_btn next">Next</a>

				</div>

				<div class="section section_with_padding" id="contact">
					<div class="h20"></div>
					<div class="half left">
						<h3>Contact Us</h3>
						<div id="contact_form">

							<form method="post" name="contact" action="">

								<div class="left">
									<label for="author">Name:</label> <input name="author"
										type="text" class="input_field" id="author" maxlength="40" />
								</div>

								<div class="right">
									<label for="email">Email:</label> <input name="email"
										type="text" class="input_field" id="email" maxlength="40" />
								</div>

								<div class="clear"></div>
								<label for="text">Message:</label>
								<textarea id="text" name="text" rows="0" cols="0"></textarea>

								<div class="clear"></div>
								<input type="submit" class="submit_btn" name="submit"
									id="submit" value="Send" /> &nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" class="submit_btn" name="reset" id="reset"
									value="Reset" />

							</form>

						</div>
					</div>

					<div class="half right">
						<h3>Our Address</h3>
						The Islamia University of Bahawalpur<br /> Punjab, Pakistan.

						<div class="clear h10"></div>
						<div class="img_nom img_border">
							<iframe width="360" height="190" frameborder="0" scrolling="no"
								marginheight="0" marginwidth="0"
								src="https://www.google.com/maps/place/Islamia+University+Bahawalpur/@29.377989,71.759282,17z/data=!3m1!4b1!4m2!3m1!1s0x393b91d700eac173:0x1bc6048ec98cce78?hl=en-US;output=embed"></iframe>
						</div>
						<a href="#home" class="home_btn">home</a> <a href="#services"
							class="page_nav_btn previous">Previous</a> <a href="#home"
							class="page_nav_btn next">Next</a>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>