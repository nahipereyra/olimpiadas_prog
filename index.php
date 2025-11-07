<?php
require_once 'componentes/conexion.php';
$paquetes = $conexion->query("SELECT * FROM EMPRESAviajes.PAQUETEVIAJE");
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú de Viajes</title>
    <link rel="stylesheet" href="index.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
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
    </header>

    <div class="demas">
        <main class="flex-shrink-0 container my-4">

            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <?php
                foreach ($paquetes as $paquete) {
                    ?>
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <div class="card-title text-center p-3">
                                <h3><?= $paquete['titulo_lugar'] ?></h3>
                            </div>
                            <div class="card-body">
                                <img class="card-img-top mb-3" src="<?= $paquete['ur_imagen'] ?>"
                                    alt="Imagen del paquete a <?= $paquete['titulo_lugar'] ?>">
                                <p class="card-text">
                                    Salida: <?= $paquete['fecha_inicio'] ?><br>
                                    Regreso: <?= $paquete['fecha_fin'] ?><br>
                                    limite: <?= $paquete['fecha_limite'] ?><br>
                                    precio:
                                </p>
                            </div>

                            <div class="boton">
                                <div class="card-footer bg-transparent border-0 mt-3">
                                    <a href="detalle.php?id=<?= $paquete['id_paquete'] ?>"
                                        class="btn btn-success w-100 fw-bold rounded-pill">
                                        ¡RESERVA AHORA!
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                }
                ?>
            </div>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
</body>

</html>