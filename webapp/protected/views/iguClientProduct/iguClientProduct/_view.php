<div class="view">

	<b><?php echo GxHtml::encode($data->getAttributeLabel('idproduct')); ?></b>:
	<?php echo GxHtml::encode(GxHtml::valueEx($data->idproduct0)); ?>
	<br />
	<b><?php echo GxHtml::encode($data->getAttributeLabel('quantity')); ?></b>:
	<?php echo GxHtml::encode($data->quantity); ?>
	<br />
	<b><?php echo GxHtml::encode($data->getAttributeLabel('currentprice')); ?></b>:
	<?php echo GxHtml::encode($data->currentprice); ?>
	<br />
	<b><?php echo GxHtml::encode($data->getAttributeLabel('creationdate')); ?></b>:
	<?php echo GxHtml::encode($data->creationdate); ?>
	<br />
	<b><?php echo GxHtml::encode($data->getAttributeLabel('totalamount')); ?></b>:
	<?php echo GxHtml::encode($data->totalamount); ?>
	<br />
	<i><b><?php echo GxHtml::link(GxHtml::encode('Kanda hano urebe neza'), array('displayAll', 'id' => $data->id, 'st'=>2)); ?></b></i>
	<br />
	<?php /*
	<?php echo GxHtml::encode($data->getAttributeLabel('detail')); ?>:
	<?php echo GxHtml::encode($data->detail); ?>
	<br />
	*/ ?>

</div>