<?php
// error_reporting(E_ALL);
// ini_set('display_errors', '1');
require('../config/database.php');
require('../config/bootstrap.php');
require('pgsql_conn.php');

if(!empty($_POST['func'])) {
	$sgas = new Sgas($sgasdb);
	if(method_exists($sgas, $_POST['func']) && !empty($_POST['elegido'])) {
		if(!empty($_POST['var1'])) {
			$sgas->$_POST['func']($_POST['elegido'],$_POST['var1']);
		} else {
			$sgas->$_POST['func']($_POST['elegido']);
		}
	}
}

/**
* 
*/
class Sgas
{
	var $db_data;
	var $sgas_dbdrv;

	function __construct($sgasdb)
	{
		$this->db_data = $sgasdb;
	}

	private function connect() {
		$db_data = $this->db_data;
		$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
		return $sgas_dbdrv;
	}

	public function correlativoTipoServicio($id) {
		$sgas_dbdrv = $this->connect();
		$correlativo = $sgas_dbdrv->query("SELECT max(correlativo_tipo) FROM acta_servicio WHERE id_tipo_servicio = ".$id);
		if(!empty($correlativo[0]['max'])) {
			$resp = $correlativo[0]['max'] + 1;
			echo json_encode($resp);
		} else {
			echo json_encode(array(1));
		}
	}

	public function correlativoCuerpo($id) {
		$sgas_dbdrv = $this->connect();
		$correlativo = $sgas_dbdrv->query("SELECT max(correlativo) FROM acta_servicio WHERE id_cuerpo = ".$id);
		if(!empty($correlativo[0]['max'])) {
			$resp = $correlativo[0]['max'] + 1;
			echo json_encode($resp);
		} else {
			echo json_encode(array(1));
		}
	}

	public function modelosDeMarcasVehiculo($id) {
		$sgas_dbdrv = $this->connect();
		$modelos = $sgas_dbdrv->query("SELECT * FROM modelo_vehiculo WHERE id_marca_vehiculo = ".$id);
		if(!empty($modelos)) {
			echo json_encode($modelos);
		} else {
			echo json_encode(array());
		}
	}

	public function municipalidadCuerpo($id) {
		$sgas_dbdrv = $this->connect();
		$mun = $sgas_dbdrv->query("SELECT * FROM municipalidad WHERE cuerpo_id = ".$id);
		if(!empty($mun)) {
			echo json_encode($mun);
		} else {
			echo json_encode(array());
		}
	}

	public function correlativoDuplicado($id, $id_cuerpo) {
		$sgas_dbdrv = $this->connect();
		$correlativo = $sgas_dbdrv->query("SELECT count(*) FROM acta_servicio WHERE correlativo = ".$id." and id_cuerpo = ".$id_cuerpo);
		if(!empty($correlativo[0]['count'])) {
			echo json_encode(1);
		} else {
			echo json_encode(array());
		}
	}

	public function correlativoTipoDuplicado($id, $correlativo) {
		$sgas_dbdrv = $this->connect();
		$correlativo = $sgas_dbdrv->query("SELECT count(*) FROM acta_servicio WHERE correlativo_tipo = ".$correlativo." and id_tipo_servicio=".$id);
		if(!empty($correlativo[0]['count'])) {
			echo json_encode(1);
		} else {
			echo json_encode(array());
		}
	}
}
