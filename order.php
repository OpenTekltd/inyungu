<?php
session_start();
include('sender.php');
function chaine_aleatoire($nb_car, $chaine = 'azertyuiopqsdfghjklmwxcvbn123456789')
{
    $nb_lettres = strlen($chaine) - 1;
    $generation = '';
    for($i=0; $i < $nb_car; $i++)
    {
        $pos = mt_rand(0, $nb_lettres);
        $car = $chaine[$pos];
        $generation .= $car;
    }
    return $generation;
}   

  if(!isset($_GET['product'])){$ab=$_POST['select'];}else
  {$ab=$_GET['product'];}
   if(isset($_POST['submit'])){
	   if(!isset($_GET['fone'])){
        try
        {
        
            $psswd = chaine_aleatoire(8);
            $fone=$_SESSION['tabl1']['phone'];
            $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
            $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'mupagasi', 'itdc@SYS=2');
            $req = $bdd->prepare('INSERT INTO order_user(phone, name, last_name, company, address, email, password) VALUES(:phone, :name, :last_name, :company, :address, :email, :password)');
            $req->execute(array(
			'phone' =>$_SESSION['tabl1']['phone'],
                        'name' =>$_SESSION['tabl1']['nom'],
			'last_name' =>$_SESSION['tabl1']['prenom'],
			'company' => $_SESSION['tabl1']['company'],
			'address' => $_SESSION['tabl1']['address'],
                        'email'=>$_SESSION['tabl1']['email'],
                        'password'=>$psswd
            ));
			$_SESSION['tabl1']['phone']=$fone;
			 $req ->closeCursor ();
        
        
        
            $req = $bdd->prepare('INSERT INTO ordering(id_ordering, product, time_ordering, quantity, delay, date_current, phone) VALUES(:id_ordering, :product, :time_ordering, :quantity, :delay, :date_current, :phone)');
            $req->execute(array(
			'id_ordering' => '',
                        'product' =>$ab,
			'time_ordering' =>$_POST['time_ordering'],
			'quantity' => $_POST['ingano'],
			'delay' => $_POST['itarik_ubikeneyeho'],
                        'date_current'=>date("Y-m-j"),
                        'phone' => $_SESSION['tabl1']['phone']	
            ));
                        $_SESSION['product']=$ab;
                        $ad='Murakoze gutumiza '.$ab.'.Murahabwa igisubizo mukanya. Ijambo ry ibanga ryanyu muzajya mukoresha ni '.$psswd;
                        $adc='InyunguLtd.';
                        $reciever='25'.$_SESSION['tabl1']['phone'];
                        $obj = new Sender("121.241.242.114","8080","cyu-inyungu","opentek@",$adc,$ad,$reciever,"1","1");  
                        $obj->Submit (); 
                        header('location:valide.php');
		        exit();
		}
		        catch(Exception $e)
        {
            die('Erreur : ' .$e->getMessage());
        }
	  }else{
		  
		         try
        {
        
        
            $psswd = chaine_aleatoire(8);
            $fone=$_SESSION['tabl1']['phone'];
            $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
            $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'mupagasi', 'itdc@SYS=2');
            $req = $bdd->prepare('INSERT INTO order_user(phone, name, last_name, company, address, email, password) VALUES(:phone, :name, :last_name, :company, :address, :email, :password)');
            $req->execute(array(
			'phone' =>$_SESSION['tabl1']['phone'],
                        'name' =>$_SESSION['tabl1']['nom'],
			'last_name' =>$_SESSION['tabl1']['prenom'],
			'company' => $_SESSION['tabl1']['company'],
			'address' => $_SESSION['tabl1']['address'],
                        'email'=>$_SESSION['tabl1']['email'],
                        'password'=>$psswd
            ));
			$_SESSION['tabl1']['phone']=$fone;
			 $req ->closeCursor ();
        
        
            $req = $bdd->prepare('INSERT INTO ordering(id_ordering, product, time_ordering, quantity, delay, date_current, phone) VALUES(:id_ordering, :product, :time_ordering, :quantity, :delay, :date_current, :phone)');
            $req->execute(array(
			'id_ordering' => '',
            'product' =>$ab,
			'time_ordering' =>$_POST['time_ordering'],
			'quantity' => $_POST['ingano'],
			'delay' => $_POST['itarik_ubikeneyeho'],
            'date_current'=>date("Y-m-j"),
            'phone' => $_GET['fone']	
            ));
			$_SESSION['tabl1']['phone']=$_GET['fone'];
			$_SESSION['product']=$ab;
                        $ad='Murakoze gutumiza '.$ab.'.Murahabwa igisubizo mukanya.';
                        $adc='InyunguLtd.';
                        $reciever='25'.$_SESSION['tabl1']['phone'];
                        $obj = new Sender("121.241.242.114","8080","cyu-inyungu","opentek@",$adc,$ad,$reciever,"1","1"); 
                        $obj->Submit (); 
                         header('location:valide.php');
		            exit();
		}
		        catch(Exception $e)
        {
            die('Erreur : ' .$e->getMessage());
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

<section class="mbr-section mbr-section-hero mbr-section-full header2 mbr-parallax-background mbr-after-navbar" id="header2-0"  style="background-image: url(assets/images/landscape3.jpg);border-color:red">

    <div class="mbr-overlay" style="opacity: 0.3; background-color: rgb(0, 0, 0);">
    </div>

    <div class="mbr-table mbr-table-full" style="border-color:red;">
        <div class="mbr-table-cell">

            <div class="containerr" style="border-color:red;">
                <div class="mbr-section row">
                    <div class="mbr-table-md-up">

                        <div class="mbr-table-cell col-md-7 content-size text-xs-center text-md-right" style="border-color:red;">
                          <form id="contact" action="" name='gutumiza' method="post">

    <h3>Gutumiza</h3><br/>
	<fieldset>
      <select placeholder="Icyo utumizaho" name="select" tabindex="2" style="padding:8.5px 130px;width:100%;border:1px solid;border-color:#C0C0C0;text-align:left;font-size:0.8em" required>
	     <option value="1" selected="selected" disabled="disabled">Icyo utumiza</option>
         <option id='kawa2' value="inanasi">inanasi</option>
         <option id='inanasi2' value="ikawa">ikawa</option>
         <option id='inanasi2' value="ibitunguru">ibitunguru</option>
         <option id='inanasi2' value="ibigori">ibigori</option>
         <option id='inanasi2' value="amatunda">amatunda</option>
         <option id='inanasi2' value="amagi">amagi</option>
         <option id='inanasi2' value="ibishyimbo">amagi</option>
         <option id='inanasi2' value="soya">amagi</option>
         <option id='inanasi2' value="ingano">amagi</option>
      </select>
    </fieldset>
    <script>     
		    var t = '<?php if(isset($_GET["product"])) { echo $_GET["product"]; }else{ echo "null"; } ?>';
		    if(t=="inanasi"){
		    document.forms['gutumiza'].elements['select'].selectedIndex= 1;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		     else if(t=="ikawa"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=2;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		      else  if(t=="ibitunguru"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=3;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		     else   if(t=="ibigori"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=4;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		      else  if(t=="amatunda"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=5;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		       else if(t=="amagi"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=6;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		     else   if(t=="ibishyimbo"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=7;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		      else  if(t=="soya"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=8;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    } 
		       else if(t=="ingano"){
		    document.forms['gutumiza'].elements['select'].selectedIndex=9;
		    document.forms['gutumiza'].elements['select'].disabled='disabled';
		    }
		    else if(t=="null")
		    {
		      document.forms['gutumiza'].elements['select'].selectedIndex=0;
		    }
        </script>
			<fieldset style="font-size:0.75em;float:left;">
			<label>Buri munsi</label>
			<input name="time_ordering" type="radio" value="musi" />
			<label>Buri cyumweru</label>
			 <input name="time_ordering" type="radio" value="cyumweru" />
			<label>Buri kwezi</label>
      <input name="time_ordering" type="radio" value="kwezi" />
	  <label>Inshuro imwe</label>
      <input name="time_ordering" type="radio" value="rimwe"/>
    </fieldset>
	    <fieldset>
      <input placeholder="Ingano(Kg)" name="ingano" type="text" style="text-align:center" tabindex="2" required>
    </fieldset>
    	<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
<script>
  webshims.setOptions('waitReady', false);
  webshims.setOptions('forms-ext', {types: 'date'});
  webshims.polyfill('forms forms-ext');
</script>
	    <fieldset>
      <input placeholder="Itariki ubikeneyeho" name="itarik_ubikeneyeho" min='2011-08-13' type="date" tabindex="2" style="padding:6px 120px;text-align:left;font-size:0.8em" required>
    </fieldset><br/>
    <fieldset>
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Ohereza</button>
    </fieldset>
    <p class="copyright">A product of <a href="https://inyungu.com" target="_blank" title="Inyungu">Inyungu</a></p>
  </form>
                            
                        </div>
                        

                    </div>
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
  <input name="animation" type="hidden">
  <?php

?>
  </body>
</html>
