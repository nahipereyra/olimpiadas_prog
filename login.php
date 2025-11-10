<?php
require_once 'componentes/conexion.php';
    if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ingresar'])){
        $errores = '';
        $correo = $conexion->real_escape_string($_POST['nombre-usuario']);
        $contraseña = $conexion->real_escape_string($_POST['contraseña']);

    if(empty($correo) || empty($contraseña)){
        $errores .= ">div class='alert alert-danger'>por favor, completa todos los campos</div>";

    }else{
        $frase = $conexion->prepare("SELECT * FROM clientes WHERE clientes.correo = ?");
        $frase-> bind_param('s',$correo);
        $frase-> execute();

        $usuario= $frase->get_result()->fetch_assoc();

        if(usuario){
            if(password_verify($contraseña, $usuario['contraseña'])){
                session_start();
                $_SESSION['userid'] = $ususario['id_usuario'];
                $_SESSION['nombre'] = $usuario['nombre'];
                $_SESSION['rol'] = $usuario['rol'];

                $conexion->close();

                header('location:index.php');
                exit;

            } else{
                $errores .= "<div class='alert alert-dqanger'>contraseña incorrecta</div>"
                
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <title>ajgencia de viajes-login</title>
</head>
<body>
    <form method="POST" action="login.php">
        <label for="nombre-usuario">nombre del usuario</label>
        <input type="email" name="nombre-usuario" id="nombre-usuario">

        <label for="contraseña">contraseña</label>
        <input type="password" name="contraseña" id="contraseña">

        <input type="sumit" value="ingresar" >

    </form>
</body>
</html>