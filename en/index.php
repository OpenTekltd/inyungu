<?php
session_start();
    if(isset($_POST['submit'])){
            $user=$_POST['fn'];
    	    $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
            $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');
		$reponse = $bdd->query("SELECT * FROM order_user WHERE phone = '$user'");
                  while($donnees=$reponse->fetch()){
			if($donnees['password']==$_POST['passwrd'])
				{
		                  header('location:customer_page.php?phone='.$user);
		                  exit;
				}
		         else{
		           echo "<script>alert('login failed!!try again')</script>";
		         }
		    }
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
  <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
  <style>
  #kawa_nanasi{display:none;}
  #kawa_nanasi{position:absolute;list-style:none;}
  #main-list{list-style:none;}
  #kawa_nanasi li a{width:185%;}
  #kawa_nanasi {margin-left:-21px;}
  .kawa_nanasi2 {margin-top:-7px;}
  li:hover ul#kawa_nanasi{display:block;transition:all .2s linear}
  li:hover ul a{background:white}
  
  
  .slider {
  max-width: 100%;
  height: 100%;
  margin: 0px auto;
  position: relative;
}
.slider>img {
  position: absolute;
  width: 100%;
  height: 100%;
}
.slider>.slide_btn {
  position: absolute;
  width: 50px;
  height: 50px;
  border:none;
  border-radius:50px 50px 50px 50px;
  top:300px;
  background:transparent;
  color:white;
  font-size:30px;
  z-index:9999;
}
#btn2{
	position:relative;
	float:right;
}
.slider>#btn2:hover {
box-shadow:-10px 0px 20px 0px white;
}
.slider>#btn1:hover {
box-shadow:10px 0px 20px 0px white;
} 
#product:hover{
	-webkit-transform:translate(10px, 20px) rotate(30deg);
	    -ms-transform:translate(10px, 20px) rotate(30deg);
	     -o-transform:translate(10px, 20px) rotate(30deg);
	        transform:scale(1.1, 1.1);
			box-shadow:0 0 0.7rem black;
			position:relative;
			z-index:9999;
}
#start_line3{width:40%;height:2px;background-color:#fbdd90;margin-bottom:0px;float:right;margin-top:-25px;}
#start_line2{width:40%;height:2px;background-color:#fbdd90;margin-bottom:0px;margin-bottom:-10px;}
@media only screen and (max-width: 640px){
	#mbr-table{top:125%;position:absolute}
	.mbr-section-title strong{font-size:1.2rem}
	#ibicuruzwa{display:none}
	#title h4{font-size:1.2rem}
	#start_line3{width:25%;margin-top:-20px}
	#start_line2{width:25%;}
}
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
                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                    <li class="nav-item"><a class="nav-link link" href="#product_section">PRODUCTS</a></li>
					<li class="nav-item"><a class="nav-link link" href="#">INSTRUCTIONS</a></li>
					<li class="nav-item"><a class="nav-link link" href="#">WHO WE ARE</a></li>
					<li class="nav-item"><a class="nav-link link" href="http://inyungu.com/"><img src="../assets/images/Rw-flag.png" alt="Kinyarwanda"/>   KIN</a></li>
					</ul>
					<button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
					<div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>

</section>

<section class="mbr-section mbr-section-hero mbr-section-full header2 mbr-parallax-background mbr-after-navbar" id="header2-0">
   <div class='slider'>
     <img src='assets/images/landscape.jpg' class='slide'>
     <img src='assets/images/cafe.jpg' class='slide'>
	 <button class='slide_btn' onclick="plusIndex(-1)" id="btn1">&#10094;</button>
	 <button class='slide_btn' onclick="plusIndex(1)" id="btn2">&#10095;</button>
   </div>
    <div class="mbr-overlay" style="opacity: 0.3;">
    </div>

    <div class="mbr-table mbr-table-full" id="mbr-table" style="margin-top:-660px;">
        <div class="mbr-table-cell">

            <div class="container">
                <div class="mbr-section row">
                    <div class="mbr-table-md-up">
                        <div class="mbr-table-cell col-md-7 content-size text-xs-center text-md-center">
                            <h3 class="mbr-section-title display-2" style="padding:0px 0px 30px;">INYUNGU </h3>
                            <div class="mbr-section-text" style="padding:0px 0px 60px;">
                                <p><strong>Inyungu is a platform with the aim of putting together farmers and buyers in Rwanda.</strong></p>
                            </div>  
                            <div class="col-lg-offset-3 col-xs-12 col-lg-4 col-lg-offset-4" style="padding:0px 0px 20px;right:1.5%;">
								<div class="mbr-section-btn">
									<ul id="main-list">
										<li id="display"><a class="btn btn-primary" data-toggle="modal" data-target="#kwemeza" style="background-color: #4CAF50; border-color:#4CAF50;" onmouseover="this.style.backgroundColor = '#067F24';this.style.borderColor = '#067F24';" onmouseout="this.style.backgroundColor = ' #4CAF50';this.style.borderColor = '#067F24';">Sign in your account!</a></li>
									</ul>
								</div>
                            </div>
                        </div>
                </div>
				<div id="ibicuruzwa" class="col-lg-offset-4 col-lg-4 col-lg-offset-4" style="top:50px;">
						<h5 class="mbr-section-title" style="padding:0px 0px 30px;text-align:center"><strong>PRODUCTS </strong></h5>
						 <div class="mbr-arrow mbr-arrow-floating hidden-sm-down" style="top:50%;" aria-hidden="true">
							<a href="#product_section"><i class="mbr-arrow-icon"></i></a>
						</div>
				</div>
            </div>

        </div>
    </div>
