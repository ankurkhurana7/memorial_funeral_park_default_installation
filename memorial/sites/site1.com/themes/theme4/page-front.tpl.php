<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="<?php print $language->language ?>" xml:lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">


	<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title><?php print $head_title ?></title>
 <?php print $head; ?>
<!--<title>Welcome to Memorial Park Funeral Home and Cemetery </title> -->
<meta name="google-site-verification" content="JCLMHXSylSarLZtjGJHXYYnjXLDPm3lS4LtlL6bCfHk">
<?php print $styles ?>
<?php print $scripts ?>
	</head>
	<body class="<?php print $body_classes; ?>">
	<?php $path_to_theme = base_path().path_to_theme(); ?>
		<div id="wrapper">
		<div id="header">
			
				<div class="top">
					<div id="logo">
						<img src="<?php print($path_to_theme); ?>/images/logo.gif" alt="logo"/>
					</div>
					<div class="featured">
						<ul>
							<li><a class="contact" href="#">Contact Us</a></li>
							<li><a class="gift" href="#">Free Gift</a></li>
						</ul>						
					</div>
				</div>
				<?php print $header ?>
		
			</div>
		<script>
		$("#block-nice_menus-1 .content").append("<div class='menu-right'></div>")
		</script>
			<div id="container">
			<div class="right">
					<img src="<?php print($path_to_theme); ?>/images/img1.jpg" alt=""/>
				</div>
				<h2 class="welcome">Welcome to Memorial Park Funeral Home and Cemetery. </h2>
				<p>The passing of a beloved family member is one of the most difficult times in our lives. With our long tradition of serving the community for 85 years and suite of best-in-class services, you can rely on us to take care of every little detail in a compassionate and professional manner.... <a href="#">read more.</a></p>
				<div class="extra">
					<div class="right contact">
						<img src="<?php print($path_to_theme); ?>/images/newnumber.jpg" alt=""/>
					</div>
					<div class="signature">
						<img src="<?php print($path_to_theme); ?>/images/signature.gif" alt=""/>
						<span>Dennis Hamilton,</span>
						<span>General Manager</span>
					</div>					
				</div>
				<a href="#" class="green" target="_blank">Memorial Park is now an approved provider of Green Funeral Service! </a>
			
           </div>		
           <div id="footer">
				<div class="block map">
					<a href="#"><img style="margin-top: 30px" src="<?php print($path_to_theme); ?>/images/map.png" alt=""/></a>
				</div>
				<div class="block address">
					<span>Memorial Park Funeral Home and Cemetery</span>
					<span>5668 Poplar Avenue</span>
					<span>Memphis, TN 38119</span>
					<span>info@memorialparkfuneralandcemetery.com</span>
					<span>Open 7 days a week. Click Here (detailed office hours info)</span>
				</div>
				<div class="block help">
					<a href="#" class="plan">Plan in Advance</a>
					<a href="#" class="immediate">Immediate Help</a>
				</div>
				<div class="block bulletin">
					<h4>Bulletin Board</h4>
					<ul>
						<li><a href="#">Chad and Hannah Smith join Memorial Park</a></li>
						<li><a href="#">Memorial Park Honors Fallen Hero on Memorial Day</a></li>
						<li><a href="#">Photos from the 2011 Easter Sunrise Service</a></li>
					</ul>
				</div>
				<div class="block">
					<h4>Video Gallery</h4>
					<a href="#"><img src="<?php print($path_to_theme); ?>/images/video_gallery.jpg" alt=""/></a>
				</div>
			</div>
			<div id="bottom">
				<p>Memorial Park Funeral Home and Cemetery,5668 Poplar Avenue,Memphis, TN 38119</p>
				<p>Copyright 2009, All Rights Reserved by NSMG. Designed by <a href="#">GKSIL</a> <a class="admin" href="#">Admin</a></p>
			</div>
			</div>
            
			</div>
			
		<?php print $closure; ?>
	</body>
</html>
