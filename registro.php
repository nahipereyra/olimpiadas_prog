<?php
require_once 'componentes/conexion.php';
if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ingresar'])){
     $errores = '';
        $correo = $conexion->real_escape_string($_POST['nombre-usuario']);
        $contraseña = $conexion->real_escape_string($_POST['contraseña']);

    if(empty($correo) || empty($contraseña)){
        $errores .= ">div class='alert alert-danger'>por favor, completa todos los campos</div>";

    }else{
        $query = $conexion->prepare('SELECT * FROM usuarios WHERE email=?');
        $query->bind_param('s', $correo);
        $query->execute();
    }if($query->get_result()->num_rows > 0){
        $errores .="<div class='alert alert-danger'>el correo ya esta registrado</div>";
    }
    if(empty($errores)){
        $contra_hash = password_hash($contraseña, PASSWORD_BCRYPT);
        $query = $conexion->prepare('INSERT INTO usuarios (correo,contraseña)VALUES(?,?)');
        $query->bind_param('ss', $correo, $contra_hash);
        $sentencia = $query->execute();
        $query->close();
        $conexion->close();
    }
    if($sentencia){
        $success = "<div class='alert alert-success'>registro existoso.puedes inicar sesion</div>";
        header('location:index.php');
    }else{
        $errores = "<div class='alert alert-danger'>hubo un error. intentalo mas tarde</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
</head>
<body>
    <form method="POST" action="registro.php">
        <?php require_once 'componentes/componente-formulario.php'?>
    </form>

</body>
</html>