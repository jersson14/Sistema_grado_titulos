<?php
    require '../../model/model_estudiantes_posgrado.php';
    $MESP = new Modelo_Estudiantes_Posgrado();

    $dni = strtoupper(htmlspecialchars($_POST['dni'], ENT_QUOTES, 'UTF-8'));
    $codigo = strtoupper(htmlspecialchars($_POST['codigo'], ENT_QUOTES, 'UTF-8'));
    $nombres = strtoupper(htmlspecialchars($_POST['nombres'], ENT_QUOTES, 'UTF-8'));
    $apepa = strtoupper(htmlspecialchars($_POST['apepa'], ENT_QUOTES, 'UTF-8'));
    $apema = strtoupper(htmlspecialchars($_POST['apema'], ENT_QUOTES, 'UTF-8'));
    $sexo = strtoupper(htmlspecialchars($_POST['sexo'], ENT_QUOTES, 'UTF-8'));
    $celular = strtoupper(htmlspecialchars($_POST['celular'], ENT_QUOTES, 'UTF-8'));
    $direc = htmlspecialchars($_POST['direc'] ?? '', ENT_QUOTES, 'UTF-8');
    $fecha_matr = $_POST['fecha_matr'] ?? null;
    $fecha_egre = $_POST['fecha_egre'] ?? null;
    $id_usuario = strtoupper(htmlspecialchars($_POST['id_usuario'], ENT_QUOTES, 'UTF-8'));

    // Si las fechas vienen vacías, pasarlas como NULL
    if (empty($fecha_matr)) $fecha_matr = null;
    if (empty($fecha_egre)) $fecha_egre = null;
    if (empty($direc)) $direc = null;

    // Manejo de la foto
    $ruta_foto = "";
    if (isset($_FILES['foto'])) {
        $nombre_archivo = $_FILES['foto']['name'];
        $tmp_archivo = $_FILES['foto']['tmp_name'];
        
        $extension = pathinfo($nombre_archivo, PATHINFO_EXTENSION);
        $nuevo_nombre = "FOTO_" . $dni . "_" . time() . "." . $extension;
        $ruta_destino = "foto/" . $nuevo_nombre;
        
        if (!file_exists("foto")) {
            mkdir("foto", 0777, true);
        }
        
        if (move_uploaded_file($tmp_archivo, $ruta_destino)) {
            $ruta_foto = "controller/estudiantes_posgrado/foto/" . $nuevo_nombre;
        }
    }

    $consulta = $MESP->Modificar_Estudiantes_Pos($dni, $codigo, $nombres, $apepa, $apema, $sexo, $celular, $direc, $fecha_matr, $fecha_egre, $id_usuario, $ruta_foto);
    echo $consulta;
?>