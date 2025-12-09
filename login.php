<?php
// 1. INCLUIR LA CONEXIÓN PRIMERO
require_once 'componentes/conexion.php'; 

// 2. INICIAR LA SESIÓN
session_start(); 

// 3. INCLUIR COMPONENTE
require_once 'componentes/componente-formulario.php';

// Eliminamos la consulta innecesaria a PAQUETEVIAJE

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['ingresar'])){
    $errores = '';
    
    // CORRECCIÓN: Usamos 'correo' del formulario
    $correo = trim($_POST['correo'] ?? ''); 
    $contraseña = $_POST['contraseña'] ?? ''; 

    if(empty($correo) || empty($contraseña)){
        // Corregido el nombre de la clase de alerta
        $errores .= "<div class='alert alert-danger'>Por favor, completa todos los campos.</div>";
    } else{
        // Sentencia Preparada para seguridad y eficiencia
        // CORRECCIÓN: Usamos 'correo' como nombre de columna (asumiendo ese es el nombre correcto)
        $frase = $conexion->prepare("SELECT id_usuario, nombre, contraseña, rol FROM usuarios WHERE correo = ?"); // ¡Añadir el ; aquí!
        $frase->bind_param('s', $correo);
        $frase->execute();
        $usuario = $frase->get_result()->fetch_assoc();
        $frase->close();

        if($usuario){
            if(password_verify($contraseña, $usuario['contraseña'])){
                // CORRECCIÓN: Usar $usuario en lugar de $ususario
                $_SESSION['userid'] = $usuario['id_usuario'];
                $_SESSION['nombre'] = $usuario['nombre'];
                $_SESSION['rol'] = $usuario['rol'];

                $conexion->close();

                // CORRECCIÓN: Usar sintaxis correcta para header
                header('Location: index.php');
                exit;
            } else{
                $errores .= "<div class='alert alert-danger'>Contraseña incorrecta.</div>";
            }
        } else {
             $errores .= "<div class='alert alert-danger'>Usuario no encontrado.</div>";
        }
    }
}

if (!empty($errores)) {
    echo $errores;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <title>Agencia de Viajes - Login</title>
</head>
<body>
    <form method="POST" action="login.php">
        <?php require_once 'componentes/componente-formulario.php'?>
    </form>
    <div>
        <p>
            ¿No tienes un usuario? Regístrate: <a href="registro.php">aquí</a>
        </p>
    </div>
</body>
</html>