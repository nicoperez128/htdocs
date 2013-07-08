
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Bomberos.cl</title>
<base href="<?=WEBROOT_NAME.DS?>">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- Scripts Tabs -->
<link rel="stylesheet" href="css/style-form.css" type="text/css" media="screen"/>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/sliding.form.js"></script>
</head>
<body>
<div id="wrapper">
		<div id="header">
				<div id="header-title">Sistema de Actos de Servicio</div>
		</div>
		<div class="nav_container">
							<div id="nav">
								<div class="catnav">
								  <ul class="catnav">
									<li><a href="" class="active">Mantenedores</a>
											<ul>
													<li><a href="" title="">Nuevo Acto de servicio</a></li>
													<li><a href="" title="">Listar actos de servicio</a></li>
											 </ul>
									</li>
								  </ul>
								</div>
							</div>
							
		</div>
		<div id="container">
				<div id="where-who">
						<div class="where">Dar de Alta</div><div class="where-forward">>></div><div class="where">Alta de Vehículo (Compra)</div>
						<div class="who">
								<div class="cerrar-sesion"><a href="">Cerrar Sesión</a></div>
								<div class="who-user">Richard Ortiz</div>
								<div class="who-icon"></div>
						</div>
						
				</div>
				<div class="container-title"><h1>Nuevo acto de servicio</h1></div>
				<!-- Formulario -->
				<div id="wrapper-formulario">
				<div id="navigation" style="display:none;">
                    <ul>
                        <li class="selected">
                            <a><span class="step-number">1</span>Generales</a>
                        </li>
                        <li>
                            <a><span class="step-number">2</span>Familia y Emergencia</a>
                        </li>
                        <li>
                            <a><span class="step-number">3</span>Apoyos que concurrieron</a>
                        </li>
                        <li>
                            <a><span class="step-number">4</span>DET</a>
                        </li>
						  <li>
                            <a><span class="step-number">5</span>Datos finales</a>
                        </li>
						        </li>
						  <li>
                            <a><span class="step-number">6</span>Apoyos</a>
                        </li>
                    </ul>
                </div>
				<div class="sec-container">
				
                <div id="steps">
                    <form id="formElem" name="formElem" action="" method="post">
                        <fieldset class="step">
                           <!--Datos del acto de servicio-->
							<div class="fields-column">
							<div class="fields-box">
						
                            <p>
                                <label for="padron">Correlativo:</label>
                                   <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF onFocus="this.blur()"/>
                            </p>
                            <p>
                                <label for="tipo">Correlativo tipo de servicio:</label>
                                 <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="tipo">Sector (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							
                            <p>
                                <label for="tipo">Cuerpo (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Compañía a cargo (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="campo1">fecha (*):</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="tipo">Tipo de servicio (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>

							
							</div>
							</div>
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="campo1">Dirección (*):</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="campo1">Calle o esquina de referencia(*):</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="campo1">Comuna(*):</label>
                                <select name="captura[id_comuna]" id="captura_id_comuna">
										<option value="48">ALGARROBO</option>
										<option value="314">ALHUE</option>
										<option value="350">ALTO BIO BIO</option>
										<option value="344">ALTO DEL CARMEN</option>
										<option value="326">ALTO HOSPICIO</option>
										<option value="230">ANCUD</option>
										<option value="6">ANDACOLLO</option>
										<option value="171">ANGOL</option>
										<option value="262">ANTARTICA</option>
										<option value="334">ANTOFAGASTA</option>
										<option value="153">ANTUCO</option>
										<option value="163">ARAUCO</option>
										<option value="318">ARICA</option>
										<option value="20">ZAPALLAR</option>
								</select>
                            </p>
							<p>
                                <label for="tipo">Población o Villa (*):</label>
                               <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="campo1">Número de block (*):</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="tipo">Número de dpto:</label>
                              <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							</div>
							</div>
                        </fieldset>
			<!--Fin Datos del servicio-->
			<!--Informacion Adicional-->
                        <fieldset class="step">
                            
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Rut del ocupante:</label>
                               <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                             <p>
                                <label for="campo1">Nombre de ocupante</label>
                               <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="campo1">Número de adultos:</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							<p>
                                <label for="tipo">Tipo de ocupante:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Propietario</option>
                                    <option>Arrendatario</option>
                                    <option>Allegado</option>
                                </select>
                            </p>
                           <p>
                                <label for="tipo">Número de niños:</label>
                               <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="tipo">Teléfono:</label>
                            <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
			
							</div>
							</div>
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Tipo de lugar:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Tipo de construcción:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Número de pisos:</label>
                            <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							<p>
                                <label for="tipo">Tipo de vehículos:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Marca de vehículo:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
						    <p>
                                <label for="tipo">Modelo de vehículo:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo1">Patente :</label>
                                
								 <input id="campo1" name="campo1"  placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							    <p>
                                <label for="tipo">Lugar de inicio del fuego:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo1">Descripción de la causa:</label>
                                <input id="campo1" name="campo1"  placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							<p>
                                <label for="tipo1">Fuente de Calor:</label>
                                <input id="campo1" name="campo1"  placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
							 <p>
                                <label for="tipo">Daños en viviendas:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Daños en vehículos:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Daños en enseres:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							</div>
							</div>
                        </fieldset>
                        <fieldset class="step">
                       <!-- Fin Informacion Adicional-->
					   <!--Fotografías-->
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="foto1">Vista Frontal :</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
                            <p>
                                <label for="foto1">Vista Lateral :</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Vista Trasera :</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>  
							</div>
							</div>

                        </fieldset>
						<fieldset class="step">
                            <!--Fin Fotografías-->
							<!-- Documentos -->
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="campo1">N° de Orden de Compra:</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="campo1">Fecha de Orden de Compra:</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="foto1">Orden de Compra:</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>  
							<p>
                                <label for="campo1">N° de declaración de ingreso:</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 19389103939" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="campo1">Fecha de declaración de ingreso:</label>
                                <input id="campo1" name="campo1" placeholder="Ej: 10-12-2012" AUTOCOMPLETE=OFF />
                            </p>
                            <p>
                                <label for="foto1">Declaración de ingreso (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Factura Comercial (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Bill of Lading (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Packing List (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Acta de Recepción (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							</div>
							</div>
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="foto1">Solicitud Extención de IVA (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
                            <p>
                                <label for="foto1">Resolución Extención de IVA (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
                            <p>
                                <label for="foto1">Valor final de la compra:</label>
                               <input id="campo1" name="campo1" placeholder="Ej: $000.000.000" AUTOCOMPLETE=OFF />
                            </p>
							<p>
                                <label for="tipo">Proveedor:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="foto1">Agente de Aduana:</label>
                               <input id="campo1" name="campo1"  AUTOCOMPLETE=OFF />
                            </p>
                           <p>
                                <label for="foto1">Manual de Usuario (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="foto1">Manual de Mantención (.pdf o .jpg):</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							<p>
                                <label for="tipo">Región del Cuerpo Destinatario (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Cuerpo de Bomberos Destinatario (*):</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							</div>
							</div>
							
							
                        </fieldset>
						  <fieldset class="step">
                            
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Mark antony:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                             <p>
                                <label for="campo1">Pauta Mantención de Carrozado</label>
                                <input id="campo1" name="campo1"  value="10-12-2012" DISABLED/>
                            </p>
                            <p>
                                <label for="campo1">Pauta Mantención de Chasis:</label>
                                <input id="campo1" name="campo1"  value="10-12-2012" DISABLED/>
                            </p>
							<p>
                                <label for="tipo">Condición:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                           <p>
                                <label for="tipo">Tipo de caja de cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Marca Caja de Cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Modelo de caja de cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							</div>
							</div>
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Tipo de Combustible:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Marca Bomba:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Modelo de Bomba:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">País de Origen del Carrozado:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">País de Origen Chasis:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="foto1">Planos del Vehículo :</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							</div>
							</div>
                        </fieldset>
						<fieldset class="step">
                            
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Mark Apoyo:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                             <p>
                                <label for="campo1">Pauta Mantención de Carrozado</label>
                                <input id="campo1" name="campo1"  value="10-12-2012" DISABLED/>
                            </p>
                            <p>
                                <label for="campo1">Pauta Mantención de Chasis:</label>
                                <input id="campo1" name="campo1"  value="10-12-2012" DISABLED/>
                            </p>
							<p>
                                <label for="tipo">Condición:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                           <p>
                                <label for="tipo">Tipo de caja de cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Marca Caja de Cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">Modelo de caja de cambio:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							</div>
							</div>
							<div class="fields-column">
							<div class="fields-box">
                            <p>
                                <label for="tipo">Tipo de Combustible:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Marca Bomba:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">Modelo de Bomba:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
							<p>
                                <label for="tipo">País de Origen del Carrozado:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="tipo">País de Origen Chasis:</label>
                               <select id="tipo" name="tipo">
									<option>Seleccione una opción</option>
                                    <option>Opción 1</option>
                                    <option>Opción 2</option>
                                    <option>Opción 3</option>
                                </select>
                            </p>
                            <p>
                                <label for="foto1">Planos del Vehículo :</label>
                                
								 <input id="foto1" name="foto1"  type="file" size="14"align="right" />
                            </p>
							</div>
							</div>
                        </fieldset>
                    </form>
                </div>
				<div class="next-button-bar">
						<div class="recordatorio">Los campos marcados con * son obligatorios</div>
						<div class="next-button">
								<a href="#" id="registerButton"><img src="css/img/next-ok.png"/></a>
				</div>
				</div>
				</div>
                
            </div>
			<!-- Fin formulario -->	
		</div>
</div>
<div id="footer" height="100%">
	<div class="footer-container">
		<div class="footer-wrapper-end"></div>
		<div class="footer_logo"><a href="http://www.bomberos.cl"><img src="css/img/footer-logo.png"/></a></div>
		<div class="footer_text">© Bomberos de Chile | Todos los derechos reservados. </br>
Junta Nacional de Cuerpos de Bomberos de Chile, Av. Bustamante 86, Providencia - Santiago </br>
Fono: (52 - 2 ) 816 00 00</div>
	</div>
</div>
</body>
<style>