</div>

</section>
<section id="product_section" style="padding:50px 50px;">
		       <div id="title" style="top:20%;"> 
					 <div id="start_line2"></div>		 
						 <h4 style="text-align:center">PRODUCTS</h4>
					<div id="start_line3"></div>
            </div>
		<div class="container">
				<div class="row" style="padding-top:20px;padding-bottom:30px;">
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;padding:5px 0px;">
						     <div><img src='assets/images/coffe.png' style="max-width:43%;" class="product"></div>
							 <div>
							   <span><h5>Coffee<h5></span>
							   <span><a href="inscription.php?product=ikawa" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;padding:5px 0px;">
						      <div><img src='assets/images/pinaple.jpg' style="max-width:23%;" class="product"></div>
							   <div>
							   <span><h5>Pineapple<h5></span>
							   <span><a href="inscription.php?product=inanasi" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;padding:5px 0px;">
						       <div><img src='assets/images/oigno.jpg'  style="max-width:43%;"  class="product"></div>
							   <div>
							   <span><h5>Onions<h5></span>
							   <span><a href="inscription.php?product=ibitunguru" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>

				</div>
				<div class="row" style="padding-top:0px;padding-bottom:30px;">
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;margin:5px 0px;">
						       <div><img src='assets/images/maracuja.jpg' style="max-width:25%;"  class="product" ></div>
							   <div>
							   <span><h5>Passion Fruit<h5></span>
							   <span><a href="inscription.php?product=amatunda" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;margin:5px 0px;">
						       <div><img src='assets/images/eggs.jpg' style="max-width:50%"  class="product"></div>
							    <div>
							   <span><h5>Eggs<h5></span>
							   <span><a href="inscription.php?product=amagi" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;padding:5px 0px;">
						  	 <div><img src='assets/images/Maize.jpg' style="max-width:43%"  class="product"></div>
							    <div>
							   <span><h5>Maize<h5></span>
							   <span><a href="inscription.php?product=ibigori" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
				</div>
									<div class="row" style="padding-top:0px;padding-bottom:30px;">
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;margin:5px 0px;">
						       <div><img src='assets/images/beans.jpg' style="max-width:35%;"  class="product" ></div>
							   <div>
							   <span><h5>Beans<h5></span>
							   <span><a href="inscription.php" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;margin:5px 0px;">
						       <div><img src='assets/images/soya.jpg' style="max-width:53%"  class="product"></div>
							    <div>
							   <span><h5>Soy<h5></span>
							   <span><a href="inscription.php" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
						  <div class="col-xs-12 col-lg-4" id="product" style="text-align:center;padding:5px 0px;">
						  	 <div><img src='assets/images/wheat.jpg' style="max-width:40%"  class="product"></div>
							    <div>
							   <span><h5>Wheat<h5></span>
							   <span><a href="inscription.php" class="btn btn-primary" style="padding:3px 8px;background-color: #4CAF50; border-color:#4CAF50;">Order!</a></span>
							 </div>
						  </div>
				</div>
		</div>
