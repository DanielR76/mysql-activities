<?php

//llamado de clases

require'class/config.php';
require'class/users.php';

$objcon = new Conexion();
$objcon->conectar();

$objuser = new Usuarios();
$objuser->login_in();






?>