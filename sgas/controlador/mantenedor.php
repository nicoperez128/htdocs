<?php
$db_data = $sgasdb;
$sgas_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
$db_data = $rndb;
$rn_dbdrv = new PostgreDB($db_data['dbname'], $db_data['host'], $db_data['port'], $db_data['user'], $db_data['password'], $db_data['persistent']);
if(!empty($_POST)) {
	$data = $_POST;
	$table = $data['table'];
	$id = $data['id'];
	unset($data['table']);
	if($data['id'] == 0) {
		unset($data['id']);
		$save_data = $sgas_dbdrv->convert($data, $table);
		$mantenedor_sql  = "INSERT INTO {$table}";
		$mantenedor_sql .= "(".implode(", ", array_keys($save_data)).",creado,modificado)";
		$mantenedor_sql .= " VALUES (".implode(", ", $save_data).", NOW(),NOW()) RETURNING id";
	} else {
		unset($data['id']);
		$save_data = $sgas_dbdrv->convert($data, $table);
		$mantenedor_sql  = "UPDATE {$table} SET ";
		foreach($save_data as $k => $v) {
			$mantenedor_sql .= " {$k} = {$v}, ";
		}
		$mantenedor_sql .= " modificado=NOW() WHERE id = {$id}";
	}

	if($sgas_dbdrv->query($mantenedor_sql)) {
		echo "guardado correctamente";
	} else {
		echo "Se produjo un error al guardar";
	}
}
if(!empty($_GET['m'])) {
	if(!empty($mantenedores[$_GET['m']])) {
		$editable = $mantenedores[$_GET['m']];
	} else {
		die;
	}

	$resp = $sgas_dbdrv->query("SELECT * FROM ".$_GET['m']." ORDER BY id");
	$cols = $sgas_dbdrv->query("select column_name,* from information_schema.columns where table_name = '{$_GET['m']}'");
	
	foreach($editable['editable'] as $e) {
		if(!empty($e['depende'])) {
			if(!empty($e['db'])) {
				if($e['db'] == 'registro_nacional') {
					$depende = $rn_dbdrv->query("SELECT {$e['col']} as id, nombre FROM {$e['depende']} order by nombre");
					utf8_encode_deep($depende);
				}
			} else {
				$depende = $sgas_dbdrv->query("SELECT * FROM ".$e['depende']." ORDER BY id");
			}
		}
	}

	$modelo = $sgas_dbdrv->query("SELECT * FROM modelo_vehiculo ORDER BY id");

	$first = true;
			if($first) {
	echo "<table id='editgrid' class='columns fixed'>";
				echo "<tr>";
				foreach($cols as $t_k) {
					echo "<td>".$t_k['column_name']."</td>";
				}
				echo "<td></td>";
				echo "</tr>";
				echo "</table>";
				echo "<table id='editgrid' class='columns fixed'>";
				echo "<tr>";
				foreach($cols as $t_k) {
					echo "<td>";
					echo "<input style='display:none' name='table' value=''/>";
					echo "<input style='display:none' name='id' value=''/>";
					echo "<input style='display:none' class='editable' name='nombre' value=''/>";
					echo "</td>";
				}
				echo "<td></td>";
				$first = false;
	echo "</tr>";
	echo "</table>";
			}
	

	if(!empty($resp) && $resp != 1) {
	// 	foreach ($resp as $key => $value) {
	// 		echo "<form method='post'/>";
	// 		echo "<table id='editgrid' class='columns fixed'>";
	// 		echo "<tr>";
	// 		$id = !empty($value['id']) ? $value['id'] : '';
	// 		foreach($value as $k => $v) {
	// 			foreach($editable['editable'] as $ed) {
	// 				if(in_array($k, $ed)) {
	// 					echo "<td>";
	// 					echo "<input style='display:none' name='table' value='".$_GET['m']."'/>";
	// 					echo "<input style='display:none' name='id' value='".$id ."'/>";
	// 					echo "<input class='editable' name='nombre' value='".$v."'/>";
	// 					echo "</td>";
	// 				} else {
	// 					echo "<td>".$v."</td>";
	// 				}
	// 			}
	// 		}
	// 		echo "<td><input class='save' data-id='".$id."' type='submit' value='Guardar'></td>";
	// echo "</tr>";
	// echo "</table>";
	// echo "</form>";
	// 	}
	foreach ($resp as $key => $value) {
		echo "<form method='post'/>";
	echo "<table id='editgrid' class='columns fixed'>";
	echo "<input style='display:none' name='table' value='".$_GET['m']."'/>";
	echo "<input style='display:none' name='id' value='{$value['id']}'/>";
	echo "<tr>";
		foreach($cols as $t_k) {
					$e = false;
					$select = false;
					$data_select = array();
					foreach($editable['editable'] as $ed) {
						$data_select = $ed;
						if(in_array($t_k['column_name'], $ed)) {
							$e = true;
							if($ed['tipo'] == 'select') {
								$select = true;
							}
							break;
						} else {
							$e = false;
						}
					}
					if($e) {
						echo "<td>";
						// echo "<form id='new' method='post'/>";
						if($select) {
							
							echo "<select class='editable' name='".$data_select['col']."'>";
							foreach($depende as $d){
								$selected = $d['id'] == $value[$t_k['column_name']] ? 'selected':'';
								echo "<option value='".$d['id']."' ".$selected.">".$d['nombre']."</option>";
							}
							echo "</select>";
						} else {
							echo "<input class='editable' name='{$data_select['col']}' value='{$value[$t_k['column_name']]}'/>";
						}
						// echo "</form>";
						echo "</td>";
					} else {
						echo "<td>{$value[$t_k['column_name']]}</td>";
					}
				}
					echo "<td><input class='save' data-id='new' type='submit' value='Guardar'></td>";
	echo "</tr>";
	echo "</table>";
	echo "</form>";
	}

}
	echo "<form method='post'/>";
	echo "<table id='editgrid' class='columns fixed'>";
	echo "<tr>";
				foreach($cols as $t_k) {
					$e = false;
					$select = false;
					$data_select = array();
					foreach($editable['editable'] as $ed) {
						if(in_array($t_k['column_name'], $ed)) {
							$e = true;
							if($ed['tipo'] == 'select') {
								$select = true;
								$data_select = $ed;
							}
							break;
						} else {
							$e = false;
						}
					}
					if($e) {
						echo "<td>";
						// echo "<form id='new' method='post'/>";
						if($select) {
							echo "<input style='display:none' name='table' value='".$_GET['m']."'/>";
							echo "<input style='display:none' name='id' value='0'/>";
							echo "<select class='editable' name='".$data_select['col']."'>";
							foreach($depende as $d){
								echo "<option value='".$d['id']."'>".$d['nombre']."</option>";
							}
							echo "</select>";
						} else {
							echo "<input style='display:none' name='table' value='".$_GET['m']."'/>";
							echo "<input style='display:none' name='id' value='0'/>";
							echo "<input class='editable' name='nombre' value=''/>";
						}
						// echo "</form>";
						echo "</td>";
					} else {
						echo "<td></td>";
					}
				}
				echo "<td><input class='save' data-id='new' type='submit' value='Nuevo'></td>";
	echo "<form method='post'/>";
	echo "</tr>";
	echo "</table>";
		// echo "<br><div><button type='button'>agregar</button></div>";
}
?>
<script type="text/javascript">
$(".save").click(function(data){
	var id = $(this).data('id');
	document.getElementById(id).submit();
});
</script>


