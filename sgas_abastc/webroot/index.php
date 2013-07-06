<?php 
if(empty($_SESSION['usuario'])) {
	session_start();
	include 'controlador/login.php';
} 
if(!empty($_GET['u']) && $_GET['u'] == 'logout') {
	session_destroy();
	header('Location: ' . PAGE_URL);
}
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Bomberos.cl</title>
	<base href="<?php echo BASE?>">
	<link href="css/smoothness/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css" />
	<link href="css/smoothness/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css" />
	<link href="css/style-bombero.css" rel="stylesheet" type="text/css" />
	<link href="css/alert.css" rel="stylesheet" type="text/css" />
	<link href="css/style2.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
	<link href="css/demo_table_jui.css" rel="stylesheet" type="text/css" />
	<!-- <link href="css/demo_table.css" rel="stylesheet" type="text/css" /> -->
	<link href="css/demo_page.css" rel="stylesheet" type="text/css" />
	<link href="css/tabla.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/style-form.css" type="text/css" media="screen"/>
	<!-- Scripts Tabs -->
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="js/sliding.form.js"></script>
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-datepicker-es.js"></script>
	<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="js/messages_es.js"></script>
	<script type="text/javascript" src="js/jquery.rut.min.js"></script>
	<script type="text/javascript" src="js/rut.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
</head>
<body>
<div id="wrapper">
		<div id="header">
				<div id="header-title">Sistema de Gestión de Actos de Servicio</div>
		</div>
		<?php if(isset($_SESSION['usuario'])){ ?>
		<div class="nav_container">
							<div id="nav">
								<div class="catnav">
								  <ul class="catnav">
									<li><a href="<?php echo PAGE_URL;?>" class="active">Acto de Servicio</a>
											<ul>
													<li><a href="<?php echo PAGE_URL;?>?u=nuevo_acto" title="">Nuevo Acto de servicio</a></li>
													<li><a href="<?php echo PAGE_URL;?>?u=lista_actas" title="">Listar actos de servicio</a></li>
											 </ul>
									</li>
									<li><a href="<?php echo PAGE_URL;?>" class="active">Mantenedores</a>
										<ul>
											<li><a href="<?php echo PAGE_URL;?>?u=mantenedor&m=tipo_lugar" title="">Ver Listado de Mantenedores</a></li>
										</ul>
									</li>
								  </ul>
								</div>
							</div>
							
		</div>
		<div id="container">
    <a id="fancy-mensaje-exito" href="#" class="submit" style="display: none">Fancy Exito</a>
    <a id="fancy-mensaje-error" href="#" class="submit" style="display: none">Fancy error</a>
    <a id="fancy-mensaje-error-campos" href="#" class="submit" style="display: none">Fancy error Campos</a>
    
				<div id="where-who">
						<div class="where"><div class="clock">3/6/2013 1:13:51</div></div>
				<script type="text/javascript">

				function updateClock() {
					var currentdate = new Date();
					var hour = currentdate.getHours();
					if(hour < 10) {
						hour = '0' + hour;
					}
					var minutes = currentdate.getMinutes();
					if(minutes < 10) {
						minutes = '0' + minutes;
					}
					var seconds = currentdate.getSeconds();
					if(seconds < 10) {
						seconds = '0' + seconds;
					}
					var datetime =	"[" + currentdate.getDate() + "/"
									+ (currentdate.getMonth()+1)  + "/" 
									+ currentdate.getFullYear() + "] - "  
									+ hour + ":"  
									+ minutes + ":" 
									+ seconds;
					$('.clock').html(datetime);
				}
				updateClock(); 
				setInterval('updateClock()', 1000 );
				</script>			
						<div class="who">
								<div class="cerrar-sesion"><a href="<?php echo PAGE_URL;?>?u=logout">Cerrar Sesión</a></div>
								<div class="who-user"><?php echo ucwords(strtolower($_SESSION['user_data']['nombre'] . ' ' . $_SESSION['user_data']['apellidos']))?></div>
								<div class="who-icon"></div>
						</div>						
				</div>
						<!-- <div class="where">Dar de Alta</div><div class="where-forward">>></div><div class="where">Alta de Vehículo (Compra)</div> -->
				<?php 
					if(!empty($_GET['u'])) {
						switch ($_GET['u']) {
							case 'mantenedor':
								include 'vista/'.$_GET['u'].'.php';
								break;

							case 'nuevo_acto':
								include 'controlador/acta_servicio.php';
								include 'vista/acta_servicio.php';
								include 'js/acta_servicio.php';
								break;

							case 'lista_actas':
								include 'vista/lista_actas.php';
								break;
							
							default:
								break;
						}
					}
				} else {
					include 'vista/login.php';
				}
				?>
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
<script>
$(document).ready(function() {

});
</script>
