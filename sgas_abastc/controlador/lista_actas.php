<?php
//	especies_aseguradas	id_proc_ambulancia	id_municipalidad	id_movil_oe	carabinero	id_otros_apoyos	id_investigado_por	det_fecha_inicio	det_fecha_termino	existen_fotos	existen_muestras	existen_otros	dat_otros	notas_depto_tecnico	id_cuerpo_ba	id_bombero_ba	id_dejada_por	id_comiseria	fecha_denuncia	nro_libro_denuncia	nro_hoja_denuncia	nro_parrafo_denuncia	desc_bombero_accidentado	id_bombero_acargo	id_cargo_bombero_acargo	id_bombero_tomo_datos	cargo_bombero_acargo	id_unidad_liquidos	cantidad_liquidos	cuerpo	creado	modificado	id_tipo_via	patente_carabinero	id_investigado_por_otro	correlativo_tipo
$nombres = array(
	'id_tipo_servicio' => 'Id tipo de servicio',
	'id_cuerpo' => 'id cuerpo',
	'id_compania' => 'id compañía',
	'nro_block' => 'Número de block',
	'nro_depto' => 'Número de Depto.',
	'nro_adultos' => 'Número de adultos',
	'nro_ninos' => 'Número de niños',
	'id_tipo_ocupante' => 'id tipo de ocupante',
	'id_tipo_lugar' => 'id tipo de lugar',
	'id_tipo_vehiculo' => 'id tipo de vehículo',
	'id_marca_vehiculo' => 'id marca de vehículo',
	'id_lugar_inicio_fuego' => 'id lugar de inicio del fuego',
	'id_origen' => 'id origen',
	'id_causa' => 'id causa',
	'observacion_causa' => 'Obs. Causa',
	'id_fuente_calor' => 'id fuente de calor',
	'oservacion_fuente_calor' => 'Obs. Fuente de calor',
	'dano_vivienda' => '% Daño Vivienda',
	'dano_vehiculo' => '% Daño Vehículo',
	'dano_enseres' => '% Daño Enseres',
	'otro_dano' => 'Otro daño',
	'id_unidad_explosivos' => 'id unidad explosivos',
	'cantidad_explosivos' => 'cantidad explosivos',
	'id_unidad_venenos' => 'id unidad venenos',
	'cantidad_venenos' => 'cantidad venenos',
	'id_unidad_gases' => 'id unidad gases',
	'cantidad_gases' => 'cantidad gases',
	'id_unidad_solidos' => 'id unidad solidos',
	'cantidad_solidos' => 'cantidad solidos',
	'id_unidad_radioactivos' => 'id unidad radioactivos',
	'cantidad_radioactivos' => 'cantidad radioactivos',
	'id_unidad_oxidantes' => 'id unidad oxidantes',
	'cantidad_oxidantes' => 'cantidad oxidantes',
	'id_unidad_otros' => 'id unidad otros',
	'cantidad_otros' => 'cantidad otros',
	'detalle_productos' => 'detalle productos',
	'id_empresa_dist' => 'id empresa distribuidora',
	'id_contenedor_gas' => 'id contenedor de gas',
	'id_compania_aseguradora' => 'id compañía aseguradora',
	'id_tipo_gas' => 'id tipo de gas',
	'nro_poliza' => 'Nro. de poliza',

	);
$db_data = $sgasdb;
$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);$db_data = $sgasdb;
$resp = $sgas_dbdrv->query("SELECT * FROM acta_servicio ORDER BY id");
$cols = $sgas_dbdrv->query("select column_name,* from information_schema.columns where table_name = 'acta_servicio'");

	$first = true;
	echo "<table id='editgrid' class='columns fixed'>";
			if($first) {
				echo "<tr>";
				foreach($cols as $t_k) {
					$cn = !empty($nombres[$t_k['column_name']]) ? $nombres[$t_k['column_name']] : $t_k['column_name'];
					$cn = ucfirst($cn);
					echo "<td>".$cn."</td>";
				}
				echo "<td></td>";
				echo "</tr>";
				$first = false;
			}
			echo "<tr>";

	if(!empty($resp) && $resp != 1) {
		foreach ($resp as $key => $value) {
			$id = !empty($value['id']) ? $value['id'] : '';
			foreach($value as $k => $v) {
				echo "<td>".$v."</td>";
			}
			
			echo "</tr>";
		}
	}
	echo "</table>";