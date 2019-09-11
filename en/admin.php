<!DOCTYPE html>
<html lang='en'>
<head>
  <!-- Site made with Mobirise Website Builder v3.12.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.12.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon"> -->
  <meta name="description" content="">
  <link rel="stylesheet" href="assets/bootstrap-theme.min.css">
  <link rel="stylesheet" href="assets/bootstrap.min.css">
    <link rel="stylesheet" href="assets/bootstrap-material-design-font/css/material.css">
  <link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
  <link rel="stylesheet" href="assets/tether/tether.min.css">
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="assets/theme/css/style.css">
   <link rel="stylesheet" href="assets/jquery.dataTables.min.css">
   <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
      <link rel="stylesheet" href="font-awesome/font-awesome/css/font-awesome.min.css">
  <style>
  #mydata{
      border:2px solid white;
	  height:100%;
  }
      #mydata thead{
      background-color:#D5DBDB;
  }
  #mydata2{
      border:2px solid white;
	  height:100%;
	  font-family:"Courier New", Courier, monospace;
  }
    #mydata2 thead{
      background-color:#D5DBDB;
  }
  .nav{background:white;
  height:70px;
  padding:15px;
  }
   .nav li a{
	   margin-right:10px;
	   font-size:0.9rem;
	   font-weight:bold;
  }
  tr{ border:2px solid white;font-size:0.75rem;font-family: Arial}
  .col-lg-3{
	  margin-top:60px;
	  padding-bottom:10px;
	  background:white;
	  padding-right:0px;
	  }
	    .col-lg-9{
	  margin-top:60px;
	  padding-bottom:10px;
	    background-color:white;
    	font-family:"Courier New", Courier, monospace;
		border-left:5px solid #F6F7FA;
		margin-bottom:10px;
	  }
  body{
	font-size:0.7rem;
	font-family: Arial;
	background-color:#D5DBDB  ;
	padding:0%;
  padding: 0px;/* décalage pour le menu de navigation */
}
#datatable2{
	text-align:left;
	color:#4597C1;
	}
	#datatable{
	text-align:center
	}
.btn{padding:8px 30px;margin-top:20px;}
#logo{
	font-size:1.6rem;
	margin-top:10%;

}
footer{
  margin-top: 30px;
}


/* affiche les zones en couleurs */
#content > div {
      background-color: #A9BCF5;
      box-shadow: inset 2px -2px 2px #DF3A01, inset -2px 2px 2px #DF3A01;
      height: 2024px;
}
.form-group input{margin:0 auto}


/*.row > div {
      background-color: #BEF781;
      box-shadow: inset 2px -2px 2px #DBA901, inset -2px 2px 2px #DBA901;
}*/
li {
	display: block;
	list-style: none; /* pour enlever les puces sur IE7 */
	padding:0%;
}
ul{	margin-top: 20px;}
.li a {
	display: inline-block;
	padding: 5px 0px;
	text-decoration: none;
	color: #0E425C;
	font-size:0.8rem;
	font-weight: bold;
	font-family:"Lucida Console", Monaco, monospace;
} 
.li i {
	display: inline-block;
	padding: 5px 0px;
	font-size:0.75rem;
	font-weight: bold;
} 
th{font-family:"Courier New", Courier, monospace;font-weight:bold}
td{font-family:"Courier New", Courier, monospace;font-weight:bold}
.btn{font-family:'Lucida Console', Monaco, monospace}
.active{
	background:#F6F7FA;
	border-left:5px solid #4597C1;
}
.fa-ul li:hover {
		background:#F6F7FA;
	border-left:5px solid #4597C1;
		text-underline:none;
	color:none;
}
#customer{cursor:pointer;}
.form-control {max-width:70%;max-height:30%;padding:0px 0px;text-align:center;font-family:"Courier New", Courier, monospace;font-weight:bold}
label{text-align:left;font-family:"Courier New", Courier, monospace;font-weight:bold}
.modal-title{font-family:"Courier New", Courier, monospace;font-weight:bold}
  </style>
  </head>
