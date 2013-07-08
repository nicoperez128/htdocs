<?php
// error_reporting(E_ALL);
// ini_set('display_errors', '1');
require('../config/database.php');
require('../config/bootstrap.php');
require('pgsql_conn.php');

if(!empty($_POST['func'])) {
	$mmayor = new MaterialMayor($mmayordb);
	if(method_exists($mmayor, $_POST['func']) && !empty($_POST['elegido'])) {
		if(!empty($_POST['var1'])) {
			$mmayor->$_POST['func']($_POST['elegido'],$_POST['var1']);
		} else {
			$mmayor->$_POST['func']($_POST['elegido']);
		}
	}
}

class MaterialMayor
{
	var $db_data;

	function __construct($mmayordb)
	{
		$this->db_data = $mmayordb;
	}

	private function connect() {
		$db_data = $this->db_data;
		$mm_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
		return $mm_dbdrv;
	}

	public function carrosCompania($id) {
		$mm_dbdrv = $this->connect();
		$carros = $mm_dbdrv->query("SELECT v.* FROM vehiculo_documento vd LEFT JOIN vehiculo v ON v.vehiculo_id = vd.vehiculo_id WHERE vd.compannia_id = " . $id);
		// $carros = $mm_dbdrv->query("SELECT * FROM vehiculo_documento WHERE compannia_id = ".$id);
		if(!empty($carros)) {
			echo json_encode($carros);
		} else {
			echo json_encode(array());
		}
	}
}
