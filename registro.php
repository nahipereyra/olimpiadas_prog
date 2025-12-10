<?php
require_once 'componentes/conexion.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ingresar'])) {
    $errores = '';
    $correo = $conexion->real_escape_string($_POST['nombre-usuario']);
    $contraseña = $conexion->real_escape_string($_POST['contraseña']);
    $nombre = $conexion->real_escape_string($_POST['nombre']);

    if (empty($correo) || empty($contraseña)) {
        $errores .= ">div class='alert alert-danger'>por favor, completa todos los campos</div>";

    } else {
        $query = $conexion->prepare('SELECT * FROM USUARIOS WHERE correo=?');
        $query->bind_param('s', $correo);
        $query->execute();
    }
    if ($query->get_result()->num_rows > 0) {
        $errores .= "<div class='alert alert-danger'>el correo ya esta registrado</div>";
    }
    if (empty($errores)) {
        $contra_hash = password_hash($contraseña, PASSWORD_BCRYPT);
        $query = $conexion->prepare('INSERT INTO USUARIOS (nombre, correo,contraseña) VALUES (?,?,?)');
        $query->bind_param('sss', $nombre, $correo, $contra_hash);
        $sentencia = $query->execute();
        $query->close();
        $conexion->close();
    }
    if ($sentencia) {
        $success = "<div class='alert alert-success'>registro existoso.puedes inicar sesion</div>";
        header('Location:index.php');
    } else {
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
        <label for="correo">Nombre:</label>
        <input type="text" name="nombre" id="nombre">
        
        <?php require_once 'componentes/componente-formulario.php' ?>
    </form>

</body>

</html>