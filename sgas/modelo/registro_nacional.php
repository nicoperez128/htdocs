<?php
// error_reporting(E_ALL);
// ini_set('display_errors', '1');
require('../config/database.php');
require('../config/bootstrap.php');
require('pgsql_conn.php');

if(!empty($_POST['func'])) {
	$bombero = new Bomberos($rndb);
	if(method_exists($bombero, $_POST['func']) && !empty($_POST['elegido'])) {
		$bombero->$_POST['func']($_POST['elegido']);
	}
}

/**
* 
*/
class Bomberos
{
	var $db_data;
	var $rn_dbdrv;

	var $nro_compania = array(
		'1' => 'Primera',
		'2' => 'Segunda',
		'3' => 'Tercera',
		'4' => 'Cuarta',
		'5' => 'Quinta',
		'6' => 'Sexta',
		'7' => 'Septima',
		'8' => 'Octava',
		'9' => 'Novena',
		'10' => 'Decima',
		'11' => 'Decima Primera',
		'12' => 'Decima Segunda',
		'13' => 'Decima Tercer',
		'14' => 'Decima Cuarta',
		'16' => 'Decima Quinta',
		'17' => 'Decima Sexta',
		'18' => 'Decima Septima',
		'19' => 'Decima Novena',
		'20' => 'Vigésima',
		'21' => 'Vigésima Primera',
		'22' => 'Vigésima Segunda',
		'23' => 'Vigésima Tercera',
		'24' => 'Vigésima Cuarta',
		'25' => 'Vigésima Quinta',
		'26' => 'Vigésima Sexta',
		'27' => 'Vigésima Septima',
	);

	public function __construct($rndb)
	{
		$this->db_data = $rndb;
	}

	public function connect() {
		$db_data = $this->db_data;
		$rn_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
		return $rn_dbdrv;
	}

	public function companiasDelCuerpo($id) {
		$rn_dbdrv = $this->connect();
		$compania = $rn_dbdrv->query("SELECT compannia.compannia_id, compannia.cuerpo_id, compannia.nombre as co_nombre, compannia.numero, cuerpo.nombre as cu_nombre FROM compannia LEFT JOIN cuerpo ON cuerpo.cuerpo_id = compannia.cuerpo_id where cuerpo.cuerpo_id = ".$id." order by compannia.numero");
		if(!empty($compania)) {
			foreach($compania as &$c) {
				$c['numero'] = $this->nro_compania[$c['numero']];
			}
			utf8_encode_deep($compania);
			echo json_encode($compania);
		} else {
			echo json_encode(array());
		}
	}

	public function comunasDelaCompania($id) {
		$rn_dbdrv = $this->connect();
		$comuna = $rn_dbdrv->query("SELECT comuna.comuna_id, comuna.descripcion, provincia.descripcion provincia FROM comuna LEFT JOIN provincia on comuna.provincia_id = provincia.provincia_id INNER JOIN compannia_comunas ON compannia_comunas.comuna_id = comuna.comuna_id WHERE compannia_comunas.compannia_id = ".$id." order by comuna.descripcion");

		if(!empty($comuna)) {
			utf8_encode_deep($comuna);
			echo json_encode($comuna);
		} else {
			echo json_encode(array());
		}
	}

	public function bomberosDelCuerpo($id) {
		$rn_dbdrv = $this->connect();
		$bomberos = $rn_dbdrv->query("SELECT bombero.bombero_id,bombero.nombre,bombero.apellido_paterno, bombero.apellido_materno, ib.cargo from bombero 
							left join informacion_bomberil ib on ib.bombero_id = bombero.bombero_id
							left join compannia on ib.compannia_id = compannia.compannia_id
							left join cuerpo on cuerpo.cuerpo_id = compannia.cuerpo_id
							where cuerpo.cuerpo_id = " . $id);
		if(!empty($bomberos)) {
			utf8_encode_deep($bomberos);
			echo json_encode($bomberos);
		} else {
			echo json_encode(array());
		}
	}

	public function municipalidadCuerpo($id) {
		$rn_dbdrv = $this->connect();
		$municipalidad = $rn_dbdrv->query("SELECT comuna.comuna_id, comuna.descripcion FROM comuna 
										LEFT JOIN comuna_atendida ON comuna.comuna_id = comuna_atendida.comuna_id
										LEFT JOIN cuerpo ON cuerpo.cuerpo_id = comuna_atendida.cuerpo_id
										WHERE cuerpo.cuerpo_id = " . $id);
		if(!empty($municipalidad)) {
			utf8_encode_deep($municipalidad);
			echo json_encode($municipalidad);
		} else {
			echo json_encode(array());
		}
	}
}
