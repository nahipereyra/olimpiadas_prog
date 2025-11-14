<?php
require_once 'componentes/conexion.php';
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

<body>

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
                        <img src="<?= $paquete['ur_imagen'] ?>" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="paisaje.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="paisa.jpeg" class="d-block w-100" alt="...">
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
                    descripcion del paquete.
                </div>
            </div>

            <div class="caja">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                servicios del paquete
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                el servicio de transporte que te ofrece este paquete es () tambien incluye esta estadia
                                ()
                                la fecha de salida es () y la fecha de retorno es ().
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                categorias disponibles
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                este paquete incluye estas categorias de viaje () no hay cambios en las categorias. Solo
                                la
                                que ve disponible.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                pagos disponibles
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                            data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                el metodo de pago que puede utilazar es () solo estan disponibles estos metodos. El
                                valor
                                individual por persona, mas el costo adicional por los servicios es de ()
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="my-4">
            
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"></script>
    </body>

</html>