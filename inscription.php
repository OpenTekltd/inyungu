<?php
session_start();
$_SESSION = array();
 if(isset($_POST['submit'])){
	 $name=$_POST['izina'];
	 $prenom=$_POST['irindi_zina'];
	 $company=$_POST['ikigo_ukorera'];
	 $address=$_POST['ikigo_gikorera'];
	 $email=$_POST['imeyili'];
	 $tel=$_POST['telefoni'];
         $abcd=substr($_POST['telefoni'],0 , -7);
	  $emailcheck = preg_match('#^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#', $_POST['imeyili']);
	  $abd= strlen($_POST['telefoni']);
		if($abcd == "078" AND $abd == 10 AND $emailcheck == 1){
		     try
		        { 
		        $product=$_GET['product'];		$_SESSION['tabl1']=array('phone'=>$_POST['telefoni'],'nom'=>$_POST['izina'],'prenom'=>$_POST['irindi_zina'],'company'=>$_POST['ikigo_ukorera'],'address'=>$_POST['ikigo_gikorera'],'email'=>$_POST['imeyili']);
			     header('location:order.php?product='.$product);
		            exit();
			       }
					        catch(Exception $e)
			        {
			            die('Erreur : ' .$e->getMessage());
			        }
			
		         }
		 else if($abcd == "072" AND $abd == 10 AND $emailcheck == 1){
		     try
		        { 			$_SESSION['tabl1']=array('phone'=>$_POST['telefoni'],'nom'=>$_POST['izina'],'prenom'=>$_POST['irindi_zina'],'company'=>$_POST['ikigo_ukorera'],'address'=>$_POST['ikigo_gikorera'],'email'=>$_POST['imeyili']);
			          header('location:order.php?product='.$product);
		                  exit;
			       }
					        catch(Exception $e)
			        {
			            die('Erreur : ' .$e->getMessage());
			        }
			
		         }
		    else if($abcd == "073" AND $abd == 10 AND $emailcheck == 1){
		     try
		        { 			$_SESSION['tabl1']=array('phone'=>$_POST['telefoni'],'nom'=>$_POST['izina'],'prenom'=>$_POST['irindi_zina'],'company'=>$_POST['ikigo_ukorera'],'address'=>$_POST['ikigo_gikorera'],'email'=>$_POST['imeyili']);
			          header('location:order.php?product='.$product);
		                  exit;
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
     <link rel="stylesheet" href="font-awesome/font-awesome/css/font-awesome.min.css">
  <style type="text/css">
   #contact {text-align:left}
   #table{display:none}
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
                <div class="mbr-section row">
                    <div class="mbr-table-md-up" >

                        <div class="mbr-table-cell col-md-7 content-size text-xs-center text-md-right">
                           <form id="contact" action="" method="post">
				    <h3>Umwirondoro</h3><br/>
				    <!-- <h4>Contact us for custom quote</h4> -->
				      <fieldset>
				      <input placeholder="urugero: 0788010101..." name="telefoni" id="telefoni" type="text" tabindex="1" required />
				    </fieldset>
				    	<?php
				    	if(isset($_POST['submit'])){
				    	if($abcd != "078" AND $abcd != "073" AND $abcd != "072" AND $abd!= 10){
					 echo "<script type='text/javascript'>document.getElementById('telefoni').style.border= '1px solid red';</script>
					<span style='font-size:0.8em;color:red'>Uzuza neza Telefoni yawe</span><br/>"; 
						}
					}
				         ?> 
				    <fieldset>
				      <input placeholder="Izina" name="izina" id="izina" type="text" tabindex="1" required />
				    </fieldset>
				    <fieldset>
				      <input placeholder="Irindi zina" name="irindi_zina" id="irindi_zina" type="text" tabindex="1" required />
				    </fieldset>
				    <fieldset>
				      <input placeholder="Ikigo ukorera" name="ikigo_ukorera" id="ikigo_ukorera" type="text" tabindex="1" required >
				    </fieldset>
				    <fieldset>
				      <input placeholder="Aho ikigo gikorera" name="ikigo_gikorera" id="ikigo_gikorera" type="text" tabindex="1" required >
				    </fieldset> 
				      <fieldset>
				      <input placeholder="urugero: example@gmail.com" name="imeyili" type="email" id="imeyili"  tabindex="1" required />
				    </fieldset>
				    <?php
				    if(isset($_POST['submit'])){
				        if($emailcheck!=1){
					     echo "<script type='text/javascript'>document.getElementById('imeyili').style.border= '1px solid red';</script>
					     <span style='font-size:0.8em;color:red'>Uzuza neza imeyili yawe</span><br/>";
					}
				      }
				    ?>
				        <script>
				        var ad = "<?php echo $_GET['product']; ?>";
				    </script>
				    <br/><fieldset>
				      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Komeza</button>
				    </fieldset>
				    <p class="copyright">A product of <a href="https://inyungu.com" target="_blank" title="Inyungu">Inyungu</a></p>
					<table id='table' style='border:2px solid black'>		  
					<?php	 
						try
				        {
				            $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
				            $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'mupagasi', 'itdc@SYS=2');
							      $reponse = $bdd->query("SELECT * FROM order_user");
				
				                  while ($donnes = $reponse->fetch())
				                 {
				                    echo "<tr><td>".$donnes['phone']."</td>";
								    echo "<td>" .$donnes['name']. "</td>";
								    echo "<td>" .$donnes['last_name']. "</td>";
								    echo "<td>" .$donnes['company']. "</td>";
								    echo "<td>" .$donnes['address']. "</td>";
								    echo "<td>" .$donnes['email']. "</td></tr>";
				
								   
								}
						}
						catch(Exception $e)
				        {
				            die('Erreur : ' .$e->getMessage());
				        }
				?>
					</table>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
  <input name="animation" type="hidden">
<script type="text/javascript">
  var elem = document.getElementById("telefoni");
  elem.onblur = afficherMessage;
  function afficherMessage() {
     for(var i=0;i<document.getElementById('table').rows.length;i++){
		 if(document.getElementById('table').rows[i].cells[0].innerHTML==document.getElementById("telefoni").value){
			 document.getElementById("izina").style.border='2px solid red';
			 document.getElementById("izina").value=document.getElementById('table').rows[i].cells[1].innerHTML;
			 document.getElementById("irindi_zina").style.border='2px solid red';
			 document.getElementById("irindi_zina").value=document.getElementById('table').rows[i].cells[2].innerHTML;
			 document.getElementById("ikigo_ukorera").style.border='2px solid red';
			 document.getElementById("ikigo_ukorera").value=document.getElementById('table').rows[i].cells[3].innerHTML;
			 document.getElementById("ikigo_gikorera").style.border='2px solid red';
			 document.getElementById("ikigo_gikorera").value=document.getElementById('table').rows[i].cells[4].innerHTML;
			 document.getElementById("imeyili").style.border='2px solid red';
			 document.getElementById("imeyili").value=document.getElementById('table').rows[i].cells[5].innerHTML;
			 bootbox.confirm({
    message: "Iyi numero yarakoreshejwe mugutanga umwirondoro!!Nimba mwaramaze kwiyandikisha mukomeze...",
    buttons: {
        confirm: {
            label: 'Komeza',
            className: 'btn-success'
        },
        cancel: {
            label: 'Iyandikishe',
            className: 'btn-danger'
        }
    },
    callback: function (result) {
                if(result) {
                    var ab = document.getElementById('telefoni').value;
	            document.location.href = "order.php?fone="+ab+"&product="+ad;     
        }else
		{
		        document.getElementById("telefoni").value='';
			document.getElementById("telefoni").style.border='';
			 document.getElementById("izina").value='';
			 document.getElementById("izina").style.border='';
			 document.getElementById("irindi_zina").value='';
			 document.getElementById("irindi_zina").style.border='';
			 document.getElementById("ikigo_ukorera").value='';
			 document.getElementById("ikigo_ukorera").style.border='';
			 document.getElementById("ikigo_gikorera").value='';
			 document.getElementById("ikigo_gikorera").style.border='';
			 document.getElementById("imeyili").value='';
			 document.getElementById("imeyili").style.border='';

		}
    }
});
		    }

	    }
}	  
</script>



 </body>
</html>
