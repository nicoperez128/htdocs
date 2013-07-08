<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
require('config/database.php');
require('config/bootstrap.php');
require('modelo/pgsql_conn.php');

// echo '<pre>';
// print_r($result);
// echo '</pre>';
// die;
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(__FILE__));
define('WEBROOT', ROOT . DS . 'webroot');
define('SERVER_NAME', $_SERVER['SERVER_NAME']);
define('WEBROOT_NAME', 'webroot');
define('PAGE_URL', curPageURL());
define('CONTROLADOR', PAGE_URL . '/controlador');
define('MODELO', PAGE_URL . '/modelo');
define('BASE', PAGE_URL.DS.WEBROOT_NAME.DS);
require WEBROOT . DS . 'index.php';
?>