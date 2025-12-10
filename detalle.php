<?php
session_start();
require_once 'componentes/conexion.php';
$paquetes = $conexion->query("SELECT * FROM PAQUETEVIAJE");
$id_paquete = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id_paquete != null && $id_paquete >0) {
    $paquete = $conexion->query("
        SELECT *
        FROM PAQUETEVIAJE
        WHERE id_paqueteviaje = $id_paquete 
        AND estado = '1';
    ")->fetch_assoc();
}if (!$paquete){
    echo "<div class='alert alert-dqanger'>paqute no encotrado o no disponible</div>";
    exit;
} else {
    $servicios = $conexion -> query("
    SELECT * FROM SERVICIOS JOIN PAQUETE_SERVICIO ON SERVICIOS.id_servicio = PAQUETE_SERVICIO.id_servicio WHERE PAQUETE_SERVICIO.id_paqueteviaje = $id_paquete;"
    );
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles</title>
    <link rel="stylesheet" href="css/detalle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .avatar-sm {
            width: 40px;
            height: 40px;
            object-fit: cover;
        }
    </style>
</head>

<body class="d-flex flex-column h-100">
        <header>
            <div class="content">
                <div class="menu container">
                    <a href="index.html" class="logo">logo</a>
                    <input type="checkbox" id="menu" />
                    <label for="menu">
                        <img src="imagenes/imag.png" class="menu-icono" alt="">
                    </label>
                    <nav class="navbar">
                        <ul>
                            <li><a href="index.php">inicio</a></li>
                            <li><a href="servicios.php">servicios</a></li>
                            <li><a href="ofertas.php">ofertas</a></li>
                            <li><a href="categorias.php">categorias</a></li>
                            <li><a href="redes.php">REDES SOCIALES</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="imagenes/paisa.jpeg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="imagenes/paisaje.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="imagenes/paisa.jpeg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="card">
                <div class="card-body">
                   <?= $paquete['ur_caracterización']?>
                   <br>
                   <br>  el servicio que ofrece este paquete es (<?= $paquete['id_servicio']?>)
                                la fecha de salida es (<?= $paquete['fecha_inicio']?>) y la fecha de retorno es (<?= $paquete['fecha_fin']?>).
                </div>

            </div>
            <div class="boton">
                                <div class="card-footer bg-transparent border-0 mt-3">
                                    <a href="registro.php?id=<?= $paquete['id_paqueteviaje'] ?>"
                                        class="btn btn-success w-100 fw-bold rounded-pill">
                                        ¡REGISTRATE Y COMPRA YA!
                                    </a>
                                </div>
                            </div>
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"></script>
</body>
</html>