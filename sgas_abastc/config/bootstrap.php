<?php

	$coordenadas_cuerpo = array(
		6 => array(
			'cuerpo' => 'antofagasta',
			'lat' => '-23.647451222923767',
			'lon' => '-70.39619024706167'
			),
		1 => array(
			'cuerpo' => 'arica',
			'lat' => '-18.480785529771246',
			'lon' => '-70.31145124145849'
			),
		11 => array(
			'cuerpo' => 'copiapó',
			'lat' => '-27.366076236664913',
			'lon' => '-70.3358511761975'
			),
		216 => array(
			'cuerpo' => 'coyhaique',
			'lat' => '-45.56975025302311',
			'lon' => '-72.07009088430947'
			),
		32 => array(
			'cuerpo' => 'la serena',
			'lat' => '-29.906157556240966',
			'lon' => '-71.24995350837708'
			),
		268 => array(
			'cuerpo' => 'temuco',
			'lat' => '-38.736323415789435',
			'lon' => '-72.60135584906342'
			),
		197 => array(
			'cuerpo' => 'puerto montt',
			'lat' => '-41.47155381340648',
			'lon' => '-72.93721674442484'
			),
		211 => array(
			'cuerpo' => 'valdivia',
			'lat' => '-39.81223179148972',
			'lon' => '-73.24510753123376'
			),
		219 => array(
			'cuerpo' => 'punta arenas',
			'lat' => '-53.162278148776345',
			'lon' => '-70.9106014359271'
			),
		2 => array(
			'cuerpo' => 'iquique',
			'lat' => '-20.212414491439908',
			'lon' => '-70.15203012757523'
			),
		68 => array(
			'cuerpo' => 'valparaíso',
			'lat' => '-33.03871310331993',
			'lon' => '-71.62863314151764'
			),
		22 => array(
			'cuerpo' => 'concepción',
			'lat' => '-36.827948222864435',
			'lon' => '-73.04236650466919'
			),
		113 => array(
			'cuerpo' => 'rancagua',
			'lat' => '-34.169506391495126',
			'lon' => '-70.74684157280582'
			),
		124 => array(
			'cuerpo' => 'talca',
			'lat' => '-35.428930881804064',
			'lon' => '-71.65989015151244'
			),
		170 => array(
			'cuerpo' => 'Santiago',
			'lat' => '-33.43624300344326',
			'lon' => '-70.65109303431295'
			)
		);

function pr($data){
	echo "<pre>";
	print_r($data);
	echo "</pre>";
}

function curPageURL() {
	return 'http://'.$_SERVER['HTTP_HOST'].dirname($_SERVER['PHP_SELF']);
}

function utf8_encode_deep(&$input) {
	if (is_string($input)) {
		$input = utf8_encode($input);
	} else if (is_array($input)) {
		foreach ($input as &$value) {
			utf8_encode_deep($value);
		}

		unset($value);
	} else if (is_object($input)) {
		$vars = array_keys(get_object_vars($input));

		foreach ($vars as $var) {
			utf8_encode_deep($input->$var);
		}
	}
}
?>