<?php
/*
Este archivo procesa la solicitud y genera el archivo excel

requiere tener la libreria json para recibir datos desde la pagina y transmitir el archivo excel (cambiar ubicación)
requiere tener la carpeta Classes (Php Excel)

pendiente importante: cambiar el url de la función ajax js en lista_actas

*/

error_reporting(E_ALL);
session_start();
//include (dirname(__FILE__). '/../php/Clases/json.php');

require_once("Classes/PHPExcel.php");
require_once("Classes/PHPExcel/Writer/Excel2007.php");
include('../modelo/sgas.php');
require('json.php');

/*array_walk($_REQUEST, 'limpiarCadena');

$region_id = $_REQUEST['region_id'];
$cuerpo_id = $_REQUEST['cuerpo_id'];
$compannia_id = $_REQUEST['compannia_id'];
$tipo_estado_vigencia_id = $_REQUEST['tipo_estado_vigencia_id'];

$nivel = $_SESSION['nivel'];

$result = array ();*/


$nombre_archivo = "listado_de_actos_de_servicio.xls";
$db_data = $sgasdb;
$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
$resp = $sgas_dbdrv->query("SELECT * FROM acta_servicio ORDER BY id");

//$result = GestorNegocio::Instance()->GenerarExcelStatusBomberos($region_id, $cuerpo_id, $compannia_id, $nivel, $tipo_estado_vigencia_id) ;

$objPHPExcel = new PHPExcel();
//Autor del Archivo
$objPHPExcel->getProperties()->setCreator("Sistema de gestión de Actos de Servicio");
$objPHPExcel->getProperties()->setLastModifiedBy("Sistema de gestión de Actos de Servicio");
$objPHPExcel->getProperties()->setTitle("Listado total de Actos de Servicio");
$objPHPExcel->getProperties()->setSubject("");
$objPHPExcel->getProperties()->setDescription("Este listado fue generado por el sistema SGAS, perteneciente a la Junta Nacional de Bomberos de Chile");

/*Seteo de Estilos*/

