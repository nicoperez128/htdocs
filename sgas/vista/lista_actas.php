<div id="where-who">
	<div class="where"> Actas</div><div class="where-forward"> >> </div><div class="where">Lista de actas</div>
</div>
<div id="wrapper-formulario" style="padding-top:10px;">
<?php 
$db_data = $sgasdb;
$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);$db_data = $sgasdb;
$listadoPaginado = $sgas_dbdrv->query("SELECT id, correlativo,  id_cuerpo, id_compania, fecha FROM acta_servicio");
?>
<table class="display" id="tabla-general" class="records_list" style="width: 100%" >
			<thead>
				<tr class="header">
					<th class="campos">ID</th>
					<th class="campos">CORRELATIVO</th>
					<th class="campos">CUERPO</th>
					<th class="campos">COMPANIA</th>
					<th class="campos">FECHA</th>
				</tr>
			</thead>
			<tbody>
				<?php
				foreach ($listadoPaginado as $value) {
					?>
					<tr>
						<td><?php echo $value['id']?></td>
						<td><?php echo $value['correlativo']?></td>
						<td><?php echo $value['id_cuerpo']?></td>
						<td><?php echo $value['id_compania']?></td>
						<td><?php echo $value['fecha']?></td>
					</tr>
					<?php
				}
				?>
			</tbody>
		</table>
	<div class="button-reg-bar">
		<div class="container-button">
			<a href="" class="boton-activar" id="generar-excel-bomberos">Generar Excel</a>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('#tabla-general').dataTable({
			"oLanguage": {
			"sProcessing": "Por favor espere...",
			"sSearch": "B&uacute;squeda general:",
			"sLengthMenu": "Mostrar _MENU_ elementos por p&aacute;gina",
			"sZeroRecords": "No se encontraron elementos",
			"sInfo": "Mostrando _START_ a _END_ en _TOTAL_ elementos",
			"sInfoEmpty": "Mostrando 0 a 0 de 0 elementos",
			"sInfoFiltered": "(Filtrando en _MAX_ elementos)",
			"oPaginate": {
				"sPrevious": "<<",
				"sNext": ">>",
				"sLast": "&Uacute;ltima",
				"sFirst": "Primera"
			}},
			"sPaginationType":"full_numbers",
			"aaSorting":[[2, "desc"]],
			"bJQueryUI":true
		});
	});

$('#generar-excel-bomberos').bind('click',function(event){        
            // Mostrar loading
            $("#loader_panel_busqueda").fadeIn("slow");
            $.ajax({                
                url: 'listado_xls.php',
                dataType: 'json',
                data: ({'region_id' : region_id, 'provincia_id' : provincia_id, 'cuerpo_id' : cuerpo_id, 'compannia_id' : compannia_id, 'especialidad_id' : especialidad_id,
                    'genero_id' : genero_id, 'fecha_ingreso_inicio' : fecha_ingreso_inicio, 'fecha_ingreso_fin' : fecha_ingreso_fin, 'edad_desde' : edad_desde, 'edad_hasta' : edad_hasta, 'estado_id' : estado_id, 'subestado_id' : subestado_id}),
                success: function(respuesta) {
                    $("#loader_panel_busqueda").fadeOut("slow");					
                    document.location = respuesta;
                },
                failure: function(){
                    $("#loader_panel_busqueda").fadeOut("slow");
                    alert('Ha ocurrido un problema en el servidor');
                }
            });
        });
</script>
<!-- <div class="table" style="overflow:auto;">
				<p>
					<label for="padron">Correlativo:</label>
					<input id="c1" name="data[generales][correlativo]" value='1' placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF READONLY/>
				</p>
				<p>
					<label for="tipo">Correlativo tipo de servicio:</label>
					<input id="c1" name="data[generales][correlativo_tipo]" value='1' placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF READONLY/>
				</p> -->
			<?php //include(ROOT.DS."controlador".DS."lista_actas.php");?>
<!-- </div> -->