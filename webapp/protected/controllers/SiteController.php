<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		$this->render('index');
	}
    public function actionDashboard()
	{
      $sql = "select count(*) num,c.cash cash from igu_payment p,igu_voucher v,igu_credit c where p.vouchernumber = v.vouchernumber and c.id = v.idcredit and validity = 0  group by c.cash";
		$command = Yii::app()->db->createCommand($sql);         
	    $results = $command->queryAll();      
       
        $lcv = 0;
        $credit = array();
        $counts = array();
        foreach ($results as $result)
        {
            $credit[$lcv] = $result['cash'];
            $counts[] = (int)$result['num'];
            $lcv++;
        }
        
        $this->render('dashboard', array('credit'=>$credit, 'num'=>$counts));    
	}
	public function actionMinagriDashboard()
	{
      $sql = "select count(*) num,d.district district from igu_registration r,igu_district d where d.id = r.iddistrict group by r.iddistrict";
	  //$sql = "select count(*) num,district from igu_district group by district";
		$command = Yii::app()->db->createCommand($sql);         
	    $results = $command->queryAll();      
       
        $lcv = 0;
        $credit = array();
        $counts = array();
        foreach ($results as $result)
        {
            $credit[$lcv] = $result['district'];
            $counts[] = (int)$result['num'];
            $lcv++;
        }
        
        $this->render('minagriDashboard', array('credit'=>$credit, 'num'=>$counts));    
	}
	
	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		if($error=Yii::app()->errorHandler->error)
		{
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else
				$this->render('error', $error);
		}
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$name='=?UTF-8?B?'.base64_encode($model->name).'?=';
				$subject='=?UTF-8?B?'.base64_encode($model->subject).'?=';
				$headers="From: $name <{$model->email}>\r\n".
					"Reply-To: {$model->email}\r\n".
					"MIME-Version: 1.0\r\n".
					"Content-Type: text/plain; charset=UTF-8";

				mail(Yii::app()->params['adminEmail'],$subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
			   if(Yii::app()->user->status == 4)
				$this->redirect('index.php?r=site/minagriDashboard');
			   else
			   $this->redirect('index.php?r=site/dashboard');
		}
		// display the login form
		$this->render('login',array('model'=>$model));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect('index.php?r=site/login');
		
	}
	public function actionCitydata()
   {
	   //check if isAjaxRequest and the needed GET params are set 
	   ECascadeDropDown::checkValidRequest();
	 
	   //load the cities for the current province id (=ECascadeDropDown::submittedKeyValue())
	    $data = Imirenge::model()->findAll('iddistrict=:iddistrict',array(':iddistrict'=>ECascadeDropDown::submittedKeyValue()));
	   //Convert the data by using 
	   //CHtml::listData, prepare the JSON-Response and Yii::app()->end 
	   ECascadeDropDown::renderListData($data,'id', 'umurenge');
   
   
}
}