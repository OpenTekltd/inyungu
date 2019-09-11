<?php
  include('sender.php');
	 $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
     $bdd = new PDO('mysql:host=localhost;dbname=inyungu_newdb;charset=utf8', 'mupagasi', 'itdc@SYS=2');
	 if(isset($_GET["p"])){
       if($_GET['p']=="edit"){
		    $req = $bdd->prepare('UPDATE ordering SET product =:product,time_ordering =:time_ordering,quantity =:quantity,delay =:delay,date_current =:date_current,phone =:phone WHERE id_ordering =:id');
            $req->execute(array(
            'product' =>$_POST['product'],
            'time_ordering' =>$_POST['time'],
			'quantity' =>$_POST['quantity'],
			'delay' =>$_POST['date1'],
            'date_current'=>$_POST['date2'],
			'phone'=>$_POST['phone'],
			'id'=>$_POST['id']
            ));
	    }
		else if($_GET['p']=="add"){
			$req = $bdd->prepare('INSERT INTO ordering(id_ordering, product, time_ordering, quantity, delay, date_current, phone) VALUES(:id_ordering, :product, :time_ordering, :quantity, :delay, :date_current, :phone)');
            $req->execute(array(
			'id_ordering' => '',
            'product' =>$_POST['product'],
			'time_ordering' =>$_POST['time'],
			'quantity' => $_POST['quantity'],
			'delay' => $_POST['date1'],
		    'phone' => $_POST['phone'],	
            'date_current'=>$_POST['date2']
            ));
		}
		else if($_GET['p']=="sms"){
					    $ad=$_POST['mssg'];
                        $adc='InyunguLtd.';
                        $reciever='25'.$_POST['tel'];
                        $obj = new Sender("121.241.242.114","8080","cyu-inyungu","opentek@",$adc,$ad,$reciever,"0","1");  
                        $obj->Submit (); 
		}
		else if($_GET['p']=="del"){
           $req = $bdd->prepare("DELETE FROM ordering WHERE id_ordering = :id");
		   $req->execute(array('id' => $_POST['id']));
		}
		else if($_GET['p']=="kwemeza"){
		$user=$_POST['fone'];
		echo "hello";
		$reponse = $bdd->query("SELECT * FROM order_user WHERE phone = '$user'");
                  while($donnees=$reponse->fetch()){
			if($donnees['password']==$_POST['name'])
				{
		                   echo "<script>document.location.href = 'admin.php';</script>";
				}
		          }
		}
			else if($_GET['p']=="add2"){
			$req = $bdd->prepare('INSERT INTO suppliers(ID_No, name, last_name, location, product, superficie, tel) VALUES(:ID_No, :name, :last_name, :location, :product, :superficie, :tel)');
                        $req->execute(array(
			'ID_No' => $_POST['id'],
                        'name' =>$_POST['name'],
			'last_name' =>$_POST['last_name'],
			'location' => $_POST['address'],
			'product' => $_POST['product'],
		        'superficie' => $_POST['superficie'],	
                        'tel'=>$_POST['tel']
            ));
		}
    }
?>