$tHead = array(
	'font' => array(
		'bold' => true, 'Name' => 'Calibri', 'Size' => 13
	),
	'alignment' => array(
		'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	),
	'borders' => array(
		'top' => array(
			'style' => PHPExcel_Style_Border::BORDER_THIN,
		),
	),
	'fill' => array(
		'type' => PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
		'rotation' => 90,
		'startcolor' => array(
			'argb' => '0080FF',
		),
		'endcolor' => array(
			'argb' => 'FFFFFFFF',
		),
	),
);



/*Creación y llenado del objeto excel*/

	/* Imagenes */
		$objDrawing = new PHPExcel_Worksheet_Drawing();
		$objDrawing->setName('Water_Level');
		$objDrawing->setDescription('Water_Level');
		$objDrawing->setPath('../webroot/css/img/header-bg.png');
		$objDrawing->setHeight(81);
		$objDrawing->setCoordinates('M1');
		$objDrawing->setWorksheet($objPHPExcel->getActiveSheet());


		$objDrawing2 = new PHPExcel_Worksheet_Drawing();
		$objDrawing2->setName('Water_Level');
		$objDrawing2->setDescription('Water_Level');
		$objDrawing2->setPath('../webroot/css/img/home-logo.png');
		$objDrawing2->setHeight(40);
		$objDrawing2->setCoordinates('B1');
		$objDrawing2->setWorksheet($objPHPExcel->getActiveSheet());

	/*Título*/
		$objPHPExcel->getActiveSheet()->getStyle('C1')->getFont()->setName('Calibri');
		$objPHPExcel->getActiveSheet()->getStyle('C1')->getFont()->setsize(15);
		$objPHPExcel->getActiveSheet()->SetCellValue("C1", "Bomberos de Chile");

		$objPHPExcel->getActiveSheet()->getStyle('C2')->getFont()->setName('Calibri');
		$objPHPExcel->getActiveSheet()->getStyle('C2')->getFont()->setsize(12);
		$objPHPExcel->getActiveSheet()->SetCellValue("C2", "Sistema de Gestión de Estadísticas");

		$objPHPExcel->getActiveSheet()->getStyle('C3')->getFont()->setName('Calibri');
		$objPHPExcel->getActiveSheet()->getStyle('C3')->getFont()->setsize(12);
		$objPHPExcel->getActiveSheet()->SetCellValue("C3", "Listado de Actos de Servicio");
		$objPHPExcel->getActiveSheet()->getStyle('C3')->getFont()->getColor()->applyFromArray(array("rgb" => "FF8000"));

	/*Cabeceras de Columna*/

		$objPHPExcel->getActiveSheet()->getStyle('B7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("B7", "id");
		$objPHPExcel->getActiveSheet()->getStyle('C7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("C7", "correlativo");
		$objPHPExcel->getActiveSheet()->getStyle('D7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("D7", "id_tipo_servicio");
		$objPHPExcel->getActiveSheet()->getStyle('E7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("E7", "sector");
		$objPHPExcel->getActiveSheet()->getStyle('F7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("F7", "fecha");
		$objPHPExcel->getActiveSheet()->getStyle('G7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("G7", "hora");
		$objPHPExcel->getActiveSheet()->getStyle('H7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("H7", "id_cuerpo");
		$objPHPExcel->getActiveSheet()->getStyle('I7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("I7", "id_compania");
		$objPHPExcel->getActiveSheet()->getStyle('J7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("J7", "direccion");
		$objPHPExcel->getActiveSheet()->getStyle('K7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("K7", "numero");
		$objPHPExcel->getActiveSheet()->getStyle('L7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("L7", "calle");
		$objPHPExcel->getActiveSheet()->getStyle('M7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("M7", "comuna");
		$objPHPExcel->getActiveSheet()->getStyle('N7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("N7", "poblacion");
		$objPHPExcel->getActiveSheet()->getStyle('O7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("O7", "nro_block");
		$objPHPExcel->getActiveSheet()->getStyle('P7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("P7", "nro_depto");
		$objPHPExcel->getActiveSheet()->getStyle('Q7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("Q7", "latitud");
		$objPHPExcel->getActiveSheet()->getStyle('R7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("R7", "longitud");
		$objPHPExcel->getActiveSheet()->getStyle('S7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("S7", "rut");
		$objPHPExcel->getActiveSheet()->getStyle('T7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("T7", "nombre");
		$objPHPExcel->getActiveSheet()->getStyle('U7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("U7", "telefono");
		$objPHPExcel->getActiveSheet()->getStyle('V7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("V7", "id_tipo_ocupante");
		$objPHPExcel->getActiveSheet()->getStyle('W7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("W7", "nro_adultos");
		$objPHPExcel->getActiveSheet()->getStyle('X7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("X7", "nro_ninos");
		$objPHPExcel->getActiveSheet()->getStyle('Y7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("Y7", "mails");
		$objPHPExcel->getActiveSheet()->getStyle('Z7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("Z7", "id_tipo_lugar");
		$objPHPExcel->getActiveSheet()->getStyle('AA7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AA7", "id_tipo_vehiculo");
		$objPHPExcel->getActiveSheet()->getStyle('AB7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AB7", "id_marca_vehiculo");
		$objPHPExcel->getActiveSheet()->getStyle('AC7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AC7", "id_modelo_vehiculo");
		$objPHPExcel->getActiveSheet()->getStyle('AD7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AD7", "patente");
		$objPHPExcel->getActiveSheet()->getStyle('AE7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AE7", "id_lugar_inicio_fuego");
		$objPHPExcel->getActiveSheet()->getStyle('AF7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AF7", "id_origen");
		$objPHPExcel->getActiveSheet()->getStyle('AG7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AG7", "id_causa");
		$objPHPExcel->getActiveSheet()->getStyle('AH7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AH7", "observacion_causa");
		$objPHPExcel->getActiveSheet()->getStyle('AI7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AI7", "id_fuente_calor");
		$objPHPExcel->getActiveSheet()->getStyle('AJ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AJ7", "oservacion_fuente_calor");
		$objPHPExcel->getActiveSheet()->getStyle('AK7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AK7", "dano_vivienda");
		$objPHPExcel->getActiveSheet()->getStyle('AL7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AL7", "dano_vehiculo");
		$objPHPExcel->getActiveSheet()->getStyle('AM7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AM7", "dano_enseres");
		$objPHPExcel->getActiveSheet()->getStyle('AN7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AN7", "otro_dano");
		$objPHPExcel->getActiveSheet()->getStyle('AO7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AO7", "id_unidad_explosivos");
		$objPHPExcel->getActiveSheet()->getStyle('AP7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AP7", "cantidad_explosivos");
		$objPHPExcel->getActiveSheet()->getStyle('AQ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AQ7", "id_unidad_venenos");
		$objPHPExcel->getActiveSheet()->getStyle('AR7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AR7", "cantidad_venenos");
		$objPHPExcel->getActiveSheet()->getStyle('AS7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AS7", "id_unidad_gases");
		$objPHPExcel->getActiveSheet()->getStyle('AT7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AT7", "cantidad_gases");
		$objPHPExcel->getActiveSheet()->getStyle('AU7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AU7", "id_unidad_solidos");
		$objPHPExcel->getActiveSheet()->getStyle('AV7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AV7", "cantidad_solidos");
		$objPHPExcel->getActiveSheet()->getStyle('AW7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AW7", "id_unidad_radioactivos");
		$objPHPExcel->getActiveSheet()->getStyle('AX7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AX7", "cantidad_radioactivos");
		$objPHPExcel->getActiveSheet()->getStyle('AY7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AY7", "id_unidad_oxidantes");
		$objPHPExcel->getActiveSheet()->getStyle('AZ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("AZ7", "cantidad_oxidantes");
		$objPHPExcel->getActiveSheet()->getStyle('BA7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BA7", "id_unidad_otros");
		$objPHPExcel->getActiveSheet()->getStyle('BB7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BB7", "cantidad_otros");
		$objPHPExcel->getActiveSheet()->getStyle('BC7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BC7", "detalle_productos");
		$objPHPExcel->getActiveSheet()->getStyle('BD7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BD7", "id_empresa_dist");
		$objPHPExcel->getActiveSheet()->getStyle('BE7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BE7", "id_contenedor_gas");
		$objPHPExcel->getActiveSheet()->getStyle('BF7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BF7", "id_compania_aseguradora");
		$objPHPExcel->getActiveSheet()->getStyle('BG7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BG7", "id_tipo_gas");
		$objPHPExcel->getActiveSheet()->getStyle('BH7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BH7", "nro_poliza");
		$objPHPExcel->getActiveSheet()->getStyle('BI7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BI7", "especies_aseguradas");
		$objPHPExcel->getActiveSheet()->getStyle('BJ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BJ7", "id_proc_ambulancia");
		$objPHPExcel->getActiveSheet()->getStyle('BK7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BK7", "id_municipalidad");
		$objPHPExcel->getActiveSheet()->getStyle('BL7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BL7", "id_movil_oe");
		$objPHPExcel->getActiveSheet()->getStyle('BM7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BM7", "carabinero");
		$objPHPExcel->getActiveSheet()->getStyle('BN7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BN7", "id_otros_apoyos");
		$objPHPExcel->getActiveSheet()->getStyle('BO7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BO7", "id_investigado_por");
		$objPHPExcel->getActiveSheet()->getStyle('BP7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BP7", "det_fecha_inicio");
		$objPHPExcel->getActiveSheet()->getStyle('BQ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BQ7", "det_fecha_termino");
		$objPHPExcel->getActiveSheet()->getStyle('BR7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BR7", "existen_fotos");
		$objPHPExcel->getActiveSheet()->getStyle('BS7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BS7", "existen_muestras");
		$objPHPExcel->getActiveSheet()->getStyle('BT7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BT7", "existen_otros");
		$objPHPExcel->getActiveSheet()->getStyle('BU7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BU7", "dat_otros");
		$objPHPExcel->getActiveSheet()->getStyle('BV7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BV7", "notas_depto_tecnico");
		$objPHPExcel->getActiveSheet()->getStyle('BW7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BW7", "id_cuerpo_ba");
		$objPHPExcel->getActiveSheet()->getStyle('BX7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BX7", "id_bombero_ba");
		$objPHPExcel->getActiveSheet()->getStyle('BY7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BY7", "id_dejada_por");
		$objPHPExcel->getActiveSheet()->getStyle('BZ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("BZ7", "id_comiseria");
		$objPHPExcel->getActiveSheet()->getStyle('CA7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CA7", "fecha_denuncia");
		$objPHPExcel->getActiveSheet()->getStyle('CB7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CB7", "nro_libro_denuncia");
		$objPHPExcel->getActiveSheet()->getStyle('CC7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CC7", "nro_hoja_denuncia");
		$objPHPExcel->getActiveSheet()->getStyle('CD7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CD7", "nro_parrafo_denuncia");
		$objPHPExcel->getActiveSheet()->getStyle('CE7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CE7", "desc_bombero_accidentado");
		$objPHPExcel->getActiveSheet()->getStyle('CF7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CF7", "id_bombero_acargo");
		$objPHPExcel->getActiveSheet()->getStyle('CG7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CG7", "id_cargo_bombero_acargo");
		$objPHPExcel->getActiveSheet()->getStyle('CH7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CH7", "id_bombero_tomo_datos");
		$objPHPExcel->getActiveSheet()->getStyle('CI7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CI7", "cargo_bombero_acargo");
		$objPHPExcel->getActiveSheet()->getStyle('CJ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CJ7", "id_unidad_liquidos");
		$objPHPExcel->getActiveSheet()->getStyle('CK7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CK7", "cantidad_liquidos");
		$objPHPExcel->getActiveSheet()->getStyle('CL7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CL7", "cuerpo");
		$objPHPExcel->getActiveSheet()->getStyle('CM7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CM7", "creado");
		$objPHPExcel->getActiveSheet()->getStyle('CN7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CN7", "modificado");
		$objPHPExcel->getActiveSheet()->getStyle('CO7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CO7", "id_tipo_via");
		$objPHPExcel->getActiveSheet()->getStyle('CP7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CP7", "patente_carabinero");
		$objPHPExcel->getActiveSheet()->getStyle('CQ7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CQ7", "id_investigado_por_otro");
		$objPHPExcel->getActiveSheet()->getStyle('CR7')->applyFromArray($tHead);$objPHPExcel->getActiveSheet()->SetCellValue("CR7", "correlativo_tipo");


	$objPHPExcel->setActiveSheetIndex(0);
	$cont = 8;
	foreach($resp as $row){
		$objPHPExcel->getActiveSheet()->SetCellValue("B".$cont, $row["id"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("C".$cont, $row["correlativo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("D".$cont, $row["id_tipo_servicio"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("E".$cont, $row["sector"]);
		$dt = new DateTime($row["fecha"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("F".$cont, $dt->format('d-m-Y'));
		$objPHPExcel->getActiveSheet()->SetCellValue("G".$cont, $row["hora"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("H".$cont, $row["id_cuerpo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("I".$cont, $row["id_compania"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("J".$cont, $row["direccion"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("K".$cont, $row["numero"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("L".$cont, $row["calle"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("M".$cont, $row["comuna"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("N".$cont, $row["poblacion"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("O".$cont, $row["nro_block"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("P".$cont, $row["nro_depto"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("Q".$cont, $row["latitud"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("R".$cont, $row["longitud"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("S".$cont, $row["rut"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("T".$cont, $row["nombre"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("U".$cont, $row["telefono"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("V".$cont, $row["id_tipo_ocupante"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("W".$cont, $row["nro_adultos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("X".$cont, $row["nro_ninos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("Y".$cont, $row["mails"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("Z".$cont, $row["id_tipo_lugar"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AA".$cont, $row["id_tipo_vehiculo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AB".$cont, $row["id_marca_vehiculo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AC".$cont, $row["id_modelo_vehiculo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AD".$cont, $row["patente"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AE".$cont, $row["id_lugar_inicio_fuego"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AF".$cont, $row["id_origen"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AG".$cont, $row["id_causa"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AH".$cont, $row["observacion_causa"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AI".$cont, $row["id_fuente_calor"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AJ".$cont, $row["oservacion_fuente_calor"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AK".$cont, $row["dano_vivienda"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AL".$cont, $row["dano_vehiculo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AM".$cont, $row["dano_enseres"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AN".$cont, $row["otro_dano"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AO".$cont, $row["id_unidad_explosivos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AP".$cont, $row["cantidad_explosivos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AQ".$cont, $row["id_unidad_venenos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AR".$cont, $row["cantidad_venenos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AS".$cont, $row["id_unidad_gases"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AT".$cont, $row["cantidad_gases"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AU".$cont, $row["id_unidad_solidos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AV".$cont, $row["cantidad_solidos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AW".$cont, $row["id_unidad_radioactivos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AX".$cont, $row["cantidad_radioactivos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AY".$cont, $row["id_unidad_oxidantes"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("AZ".$cont, $row["cantidad_oxidantes"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BA".$cont, $row["id_unidad_otros"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BB".$cont, $row["cantidad_otros"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BC".$cont, $row["detalle_productos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BD".$cont, $row["id_empresa_dist"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BE".$cont, $row["id_contenedor_gas"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BF".$cont, $row["id_compania_aseguradora"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BG".$cont, $row["id_tipo_gas"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BH".$cont, $row["nro_poliza"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BI".$cont, $row["especies_aseguradas"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BJ".$cont, $row["id_proc_ambulancia"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BK".$cont, $row["id_municipalidad"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BL".$cont, $row["id_movil_oe"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BM".$cont, $row["carabinero"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BN".$cont, $row["id_otros_apoyos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BO".$cont, $row["id_investigado_por"]);
		$dt = new DateTime($row["det_fecha_inicio"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("BP".$cont, $dt->format('d-m-Y'));
		$dt = new DateTime($row["det_fecha_termino"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("BQ".$cont, $dt->format('d-m-Y'));
		$objPHPExcel->getActiveSheet()->SetCellValue("BR".$cont, $row["existen_fotos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BS".$cont, $row["existen_muestras"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BT".$cont, $row["existen_otros"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BU".$cont, $row["dat_otros"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BV".$cont, $row["notas_depto_tecnico"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BW".$cont, $row["id_cuerpo_ba"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BX".$cont, $row["id_bombero_ba"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BY".$cont, $row["id_dejada_por"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("BZ".$cont, $row["id_comiseria"]);
		$dt = new DateTime($row["fecha_denuncia"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("CA".$cont, $dt->format('d-m-Y'));
		$objPHPExcel->getActiveSheet()->SetCellValue("CB".$cont, $row["nro_libro_denuncia"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CC".$cont, $row["nro_hoja_denuncia"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CD".$cont, $row["nro_parrafo_denuncia"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CE".$cont, $row["desc_bombero_accidentado"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CF".$cont, $row["id_bombero_acargo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CG".$cont, $row["id_cargo_bombero_acargo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CH".$cont, $row["id_bombero_tomo_datos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CI".$cont, $row["cargo_bombero_acargo"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CJ".$cont, $row["id_unidad_liquidos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CK".$cont, $row["cantidad_liquidos"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CL".$cont, $row["cuerpo"]);
		$dt = new DateTime($row["creado"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("CM".$cont, $dt->format('d-m-Y'));
		$dt = new DateTime($row["modificado"]); 
		$objPHPExcel->getActiveSheet()->SetCellValue("CN".$cont, $dt->format('d-m-Y'));
		$objPHPExcel->getActiveSheet()->SetCellValue("CO".$cont, $row["id_tipo_via"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CP".$cont, $row["patente_carabinero"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CQ".$cont, $row["id_investigado_por_otro"]);
		$objPHPExcel->getActiveSheet()->SetCellValue("CR".$cont, $row["correlativo_tipo"]);


	    $cont++;
	}

//$objPHPExcel->getActiveSheet()->getStyle('B2')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_BLUE);

	

/*Titulo del libro y seguridad */
	$objPHPExcel->getActiveSheet()->setTitle('Listado de Actos');
	$objPHPExcel->getSecurity()->setLockWindows(true);
	$objPHPExcel->getSecurity()->setLockStructure(true);
	
// Se modifican los encabezados del HTTP para indicar que se envia un archivo de Excel.
	/*header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	header('Content-Disposition: attachment;filename="'.$nombre_archivo.'"');
	header('Cache-Control: max-age=0');*/

//Creamos el Archivo .xlsx
	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('../webroot/uploads/'.$nombre_archivo);

    $objPHPExcel->disconnectWorksheets();
    unset($objPHPExcel);

/*Cambiar url por variable */
$url = curDownloadURL();


$url = $url ."/". $nombre_archivo;


//echo "asdasdas".$GLOBALS['url'];die();

$json = new Services_JSON();
echo $json->encode($url); 
//echo json_encode($result);
die;
?>
