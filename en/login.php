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
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <style>
  body{background-color:#F2F3F4
  }
  #contact{font-size:1rem;}
  </style>
  
  
</head>
<body>
 <div id="wrapper" style='padding-top:40px;'>
           <div class="navbar-brand" style='text-align:center;width:100%;'>
                 <a class="navbar-caption" style='font-size:4rem;color:black;' href="http://www.inyungu.com"><strong>INYUNGU</strong></a><br/>
           </div>
		   <div class="mbr-section">
               <div class="mbr-table-md-up" >
                  <div class="mbr-table-cell col-md-7 content-size text-xs-center text-md-center">
                    <form id="contact" action="" method="post">
                         <h3><strong>Login</strong></h3><br/>
						 <?php
                          if(isset($_POST['submit'])){
		                      if($_POST['password']!= 'Opentek@'){
		                          echo "<br/><span style='color:red;font-size:0.8rem;'>Please make sure that you enter the right password...</span><br/><br/>";
		                        }else
								{
									echo '<script>document.location.href = "admin.php";</script>';
								}
                            }
                         ?> 
		                 <fieldset>
                         <input placeholder="User name" name="User_name" size='35' value='Admin' type="User_name" id="User_name"  tabindex="1" disabled style='color:#F8C471;border:1px solid #99A3A4;background:#F7F9F9;cursor:not-allowed'required />
                         </fieldset><br/>
                         <fieldset>
                         <input placeholder="Password" name="password" size='35' id="password" type="password" tabindex="1" required >
                         </fieldset>
                         <br/><fieldset>
                         <button name="submit" type="submit"  style='padding:1px 130px;' onClick="manipule_submit();" id="contact_submit" data-submit="...Sending">login</button>
                         </fieldset><br/><br/>
                         <p class="copyright">A product of <a href="https://inyungu.com" target="_blank" title="Inyungu">Inyungu</a></p>
                         </form>
                   </div>
                </div>
            </div>
  </div>
  
  <footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer1-2" style="background-color: rgb(50, 50, 50);margin-top:25px;padding:25px;">
    
    <div class="container">
        <p class="text-xs-center">Copyright (c) 2017 Inyungu.</p>
    </div>
</footer>
</body>

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
</html>