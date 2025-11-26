<label for="nombre-usuario">nombre del usuario</label>
<input type="email" name="nombre-usuario" id="nombre-usuario">

<label for="contraseña">contraseña</label>
<input type="password" name="contraseña" id="contraseña">

<input type="submit" value="ingresar">


<?php
require_once 'componentes/conexion.php';

// Recuperar el ID del paquete desde la URL
$id_paquete = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id_paquete > 0) {

    // Consultar el paquete
    $paquete = $conexion->query("
        SELECT *
        FROM paquete
        WHERE id_paquete = $id_paquete 
        AND (estado = 'disponible' OR estado = 'proximamente')
    ")->fetch_assoc();

    if (!$paquete) {
        echo "<div class='alert alert-danger text-center mt-5'>Paquete no encontrado o no disponible.</div>";
        exit;
    }

    $fechaLimite = new DateTime($paquete['f_limite']);
    $fechaInicio = new DateTime($paquete['f_inicio']);
    $fechaFin = new DateTime($paquete['f_fin']);
    $hoy = new DateTime();

    $dias_restantes = $hoy->diff($fechaLimite)->format('%a');
    $dias_estadia = $fechaInicio->diff($fechaFin)->format('%a');
    $cupo_disponible = $paquete['cupo_total'] - $paquete['cupo_reservado'];

  
    $servicios = $conexion->query("
       SELECT *
       FROM servicio JOIN paquete_servicio ON servicio.id_servicio = paquete_servicio.id_paquete
       Where paquete_servicio.id_paquete = $id_paquete;
    ");
} else {
    echo "<div class='alert alert-danger mt-5 text-center'>ID de paquete inválido.</div>";
    exit;
}
?>