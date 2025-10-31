<?php
$servidor = "localhost";
$usuario = "root";
$contraseña = "";
$base = "EMPRESAviajes";

// conexión con la base de datos
$conexion = new mysqli($servidor, $usuario, $contraseña, $base);

// verificar conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
?>
