<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="30px">
		      id		</th>
 		<th width="80px">
		      idsouscategory 		</th>
 		<th width="80px">
		      productname		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id; ?>
		</td>
       		<td>
			<?php echo $row->idsouscategory; ?>
		</td>
       		<td>
			<?php echo $row->productname; ?>
		</td>
       		
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>