<body>
  <nav class='nav navbar-fixed-top' id='my-navbar'>
    <div class='container'>
	  <div class='navbar-header'>
	    <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#navbar-collapse'>
		<span class='icon-bar'></span>
		<span class='icon-bar'></span>
		<span class='icon-bar'></span>
		<span class='icon-bar'></span>
		</button>
		<a id='logo'><strong style="color:#4597C1;font-family:'Lucida Console', Monaco, monospace;">Dashboard App</strong></a>
	  </div>
	  <div class='collapse navbar-collapse' id='navbar-collapse'>
	  </div>
	</div>
  </nav>
 
  <p><br/><br/></p>
 <div style="width:97%;margin-top:40px;padding:0%;margin:0 auto">
  <section  style="width:100%;">
       <div class='col-lg-3 col-sm-12 col-xs-12' id="mytable">
			<ul class="fa-ul">
			  <li class="active li"><i class="fa fa-user" aria-hidden="true"></i><a href="#">&nbsp&nbspCustomer Management</a></li>
			  <li class="li"><i class="fa fa-paper-plane" aria-hidden="true"></i><a href="sendsms.php">&nbsp&nbsp Send SMS</a></li>
			  <li class="li"><i class="fa fa-cogs" aria-hidden="true"></i><a href="#">&nbsp&nbsp Settings</a></li>
			  <li class="li"><i class="fa fa-file" aria-hidden="true"></i><a href="#">&nbsp&nbsp Report</a></li>
			</ul>
       </div>
      <div class='col-lg-9 col-sm-12 col-xs-12' id='my-column'>
		<div id="tabl1" style="display:none;position:absolute;width:100%;background-color:white;right:0%;padding:0px 50px;">
		   <div class='page-header' id='datatable2'>
			  <h5><strong style="font-family:'Lucida Console', Monaco, monospace">Table of Orders</strong></h5>
			  <h6><strong style="font-size:0.9rem;font-family:'Lucida Console', Monaco, monospace">CUSTOMER Contact :</strong><small style="font-family:'Lucida Console', Monaco, monospace"><?php echo $_GET['phone']; ?></small></h6>
		  </div>
		  <table class='table table-bordered table-striped' id='mydata2'>
			 <thead>
				<tr>
					 <th >First & last Names</th>
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
						  $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
						 $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');
						  $reponse = $bdd->query("SELECT * FROM ordering WHERE phone = '$phone'");
								 while ($donnes = $reponse->fetch())
								{
									echo'
											<tr>
												 <td>'.$donnes['phone'].'</td>
												 <td>'.$donnes['product'].'</td>
												 <td>'.$donnes['quantity'].'</td>
												 <td>'.$donnes['time_ordering'].'</td>
												 <td>'.$donnes['delay'].'</td>
												 <td>'.$donnes['date_current'].'</td>
												 <td>
												<button type="button" style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px" class="btn btn-warning bt-xs update" data-toggle="modal" data-target="#edit-'.$donnes['id_ordering'].'"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></button>
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
  	 <button type="button" style="padding:5px 35px;font-weight:bold;margin-bottom:25px;font-family:'Lucida Console', Monaco, monospace;margin-top:15px;margin-left:5px;" class="btn btn-infos"><a href="admin.php"  style="color:#4597C1;">back</a></button>
  </div>
	 <div id="tabl2" style="position:relative;text-align:center;">
			   <div class='page-header' id='datatable2'>
				  <h5><strong style="font-family:'Lucida Console', Monaco, monospace">List of customers</strong></h5>
			  </div>
			  <div style="padding:0px 200px;">
				<table class="table table-bordered table-striped" id="mydata">
				 <thead>
					<tr>
						<th width="30%">Phone</th>
						<th width="30%">Names</th>
						<th width="40%">Action</th>
					</tr>
				 </thead>
				 <tbody id='customer'>
				 <?php
					 
					  $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
					  $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');
					  $reponse=$bdd->query("SELECT * FROM order_user");
							 while ($donnes = $reponse->fetch())
							{
								echo'
										<tr>
											 <td onclick="recupere(this)" id="'.$donnes['phone'].'">'.$donnes['phone'].'</td>
											 <td onclick="recupere(this)" id="'.$donnes['phone'].'">'.$donnes['name'].' '.$donnes['last_name'].'</td>
											 <td>
											 <button type="button" style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px" data-toggle="modal" data-target="#edit-'.$donnes['phone'].'" class="btn btn-warning"><i class="fa fa-pencil fa-lg" aria-hidden="true"></i></button>
											 <div class="modal fade" id="edit-'.$donnes['phone'].'" tabIndex="-1" role="dialog" aria-labelledby="editLabel-'.$donnes['phone'].'">
									  <div class="modal-dialog" role="document">
											<div class="modal-content">
										  <div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="close" ><span arial-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="editLabel-'.$donnes['phone'].'">Update Data<h4>
										  </div>
									  <form>
									  <div class="modal-body">
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['phone'].'">
										   <label style="float:left">Tel Number:</label>
										   <input disabled type="text" style="padding:0px 0px;" class="form-control input-sm" id="fone-'.$donnes['phone'].'" value="'.$donnes['phone'].'" aria-describedby="sizing-addon1">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['name'].'">
										   <label style="float:left">Name:</label>
											   <input type="text" class="form-control" id="name-'.$donnes['name'].'" value="'.$donnes['name'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['last_name'].'">
										   <label style="float:left">Last Name:</label>
											   <input type="text" class="form-control" id="last_name-'.$donnes['last_name'].'" value="'.$donnes['last_name'].'">
										   </div>
										 
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['company'].'">
										   <label style="float:left">Company:</label>
											   <input type="text" class="form-control" id="company-'.$donnes['company'].'" value="'.$donnes['company'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['address'].'">
										   <label style="float:left">Address:</label>
											   <input type="text" class="form-control" id="address-'.$donnes['address'].'" value="'.$donnes['address'].'">
										   </div>
										   <div class="form-group">
										   <input type="hidden" id="'.$donnes['email'].'">
										   <label style="float:left">Email address:</label>
											   <input type="text" class="form-control" id="email-'.$donnes['email'].'" value="'.$donnes['email'].'">
										   </div>
									  </div>					  
									  <div class="modal-footer">
										  <button type="button" class="btn btn-default" data-dismiss="modal" >close</button>
										  <button type="submit" onclick="UpdateData('.$donnes["phone"].')" class="btn btn-primary" >Save changes</button>
									  </div>
									  </form>
						   </div>
					  </div>
			  </div>
											 <button type="button" style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px" class="btn btn-danger bt-xs delete"><i class="fa fa-trash fa-lg" aria-hidden="true"></i></button>
											 <button type="button" style="padding:2px 5px;margin-bottom:-5px;margin-top:-5px;" class="btn btn-info bt-xs delete">Actif</button>
                                              											
											</td>
										</tr>
								
								';   
							}
				 ?>
				</tbody>
            </table>
			</div>
	</div>
  </div>
  </section>
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
		 $("#mydata2").DataTable();
  });
  </script>
    <script>
		var eme = "<?php if(isset($_GET['phone']) ){echo $_GET['phone'];} ?>";
		var em = "<?php if(isset($_GET['phone'])){echo '1';} else echo "0";?>";
     if(em == 1){
		  document.getElementById('tabl1').style.display='block';
		  document.getElementById('tabl2').style.display='none';  
        }
     else if(em == 0){
		  document.getElementById('tabl2').style.display='block';
		  document.getElementById('tabl1').style.display='none';  
   }
     function recupere(obj){
		 
		  var oInput = obj.getAttribute('id')	  
		  document.location.href = "admin.php?phone="+oInput; 
}
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
  </script>
  </body>
  </html>