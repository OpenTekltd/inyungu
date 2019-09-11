<h3><?php echo Yii::t('app', 'Reba') . ' ' . GxHtml::encode($model->label()) ; ?></h3>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data' => $model,
	'attributes' => array(
array(
			'name' => 'idproduct0',
			'type' => 'raw',
			'value' => $model->idproduct0 !== null ? GxHtml::link(GxHtml::encode(GxHtml::valueEx($model->idproduct0)), array('iguProducts/view', 'id' => GxActiveRecord::extractPkValue($model->idproduct0, true))) : null,
			),
			
			'currentprice',
			'creationdate',
			'quantity',
			'totalamount',
			'idclient0.telephone',
			'idclient0.name',
			'idclient0.email',
			'idclient0.iddistrict0.idprovince0.province',
			'idclient0.iddistrict0.district',
			'idclient0.sector',
			'idclient0.nameofcooperative',
			'detail',
	),
)); ?>

	
	  <?php
	 $i=1;
	foreach($model->iguImageProducts as $relatedModel) {
	?>
	<div class="span3 well">
	  <?php
        
        echo CHtml::image(Yii::app()->request->baseUrl.'/products/'.GxHtml::valueEx($relatedModel),"image",array("width"=>200));
		echo '&nbsp;';
		if($i%4 == 0)
	      echo '<br/>';
		
		$i++;
?> 

	</div><!--/span-->
	<?php
		}
	
?>



		