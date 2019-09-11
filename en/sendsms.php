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
   <link rel="stylesheet" href="font-awesome/font-awesome/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <style>
  #mydata{
      border:2px solid #D5DBDB;
	  height:100%
  }
  #mydata2{
      border:2px solid #D5DBDB;
	  height:100%;
	  font-family:"Courier New", Courier, monospace;
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
  tr{ border:2px solid #F2F3F9;font-size:0.75rem;font-family: Arial;cursor:pointer}
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
		margin-bottom:50px;
	  }
  body{
	font-size:0.7rem;
	font-family: Arial;
	background-color:#D5DBDB;
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
th{font-family:"Courier New", Courier, monospace;}
td{font-family:"Courier New", Courier, monospace;}
.activer{
	background:#F6F7FA;
	border-left:5px solid #4597C1;
}
.fa-ul li:hover {
		background:#F6F7FA;
	    border-left:5px solid #4597C1;
		text-underline:none;
	    color:none;
}
.tab-content{margin-top:20px;}
.tab-content{margin-top:20px;}
#my-column4{margin-top:-7%;display:none}
h6{font-family:"Courier New", Courier, monospace;font-weight:bold}
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
		<a href='' id='logo'><strong style="color:#4597C1;font-family:'Lucida Console', Monaco, monospace;">Dashboard App</strong></a>
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
			  <li class="li"><i class="fa fa-user" aria-hidden="true"></i><a href="admin.php">&nbsp&nbspCustomer Management</a></li>
			  <li class="activer li"><i class="fa fa-paper-plane" aria-hidden="true"></i><a href="#">&nbsp&nbsp Send SMS</a></li>
			  <li class="li"><i class="fa fa-cogs" aria-hidden="true"></i><a href="#">&nbsp&nbsp Settings</a></li>
			  <li class="li"><i class="fa fa-file" aria-hidden="true"></i><a href="#">&nbsp&nbsp Report</a></li>
			</ul>
       </div>
    <div class='col-lg-9 col-sm-12 col-xs-12' id='my-column'>
		<ul class="nav nav-pills">
		  <li class="active"><a data-toggle="pill"  href="#home">One SMS</a></li>
		  <li><a data-toggle="pill" href="#menu1">SMS Group</a></li>
		</ul>

		<div class="tab-content">
		  		  <div id="home" class="tab-pane fade in active">
				<h5  style="font-family:'Lucida Console', Monaco, monospace">Send An SMS </h5>
				<div class='col-lg-6 col-sm-12 col-xs-12' id='my-column3'>
				<form class="form-horizontal" role="form">
					  <div class="form-group">
						<label class="control-label col-sm-2" for="tel">Tel:</label>
						<div class="col-sm-10">
						 <input type="text" class="form" id="tel" />
						  <a style="padding:2px 5px;margin-top:-0px;color:#4597C1;cursor:pointer" onclick="getTel()"><i class="fa fa-search" aria-hidden="true"></i></a>
						</div>
					  </div>
					  <div class="form-group">
						<label class="control-label col-sm-2" for="mssg">Your message:</label>
						<div class="col-sm-10"> 
						  <textarea class="form" id="mssg" style="font-family:'Lucida Console', Monaco, monospace" id="pwd" name="mssg" rows="5" cols="40"></textarea>
						</div>
					  </div>
					  <div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">
						  <button type="submit" Onclick="send()" style="border:3px solid #4597C1;margin-top:-0px;" class="btn btn-default"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
						</div>
					  </div>
                </form>
				</div>
				<div class='col-lg-6 col-sm-12 col-xs-12' id='my-column4'>
					<ul class="nav nav-pills" style="left:-10px;">
					  <li class="active"><a data-toggle="pill" href="#home2">Suppliers</a></li>
					  <li><a data-toggle="pill" href="#menu2">Buyers</a></li>
					</ul>

					<div class="tab-content" style="padding:0px 20px;">
					   <div id="home2" class="tab-pane fade in active">
					       <div style="margin-top:-25px;margin-bottom:20px;border-bottom:2px solid #F6F7FA">
						 <h6>Suppliers</h6>
						<button type="button" style="float:right;padding:2px 5px;margin-bottom:-5px;margin-top:-30px" class="btn btn-infos" data-toggle="modal" data-target="#kwemeza"><i class="fa fa-user-plus" aria-hidden="true"></i></button>
						</div>
                           	<table style="float:right;" class="table table-bordered table-striped" id="mydata2">
											 <thead>
												<tr>
													<th>Phone</th>
													<th>Names</th>
												</tr>
											 </thead>
											 <tbody>
											 <?php
											 $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
									 $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');
												  $reponse=$bdd->query("SELECT * FROM suppliers");
														 while ($donnes = $reponse->fetch())
														{
															echo'
																	<tr onclick="recupere(this)" onmouseover="change(this)" onmouseout="unchange(this)">
																		 <td>'.$donnes['tel'].'</td>
																		 <td>'.$donnes['name'].' '.$donnes['last_name'].'</td>
																	</tr>
															
															';   
														}
											 ?>
											</tbody>
					</table>
					  </div>
					  <div id="menu2" class="tab-pane fade">
					  <div style="margin-top:-25px;margin-bottom:20px;border-bottom:2px solid #F6F7FA">
					    <h6>Buyers</h6>
						</div>
								<table style="float:right;" class="table table-bordered table-striped" id="mydata">
												 <thead>
													<tr>
														<th>Phone</th>
														<th>Names</th>
													</tr>
												 </thead>
												 <tbody>
												 <?php
								$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
                                                                  $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'inyungu_inyungu', 'QHTJ-h^5mAQH');													  
                                                                    $reponse=$bdd->query("SELECT * FROM order_user");
															 while ($donnes = $reponse->fetch())
															{
																echo'
																		<tr onclick="recupere(this)" onmouseover="change(this)" onmouseout="unchange(this)">
																			 <td>'.$donnes['phone'].'</td>
																			 <td>'.$donnes['name'].' '.$donnes['last_name'].'</td>
																		</tr>
																
																';   
															}
												 ?>
												</tbody>
						</table>  
					  </div>
					</div>
			    </div>
		  </div>
		  <div id="menu1" class="tab-pane fade">
				<h5 style="font-family:'Lucida Console', Monaco, monospace">GROUP SMS</h5>
				<p></p>
				<div class='col-lg-6  col-lg-offset-3 col-sm-12 col-xs-12' id='my-column6'>
				<form class="form-horizontal" name="demo" role="form">
					  <div class="form-group" style="left:10px;">
	                       <table style="float:right" class="table table-bordered table-striped" id="mydata3">
										 <thead>
											<tr>
												<th width="10%">Action</th>
												<th width="10%">Phone</th>
												<th width="20%">Names</th>
											</tr>
										 </thead>
										 <tbody>
										 <?php
											  $reponse=$bdd->query("SELECT * FROM order_user");
													 while ($donnes = $reponse->fetch())
													{
														echo'
																<tr onclick="recupere(this)" onmouseover="change(this)" onmouseout="unchange(this)">
																     <td><label><input type="checkbox" id="'.$donnes['phone'].'" name="checkboxa" value=""></label></td>
																	 <td id="'.$donnes['phone'].'">'.$donnes['phone'].'</td>
																	 <td>'.$donnes['name'].' '.$donnes['last_name'].'</td>
																</tr>
														
														';   
													}
										 ?>
										</tbody>
                             </table>
					  </div>
					  <div class="form-group">
						<label class="control-label col-sm-2" for="pwd">Your message:</label>
						<div class="col-sm-10"> 
						  <textarea class="form" style="font-family:'Lucida Console', Monaco, monospace" id="mssge" name="mssge" rows="5" cols="40"></textarea>
						</div>
					  </div>
					  <div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">
						  <button type="submit" Onclick="sende()" style="border:3px solid #4597C1;margin-top:-0px;" class="btn btn-default"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
						</div>
					  </div>
                                    </form>
				</div>
		    </div>
		</div>
        </div>
  </section>
  </div>
  
  
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
									<label style="float:left">ID number:</label>
									<input type="number" class="form-control input-sm" id="id" aria-describedby="sizing-addon1">
									 </div>
									 <div class="form-group">
									 <label style="float:left">Name:</label>
									<input type="text" class="form-control input-sm" id="name" aria-describedby="sizing-addon1">
									 </div>
									<div class="form-group">
									 <label style="float:left">Other name:</label>
									<input type="text" class="form-control input-sm" id="last_name" aria-describedby="sizing-addon1">
									 </div>
									 <div class="form-group">
									 <label style="float:left">Address:</label>
									<input type="text" class="form-control input-sm" id="aderesi" aria-describedby="sizing-addon1">
									 </div>
									<div class="form-group">
									<label style="float:left">Products:</label>
									<input type="text" class="form-control" id="ibicuruzwa">
									</div>
									<div class="form-group">
									<label style="float:left">Surface:</label>
									<input type="text" class="form-control" id="ubuso">
									</div>
									<div class="form-group">
									<label style="float:left">Telephone:</label>
									<input type="text" class="form-control" id="telefoni">
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
		 $("#mydata2").DataTable();
		 $("#mydata3").DataTable();
  });
  </script>
    <script>
	var em = "<?php if(isset($_GET['phone'])){echo '1';} else echo "0";?>";
     if(em == 1){
		  document.getElementById('tabl1').style.display='block';
		  document.getElementById('tabl2').style.display='none';  
        }
     else if(em == 0){
		  document.getElementById('tabl2').style.display='block';
		  document.getElementById('tabl1').style.display='none';  
   }
   function getTel(){
          document.getElementById('my-column4').style.display='block';  
   }
     function recupere(obj){
		 
		  var oInput = obj.getElementsByTagName('TD');		  
		  document.getElementById("tel").value=oInput[0].innerHTML;
}
    function send(){
			var tel = $("#tel").val();
			var mssge= $("#mssg").val();
			$.ajax({
			 url: "server.php?p=sms",
			 type: "POST",
			 data: "tel="+tel+"&mssg="+mssge,
			 success: function(result){
				 alert("SMS sent");
			 }
		});
	}
        function sende(){
		    for(var i=0;i<document.forms['demo'].checkboxa.length;i++){
			    if(document.forms['demo'].checkboxa[i].checked){
					var tel = document.forms['demo'].checkboxa[i].getAttribute('id');
					var mssge= $("#mssge").val();
					alert(mssge);
					$.ajax({
						 url: "server.php?p=sms",
						 type: "POST",
						 data: "tel="+tel+"&mssg="+mssge,
						 success: function(result){
							 alert("SMS sent");
						 }
					});
				}
	        }
		}
    function UpdateData(str){
            var id = str;
			var fon = $("#fone-"+str).val();
			var product= $("#product-"+str).val();
			var quantity= $("#quantity-"+str).val();
			var timer = $("#time_ordering-"+str).val();
			var delay= $("#date1-"+str).val();
			var date_current= $("#date2-"+str).val();
			alert(fon);
			$.ajax({
			 url: "server.php?p=edit",
			 type: "POST",
			 data: "id="+id+"&product="+product+"&quantity="+quantity+"&date1="+delay+"&date2="+date_current+"&phone="+fon+"&time="+timer,
			 success: function(data){
			 }
		});
	}
	
	    function kwemeza(){
			var id = $("#id").val();
			var name= $("#name").val();
			var last_name= $("#last_name").val();
			var address = $("#aderesi").val();
			var product= $("#ibicuruzwa").val();
			var superficie= $("#ubuso").val();
			var tel= $("#telefoni").val();
			$.ajax({
			 url: "server.php?p=add2",
			 type: "POST",
			 data: "id="+id+"&name="+name+"&last_name="+last_name+"&address="+address+"&product="+product+"&superficie="+superficie+"&tel="+tel,
			 success: function(data){	
                             	   
			   alert("you've successfully registered in the system");
			 }
		});
	}
  </script>
  </body>
  </html>