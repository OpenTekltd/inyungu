<?php

$this->breadcrumbs = array(
	$model->label(2) => array('index'),
	GxHtml::valueEx($model) => array('view', 'id' => GxActiveRecord::extractPkValue($model, true)),
	Yii::t('app', 'Update'),
);

?>

<h1><?php echo Yii::t('app', 'Hindura') . ' ' . GxHtml::encode($model->label()) ; ?></h1>

<?php
$this->renderPartial('_form', array(
		'model' => $model));
?>