</section>
<section class="mbr-footer mbr-section mbr-section-md-padding" id="contacts3-2" style="background-color: rgb(46, 46, 46); padding-top: 90px; padding-bottom: 90px;">


    <div class="row">
    
            <div class="mbr-company col-xs-12 col-md-3">

                <div class="mbr-company card">
                   <!--  <div><img src="assets/images/logo.png" class="card-img-top"></div> -->
                   
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <span class="list-group-icon"><span class="etl-icon icon-phone mbr-iconfont-company-contacts3"></span></span>
                            <span class="list-group-text">+250 788 304 196</span>
                        </li>
                        <li class="list-group-item">
                            <span class="list-group-icon"><span class="etl-icon icon-map-pin mbr-iconfont-company-contacts3"></span></span>
                            <span class="list-group-text">176 ST, Land Trade House, 3rd Floor</span>
                        </li>
                        <li class="list-group-item active">
                            <span class="list-group-icon"><span class="etl-icon icon-envelope mbr-iconfont-company-contacts3"></span></span>
                            <span class="list-group-text"><a href="mailto:info@inyungu.com">info@inyungu.com</a></span>
                        </li>
                    </ul>
                </div>

            </div>
           <!--  <div class="mbr-footer-content col-xs-12 col-md-6 col-lg-3">
                <h4>Categories</h4>
                <ul><li><a class="text-white" href="#">Business</a></li><li><a class="text-white" href="#">Design</a></li><li><a class="text-white" href="#">Real life</a></li><li><a class="text-white" href="#">Science</a></li><li><a class="text-white" href="#">Tech</a></li></ul>
            </div> -->
            <div class="mbr-company col-xs-12 col-md-6">

                <div class="mbr-map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.4874802553536!2d30.108960314296727!3d-1.958567098572121!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x19dca6556852ec37%3A0x6e2e97ac157c1bb8!2sLandstar+Hotel!5e0!3m2!1sfr!2sfr!4v1494508171471" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>

            </div>
            <div class="col-xs-12 col-md-3" data-form-type="formoid">

                <div data-form-alert="true">
                    <div hidden="" data-form-alert-success="true">Thank you for writing to us.</div>
                </div>

                <form action="#" method="post" data-form-title="MESSAGE">

                    <input type="hidden" value="4w0ip1MVAyIbm6mBbVUw9a1cf+iIY4XbL0FuQq+AtrQsSLj3nmu2TnbQQbwYBor91qYdOxXstMayub80SIXDRLYH+kHlXutkTnQh6V4/bj/03vANoBpMleFew95IR4lh" data-form-email="true">

                    

                    <div class="form-group">
                        <label class="form-control-label" for="contacts3-2-email">Email<span class="form-asterisk">*</span></label>
                        <input type="email" class="form-control input-sm input-inverse" name="email" required="" data-form-field="Email" id="contacts3-2-email">
                    </div>

                    

                    <div class="form-group">
                        <label class="form-control-label" for="contacts3-2-message">Message</label>
                        <input class="form-control input-sm input-inverse" name="message" data-form-field="Message" rows="5" id="contacts3-2-message" style="height:100px;"/>
                    </div>

                    <div><button type="submit" class="btn btn-sm btn-black">Write to us</button></div>

                </form>

            </div>
        </div>
</section>

<footer class="mbr-small-footer mbr-section mbr-section-nopadding" id="footer1-2" style="background-color: rgb(50, 50, 50); padding-top: 1.75rem; padding-bottom: 1.75rem;">
    
    <div class="container">
        <p class="text-xs-center">Copyright (c) 2017 Inyungu.</p>
    </div>
</footer>
    <div class="modal fade" id="kwemeza" tabIndex="-1" role="dialog" aria-labelledby="editLabel">
		 <div class="modal-dialog" role="document">
			 <div class="modal-content">
				 <div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-label="close" ><span arial-hidden="true">&times;</span></button>
						 <h4 class="modal-title" id="editLabel">Comfirmation Portal<h4>
					 </div>
					  <form action="" method="post">
							 <div class="modal-body"> 
								  <div class="form-group">
									 <label style="float:left">Telephone:</label>
									<input type="text" style="padding:0px 0px;" class="form-control" name="fn" value="">
									 </div>
									<div class="form-group">
									<label style="float:left">Password:</label>
									<input type="password" class="form-control" name="passwrd" value="">
									</div>
							</div>					  
									  <div class="modal-footer">
										  <button type="button" class="btn btn-default" data-dismiss="modal" >close</button>
										  <button type="submit" name="submit" class="btn btn-primary" >Comfirm</button>
									  </div>
					 </form>
			</div>
		</div>
	</div>

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
  var index = 1;

  function plusIndex(n){
	  index = index + n;
	  showImage(index);
  }
   showImage(1);
   
   function showImage(n){
	    
	   var x=document.getElementsByClassName('slide');
	 
	   if(n>x.length){index=1;}
	   if(n<1){index=x.length;}
	   for(var i=0;i<x.length;i++){
		   
		   x[i].style.opacity=0;
	   }
	   x[index-1].style.transition='opacity 2s';
	   x[index-1].style.opacity=1;
   }
   
   autoSlide();
   
   function autoSlide(){
	   	   var x=document.getElementsByClassName('slide');
	   for(var i=0;i<x.length;i++){
		   
		   x[i].style.opacity=0;
	   }
	   if(index > x.length){index = 1;}
	   x[index-1].style.transition='opacity 2s';
	   x[index-1].style.opacity=1;
	   index++;
	   setTimeout(autoSlide,5500);
   }
  </script>  
  <input name="animation" type="hidden">
  </body>
</html>