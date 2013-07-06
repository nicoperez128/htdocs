<div class="container-title"><h1>Nuevo acto de servicio</h1></div>
<!-- Formulario -->
<div id="wrapper-formulario">
<div id="navigation" style="display:none;">
	<ul>
		<li class="selected">
			<a><span class="step-number">1</span>Datos generales</a>
		</li>
		<li>
			<a><span class="step-number">2</span>Datos del lugar</a>
		</li>
		<li>
			<a><span class="step-number">3</span>Afectado(s)</a>
		</li>
		<li>
			<a><span class="step-number">4</span>Características</a>
		</li>
		<li>
			<a><span class="step-number">5</span>Apoyos</a>
		</li>
		<li>
			<a><span class="step-number">6</span>Depto. Técnico</a>
		</li>
		<li>
			<a><span class="step-number">7</span>Bombero accidentado</a>
		</li>
		<li>
			<a><span class="step-number">8</span>Datos internos</a>
		</li>
		<li>
			<a><span class="step-number">9</span>Datos finales</a>
		</li>
	</ul>
</div>
<div class="sec-container">
	<div id="dvLoading"></div>
	<div id="steps">
		<form id="formElem" name="formElem" method="post">
			<fieldset class="step" data-id="1">
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="dg_cuerpo">Cuerpo:</label>
							<select id="dg_cuerpo" name="data[generales][cuerpo]" required>
								<option value="">Seleccione una opción</option>
								<?php foreach($cuerpo as $c):?>
								<option value="<?php echo $c['cuerpo_id']?>"><?php echo $c['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
						   <label for="dg_compania">Compañía a cargo:</label>
						   <select id="dg_compania" name="data[generales][compania]">
								<option value="">Seleccione una opción</option>
							</select>
						</p>
						<p>
							<label for="padron">Correlativo del cuerpo:</label>
							<input id="c1" name="data[generales][correlativo]" value=''  AUTOCOMPLETE=OFF class="c1" />
						</p>
						<p>
						   <label for="tipo">Tipo de servicio:</label>
						   <select id="tipo" name="data[generales][tipo_servicio]" required>
								<option value="">Seleccione una opción</option>
								<?php foreach($tservicio as $t):?>
								<option value="<?php echo $t['id']?>"><?php echo $t['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="tipo">Correlativo tipo de servicio:</label>
							<input id="c2" class="c2" name="data[generales][correlativo_tipo]" value=''  AUTOCOMPLETE=OFF />
						</p>
						<p>
						   <label for="sector">Sector (*):</label>
							<input id="sector" name="data[generales][sector]" class="required" value="<?php echo $data['acta']['sector']?>"/>
						</p>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="g_fecha">Fecha (*):</label>
							<input id="g_fecha" name="data[generales][fecha]" placeholder="dd/mm/aaaa" AUTOCOMPLETE=OFF />
							<script>
								$(function() {
									$("#g_fecha").datepicker();
								});
							</script>
						</p>
						<p style="float:left;">
							<label style="">Hora:</label>
							<select id="gen_hora" style="float:left;width:80px;" name="data[generales][hora][h]">
								<option value="">Hora</option>
								<?php for ($i=0; $i <= 23; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
							<span style="float:left;">:</span>
							<select id="gen_minuto" style="float:left;width:80px;" name="data[generales][hora][m]">
								<option value="">Minuto</option>
								<?php for ($i=0; $i <= 59; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
						</p>						
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="2">
			   <!--Datos del lugar-->
				<div class="fields-column">
					<div class="fields-box">
					<p>
						<label for="id_tipo_via">Tipo de via:</label>
						<select id="id_tipo_via" name="data[lugar][id_tipo_via]">
							<option value="">Seleccione una opción</option>
							<?php foreach($tvia as $tv):?>
							<option value="<?php echo $tv['id']?>"><?php echo $tv['nombre']?></option>
							<?php endforeach;?>
						</select>
					</p>
					<p>
						<label for="d1">Dirección:</label>
						<input id="d1" name="data[lugar][direccion]" value=''  AUTOCOMPLETE=OFF />
					</p>
					<p>
						<label for="n1">Número:</label>
						<input id="n1" name="data[lugar][numero]" value=''  AUTOCOMPLETE=OFF />
					</p>
					<p>
						<label for="calle1">Calle o Esquina de Referencia:</label>
						<input id="calle1" name="data[lugar][calle]"  AUTOCOMPLETE=OFF />
					</p>
					<p>
					   <label for="comuna">Comuna (*):</label>
					   <select id="comuna" name="data[lugar][comuna]">
							<option value="">Seleccione una opción</option>
							<?php foreach($comuna as $c):?>
							<option value="<?php echo $c['comuna_id']?>" data-provincia="<?php echo $c['provincia']?>"><?php echo $c['descripcion']?></option>
							<?php endforeach;?>
						</select>
					</p>
					<p>
						<label for="poblacion">Población:</label>
						<input id="poblacion" name="data[lugar][poblacion]"  AUTOCOMPLETE=OFF />
					</p>
					<p>
						<label for="nro_block">Numero de block:</label>
						<input id="nro_block" name="data[lugar][nro_block]"  AUTOCOMPLETE=OFF />
					</p>
					<p>
						<label for="nro_depto">Numero de Depto.:</label>
						<input id="nro_depto" name="data[lugar][nro_depto]"  AUTOCOMPLETE=OFF />
					</p>
					<p>
						<label for="latitud">Latitud:</label>
						<input id="latitud" name="data[lugar][latitud]" AUTOCOMPLETE=OFF READONLY/>
					</p>
					<p>
						<label for="longitud">Longitud:</label>
						<input id="longitud" name="data[lugar][longitud]" AUTOCOMPLETE=OFF READONLY/>
					</p>
					<p>
						<input id="buscar_mapa" type="button" value="Buscar en Mapa">
					</p>
					</div>
				</div>

			<div class="fields-column">
				<div class="fields-box">
					<div>
						<p>
							<?php include 'vista/map_locator.php';?>
						</p>
					</div>
					<div class="clear" id="map_result">
						
					</div>
				</div>
			</div>
			</fieldset>
			<fieldset class="step" data-id="3">
				<div class="fields-column">
					<div class="fields-box">
						<div id="afectados">
							<p>
								<label for="rut">Rut del afectado:</label>
								<input id="rut" class="rut" name="data[afectado][rut]" onBlur="ThousandSeparate(this);" placeholder="Ej: 11111111-9" AUTOCOMPLETE=OFF/>
							</p>
							<p>
								<label for="nombre">Nombre del afectado:</label>
								<input id="nombre" name="data[afectado][nombre]" placeholder="Ej: Juan Perez" AUTOCOMPLETE=OFF />
							</p>
							<p>
								<label for="telefono">Teléfono:</label>
								<input id="telefono" name="data[afectado][telefono]"  AUTOCOMPLETE=OFF />
							</p>
							<p>
								<label for="id_tipo_ocupante">Tipo de ocupante:</label>
								<select id="id_tipo_ocupante" name="data[afectado][id_tipo_ocupante]">
									<option value="">Seleccione una opción</option>
									<?php foreach($tocupante as $to):?>
									<option value="<?php echo $to['id']?>"><?php echo $c['nombre']?></option>
									<?php endforeach;?>
								</select>
							</p>
							<p>
								<label for="nro_adultos">Número de adultos:</label>
								<input id="nro_adultos" name="data[afectado][nro_adultos]" placeholder="Ej: 3" AUTOCOMPLETE=OFF />
							</p>
							<p>
								<label for="nro_ninos">Número de niños:</label>
								<input id="nro_ninos" name="data[afectado][nro_ninos]" placeholder="Ej: 1" AUTOCOMPLETE=OFF />
							</p>
							
						</div>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<button type="button" id="agregar_otros_afectados">Agregar otros afectados</button>
						</p>
						<div id="otros_afectados"></div>
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="4">
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="id_lugar_inicio_fuego">Lugar de inicio del fuego:</label>
							<select id="id_lugar_inicio_fuego" name="data[caract][id_lugar_inicio_fuego]">
								<option value="">Seleccione una opción</option>
								<?php foreach($linicio as $li):?>
								<option value="<?php echo $li['id']?>"><?php echo $li['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="id_origen">Origen:</label>
							<select id="id_origen" name="data[caract][id_origen]">
								<option value="">Seleccione una opción</option>
								<?php foreach($origen as $or):?>
								<option value="<?php echo $or['id']?>"><?php echo $or['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="id_causa">Causa:</label>
							<select id="id_causa" name="data[caract][id_causa]">
								<option value="">Seleccione una opción</option>
								<?php foreach($causa as $ca):?>
								<option value="<?php echo $ca['id']?>"><?php echo $ca['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="observacion_causa">Obs. Causa:</label>
							<textarea id="observacion_causa" name="data[caract][observacion_causa]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF /></textarea>
						</p>
						<p>
							<label for="id_fuente_calor">Fuente de calor:</label>
							<select id="id_fuente_calor" name="data[caract][id_fuente_calor]">
								<option value="">Seleccione una opción</option>
								<?php foreach($fcalor as $fc):?>
								<option value="<?php echo $fc['id']?>"><?php echo $fc['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="dano_vivienda">Daño en viviendas:</label>
							<select id="dano_vivienda" name="data[caract][dano_vivienda]">
								<?php for ($i=0; $i <= 100; $i++) : ?>'+
								<option name="data[caract][dano_vivienda][]" value="<?php echo $i?>"><?php echo $i?> %</option>
								<?php endfor;?>
							</select>
						</p>
						<p>
							<label for="dano_vehiculo">Daños en vehículos:</label>
							<select id="dano_vehiculo" name="data[caract][dano_vehiculo]">
								<?php for ($i=0; $i <= 100; $i++) : ?>'+
								<option name="data[caract][dano_vehiculo][]" value="<?php echo $i?>"><?php echo $i?> %</option>
								<?php endfor;?>
							</select>
						</p>
						<p style="float:left;">
							<label for="id_unidad_explosivos">Cantidad de explosivos:</label>
							<select id="id_unidad_explosivos" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_explosivos]">
								<option value="">Unidad</option>
								<?php foreach($uexplosivos as $ue):?>
								<option value="<?php echo $ue['id']?>"><?php echo $ue['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_explosivos" name="data[caract][cantidad_explosivos]" style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_liquidos">Cantidad de liquidos:</label>
							<select id="id_unidad_liquidos" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_liquidos]" >
								<option value="">Unidad</option>
								<?php foreach($uliquidos as $ul):?>
								<option value="<?php echo $ul['id']?>"><?php echo $ul['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_liquidos" name="data[caract][cantidad_liquidos]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_venenos">Cantidad de venenos:</label>
							<select id="id_unidad_venenos" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_venenos]" >
								<option value="">Unidad</option>
								<?php foreach($uvenenos as $uv):?>
								<option value="<?php echo $uv['id']?>"><?php echo $uv['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_venenos" name="data[caract][cantidad_venenos]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_gases">Cantidad de gases:</label>
							<select id="id_unidad_gases" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_gases]" >
								<option value="">Unidad</option>
								<?php foreach($ugases as $ug):?>
								<option value="<?php echo $ug['id']?>"><?php echo $ug['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_gases" name="data[caract][cantidad_gases]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_solidos">Cantidad de sólidos:</label>
							<select id="id_unidad_solidos" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_solidos]" >
								<option value="">Unidad</option>
								<?php foreach($usolidos as $us):?>
								<option value="<?php echo $us['id']?>"><?php echo $us['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_solidos" name="data[caract][cantidad_solidos]"   style="float:left;width:110px;"placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_radioactivos">Cantidad de radioactivos:</label>
							<select id="id_unidad_radioactivos" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_radioactivos]" >
								<option value="">Unidad</option>
								<?php foreach($uradioactivos as $ur):?>
								<option value="<?php echo $ur['id']?>"><?php echo $ur['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_radioactivos" name="data[caract][cantidad_radioactivos]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_oxidantes">Cantidad de oxidantes:</label>
							<select id="id_unidad_oxidantes" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_oxidantes]" >
								<option value="">Unidad</option>
								<?php foreach($uoxidantes as $uo):?>
								<option value="<?php echo $uo['id']?>"><?php echo $uo['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_oxidantes" name="data[caract][cantidad_oxidantes]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p style="float:left;">
							<label for="id_unidad_otros">Cantidad de otros:</label>
							<select id="id_unidad_otros" style="float:left;width:80px;height:25px;" name="data[caract][id_unidad_otros]" >
								<option value="">Unidad</option>
								<?php foreach($uotros as $uot):?>
								<option value="<?php echo $uot['id']?>"><?php echo $uot['nombre']?></option>
								<?php endforeach;?>
							</select>
							<input id="cantidad_otros" name="data[caract][cantidad_otros]"  style="float:left;width:110px;" placeholder="Ej: 123" AUTOCOMPLETE=OFF />
						</p>
						<p>
							<label for="detalle_productos">Detalle de los productos:</label>
							<textarea rows="2" id="detalle_productos" name="data[caract][detalle_productos]" placeholder="Ej: abc" AUTOCOMPLETE=OFF /></textarea>
						</p>
						<button type="button" id="agregar_contenedor_gas">Agregar contenedor de gas</button>
						<div id="contenedor_gas" class="clear"></div> <br />
						<button type="button" id="agregar_empresa_dist">Agregar empresa distribuidora de gas</button>
						<div id="empresa_dist" class="clear"></div> <br />						
					</div>
				</div>

				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="id_tipo_vehiculo">Tipo de vehículo:</label>
							<select id="id_tipo_vehiculo" name="data[caract][id_tipo_vehiculo]">
								<option value="">Seleccione una opción</option>
								<?php foreach($tvehiculo as $tv):?>
								<option value="<?php echo $tv['id']?>"><?php echo $tv['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="id_marca_vehiculo">Marca del vehículo:</label>
							<select id="id_marca_vehiculo" name="data[caract][id_marca_vehiculo]">
								<option value="">Seleccione una opción</option>
								<?php foreach($marcas_v as $mv):?>
								<option value="<?php echo $mv['id']?>"><?php echo $mv['nombre']?></option>
								<?php endforeach;?>
							</select>
						</p>
						<p>
							<label for="id_modelo_vehiculo">Modelo del vehículo:</label>
							<select id="id_modelo_vehiculo" name="data[caract][id_modelo_vehiculo]">
								<option value="">Seleccione una opción</option>
							</select>
						</p>
						<p>
							<label for="patente">Patente:</label>
							<input id="patente" name="data[caract][patente]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF />
						</p>
					</div>
					<div class="fields-box">
						<button type="button" id="agregar_compania_aseguradora">Agregar compañía aseguradora</button>
						<div id="compania_aseguradora"></div>
						<p>
							<label for="nro_poliza">Número de póliza:</label>
							<input id="nro_poliza" name="data[caract][nro_poliza]" placeholder="Ej: abc" AUTOCOMPLETE=OFF />
						</p>
						<p>
							<label for="especies_aseguradas">Especie(s) asegurada(s):</label>
							<textarea rows="2" id="especies_aseguradas" name="data[caract][especies_aseguradas]" placeholder="Ej: abc" AUTOCOMPLETE=OFF /></textarea>
						</p>
					</div>
					<div class="fields-box">
						<p class="multiple-selection">
							<label for="id_tipo_lugar">Tipo de lugar:</label><br><br>
							<?php foreach ($tlugar as $k => $v) : ?>
							<label id="lbl_chk<?php echo $v['id']?>" for="chk<?php echo $v['id']?>"><?php echo $v['nombre']?></label><a href="#" class="tipo_lugar" data-id="<?php echo $v['id']?>" data-nombre="<?php echo $v['nombre']?>" style="line-height:15px!important;padding:5px;float:right;text-decoration:none;" id="chk<?php echo $v['id']?>">+</a><br>
							<?php endforeach;?>
						</p>
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="5">
				<div class="fields-column">
					<div class="fields-box">
						<div id="ambulancia">
							<p>
								<label for="id_proc_ambulancia">Procedencia de la ambulancia:</label>
								<select id="id_proc_ambulancia" name="data[apoyo][id_proc_ambulancia][]">
									<option value="">Seleccione una opción</option>
									<?php foreach($pambulancia as $pa):?>
									<option value="<?php echo $pa['id']?>"><?php echo $pa['nombre']?></option>
									<?php endforeach;?>
								</select>
							</p>
							<p>
								<label for="id_ident_movil">Identificación del móvil:</label>
								<input id="id_ident_movil" name="data[apoyo][id_ident_movil][]" placeholder="Ej: abc" AUTOCOMPLETE=OFF />
							</p>
						</div>
						<button type="button" id="agregar_ambulancia">Agregar nueva ambulancia</button>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						<div id="id_municipalidad">

						</div>
						
						<p>
							<label for="id_movil_oe">Patente o ID del móvil de la O.E.:</label>
							<input id="id_movil_oe" name="data[apoyo][id_movil_oe]"  AUTOCOMPLETE=OFF />
						</p>
						<p>
							<label for="carabinero">Carabinero a cargo:</label>
							<input id="carabinero" name="data[apoyo][carabinero]"  AUTOCOMPLETE=OFF required />
						</p>
						<p>
							<label for="patente_carabinero">Patente Carabinero:</label>
							<input id="patente_carabinero" name="data[apoyo][patente_carabinero]"  AUTOCOMPLETE=OFF />
						</p>
						<div id="apoyo_bomberil">
							<p>
								<label for="id_apoyo_cuerpo">Otros apoyos bomberiles:</label>
								<select id="id_apoyo_cuerpo" name="data[apoyo][id_apoyo_cuerpo][]">
									<option value="">Seleccione cuerpo de apoyo</option>
									<?php foreach($cuerpo as $cu):?>
									<option value="<?php echo $cu['cuerpo_id']?>"><?php echo $cu['nombre']?></option>
									<?php endforeach;?>
								</select>
								<br>
								<br>
								<select id="id_apoyo_compania" name="data[apoyo][id_apoyo_compania][]">
									<option value="">Seleccione compañía de apoyo</option>
								</select>
							</p>
						</div>
						<button type="button" id="agregar_apoyo_bomberil">Agregar apoyo bomberil</button>
						<div id="otros_apoyos">
							<p>
								<label for="id_otros_apoyos">Otros apoyos:</label>
								<textarea rows="2" id="id_otros_apoyos" name="data[apoyo][id_otros_apoyos][]" placeholder="Ej: abc" AUTOCOMPLETE=OFF /></textarea>
							</p>
						</div>
						<button type="button" id="agregar_otros_apoyos">Agregar otros apoyos</button>
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="6">
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="id_investigado_por">Investigado por:</label>
							<select id="id_investigado_por" name="data[dept_tec][id_investigado_por]">
								<option value="">Seleccione una opción</option>
								<option value="0">OTRO</option>
							</select>
							<input id="id_investigado_por_otro" style="display:none;" name="data[dept_tec][id_investigado_por_otro]" value="" AUTOCOMPLETE=OFF />

						</p>
						<script>
							var cc = 0;
							$('#id_investigado_por').click(function () {        
								cc++;
								if (cc == 2) {
									$(this).change();
									cc = 0;
								} 
							}).change(function (data) {
								if($(this).val() == '0') {
									$('#id_investigado_por_otro').show();
								} else {
									$('#id_investigado_por_otro').hide();
									$('#id_investigado_por_otro').val('');
								}
								cc = -1;
							});
						</script>
						<p>
							<label for="det_fecha_inicio">Fecha de inicio:</label>
							<input id="det_fecha_inicio" name="data[dept_tec][det_fecha_inicio]" placeholder="dd/mm/aaaa" AUTOCOMPLETE=OFF />
							<script>
								$(function() {
									$("#det_fecha_inicio").datepicker();
								});
							</script>
						</p>
						<p style="float:left;">
							<label style="">Hora de inicio:</label>
							<select id="det_hora_inicio" style="float:left;width:80px;" name="data[dept_tec][det_hora_inicio][h]">
								<option value="">Hora</option>
								<?php for ($i=0; $i <= 23; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
							<span style="float:left;">:</span>
							<select id="det_minuto_inicio" style="float:left;width:80px;" name="data[dept_tec][det_hora_inicio][m]">
								<option value="">Minuto</option>
								<?php for ($i=0; $i <= 59; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
						</p>
						<p>
							<label for="det_fecha_termino">Fecha de término:</label>
							<input id="det_fecha_termino" name="data[dept_tec][det_fecha_termino]" placeholder="dd/mm/aaaa" AUTOCOMPLETE=OFF />
							<script>
								$(function() {
									$("#det_fecha_termino").datepicker();
								});
							</script>
						</p>
						<p style="float:left;">
							<label style="">Hora de inicio:</label>
							<select id="det_hora_termino" style="float:left;width:80px;" name="data[dept_tec][det_hora_termino][h]">
								<option value="">Hora</option>
								<?php for ($i=0; $i <= 23; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
							<span style="float:left;">:</span>
							<select id="det_minuto_termino" style="float:left;width:80px;" name="data[dept_tec][det_hora_termino][m]">
								<option value="">Minuto</option>
								<?php for ($i=0; $i <= 59; $i++): ?>
								<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
								<?php endfor;?>
							</select>
						</p>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="nombre">¿Existen fotos?</label>
							No <input type="radio" name="data[dept_tec][existen_fotos]" value="0" checked>
							&nbspSi <input type="radio" name="data[dept_tec][existen_fotos]" value="1">  
						</p>
						<p>
							<label for="nombre">¿Existen muestras?</label>
							No <input type="radio" name="data[dept_tec][existen_muestras]" value="0" checked>
							&nbspSi <input type="radio" name="data[dept_tec][existen_muestras]" value="1">  
						</p>
						<p>
							<label for="nombre">¿Existen otros?</label>
							No <input type="radio" name="data[dept_tec][existen_otros]" value="0" checked>
							&nbspSi <input type="radio" name="data[dept_tec][existen_otros]" value="1"><br><br>
							<textarea id="dat_otros" name="data[dept_tec][dat_otros]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF /></textarea>
						</p>
						<p>
							<label for="nombre">Notas del departamento técnico:</label>
							<textarea id="notas_depto_tecnico" name="data[dept_tec][notas_depto_tecnico]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF /></textarea>
						</p>
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="7">
				<div id="otros_bomberos"></div>
				
				<button type="button" id="agregar_otros_bomberos">Agregar bombero accidentado</button>

			</fieldset>
			<fieldset class="step" data-id="8">
				<div class="fields-column">
					<div class="fields-box">
						<p>
							<label for="id_bombero_acargo">Bombero a cargo:</label>
							<select id="id_bombero_acargo" name="data[dat_int][id_bombero_acargo]">
								<option value="">Seleccione una opción</option>
							</select>
						</p>
						<p>
							<label for="cargo_bombero_acargo">Cargo:</label>
							<select id="id_cargo_bombero_acargo" name="data[dat_int][id_cargo_bombero_acargo]">
								<option value="">Seleccione una opción</option>
								<?php foreach($cargo as $cg):?>
								<option value="<?php echo $cg['categoria_id']?>"><?php echo $cg['descripcion']?></option>
								<?php endforeach;?>
							</select>
							<!-- <input id="cargo_bombero_acargo" name="data[bomb_acc][cargo_bombero_acargo]" AUTOCOMPLETE=OFF /> -->
						</p>
						<p>
							<label for="id_bombero_tomo_datos">Bombero que tomo los datos:</label>
							<select id="id_bombero_tomo_datos" name="data[dat_int][id_bombero_tomo_datos]">
								<option value="">Seleccione una opción</option>
							</select>
						</p>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						<div id="compania_radio">
							
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset class="step" data-id="9">
				<div class="fields-column">
					<div class="fields-box">
						
						<p>
							<button type="button" id="agregar_otros_vehiculos">Agregar otros vehiculos</button>
						</p>
						<div id="otros_vehiculos" class="clear"></div>
					</div>
				</div>
				<div class="fields-column">
					<div class="fields-box">
						
						<p>
							<button type="button" id="agregar_otros_lesionados">Agregar otros lesionados</button>
						</p>
						
						<div id="otros_lesionados" class="clear"></div>
					</div>
				</div>
			</fieldset>
		<p>
			
		</p>
		</form>
	</div>
	<div class="next-button-bar">
			<div class="recordatorio">Los campos marcados con * son obligatorios</div>
			<input class="guardar" style="float:right;" type="button" value="Guardar">
			<!-- <div class="next-button">
					<a href="#" id="registerButton"><img src="css/img/next-ok.png"/></a>
			</div> -->
	</div>
</div>
<div id="compania_aseguradora_element" style="display:none;">
	<p>
		<label for="id_compania_aseguradora">Compañía aseguradora:</label>
		<select id="id_compania_aseguradora" name="data[caract][id_compania_aseguradora][]" >
			<option value="">Seleccione una opción</option>
			<?php foreach($caseguradora as $ca):?>
			<option value="<?php echo $ca['id']?>"><?php echo $ca['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
</div>
<div id="empresa_dist_element" style="display:none;">
	<p>
		<label for="id_empresa_dist">Empresa distribuidora del gas:</label>
		<select id="id_empresa_dist" name="data[caract][id_empresa_dist][]" >
			<option value="">Seleccione una opción</option>
			<?php foreach($edist_gas as $ed):?>
			<option value="<?php echo $ed['id']?>"><?php echo $ed['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
</div>
<div id="gas_element" style="display:none;">
	<p>
		<label for="id_contenedor_gas">Tipo de contenedor del gas:</label>
		<select id="id_contenedor_gas" name="data[caract][id_contenedor_gas][]" >
			<option value="">Seleccione una opción</option>
			<?php foreach($cgas as $cg):?>
			<option value="<?php echo $cg['id']?>"><?php echo $cg['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
	<p>
		<label for="id_tipo_gas">Tipo de gas:</label>
		<select id="id_tipo_gas" name="data[caract][id_tipo_gas][]" >
			<option value="">Seleccione una opción</option>
			<?php foreach($tgas as $tg):?>
			<option value="<?php echo $tg['id']?>"><?php echo $tg['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
	<p>
		<label for="capacidad_contenedor">Capacidad del contenedor (Kg):</label>
		<input id="capacidad_contenedor" name="data[caract][capacidad_contenedor]" placeholder="Ej: abc" AUTOCOMPLETE=OFF />
	</p>
</div>
<div id="otros_afectados_element" style="display:none;">
	<p>
		<label for="oa_rut">Rut del afectado:</label>
		<input id="oa_rut" name="data[dat_fin][otros_afectados][rut][]" class="rut" placeholder="Ej: 11111111-9" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="oa_nombre">Nombre del afectado:</label>
		<input id="oa_nombre" name="data[dat_fin][otros_afectados][nombre][]" placeholder="Ej: Juan Perez" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="oa_direccion">Dirección:</label>
		<input id="oa_direccion" name="data[dat_fin][otros_afectados][direccion][]"  AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="oa_id_tipo_ocupante">Tipo de ocupante:</label>
		<select id="oa_id_tipo_ocupante" name="data[dat_fin][otros_afectados][id_tipo_ocupante][]">
			<option value="">Seleccione una opción</option>
			<?php foreach($tocupante as $to):?>
			<option value="<?php echo $to['id']?>"><?php echo $c['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
	<p>
		<label for="oa_nro_adultos">Número de adultos:</label>
		<input id="oa_nro_adultos" name="data[dat_fin][otros_afectados][nro_adultos][]" placeholder="Ej: 3" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="oa_nro_ninos">Número de niños:</label>
		<input id="oa_nro_ninos" name="data[dat_fin][otros_afectados][nro_ninos][]" placeholder="Ej: 1" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="oa_dano_vivienda">Daño en viviendas:</label>
		<select id="oa_dano_vivienda" name="data[dat_fin][otros_afectados][dano_vivienda][]">
			<?php for ($i=0; $i <= 100; $i++) : ?>'+
			<option name="data[dat_fin][otros_afectados][dano_vivienda][]" value="<?php echo $i?>"><?php echo $i?> %</option>
			<?php endfor;?>
		</select>
	</p>
	<p>
		<label for="oa_dano_vehiculo">Daños en vehículos:</label>
		<select id="oa_dano_vehiculo" name="data[dat_fin][otros_afectados][dano_vehiculo][]">
			<?php for ($i=0; $i <= 100; $i++) : ?>'+
			<option name="data[dat_fin][otros_afectados][dano_vehiculo][]" value="<?php echo $i?>"><?php echo $i?> %</option>
			<?php endfor;?>
		</select>
	</p>
	<p>
	<label for="oa_otros_danos">Otros daños:</label>
		<textarea id="oa_otros_danos" rows="4" name="data[dat_fin][otros_afectados][otros_danos][]" placeholder="Ej: 3" AUTOCOMPLETE=OFF /></textarea>
	</p>
</div>

<div id="otros_vehiculos_element" style="display:none;">
	<p>
		<label for="ov_id_tipo_vehiculo">Tipo de vehículo:</label>
		<select id="ov_id_tipo_vehiculo" name="data[dat_fin][otros_vehiculos][id_tipo_vehiculo][]">
			<option value="">Seleccione una opción</option>
			<?php foreach($tvehiculo as $tv):?>
			<option value="<?php echo $tv['id']?>"><?php echo $tv['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
	<p>
		<label for="ov_id_marca_vehiculo">Marca del vehículo:</label>
		<select id="ov_id_marca_vehiculo" class="ov_id_marca_vehiculo" name="data[dat_fin][otros_vehiculos][id_marca_vehiculo][]">
			<option value="">Seleccione una opción</option>
			<?php foreach($marcas_v as $mv):?>
			<option value="<?php echo $mv['id']?>"><?php echo $mv['nombre']?></option>
			<?php endforeach;?>
		</select>
	</p>
	<p>
		<label for="ov_id_modelo_vehiculo">Modelo del vehículo:</label>
		<select id="ov_id_modelo_vehiculo" class="ov_id_modelo_vehiculo"  name="data[dat_fin][otros_vehiculos][id_modelo_vehiculo][]">
			<option value="">Seleccione una opción</option>
		</select>
	</p>
	<p>
		<label for="ov_patente">Patente:</label>
		<input id="ov_patente" name="data[dat_fin][otros_vehiculos][patente][]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF />
	</p>
</div>

<div id="otros_lesionados_element" style="display:none;">
	<p>
		<label for="ol_rut">Rut del afectado:</label>
		<input id="ol_rut" name="data[dat_fin][otros_lesionados][rut][]" class="rut" onBlur="ThousandSeparate(this);" placeholder="Ej: 11111111-9" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="ol_nombre">Nombre del afectado:</label>
		<input id="ol_nombre" name="data[dat_fin][otros_lesionados][nombre][]" placeholder="Ej: Juan Perez" AUTOCOMPLETE=OFF />
	</p>
	<p>
		<label for="fallecido">¿Fallecido? </label>
		<select id="fallecido" name="data[dat_fin][otros_lesionados][fallecido][]">
			<option value="0">No</option>
			<option value="1">Si</option>
		</select>
	</p>
</div>


<div id="tipo_lugar_element" style="display:none;">
<p>
	<label for="id_tipo_construccion">Tipo de construcción:</label>
	<select id="id_tipo_construccion" name="data[lugar][id_tipo_construccion][]">
		<?php foreach ($tconst as $k => $v) : ?>
		<option name="data[lugar][id_tipo_construccion][]" value="<?php echo $v["id"]?>"><?php echo $v["nombre"]?></option>
		<?php endforeach;?>
	</select>
</p>
<p>
	<label for="pisos">Número de adultos:</label>
	<input id="pisos" name="data[lugar][pisos]" placeholder="Ej: 3" AUTOCOMPLETE=OFF />
</p>
<p>
	<label for="dano_enseres">Daño en enseres:</label>
	<select id="dano_enseres" name="data[lugar][id_tipo_construccion][]">
		<?php for ($i=0; $i <= 100; $i++) : ?>
		<option name="data[lugar][id_tipo_construccion][]" value="<?php echo $i?>"><?php echo $i?> %</option>
		<?php endfor;?>
	</select>
</p>
</div>

<div id="otros_bomberos_element" style="display:none;">
	<div class="fields-column">
		<div class="fields-box">
			<p>
				<label for="id_cuerpo_ba">Cuerpo:</label>
				<select id="id_cuerpo_ba" class="id_cuerpo_ba" name="data[bomb_acc][id_cuerpo_ba][]">
					<option value="">Seleccione una opción</option>
					<?php foreach($cuerpo as $cu):?>
					<option value="<?php echo $cu['cuerpo_id']?>"><?php echo $cu['nombre']?></option>
					<?php endforeach;?>
				</select>
			</p>
			<p>
				<label for="id_bombero_ba">Bombero:</label>
				<select id="id_bombero_ba" class="id_bombero_ba" name="data[bomb_acc][id_bombero_ba][]">
					<option value="">Seleccione una opción</option>
					<option value="0">Todos</option>
				</select>
			</p>
			<p>
				<label for="id_dejada_por">Denuncia dejada por:</label>
				<select id="id_dejada_por" class="id_dejada_por" name="data[bomb_acc][id_dejada_por][]">
					<option value="">Seleccione una opción</option>
				</select>
			</p>
			<p>
				<label for="id_comiseria">Comisaría:</label>
				<select id="id_comiseria" name="data[bomb_acc][id_comiseria][]">
					<option value="">Seleccione una opción</option>
					<option>No info</option>
				</select>
			</p>
			<p>
				<label for="fecha_denuncia">Fecha de la denuncia:</label>
				<input class="fecha_denuncia" name="data[bomb_acc][fecha_denuncia][]" placeholder="dd/mm/aaaa" AUTOCOMPLETE=OFF />
			</p>
			<p style="float:left;">
				<label style="">Hora:</label>
				<select id="bomb_hora" style="float:left;width:80px;" name="data[bomb_acc][hora][h][]">
					<option value="">Hora</option>
					<?php for ($i=0; $i <= 23; $i++): ?>
					<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
					<?php endfor;?>
				</select>
				<span style="float:left;">:</span>
				<select id="bomb_minuto" style="float:left;width:80px;" name="data[bomb_acc][hora][m][]">
					<option value="">Minuto</option>
					<?php for ($i=0; $i <= 59; $i++): ?>
					<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
					<?php endfor;?>
				</select>
			</p>
		</div>
	</div>
	<div class="fields-column">
		<div class="fields-box">
			<p>
				<label for="nro_libro_denuncia">Numero del libro de la denuncia:</label>
				<input id="nro_libro_denuncia" name="data[bomb_acc][nro_libro_denuncia][]"  AUTOCOMPLETE=OFF />
			</p>
			<p>
				<label for="nro_hoja_denuncia">Numero de la hoja de la denuncia:</label>
				<input id="nro_hoja_denuncia" name="data[bomb_acc][nro_hoja_denuncia][]"  AUTOCOMPLETE=OFF />
			</p>
			<p>
				<label for="nro_parrafo_denuncia">Numero del parrafo de la denuncia:</label>
				<input id="nro_parrafo_denuncia" name="data[bomb_acc][nro_parrafo_denuncia][]"  AUTOCOMPLETE=OFF />
			</p>
			<p>
				<label for="nombre">Descripción:</label>
				<textarea id="desc_bombero_accidentado" name="data[bomb_acc][desc_bombero_accidentado][]" placeholder="Ej: XXXXXX" AUTOCOMPLETE=OFF /></textarea>
			</p>
		</div>
	</div>
</div>
<div id="hora_carro" style="display:none;">
	<p style="float:left;">
		<label style="">Hora Despacho:</label>
		<select  style="float:left;width:80px;" name="data[carro][hora_despacho][h][]">
			<option value="">Hora</option>
			<?php for ($i=0; $i <= 23; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
		<span style="float:left;">:</span>
		<select style="float:left;width:80px;" name="data[carro][hora_despacho][m][]">
			<option value="">Minuto</option>
			<?php for ($i=0; $i <= 59; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
	</p>
	<p style="float:left;">
		<label style="">Hora de llegada al lugar:</label>
		<select  style="float:left;width:80px;" name="data[carro][hora_llegada][h][]">
			<option value="">Hora</option>
			<?php for ($i=0; $i <= 23; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
		<span style="float:left;">:</span>
		<select style="float:left;width:80px;" name="data[carro][hora_llegada][m][]">
			<option value="">Minuto</option>
			<?php for ($i=0; $i <= 59; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
	</p>
	<p style="float:left;">
		<label style="">Hora de retirada del lugar:</label>
		<select  style="float:left;width:80px;" name="data[carro][hora_retirada][h][]">
			<option value="">Hora</option>
			<?php for ($i=0; $i <= 23; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
		<span style="float:left;">:</span>
		<select style="float:left;width:80px;" name="data[carro][hora_retirada][m][]">
			<option value="">Minuto</option>
			<?php for ($i=0; $i <= 59; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
	</p>
	<p style="float:left;">
		<label style="">Hora de llegada al cuartel:</label>
		<select  style="float:left;width:80px;" name="data[carro][hora_llegada_cuartel][h][]">
			<option value="">Hora</option>
			<?php for ($i=0; $i <= 23; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('H') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
		<span style="float:left;">:</span>
		<select style="float:left;width:80px;" name="data[carro][hora_llegada_cuartel][m][]">
			<option value="">Minuto</option>
			<?php for ($i=0; $i <= 59; $i++): ?>
			<option value="<?php echo $i?>" <?php echo date('i') == $i ? 'selected' : '';?>><?php echo $i < 10 ? "0".$i : $i?></option>
			<?php endfor;?>
		</select>
	</p>
</div>