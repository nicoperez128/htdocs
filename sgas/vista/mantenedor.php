<div id="where-who">
	<div class="where"> Mantenedor</div><div class="where-forward"> >> </div><div class="where"><?php echo $mantenedores[$_GET['m']]['nombre']?></div>
</div>
<div id="wrapper-formulario">
</div>
<div id="left-nav-bar">
    <div class="left-catnav">
        <ul>
        	<?php foreach ($mantenedores as $k => $v):?>
			<li><a href="<?php echo PAGE_URL;?>?u=mantenedor&m=<?php echo $k?>" title=""><?php echo $v['nombre']?></a></li>
			<?php endforeach;?>
        </ul>
    </div>
</div>
<div class="sec-container">
		<!-- <form id="formElem" style="margin-left:50px" name="formElem" action="<?php echo CONTROLADOR?>/mantenedor.php" method="post"> -->
				<!-- <p>
					<label for="padron">Correlativo:</label>
					<input id="c1" name="data[generales][correlativo]" value='1' placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF READONLY/>
				</p>
				<p>
					<label for="tipo">Correlativo tipo de servicio:</label>
					<input id="c1" name="data[generales][correlativo_tipo]" value='1' placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF READONLY/>
				</p> -->
			<?php include(ROOT.DS."controlador".DS."mantenedor.php");?>
		<!-- </form> -->
</div>