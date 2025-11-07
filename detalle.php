<?php

require_once 'componentes/conexion.php';

// --- Variables de PRUEBA (AJUSTA ESTO a tu lógica de sesión real) ---
$nombre_cliente_actual = "Usuario Invitado";
$id_cliente_actual = 999;
$id_paquete_actual = 1; // Usamos un ID fijo para esta página de detalles
$error_message = '';
?>
<!-- menu -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles</title>
    <link rel="stylesheet" href="detalle.css">
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
<!-- fin del menu -->
 <!-- carrucel -->
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
<!-- fin del carrucel -->
 
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

            <section id="comentarios" class="my-5 container">
                <h3 class="mb-4"><?php echo $total_comentarios; ?> Comentarios</h3>

                <?php if (!empty($error_message)): ?>
                    <div class="alert alert-danger"><?php echo $error_message; ?></div>
                <?php endif; ?>

                <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" class="d-flex mb-5">

                    <img src="https://via.placeholder.com/40/20a8d8/ffffff?text=<?php echo substr($nombre_cliente_actual, 0, 1); ?>"
                        class="rounded-circle avatar-sm me-3" alt="Tu Avatar" style="width: 40px; height: 40px;">

                    <div class="flex-grow-1">
                        <div class="mb-2">
                            <textarea class="form-control" placeholder="Añade un comentario público..." rows="1"
                                name="comment_text" id="comentario-input-form" required></textarea>

                            <input type="hidden" name="nombre_cliente"
                                value="<?php echo htmlspecialchars($nombre_cliente_actual); ?>">
                            <input type="hidden" name="id_cliente" value="<?php echo $id_cliente_actual; ?>">
                            <input type="hidden" name="video_id" value="<?php echo $video_id_actual; ?>">
                        </div>

                        <div class="d-flex justify-content-end collapse" id="comment-form-buttons">
                            <button class="btn btn-light btn-sm me-2" type="button"
                                onclick="document.getElementById('comentario-input-form').value=''; document.getElementById('comment-form-buttons').classList.remove('show');">
                                Cancelar
                            </button>
                            <button class="btn btn-primary btn-sm" type="submit" name="comentar">
                                Comentar
                            </button>
                        </div>
                    </div>
                </form>

                <script>
                    document.getElementById('comentario-input-form').addEventListener('focus', function () {
                        document.getElementById('comment-form-buttons').classList.add('show');
                    });
                </script>

                <?php if ($total_comentarios > 0): ?>
                    <?php foreach ($comentarios_array as $comentario): ?>
                        <div class="comment-item d-flex mb-4">
                            <img src="https://via.placeholder.com/40/f3f3f3/000000?text=<?php echo substr($comentario['cliente'], 0, 1); ?>"
                                class="rounded-circle avatar-sm me-3" alt="Avatar" style="width: 40px; height: 40px;">

                            <div class="flex-grow-1">
                                <div class="mb-1">
                                    <span class="fw-bold me-2"><?php echo htmlspecialchars($comentario['cliente']); ?></span>
                                    <small class="text-muted"><?php echo $comentario['fecha_comentario']; ?></small>
                                </div>
                                <p class="mb-2"><?php echo nl2br(htmlspecialchars($comentario['comentario'])); ?></p>

                                <div class="d-flex align-items-center">
                                    <button class="btn btn-sm text-muted p-0 me-3"><i class="bi bi-hand-thumbs-up"></i></button>
                                    <span class="text-muted small me-3">0</span>
                                    <button class="btn btn-sm text-muted p-0 me-3"><i
                                            class="bi bi-hand-thumbs-down"></i></button>
                                    <button class="btn btn-sm text-muted p-0 me-3 fw-bold">Responder</button>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <p class="text-muted text-center">Aún no hay comentarios. Sé el primero.</p>
                <?php endif; ?>

            </section>

            <?php
            // --- 2. PROCESAR DATOS DEL FORMULARIO ---
            // Usamos 'comentar' como name del botón submit
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['comentar'])) {

                // El formulario original tiene name="comment_text"
                $comentario_texto = $conexion->real_escape_string($_POST['comment_text']);

                if (!empty($comentario_texto)) {

                    // 3. CONSULTA SQL PARA INSERTAR EL COMENTARIO
                    // Usamos tus nombres de columna: cliente, id_cliente, comentario, fecha_comentario
                    // Agrego 'video_id' si existe en tu tabla; si no, quítalo de la consulta.
                    $sql_insert = "INSERT INTO comentarios (cliente, id_cliente, comentario, fecha_comentario, id_paquete)
            VALUES ('$nombre_cliente_actual', '$id_cliente_actual', '$comentario_texto', NOW(), '$id_paquete_actual')";

                    if ($conexion->query($sql_insert) === TRUE) {
                        // Éxito: Redirigir para evitar reenvío del formulario (PRG pattern)
                        header("Location: " . $_SERVER['PHP_SELF']);
                        exit();
                    } else {
                        $error_message = "Error al guardar el comentario: " . $conexion->error;
                    }
                }
            }

            // --- 4. OBTENER COMENTARIOS PARA MOSTRAR ---
            $comentarios_array = [];
            $total_comentarios = 0;

            // Seleccionamos los campos necesarios y filtramos por video_id (si aplica)
            $sql_select = "SELECT cliente, comentario, fecha_comentario FROM comentarios WHERE video_id =
            '$id_paquete_actual' ORDER BY fecha_comentario DESC";
            $resultado = $conexion->query($sql_select);

            if ($resultado->num_rows > 0) {
                $total_comentarios = $resultado->num_rows;
                while ($fila = $resultado->fetch_assoc()) {
                    $comentarios_array[] = $fila;
                }
            }
            ?>
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"></script>
    </body>

</html>