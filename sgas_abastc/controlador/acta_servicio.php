<?php
if(!empty($_POST) && !empty($_POST['data'])) {
// pr($_POST);die;
	$date = date('Y-m-d',strtotime("1 January 1900"));
	//generales
	$data = $_POST['data']['generales'];
	$acta_servicio['correlativo'] = $data['correlativo'];
	$acta_servicio['correlativo_tipo'] = $data['correlativo_tipo'];
	$acta_servicio['sector'] = $data['sector'];
	$acta_servicio['fecha'] = empty($data['fecha']) ? $date : date('Y-m-d',strtotime($data['fecha']));
	// $acta_servicio['id_cuerpo'] = $data['cuerpo'];
	$acta_servicio['id_cuerpo'] = $data['cuerpo'];
	$acta_servicio['id_compania'] = $data['compania'];
	$acta_servicio['id_tipo_servicio'] = $data['tipo_servicio'];

	//lugar
	$data = $_POST['data']['lugar'];
	$acta_servicio['direccion'] = $data['direccion'];
	$acta_servicio['id_tipo_via'] = $data['id_tipo_via'];
	$acta_servicio['numero'] = $data['numero'];
	$acta_servicio['calle'] = $data['calle'];
	$acta_servicio['comuna'] = $data['comuna'];
	$acta_servicio['poblacion'] = $data['poblacion'];
	$acta_servicio['nro_block'] = $data['nro_block'];
	$acta_servicio['nro_depto'] = $data['nro_depto'];
	$acta_servicio['latitud'] = $data['latitud'];
	$acta_servicio['longitud'] = $data['longitud'];

	//afectado
	$data = $_POST['data']['afectado'];
	$acta_servicio['rut'] = str_replace('.', '', $data['rut']);
	$acta_servicio['nombre'] = $data['nombre'];
	$acta_servicio['telefono'] = $data['telefono'];
	$acta_servicio['id_tipo_ocupante'] = $data['id_tipo_ocupante'];
	$acta_servicio['nro_adultos'] = $data['nro_adultos'];
	$acta_servicio['nro_ninos'] = $data['nro_ninos'];

	//caracteristicas
	$data = $_POST['data']['caract'];
	$acta_servicio['id_tipo_vehiculo'] = $data['id_tipo_vehiculo'];
	$acta_servicio['id_marca_vehiculo'] = $data['id_marca_vehiculo'];
	$acta_servicio['id_modelo_vehiculo'] = $data['id_modelo_vehiculo'];
	$acta_servicio['patente'] = $data['patente'];
	$acta_servicio['id_lugar_inicio_fuego'] = $data['id_lugar_inicio_fuego'];
	$acta_servicio['id_origen'] = $data['id_origen'];
	$acta_servicio['id_causa'] = $data['id_causa'];
	$acta_servicio['observacion_causa'] = $data['observacion_causa'];
	$acta_servicio['id_fuente_calor'] = $data['id_fuente_calor'];
	$acta_servicio['dano_vivienda'] = $data['dano_vivienda'];
	$acta_servicio['dano_vehiculo'] = $data['dano_vehiculo'];
	$acta_servicio['id_unidad_explosivos'] = $data['id_unidad_explosivos'];
	$acta_servicio['cantidad_explosivos'] = $data['cantidad_explosivos'];
	$acta_servicio['id_unidad_liquidos'] = $data['id_unidad_liquidos'];
	$acta_servicio['cantidad_liquidos'] = $data['cantidad_liquidos'];
	$acta_servicio['id_unidad_venenos'] = $data['id_unidad_venenos'];
	$acta_servicio['cantidad_venenos'] = $data['cantidad_venenos'];
	$acta_servicio['id_unidad_gases'] = $data['id_unidad_gases'];
	$acta_servicio['cantidad_gases'] = $data['cantidad_gases'];
	$acta_servicio['id_unidad_solidos'] = $data['id_unidad_solidos'];
	$acta_servicio['cantidad_solidos'] = $data['cantidad_solidos'];
	$acta_servicio['id_unidad_radioactivos'] = $data['id_unidad_radioactivos'];
	$acta_servicio['cantidad_radioactivos'] = $data['cantidad_radioactivos'];
	$acta_servicio['id_unidad_oxidantes'] = $data['id_unidad_oxidantes'];
	$acta_servicio['cantidad_oxidantes'] = $data['cantidad_oxidantes'];
	$acta_servicio['id_unidad_otros'] = $data['id_unidad_otros'];
	$acta_servicio['cantidad_otros'] = $data['cantidad_otros'];
	$acta_servicio['detalle_productos'] = $data['detalle_productos'];
	// $acta_servicio['id_empresa_dist'] = $data['id_empresa_dist'];
	// $acta_servicio['id_contenedor_gas'] = $data['id_contenedor_gas'];
	// $acta_servicio['id_tipo_gas'] = $data['id_tipo_gas'];
	// $acta_servicio['id_compania_aseguradora'] = $data['id_compania_aseguradora'];
	$acta_servicio['nro_poliza'] = $data['nro_poliza'];
	$acta_servicio['especies_aseguradas'] = $data['especies_aseguradas'];

	//apoyo
	$data = $_POST['data']['apoyo'];
	$acta_servicio['id_movil_oe'] = $data['id_movil_oe'];
	$acta_servicio['carabinero'] = $data['carabinero'];
	$acta_servicio['patente_carabinero'] = $data['patente_carabinero'];

	//departamento tecnico
	$data = $_POST['data']['dept_tec'];

	$acta_servicio['id_investigado_por_otro'] = $data['id_investigado_por_otro'];
	$acta_servicio['id_investigado_por'] = $data['id_investigado_por'];
	$acta_servicio['det_fecha_inicio'] = empty($data['det_fecha_inicio']) ? $date : date('Y-m-d H:i:s',strtotime($data['det_fecha_inicio']." ".$data['det_hora_inicio']['h'].":".$data['det_hora_inicio']['m']));
	$acta_servicio['det_fecha_termino'] = empty($data['det_fecha_termino']) ? $date : date('Y-m-d H:i:s',strtotime($data['det_fecha_termino']." ".$data['det_hora_termino']['h'].":".$data['det_hora_termino']['m']));
	$acta_servicio['existen_fotos'] = $data['existen_fotos'];
	$acta_servicio['existen_muestras'] = $data['existen_muestras'];
	$acta_servicio['existen_otros'] = $data['existen_otros'];
	$acta_servicio['dat_otros'] = $data['dat_otros'];
	$acta_servicio['notas_depto_tecnico'] = $data['notas_depto_tecnico'];

	///datos internos
	$data = $_POST['data']['dat_int'];
	$acta_servicio['id_bombero_acargo'] = $data['id_bombero_acargo'];
	$acta_servicio['id_bombero_tomo_datos'] = $data['id_bombero_tomo_datos'];
	$acta_servicio['id_cargo_bombero_acargo'] = $data['id_cargo_bombero_acargo'];

	//datos finales
	// $data = $_POST['data']['dat_fin'];
	$db_data = $sgasdb;
	$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);$db_data = $sgasdb;
	$converted_data = $sgas_dbdrv->convert($acta_servicio, 'acta_servicio');

	$sql  = "INSERT INTO acta_servicio";
	$sql .= "(".implode(", ", array_keys($acta_servicio)).",creado,modificado)";
	$sql .= " VALUES (".implode(", ", $converted_data).", NOW(),NOW()) RETURNING id";
	$sgas_dbdrv->begin();
	$exec = $sgas_dbdrv->query($sql);

	if(!empty($exec[0]['id'])) {
		$id = $exec[0]['id'];
		//acta_tipo_lugar
		$data = $_POST['data']['caract'];
		if(!empty($data['tc'])) {
			if(count($data['tc']) > 0) {
				$save_data = array();
				foreach ($data['tc'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_tipo_lugar'] = $k;
					foreach($v['id_tipo_construccion'] as $dtk => $dtv) {
						$save_data['id_tipo_construccion'] = $dtv;
						$save_data['pisos'] = $v['pisos'][$dtk];
						$save_data['dano_enseres'] = $v['dano_enseres'][$dtk];
						$save_data['otros_danos'] = $v['otros_danos'][$dtk];
						$save_data = $sgas_dbdrv->convert($save_data, 'acta_tipo_lugar');
						$sql  = "INSERT INTO acta_tipo_lugar";
						$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
						$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
						if(!$sgas_dbdrv->query($sql)) {
							$sgas_dbdrv->rollback();
							$error = true;
							die;
						}
					}
				}
			}
		}

		//apoyo
		$data = $_POST['data']['apoyo'];
		if(!empty($data['id_apoyo_cuerpo'])) {
			if(count($data['id_apoyo_cuerpo']) > 0) {
				$save_data = array();
				foreach ($data['id_apoyo_cuerpo'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_cuerpo'] = $v;
					$save_data['id_compania'] = $data['id_apoyo_compania'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'apoyo_bomberil');
					$sql  = "INSERT INTO apoyo_bomberil";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//otros apoyo
		$data = $_POST['data']['apoyo'];
		if(!empty($data['id_otros_apoyos'])) {
			if(count($data['id_otros_apoyos']) > 0) {
				$save_data = array();
				foreach ($data['id_otros_apoyos'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['texto'] = $v;
					$save_data = $sgas_dbdrv->convert($save_data, 'otros_apoyos');
					$sql  = "INSERT INTO otros_apoyos";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//otros afectados
		if(!empty($_POST['data']['dat_fin']['otros_afectados'])) {
			$data = $_POST['data']['dat_fin'];
			if(count($data['otros_afectados']['rut']) > 0) {
				$save_data = array();
				foreach ($data['otros_afectados']['rut'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['rut'] = str_replace('.', '', $v);
					$save_data['nombre'] = $data['otros_afectados']['nombre'][$k];
					$save_data['direccion'] = $data['otros_afectados']['direccion'][$k];
					$save_data['id_tipo_ocupante'] = $data['otros_afectados']['id_tipo_ocupante'][$k];
					$save_data['nro_adultos'] = $data['otros_afectados']['nro_adultos'][$k];
					$save_data['nro_ninos'] = $data['otros_afectados']['nro_ninos'][$k];
					$save_data['dano_vivienda'] = $data['otros_afectados']['dano_vivienda'][$k];
					$save_data['dano_vehiculo'] = $data['otros_afectados']['dano_vehiculo'][$k];
					$save_data['otros_danos'] = $data['otros_afectados']['otros_danos'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'otros_afectados');
					$sql  = "INSERT INTO otros_afectados";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//otros vehiculos
		if(!empty($_POST['data']['dat_fin']['otros_vehiculos'])) {
			$data = $_POST['data']['dat_fin'];
			$save_data = array();
			if(count($data['otros_vehiculos']['id_tipo_vehiculo']) > 0) {
				foreach ($data['otros_vehiculos']['id_tipo_vehiculo'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_tipo_vehiculo'] = $v;
					$save_data['id_marca_vehiculo'] = $data['otros_vehiculos']['id_marca_vehiculo'][$k];
					$save_data['id_modelo_vehiculo'] = $data['otros_vehiculos']['id_modelo_vehiculo'][$k];
					$save_data['patente'] = $data['otros_vehiculos']['patente'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'otros_vehiculos');
					$sql  = "INSERT INTO otros_vehiculos";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//otros lesionados
		if(!empty($_POST['data']['dat_fin']['otros_lesionados'])) {
			$data = $_POST['data']['dat_fin'];
			if(count($data['otros_lesionados']['rut']) > 0) {
				$save_data = array();
				foreach ($data['otros_lesionados']['rut'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['rut'] = str_replace('.', '', $v);
					$save_data['nombre'] = $data['otros_lesionados']['nombre'][$k];
					$save_data['fallecido'] = $data['otros_lesionados']['fallecido'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'otros_lesionados');
					$sql  = "INSERT INTO otros_lesionados";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//Contenedores de gas
		if(!empty($_POST['data']['caract']['id_contenedor_gas'])) {
			$data = $_POST['data']['caract'];
			if(count($data['id_contenedor_gas']) > 0) {
				$save_data = array();
				foreach ($data['id_contenedor_gas'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_tipo_gas'] = $data['id_tipo_gas'][$k];
					$save_data['capacidad_contenedor'] = $data['capacidad_contenedor'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'acta_contenedor_gas');
					$sql  = "INSERT INTO acta_contenedor_gas";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//Empresa distribuidora
		if(!empty($_POST['data']['caract']['id_empresa_dist'])) {
			$data = $_POST['data']['caract'];
			if(count($data['id_empresa_dist']) > 0) {
				$save_data = array();
				foreach ($data['id_empresa_dist'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_empresa_dist'] = $data['id_empresa_dist'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'acta_empresa_dist');
					$sql  = "INSERT INTO acta_empresa_dist";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//Compañía aseguradora
		if(!empty($_POST['data']['caract']['id_compania_aseguradora'])) {
			$data = $_POST['data']['caract'];
			if(count($data['id_compania_aseguradora']) > 0) {
				$save_data = array();
				foreach ($data['id_compania_aseguradora'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_compania_aseguradora'] = $data['id_compania_aseguradora'][$k];
					$save_data = $sgas_dbdrv->convert($save_data, 'acta_compania_aseguradora');
					$sql  = "INSERT INTO acta_compania_aseguradora";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}

		//bombero accidentado
		if(!empty($_POST['data']['bomb_acc']['id_cuerpo_ba'])) {
			$data = $_POST['data']['bomb_acc'];
			if(count($data['id_cuerpo_ba']) > 0) {
				$save_data = array();
				foreach ($data['id_cuerpo_ba'] as $k => $v) {
					$save_data['id_acta_servicio'] = $id;
					$save_data['id_cuerpo_ba'] = $v;
					$save_data['id_bombero_ba'] = $data['id_bombero_ba'][$k];
					$save_data['id_dejada_por'] = $data['id_dejada_por'][$k];
					$save_data['id_comiseria'] = $data['id_comiseria'][$k];
					$save_data['fecha_denuncia'] = empty($data['fecha_denuncia'][$k]) ? $date : date('Y-m-d H:i:s',strtotime($data['fecha_denuncia'][$k]." ".$data['hora']['h'][$k].":".$data['hora']['m'][$k]));
					$save_data['nro_libro_denuncia'] = $data['nro_libro_denuncia'][$k];
					$save_data['nro_hoja_denuncia'] = $data['nro_hoja_denuncia'][$k];
					$save_data['nro_parrafo_denuncia'] = $data['nro_parrafo_denuncia'][$k];
					$save_data['desc_bombero_accidentado'] = $data['desc_bombero_accidentado'][$k];

					$save_data = $sgas_dbdrv->convert($save_data, 'otros_bomberos');
					$sql  = "INSERT INTO otros_bomberos";
					$sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
					$sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
					if(!$sgas_dbdrv->query($sql)) {
						$sgas_dbdrv->rollback();
						$error = true;
						die;
					}
				}
			}
		}
		$sgas_dbdrv->commit();
		$success = true;
	} else {
		$sgas_dbdrv->rollback();
		$error = true;
	}

}
$db_data = $mmayordb;
$mm_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);

$db_data = $rndb;
$rn_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
// $sql = "INSERT INTO unidad_explosivos(nombre) values('test')";
// $sql = "UPDATE unidad_explosivos SET nombre='omg' WHERE id = 9";
// $comuna = $rn_dbdrv->query("SELECT * FROM comuna order by descripcion");
$cuerpo = $rn_dbdrv->query("SELECT * FROM cuerpo order by nombre");
utf8_encode_deep($cuerpo);
$compania = $rn_dbdrv->query("SELECT compannia.compannia_id, compannia.cuerpo_id, compannia.nombre as co_nombre, cuerpo.nombre as cu_nombre FROM compannia LEFT JOIN cuerpo ON cuerpo.cuerpo_id = compannia.cuerpo_id where cuerpo.cuerpo_id = 275 order by compannia.nombre");
utf8_encode_deep($compania);
$comuna = $rn_dbdrv->query("SELECT comuna.comuna_id, comuna.descripcion, provincia.descripcion provincia FROM comuna LEFT JOIN provincia on comuna.provincia_id = provincia.provincia_id order by comuna.descripcion");
utf8_encode_deep($comuna);
$cargo = $rn_dbdrv->query("SELECT * FROM categoria where categoria_padre_id = 6 order by descripcion");
utf8_encode_deep($cargo);

$db_data = $sgasdb;
$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);$db_data = $sgasdb;
$correlativo = $sgas_dbdrv->query("SELECT max(id) FROM acta_servicio");
$tlugar = $sgas_dbdrv->query("SELECT * FROM tipo_lugar");
$tvia = $sgas_dbdrv->query("SELECT * FROM tipo_via");
$tservicio = $sgas_dbdrv->query("SELECT * FROM tipo_servicio");
$tvehiculo = $sgas_dbdrv->query("SELECT * FROM tipo_vehiculo");
$marcas_v = $sgas_dbdrv->query("SELECT * FROM marca_vehiculo");
$tconst = $sgas_dbdrv->query("SELECT * FROM tipo_construccion");
$tocupante = $sgas_dbdrv->query("SELECT * FROM tipo_ocupante");
$linicio = $sgas_dbdrv->query("SELECT * FROM lugar_inicio_fuego");
$origen = $sgas_dbdrv->query("SELECT * FROM origen");
$causa = $sgas_dbdrv->query("SELECT * FROM causa");
$fcalor = $sgas_dbdrv->query("SELECT * FROM fuente_calor");
$edist_gas = $sgas_dbdrv->query("SELECT * FROM empresa_dist_gas");
$cgas = $sgas_dbdrv->query("SELECT * FROM contenedor_gas");
$tgas = $sgas_dbdrv->query("SELECT * FROM tipo_gas");
$caseguradora = $sgas_dbdrv->query("SELECT * FROM compania_aseguradora");
$pambulancia = $sgas_dbdrv->query("SELECT * FROM proc_ambulancia");
// $municipalidad = $sgas_dbdrv->query("SELECT * FROM municipalidad");

//unidades
$uexplosivos = $sgas_dbdrv->query("SELECT * FROM unidad_explosivos");
$ugases = $sgas_dbdrv->query("SELECT * FROM unidad_gases");
$uliquidos = $sgas_dbdrv->query("SELECT * FROM unidad_liquidos");
$uotros = $sgas_dbdrv->query("SELECT * FROM unidad_otros");
$uoxidantes = $sgas_dbdrv->query("SELECT * FROM unidad_oxidantes");
$uradioactivos = $sgas_dbdrv->query("SELECT * FROM unidad_radioactivos");
$usolidos = $sgas_dbdrv->query("SELECT * FROM unidad_solidos");
$uvenenos = $sgas_dbdrv->query("SELECT * FROM unidad_venenos");

//edit form data
$data = array();
if(!empty($_GET['e'])) {
	$data['acta'] = $sgas_dbdrv->query("SELECT * FROM acta_servicio WHERE id = " . $_GET['e']);
	if(!empty($data['acta'][0])) {
		$data['acta'] = $data['acta'][0];
		$data['tipo_lugar'] = $sgas_dbdrv->query("SELECT atl.*, tl.nombre as tl_nombre, tipo_construccion.nombre as tc_nombre FROM acta_tipo_lugar atl LEFT JOIN tipo_lugar tl ON atl.id_tipo_lugar = tl.id LEFT JOIN tipo_construccion ON atl.id_tipo_construccion = tipo_construccion.id WHERE atl.id_acta_servicio = " . $_GET['e']);
		$data['apoyo_bomberil'] = $sgas_dbdrv->query("SELECT * FROM apoyo_bomberil WHERE apoyo_bomberil.id_acta_servicio = " . $_GET['e']);
		$data['otros_apoyos'] = $sgas_dbdrv->query("SELECT * FROM otros_apoyos WHERE otros_apoyos.id_acta_servicio = " . $_GET['e']);
		$data['otros_afectados'] = $sgas_dbdrv->query("SELECT * FROM otros_afectados WHERE otros_afectados.id_acta_servicio = " . $_GET['e']);
		$data['otros_vehiculos'] = $sgas_dbdrv->query("SELECT * FROM otros_vehiculos WHERE otros_vehiculos.id_acta_servicio = " . $_GET['e']);
		$data['otros_lesionados'] = $sgas_dbdrv->query("SELECT * FROM otros_lesionados WHERE otros_lesionados.id_acta_servicio = " . $_GET['e']);
		$data['otros_bomberos'] = $sgas_dbdrv->query("SELECT * FROM otros_bomberos WHERE otros_bomberos.id_acta_servicio = " . $_GET['e']);
	}
}
// pr($data);

$rn_dbdrv->closeConnection();
$sgas_dbdrv->closeConnection();