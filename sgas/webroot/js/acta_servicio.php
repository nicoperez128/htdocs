<script type="text/javascript">
$(document).ready(function() {
	buscar_mapa
	$("#buscar_mapa").click(function(data){
		var address = document.getElementById("d1").value + ' ' + document.getElementById("n1").value+ ', '+$('#comuna option:selected').data('provincia')+ ', '+$('#comuna option:selected').text()+', Chile';
		geocoder.geocode({
		  'address': address,
		  'partialmatch': true}, geocodeResult);
		clearOverlays();
	});

	function cambiarGeoCuerpo(lat, lang) {
		var latlng = new google.maps.LatLng(lat,lang);
		map.setOptions({
			center: latlng,
			zoom: 13
		});
		clearOverlays();
	}
	$("#fancy-mensaje-exito").fancybox({
			maxWidth	: 350,
			maxHeight	: 300,            
			fitToView	: true,
			autoSize	: false,
			closeClick	: true,
			closeBtn   : true,
			openEffect : 'elastic',
			openSpeed  : 150,
			closeEffect : 'elastic',
			closeSpeed  : 150,
			scrolling         : 'no',
			href: "html/guardado-exito.html",
			type: 'iframe'
		});

	$("#fancy-mensaje-error").fancybox({
			maxWidth	: 350,
			maxHeight	: 300,            
			fitToView	: true,
			autoSize	: false,
			closeClick	: true,
			closeBtn   : true,
			openEffect : 'elastic',
			openSpeed  : 150,
			closeEffect : 'elastic',
			closeSpeed  : 150,
			scrolling         : 'no',
			href: "html/guardado-error.html",
			type: 'iframe'
		});

	$("#fancy-mensaje-error-campos").fancybox({
			maxWidth	: 350,
			maxHeight	: 300,            
			fitToView	: true,
			autoSize	: false,
			closeClick	: true,
			closeBtn   : true,
			openEffect : 'elastic',
			openSpeed  : 150,
			closeEffect : 'elastic',
			closeSpeed  : 150,
			scrolling         : 'no',
			href: "html/guardado-error-campos.html",
			type: 'iframe'
		});
	<?php if(!empty($success) && empty($error)): ?>
		$('#fancy-mensaje-exito').click();
	<?php elseif(!empty($error)):?>
		$('#fancy-mensaje-error').click();
	<?php endif;?>
	$.validator.addMethod("rut", function(value, element) {
		return this.optional(element) || $.Rut.validar(value);
	}, "Este campo debe ser un rut valido.");

	var response = true;
	$.validator.addMethod("c1", function(value, element) {
		elegido=$("#c1").val();
		dg_cuerpo = $("#dg_cuerpo").val();
	
		$.ajax({
			type: "POST",
			url: '<?php echo MODELO."/sgas.php"?>',
			data: {func:'correlativoDuplicado', elegido: elegido,var1:dg_cuerpo},
			dataType:"json",
			async:false,
			success: function(msg)
			{
				if(msg == 1) {
					response = false;
				} else {
					response = true;
				}
			}
		});
		return response;
	}, "Correlativo en uso");

	$.validator.addMethod("c2", function(value, element) {
		elegido=$("#tipo").val();
		correlativo = $("#c2").val();

		$.ajax({
			type: "POST",
			url: '<?php echo MODELO."/sgas.php"?>',
			data: {func:'correlativoTipoDuplicado', elegido: elegido,var1:correlativo},
			dataType:"json",
			async:false,
			success: function(msg)
			{
				if(msg == 1) {
					response = false;
				} else {
					response = true;
				}
			}
		});
		return response;
	}, "Correlativo en uso");
	$("#formElem").validate({
		focusInvalid: false,
		onfocusout: function (element) {
			$(element).valid();
		},
		invalidHandler: function(errorMap, errorList) {
			$("html, body").animate({ scrollTop: 0 }, "fast");
			$('#fancy-mensaje-error-campos').click();
			var errores = new Array();
			for (var i = 0; i < errorList.errorList.length; i++) {
				id = $(errorList.errorList[i].element).closest(".step").data('id');
				errores.push(id);
				$(errorList.errorList[i].element).closest('ul').find('li').removeClass('selected');
       			$(errorList.errorList[i].element).closest('ul').find('li').addClass('selected');
			};
			uniqueErr = errores.filter(function(elem, pos) {
				return errores.indexOf(elem) == pos;
			});

			if(uniqueErr.length > 0) {
				var stepsObjects = $('#navigation').find('.step-number');
				for (var i = 0; i < stepsObjects.length; i++) {
					hasError = false;
					for (var j = 0; j < uniqueErr.length; j++) {
						if($(stepsObjects[i]).html() == uniqueErr[j]) {
							hasError = true;
						}
					};
						step = $(stepsObjects[i]).html();
						var $link = $('#navigation li:nth-child(' + parseInt(step) + ') a');
						$link.parent().find('.error,.checked').remove();

						var valclass = 'checked';
						if(hasError){
							error = -1;
							valclass = 'error';
						}
						$('<span class="'+valclass+'"></span>').insertAfter($link);
				}

			
				var stepsWidth	= 0;
			    var widths 		= new Array();
				$('#steps .step').each(function(i){
			        var $step 		= $(this);
					widths[i]  		= stepsWidth;
			        stepsWidth	 	+= $step.width();
					$step.closest('ul').find('li').removeClass('selected');
			    });
        		

				$('#steps').width(stepsWidth);
				current = uniqueErr[0];
				$('#steps').stop().animate({
					marginLeft: '-' + widths[current-1] + 'px'
				},500,function(){
					$('#steps .step').each(function(i){
				        if($(this).closest('ul').find('li').hasClass('error')) {
				        	$(this).closest('ul').find('li').addClass('selected');
				        }
				    });
					$('#formElem').children(':nth-child('+ parseInt(current) +')').find(':input:first').focus();	
				});
			}
		}
	});


	var currentdate = new Date();
	var month = (currentdate.getMonth()+1);
	if(month < 10) {
		month = '0'+month;
	}
	var day = currentdate.getDate();
	if(day < 10) {
		day = '0'+day;
	}
	var datetime =	day + "/"
					+ month  + "/" 
					+ currentdate.getFullYear();
	$('.fecha_denuncia').val(datetime);
	$('#det_fecha_inicio').val(datetime);
	$('#g_fecha').val(datetime);
	$('#det_fecha_termino').val(datetime);

	var tipo_lugar_element = function(id, title) {
			var element = '<div id="tl_element_' + id + '"><p class="subtitle">'+ title + '</p>' +
			'<button type="button" class="eliminar">X</button><p>'+
			'	<label for="id_tipo_construccion_' + id + '">Tipo de construcción:</label>'+
			'	<select id="id_tipo_construccion' + id + '" name="data[caract][tc][' + id + '][id_tipo_construccion][]">'+
			'		<?php foreach ($tconst as $k => $v) : ?>'+
			'		<option value="<?php echo $v["id"]?>"><?php echo $v["nombre"]?></option>'+
			'		<?php endforeach;?>'+
			'	</select>'+
			'</p>'+
			'<p>'+
			'	<label for="pisos">Número de pisos:</label>'+
			'	<input id="pisos" name="data[caract][tc][' + id + '][pisos][]" placeholder="Ej: 3" AUTOCOMPLETE=OFF />'+
			'</p>'+
			'<p>'+
			'	<label for="dano_enseres' + id + '">Daño en enseres:</label>'+
			'	<select id="dano_enseres' + id + '" name="data[caract][tc][' + id + '][dano_enseres][]">'+
			'		<?php for ($i=0; $i <= 100; $i++) : ?>'+
			'		<option value="<?php echo $i?>"><?php echo $i?> %</option>'+
			'		<?php endfor;?>'+
			'	</select>'+
			'</p>'+
			'<p>'+
			'	<label for="otros_danos">Otros daños:</label>'+
			'	<textarea id="otros_danos" rows="4" name="data[caract][tc][' + id + '][otros_danos][]" placeholder="Ej: 3" AUTOCOMPLETE=OFF /></textarea>'+
			'</p></div>';
			return element;
		}

	$(".tipo_lugar").click(function(data){
		var title = $(this).data('nombre');
		var id = $(this).data('id');
		var element = tipo_lugar_element(id,title);
		$(this).parent().parent().append(element);
		return false;
	});

	$("#dg_cuerpo").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'companiasDelCuerpo' }, function(data){
				$('#dg_compania option:gt(0)').remove();
				if(data) {
					var json = '<?php echo json_encode($coordenadas_cuerpo)?>';
					var cuerpo_geo = JSON.parse(json);
					var data = $.parseJSON(data);
					if(cuerpo_geo[elegido]) {
						if(cuerpo_geo[elegido].lat) {
							cambiarGeoCuerpo(cuerpo_geo[elegido].lat, cuerpo_geo[elegido].lon);
							$('#latitud').val(cuerpo_geo[elegido].lat);
							$('#longitud').val(cuerpo_geo[elegido].lon);
						}
					}
					
					$("#compania_radio").html('');
					$.each( data, function( key, value ) {
						$("#dg_compania").append($("<option></option>").attr("value", value.compannia_id).text(value.numero + ' - ' +value.co_nombre));
						$("#compania_radio").append('<div id="compania_'+value.compannia_id+'"><p><label for="nombre">'+value.numero + ' - ' +value.co_nombre+'</label>' +
							'No <input type="radio" class="compania_radio" data-id="'+value.compannia_id+'" name="data[dat_int][compania]['+value.compannia_id+']" value="0" checked>' +
							'&nbspSi <input type="radio" class="compania_radio" data-id="'+value.compannia_id+'" name="data[dat_int][compania]['+value.compannia_id+']" value="1"></p>');
					});
				}
			});
			$.post('<?php echo MODELO."/sgas.php"?>', { elegido: elegido, func:'correlativoCuerpo' }, function(data){
				var data = $.parseJSON(data);
				if(data) {
					$("#c1").val(data);
				}
			});

			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'municipalidadCuerpo' }, function(data){
				var data = $.parseJSON(data);
				$('#id_municipalidad').html('');
				if(data.length > 0) {
					$('#id_municipalidad').html('<p>Oficina de emergencia de:<p>');
					$.each( data, function( key, value ) {
						$('#id_municipalidad').append('<p>Municipalidad de '+value.descripcion+' <input type="checkbox" name="data[apoyo][id_municipalidad][]" value="'+value.comuna_id+'"><br></p>');
					});
				} else {
					$('#id_municipalidad').html('<p>No hay municipalidades para este sector<p>');
				}
			});

			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'bomberosDelCuerpo' }, function(data){
				$('#id_investigado_por option:gt(1)').remove();
				$('#id_bombero_acargo option:gt(1)').remove();
				$('#id_bombero_tomo_datos option:gt(1)').remove();
				if(data) {
					var data = $.parseJSON(data);
					// $('#id_investigado_por').html('<option value="">Seleccione una opción</option>');
					$.each( data, function( key, value ) {
						$('#id_investigado_por').append($("<option></option>").attr("value", value.bombero_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
						$('#id_bombero_acargo').append($("<option data-cargo='"+value.cargo+"'></option>").attr("value", value.bombero_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
						$('#id_bombero_tomo_datos').append($("<option></option>").attr("value", value.bombero_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
					});
				}
			});
		});
	});

	$("#id_bombero_acargo").change(function () {
		elegido=$(this).find('option:selected');
		cargo = elegido.data('cargo');
		// $("#id_cargo_bombero_acargo option[value='"+cargo+"']").attr("selected", true);
		var selections = document.querySelector('#id_cargo_bombero_acargo');
		selections.value = cargo;
		var evt = document.createEvent("HTMLEvents");
		evt.initEvent("change", true, true);
		selections.dispatchEvent(evt);
	});

	$("#id_apoyo_cuerpo").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'companiasDelCuerpo' }, function(data){
				$('#id_apoyo_compania option:gt(0)').remove();
				if(data) {
					var data = $.parseJSON(data);
					$.each( data, function( key, value ) {
						$("#id_apoyo_compania").append($("<option></option>").attr("value", value.compannia_id).text(value.numero + ' - ' +value.co_nombre));
					});
				}
			});
		});
	});

	$("#dg_compania").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'comunasDelaCompania' }, function(data){
				$('#comuna option:gt(0)').remove();
				if(data) {
					var data = $.parseJSON(data);
					$.each( data, function( key, value ) {
						$("#comuna").append($("<option></option>").attr("value", value.compannia_id).text(value.numero + ' - ' +value.co_nombre));
					});
					$("#comuna").append($("<option></option>").attr("value", "0").text("Todos"));
				}
			});
		});
	});

	$("#comuna").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			if(elegido == 0) {
				$('#comuna option:gt(0)').remove();
				<?php foreach ($comuna as $c):?>
				$("#comuna").append($("<option></option>").attr("value", <?php echo $c['comuna_id']?>).text("<?php echo $c['descripcion']?>"));
				<?php endforeach;?>
			}
		});
	});

	$("#id_marca_vehiculo").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			$.post('<?php echo MODELO."/sgas.php"?>', { elegido: elegido, func:'modelosDeMarcasVehiculo' }, function(data){
				$('#id_modelo_vehiculo option:gt(0)').remove();
				if(data) {
					var data = $.parseJSON(data);
					$.each( data, function( key, value ) {
						$("#id_modelo_vehiculo").append($("<option></option>").attr("value", value.id).text(value.nombre));
					});
				}
			});
		});
	});

	$(document).on('change', '.ov_id_marca_vehiculo', function() {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			var newselect = $(this).parent().parent().parent().find(".ov_id_modelo_vehiculo");
			$.post('<?php echo MODELO."/sgas.php"?>', { elegido: elegido, func:'modelosDeMarcasVehiculo' }, function(data){
				$(newselect).find('option').remove()
				if(data) {
					var data = $.parseJSON(data);
					$(newselect).html('<option value="">Seleccione una opción</option>');
					$.each( data, function( key, value ) {
						$(newselect).append($("<option></option>").attr("value", value.id).text(value.nombre));
					});
				}
			});
		});
	});

	$(document).on('change', '.compania_radio', function() {
		id=$(this).data('id');
		if($(this).val() == 1) {
			elegido=$(this).data('id');
			element = $(this);
			$.post('<?php echo MODELO."/material_mayor.php"?>', { elegido: elegido, func:'carrosCompania' }, function(data){
				if(data) {
					var data = $.parseJSON(data);
					if (data.length > 0) {
						var html = '<div id="'+id+'"><p>';
						for (var i=0;i<data.length;i++) { 
							html += 'Denominación: ' + data[i].denominacion + ' <input type="checkbox" id="carro_'+data[i].vehiculo_id+'" class="carro" data-id="'+data[i].vehiculo_id+'" name="data[dat_int][carros][]" value="'+data[i].vehiculo_id+'"><br>';
						}
						html += '</p></div>';
						$('#compania_'+id).after(html);
					};
				}
			});
		} else {
			$("#"+id).remove();
		}
	});

	$(document).on('change', '.carro', function() {
		var id = $(this).data('id');
		if($(this).is(':checked')) {
			$('#carro_'+id).after('<div id="datos_carro_'+id+'">'+$('#hora_carro').html()+'</div>');
		} else {
			$('#datos_carro_'+id).remove();
		}
	});

	// $("#id_cuerpo_ba").change(function () {
	// 	$("#id_cuerpo_ba option:selected").each(function () {
	// 		elegido=$(this).val();
	// 		$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'bomberosDelCuerpo' }, function(data){
	// 			$('#id_bombero_ba option:gt(1)').remove();
	// 			$('#id_dejada_por option:gt(0)').remove();
	// 			if(data) {
	// 				var data = $.parseJSON(data);
	// 				$.each( data, function( key, value ) {
	// 					$("#id_bombero_ba").append($("<option></option>").attr("value", value.compannia_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
	// 					$("#id_dejada_por").append($("<option></option>").attr("value", value.compannia_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
	// 				});
	// 			}
	// 		});
	// 	});
	// });

	$("#dg_cuerpo").val($("#dg_cuerpo option:eq(1)").val()).trigger('change');

	$("#tipo").change(function () {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			$.post('<?php echo MODELO."/sgas.php"?>', { elegido: elegido, func:'correlativoTipoServicio' }, function(data){
				var data = $.parseJSON(data);
				if(data) {
					$("#c2").val(data);
				}
			});
		});
	});

	//  $("#c1").change(function () {
	// 		elegido=$(this).val();
	// 		dg_cuerpo = $("#dg_cuerpo").val();
	// 		if(!dg_cuerpo) {
	// 			alert('Debe elejir un cuerpo antes de ingresar el correlativo');
	// 			return false;
	// 		}
	// 		$.post('<?php echo MODELO."/sgas.php"?>', { elegido: elegido,var1:dg_cuerpo, func:'correlativoDuplicado' }, function(data){
	// 			if(data) {
	// 				var validator = $("#formElem");
	// 				validator.showErrors({
	// 					"c1": "test"
	// 				});
	// 			}
	// 		// // 	var data = $.parseJSON(data);
	// 		// // 	if(data) {
	// 		// // 		$("#c2").val(data);
	// 		// // 	}
	// 		});
	// });

	$(".guardar").click(function(data){
		data.preventDefault();
		$("#formElem").submit(); 
	});

	$(document).on('click', '.eliminar', function() {
		var id = $(this).data('id');
		if(id !== null && count_otros_afectados_arr.length > 0) {
			var idx = count_otros_afectados_arr.indexOf(id);
			if(idx!=-1) {
				count_otros_afectados_arr.splice(idx, 1);
			}
		}
		$(this).parent().remove();
	});

	$(document).on('click', '#agregar_otros_bomberos', function() {
		var otros_bomberos = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#otros_bomberos_element").html() + '</div>';
		$("#otros_bomberos").after(otros_bomberos);
		$('.fecha_denuncia').val(datetime);
		$("#id_cuerpo_ba").val($("#id_cuerpo_ba option:eq(1)").val()).trigger('change');
	});

	$("body").on("click", ".fecha_denuncia", function(){
		if (!$(this).hasClass("hasDatepicker"))
		{
			$(this).datepicker();
			$(this).datepicker("show");
		}
	});

	$("#agregar_ambulancia").click(function(){
		var ambulancia = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#ambulancia").html() + '</div>';
		$("#ambulancia").after(ambulancia);		
	});

	$("#agregar_contenedor_gas").click(function(){
		var contenedor = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#gas_element").html() + '</div>';
		$("#contenedor_gas").after(contenedor);		
	});

	$("#agregar_compania_aseguradora").click(function(){
		var contenedor = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#compania_aseguradora_element").html() + '</div>';
		$("#compania_aseguradora").after(contenedor);		
	});

	$("#agregar_empresa_dist").click(function(){
		var contenedor = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#empresa_dist_element").html() + '</div>';
		$("#empresa_dist").after(contenedor);		
	});

	$("#agregar_apoyo_bomberil").click(function(){
		var apoyo = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#apoyo_bomberil").html() + '</div>';
		$("#apoyo_bomberil").after(apoyo);		
	});

	$("#agregar_otros_apoyos").click(function(){
		var apoyo = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#otros_apoyos").html() + '</div>';
		$("#otros_apoyos").after(apoyo);		
	});

	var count_otros_afectados = 0;
	var count_otros_afectados_arr = new Array;
	$("#agregar_otros_afectados").click(function(){
		var val = null;
		var filled = false;
		$("#afectados").children().each(function(){
			val = $(this).find('select, input, textarea').val();
			if(!(val == 0 || !val)) {
				filled = true;
			}
		});
		if(!filled) {
			alert('Al menos un campo debe ser llenado antes de continuar agregando afectados.');
			return false;
		}

		if(count_otros_afectados > 0 && count_otros_afectados_arr.length > 0) {
			// var elmento_anterior = count_otros_afectados - 1;
			for (var i = 0; i < count_otros_afectados_arr.length; i++) {
				var val = null;
				var filled = false;
				$('#oa_' + count_otros_afectados_arr[i]).children().each(function(){
					val = $(this).find('select, input, textarea').val();
					if(!(val == 0 || !val)) {
						filled = true;
					}
				});
				if(!filled) {
					alert('Al menos un campo debe ser llenado antes de continuar agregando afectados.');
					return false;
					break;
				}
			};

		}
		count_otros_afectados_arr.push(count_otros_afectados);
		var apoyo = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar" data-id="'+count_otros_afectados+'">X</button><div id="oa_'+count_otros_afectados+'">' + $("#otros_afectados_element").html() + '</div>';
		$("#otros_afectados").after(apoyo);
		count_otros_afectados++;
		
	});

	$("#agregar_otros_vehiculos").click(function(){
		var apoyo = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#otros_vehiculos_element").html() + '</div>';
		$("#otros_vehiculos").after(apoyo);		
	});

	$("#agregar_otros_lesionados").click(function(){
		var apoyo = '<div class="clear" style="border-top:1px solid #d9d9d9;"><button type="button" class="eliminar">X</button>' + $("#otros_lesionados_element").html() + '</div>';
		$("#otros_lesionados").after(apoyo);		
	});

	//otro bombero
	$(document).on('change', '.id_cuerpo_ba', function() {
		$("option:selected", this).each(function () {
			elegido=$(this).val();
			var newselect = $(this).parent().parent().parent().find(".id_bombero_ba");
			var newselect2 = $(this).parent().parent().parent().find(".id_dejada_por");
			$.post('<?php echo MODELO."/registro_nacional.php"?>', { elegido: elegido, func:'bomberosDelCuerpo' }, function(data){
				$(newselect).find('option').remove()
				$(newselect2).find('option').remove()
				if(data) {
					var data = $.parseJSON(data);
					$(newselect).html('<option value="">Seleccione una opción</option>');
					$(newselect2).html('<option value="">Seleccione una opción</option>');
					$.each( data, function( key, value ) {
						$(newselect).append($("<option></option>").attr("value", value.bombero_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
						$(newselect2).append($("<option></option>").attr("value", value.bombero_id).text(value.apellido_paterno + ' ' + value.apellido_materno + ' ' + value.nombre));
					});
				}
			});
		});
	});

});
function ThousandSeparate() {
	arguments[0].value = arguments[0].value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
	return true;
}

$(window).load(function(){
	$('#dvLoading').fadeOut(500);
});
</script>