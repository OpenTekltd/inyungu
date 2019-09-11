<?php
        $phone = $_GET['phone'];
	 $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
	 $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');
	 $reponse = $bdd->query("SELECT * FROM order_user WHERE phone = '$phone'");
	while ($donnes = $reponse->fetch())
	 {
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
  #contact{text-align:left;}
  th, td {font-size:0.8rem;}
  tbody{margin-top:5%;}
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
                    <li class="nav-item"><a class="nav-link link" href="quitter.php">EXIT</a></li></ul>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>
</section>

<section class="mbr-section mbr-section-hero mbr-section-full header2 mbr-parallax-background mbr-after-navbar" id="header2-0" style="background-image: url(assets/images/landscape3.jpg);border-color:red">

    <div class="mbr-table mbr-table-full" style="border-color:red;">
        <div class="mbr-table-cell">
            <div class="containerr">
                <div class="mbr-section row" style="width:250%;background-color:white;margin-top:40%;;margin-left:-300px;padding:18%;border-radius:5px 5px 5px 5px;border:2px solid #4CAF50;margin-bottom:30%;">
			    <div id="tabl1" style="width:100%;background-color:white;right:0%;padding:0px 20px;">
		              <div class='page-header' id='datatable2' style="margin-bottom:5%;border-bottom:1px solid #BFC9CA ">
			            <h5><strong style="font-family:'Lucida Console', Monaco, monospace">Table of Orders</strong></h5>
	                            <h6><strong style="font-size:0.9rem;font-family:'Lucida Console', Monaco, monospace">CUSTOMER : </strong><small style="font-family:'Lucida Console', Monaco, monospace"><?php echo $donnes['name'].' '.$donnes['last_name'].' / '.$donnes['phone'];}  $reponse->closeCursor ();?></small></h6>
	                            <button type="button" onclick="UpdateCustomer('')" style="padding:2px 5px;margin-bottom:-5px;margin-top:-45px;float:right;padding:3px 30px" class="btn btn-infos"><i class="fa fa-pencil fa-2x"data-toggle="modal" data-target="#kwemeza" aria-hidden="true"></i></button>
		               </div>		           
		               
		  <table class='table table-bordered table-striped' id='mydata2'>
			 <thead>
				<tr>
					 <th >Product</th>
					 <th >Quantity</th>
					 <th >ordering</th>
					 <th >Dead_line</th>
					 <th >Date_current</th>
					 <th >Action</th>
				</tr>
			 </thead>
			 <tbody>
						<?php
						 if(isset($_GET['phone'])){
						  $phone= $_GET['phone'];
						  $reponse = $bdd->query("SELECT * FROM ordering WHERE phone = '$phone'");
								 while ($donnes = $reponse->fetch())
								{
									echo'
											<tr>
												 <td>'.$donnes['product'].'</td>
												 <td>'.$donnes['quantity'].'</td>
												 <td>'.$donnes['time_ordering'].'</td>
												 <td>'.$donnes['delay'].'</td>
												 <td>'.$donnes['date_current'].'</td>
												 <td>
											<button type="button"   style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px" class="btn btn-warning bt-xs update" data-toggle="modal" data-target="#edit-'.$donnes['id_ordering'].'"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></button>
					<div class="modal fade" id="edit-'.$donnes['id_ordering'].'" tabIndex="-1" role="dialog" aria-labelledby="editLabel-'.$donnes['id_ordering'].'">
					  <div class="modal-dialog" role="document">
							<div class="modal-content">
						  <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="close" ><span arial-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="editLabel-'.$donnes['id_ordering'].'">Update Orders<h4>
						  </div>
									  <form>
									  <div class="modal-body">
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['phone'].'">
										   <label>Tel Number:</label>
										   <input disabled type="text" class="form-control" id="fone-'.$donnes['id_ordering'].'" value="'.$donnes['phone'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['product'].'">
										   <label>Product:</label>
											   <input type="text" class="form-control" id="product-'.$donnes['id_ordering'].'" value="'.$donnes['product'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['quantity'].'">
										   <label>Quantity:</label>
											   <input type="number" class="form-control" id="quantity-'.$donnes['id_ordering'].'" value="'.$donnes['quantity'].'">
										   </div>';
										   if($donnes['time_ordering']=="umusi"){
										   echo'
										   <div style="padding-left:60px;">
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri munsi</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" checked value="umusi">
										   </div>
											<div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri cyumweru</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="icyumweru">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Buri kwezi</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="ukwezi">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Inshuro imwe</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="rimwe">
										   </div><br/><br/><br/></div>';
										   }
										   if($donnes['time_ordering']=="cyumweru"){
										   echo'
										   <div style="padding-left:60px;">
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri munsi</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="umusi">
										   </div>
											<div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri cyumweru</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" checked value="icyumweru">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Buri kwezi</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="ukwezi">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Inshuro imwe</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="rimwe">
										   </div><br/><br/><br/></div>';
										   }
										   if($donnes['time_ordering']=="kwezi"){
										   echo'
										   <div style="padding-left:60px;">
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri munsi</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="umusi">
										   </div>
											<div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri cyumweru</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="icyumweru">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Buri kwezi</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" checked value="ukwezi">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Inshuro imwe</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="rimwe">
										   </div><br/><br/><br/></div>';
										   }
										   if($donnes['time_ordering']=="rimwe"){
										   echo'
										   <div style="padding-left:60px;">
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri munsi</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="umusi">
										   </div>
											<div class="form-group" style="float:left;padding:15px 15px;">
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
										   <label>Buri cyumweru</label>
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="icyumweru">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Buri kwezi</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'" value="ukwezi">
										   </div>
										   <div class="form-group" style="float:left;padding:15px 15px;">
										   <label>Inshuro imwe</label>
										   <input type="hidden" id="'.$donnes['time_ordering'].'">
											   <input type="radio" class="form-control" id="time_ordering-'.$donnes['id_ordering'].'"  checked  value="rimwe">
										   </div><br/><br/><br/></div>';
										   }
										   echo'
										   <div class="form-group" style="margin-top:15%;">
										   <input type="hidden" id="'.$donnes['delay'].'">
										   <label>Delay:</label>
											   <input type="date" class="form-control" id="date1-'.$donnes['id_ordering'].'" value="'.$donnes['delay'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['date_current'].'">
										   <label>Date of start:</label>
											   <input type="date" class="form-control" id="date2-'.$donnes['id_ordering'].'" value="'.$donnes['date_current'].'">
										   </div>
									  </div>
									  
									  <div class="modal-footer">
										  <button type="button" class="btn btn-default" data-dismiss="modal" >close</button>
										  <button type="submit" onclick="UpdateData('.$donnes["id_ordering"].')" class="btn btn-primary" >Save changes</button>
									  </div>
									  </form>
						   </div>
					  </div>
			  </div>
													 <button type="button" onclick="deleteData('.$donnes["id_ordering"].')" style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px" class="btn btn-danger bt-xs delete"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>
												 </td>
											</tr>
									
									';   
								}
						 }
		?>
			 </tbody>
		  </table>
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


      <div class="modal fade" id="kwemeza" tabIndex="-1" role="dialog" aria-labelledby="editLabel">
		 <div class="modal-dialog" role="document">
			 <div class="modal-content">
				 <div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-label="close" ><span arial-hidden="true">&times;</span></button>
						 <h4 class="modal-title" id="editLabel">Register<h4>
					 </div>
					  <form>
							 <div class="modal-body"> 
								  <div class="form-group">
									 <label style="float:left">Telephone:</label>
									<input type="text" class="form-control input-sm" id="id_customer" aria-describedby="sizing-addon1">
									 </div>
									 <div class="form-group">
									 <label style="float:left">Name:</label>
									<input type="text" class="form-control input-sm" id="name_customer" aria-describedby="sizing-addon1">
									 </div>
									<div class="form-group">
									 <label style="float:left">Other name:</label>
									<input type="text" class="form-control input-sm" id="last_name_customer" aria-describedby="sizing-addon1">
									 </div>
									 <div class="form-group">
									 <label style="float:left">Company name:</label>
									<input type="text" class="form-control input-sm" id="company" aria-describedby="sizing-addon1">
									 </div>
									<div class="form-group">
									<label style="float:left">Company location:</label>
									<input type="text" class="form-control" id="address">
									</div>
									<div class="form-group">
									<label style="float:left">Email:</label>
									<input type="text" class="form-control" id="email">
									</div>
							</div>					  
									  <div class="modal-footer">
										  <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
										  <button type="submit" onclick="kwemeza()" class="btn btn-primary" >Confirm</button>
									  </div>
					 </form>
			</div>
		</div>
	</div>
  
  
  
  <script src='assets/jquery-3.2.1.min.js'> </script>
  <script src="assets/bootstrap.min.js" ></script>
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
  <script src="assets/jquery.dataTables.js"></script>
     <script>
  
  $(document).ready(function(){
	    $("#mydata").DataTable();
		 $("#mydata3").DataTable();
  });
  </script>
      <script>
    function deleteData(str){
			var id = str;
			$.ajax({
			 type: "POST",
			 url: "server.php?p=del",
			 data: "id="+id,
			 success: function(result){
				document.location.href = "admin.php?phone="+eme; 
			 }
		});
	}
    
    function UpdateData(str){
            var id = str;
			var fone = $("#phone-"+str).val();
			var name= $("#name-"+str).val();
			var last_name= $("#last_name-"+str).val();
			var company= $("#company-"+str).val();
			var address= $("#address-"+str).val();
			var email= $("#email-"+str).val();
			$.ajax({
			 url: "server.php?p=editcust",
			 type: "POST",
			 data: "fone="+fone+"&name="+name+"&last_name="+last_name+"&company="+company+"&address="+address+"&email="+email,
			 success: function(data){
			 }
		});
	}
	
	   function UpdateCustomer(){
			var fone = $("#id_customer").val();
			var name= $("#name_customer").val();
			var last_name= $("#last_name_customer").val();
			var company= $("#company").val();
			var address= $("#address").val();
			var email= $("#email").val();
			$.ajax({
			 url: "server.php?p=editcust",
			 type: "POST",
			 data: "fone="+fone+"&name="+name+"&last_name="+last_name+"&company="+company+"&address="+address+"&email="+email,
			 success: function(data){
			 }
		});
	}
  </script>
  <input name="animation" type="hidden">
  </body>
</html>