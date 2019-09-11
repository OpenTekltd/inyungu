<?php

class IguProductsController extends GxController {

    public function filters() {
        return array(
            'accessControl',
        );
    }

    public function accessRules() {
        return array(
            array('allow',
                'actions' => array('index', 'view'),
                'users' => array('@'),
            ),
            array('allow',
                'actions' => array('minicreate', 'create', 'update', 'admin', 'delete', 'GeneratePdf', 'GenerateExcel', 'index', 'view'),
                'expression' => '$user->status == 2',
            ),
            array('deny',
                'users' => array('*'),
            ),
        );
    }

    public function actionView($id) {
        $this->render('view', array(
            'model' => $this->loadModel($id, 'IguProducts'),
        ));
    }

    public function actionCreate() {
        $model = new IguProducts;

        if (isset($_POST['IguProducts'])) {
            $rnd = rand(0, 99999);
            $model->setAttributes($_POST['IguProducts']);

            $uploadedFile = CUploadedFile::getInstance($model, 'image');
            if (empty($uploadedFile)) {
                $fileName = 'default.jpg';
            } else {
                $fileName = "{$rnd}-{$uploadedFile}";  // random number + file name
                $model->image = $fileName;
            }
            if ($model->save()) {

                $uploadedFile->saveAs(Yii::app()->basePath . '/../images/products/' . $fileName);
                $this->redirect(array('view', 'id' => $model->id));
            }
        }
        $this->render('create', array(
            'model' => $model,
        ));
    }

    public function actionUpdate($id) {
        $model = $this->loadModel($id, 'IguProducts');

        $this->performAjaxValidation($model, 'igu-products-form');

        if (isset($_POST['IguProducts'])) {
            $_POST['IguProducts']['image'] = $model->image;
            $model->setAttributes($_POST['IguProducts']);
            $uploadedFile = CUploadedFile::getInstance($model, 'image');
            if ($model->save()) {
                if (!empty($uploadedFile)) {  // check if uploaded file is set or not
                    $uploadedFile->saveAs(Yii::app()->basePath . '/../images/products/' . $model->image);
                }
                $this->redirect(array('view', 'id' => $model->id));
            }
        }

        $this->render('update', array(
            'model' => $model,
        ));
    }

    public function actionDelete($id) {
        if (Yii::app()->getRequest()->getIsPostRequest()) {
            $this->loadModel($id, 'IguProducts')->delete();

            if (!Yii::app()->getRequest()->getIsAjaxRequest())
                $this->redirect(array('admin'));
        } else
            throw new CHttpException(400, Yii::t('app', 'Your request is invalid.'));
    }

    public function actionIndex() {
        $dataProvider = new CActiveDataProvider('IguProducts');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    public function actionAdmin() {
        $model = new IguProducts('search');
        $model->unsetAttributes();

        if (isset($_GET['IguProducts']))
            $model->setAttributes($_GET['IguProducts']);

        $this->render('admin', array(
            'model' => $model,
        ));
    }

    public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['IguProducts_records']))
               {
                $model=$session['IguProducts_records'];
               }
               else
                 $model = IguProducts::model()->findAll();

		
		Yii::app()->request->sendFile(date('YmdHis').'.xls',
			$this->renderPartial('excelReport', array(
				'model'=>$model
			), true)
		);
	}
    
    public function actionGeneratePdf() {
        $session = new CHttpSession;
        $session->open();
        Yii::import('application.modules.admin.extensions.giiplus.bootstrap.*');
        require_once('tcpdf/tcpdf.php');
        require_once('tcpdf/config/lang/eng.php');

        if (isset($session['IguProducts_records'])) {
            $model = $session['IguProducts_records'];
        } else
            $model = IguProducts::model()->findAll();



        $html = $this->renderPartial('expenseGridtoReport', array(
            'model' => $model
                ), true);

        //die($html);

        $pdf = new TCPDF();
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor(Yii::app()->name);
        $pdf->SetTitle('IguProducts Report');
        $pdf->SetSubject('IguProducts Report');
        //$pdf->SetKeywords('example, text, report');
        $pdf->SetHeaderData('', 0, "Report", '');
        $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Example Report by " . Yii::app()->name, "");
        $pdf->setHeaderFont(Array('helvetica', '', 8));
        $pdf->setFooterFont(Array('helvetica', '', 6));
        $pdf->SetMargins(15, 18, 15);
        $pdf->SetHeaderMargin(5);
        $pdf->SetFooterMargin(10);
        $pdf->SetAutoPageBreak(TRUE, 0);
        $pdf->SetFont('dejavusans', '', 7);
        $pdf->AddPage();
        $pdf->writeHTML($html, true, false, true, false, '');
        $pdf->LastPage();
        $pdf->Output("IguProducts_002.pdf", "I");
    }

}
