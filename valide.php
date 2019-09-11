<?php
session_start();
		try
        {
			$ab=$_SESSION['tabl1']['phone'];
            $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
            $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'mupagasi', 'itdc@SYS=2');
			      $reponse = $bdd->query("SELECT * FROM order_user WHERE phone ='$ab'");
                  while ($donnes = $reponse->fetch())
                 {
					 if($donnes['phone']==$ab)
					 {
						 $_SESSION['tabl1']['nom']=  $donnes['name'];
						 $_SESSION['tabl1']['prenom']=  $donnes['last_name'];
						 $_SESSION['tabl1']['company']=  $donnes['company'];
						 $_SESSION['tabl1']['address']=  $donnes['address'];
						 $_SESSION['tabl1']['phone']=  $donnes['phone'];
						 $_SESSION['tabl1']['email']=  $donnes['email'];
					 }
				}
		}
		catch(Exception $e)
        {
            die('Erreur : ' .$e->getMessage());
        }
?>
<!DOCTYPE html>
<html>
<head>
  <!-- Site made with Mobirise Website Builder v3.12.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.12.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon"> -->
  <meta name="description" content="">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
  <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="assets/dropdown/css/style.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
  <link rel="stylesheet" href="assets/theme/css/ordercss.css">
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <style type="text/css">
  #contact{text-align:left;}
  </style>
  
  
</head>
<body>
<section id="menu-0">

    <nav class="navbar navbar-dropdown bg-color transparent navbar-fixed-top">
        <div class="container">

            <div class="mbr-table">
                <div class="mbr-table-cell">

                    <div class="navbar-brand">
                        <!-- <a href="https://www.inyungu.com" class="navbar-logo"><img src="assets/images/logo.png" alt="Mobirise"></a> -->
                        <a class="navbar-caption" href="http://www.inyungu.com">INYUNGU</a>
                    </div>

                </div>
                <div class="mbr-table-cell">

                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar"><li class="nav-item"><a class="nav-link link" href="#">AMABWIRIZA</a></li><li class="nav-item"><a class="nav-link link" href="#">ABO TURIBO</a></li></ul>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>

</section>

<section class="mbr-section mbr-section-hero mbr-section-full header2 mbr-parallax-background mbr-after-navbar" id="header2-0" style="background-image: url(assets/images/landscape3.jpg);border-color:red">

    <div class="mbr-overlay" style="opacity: 0.3; background-color: rgb(0, 0, 0);">
    </div>

    <div class="mbr-table mbr-table-full" style="border-color:red;">
        <div class="mbr-table-cell">
            <div class="containerr" style="border-color:red;">
                <div class="mbr-section row" style="width:200%;height:100%;text-align:center;background-color:white;margin-top:80px;margin-left:-200px;padding:18%;border-radius:10px 10px 10px 10px;border:4px solid #4CAF50">
                                    <div style="margin-top:-10%;margin-bottom:10px;"><img src='assets/images/succcess.png'  style="max-width:10%;" /></div>
				    <h4 style=" font-family: 'Montserrat-bold', sans-serif;"><span style="font-family:'Courier New', Courier, monospace;font-weight:bold;text-transform:uppercase"><?php echo $_SESSION['tabl1']['nom'] .'&nbsp&nbsp'. $_SESSION['tabl1']['prenom']; ?> ,</span></h4><br/>
				    <p style="font-family:'Courier New', Courier, monospace;font-weight:bold">Mubashije gutumiza <?php echo $_SESSION['product']; ?>, Murakoze kubwo kwiyandikisha kwiki gikorwa. Mukande aho mushaka kugana:</p>					
					<div class="mbr-section-btn" style="position:absolute;margin-left:70px;"><a class="btn btn-primary" id="gutumiza" onclick="afficherMessage();" style="background-color: #4CAF50; border-color:#4CAF50;" href='order.php'>GUTUMIZA KANDI</a></div>
		            <div class="mbr-section-btn" style="position:relative;float:right;margin-right:70px;"><a class="btn btn-primary" style="background-color: #4CAF50; border-color:#4CAF50; " href="quitter.php">GUSUBIRA AHABANZA</a></div>
				</div>
            </div>
        </div>
    </div>
</section>



<footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer1-2" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">
    
    <div class="container">
        <p class="text-xs-center">Copyright (c) 2017 Inyungu.</p>
    </div>
</footer>
  </script>

  <script src="assets/web/assets/jquery/jquery.min.js"></script>
  <script src="assets/tether/tether.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="assets/jarallax/jarallax.js"></script>
  <script src="assets/viewport-checker/jquery.viewportchecker.js"></script>
  <script src="assets/dropdown/js/script.min.js"></script>
  <script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
  <script src="assets/theme/js/script.js"></script>
  <script src="assets/formoid/formoid.min.js"></script>
      <script>
   var ab='<?php echo $_SESSION['product']; ?>';
   if(ab=='ikawa'){document.getElementById('header2-0').style.backgroundImage= "url('assets/images/cafe.jpg')";}
   else if(ab=='inanasi'){document.getElementById('header2-0').style.backgroundImage="url('assets/images/landscape.jpg')";}
</script>
  <input name="animation" type="hidden">
  </body>
</html>
