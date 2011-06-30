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
			
			<div id="left_content"><?php if (count($secondary_links)){ ?>
  <div id="secondary">
    <?php print theme('links', $secondary_links,array('class' => 'secondary_menu')) ?>
  </div> <!-- /#secondary -->
<?php } ?>
 </div>
			<div id="main_content">
            <?php print $content ?>	
			
           </div> 
			
           </div>		
            
			</div>
	<div id="bottom">
				<p>Memorial Park Funeral Home and Cemetery,5668 Poplar Avenue,Memphis, TN 38119</p>
				<p>Copyright 2009, All Rights Reserved by NSMG. Designed by <a href="#">#####</a> <a class="admin" href="#">Admin</a></p>
			<?php if ($footer_message || $footer) : ?>
              <div>
            <?php print $footer_message . $footer;?>
           </div>
          <?php endif; ?>
			</div>
		  </div>
		<?php print $closure; ?>
	</body>
</html>
