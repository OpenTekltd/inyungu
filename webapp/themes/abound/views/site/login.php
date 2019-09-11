<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Kwinjira';
$this->breadcrumbs=array(
	'Kwinjira',
);
?>
<div class="page-header">
	<h1>Injira <small>muri konti yawe</small></h1>
</div>
<div class="row-fluid">
	
    <div class="span6 offset3">
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>"Uzuza ibyo usabwa",
	));
	
?>



    <p>Mushobora gukoresha izina mukoresha na akajambo k ibanga:</p>
    
    <div class="form">
    <?php $form=$this->beginWidget('CActiveForm', array(
        'id'=>'login-form',
        'enableClientValidation'=>true,
        'clientOptions'=>array(
            'validateOnSubmit'=>true,
        ),
    )); ?>
    
        <p class="note">Utuzu turiho aka kantu <span class="required" style="color: red;">*</span> nitegeko kuhuzuza.</p>
    
        <div class="row">
            <?php echo $form->labelEx($model,'<b>Izina Ukoresha</b>'); ?>
            <?php echo $form->textField($model,'username'); ?>
            <span style="color: red;"><?php echo $form->error($model,'username'); ?></span>
        </div>
    
        <div class="row">
            <?php echo $form->labelEx($model,'<b>Akajambo k ibanga</b>'); ?>
            <?php echo $form->passwordField($model,'password'); ?>
            <span style="color: red;"><?php echo $form->error($model,'password'); ?></span>
            <p class="hint">
               <h5><a href='?r=user/create&create=1'>Iyandikishe <kbd>Hano</kbd></a></h5>
            </p>
        </div>
    
        <div class="row rememberMe">
            <?php echo $form->checkBox($model,'rememberMe'); ?>
            <?php echo $form->label($model,'rememberMe'); ?>
            <span style="color: red;"><?php echo $form->error($model,'rememberMe'); ?></span>
        </div>
    
        <div class="row buttons">
            <?php echo CHtml::submitButton('Login',array('class'=>'btn btn btn-primary')); ?>
        </div>
    
    <?php $this->endWidget(); ?>
    </div><!-- form -->

<?php $this->endWidget();?>

    </div>

</div>