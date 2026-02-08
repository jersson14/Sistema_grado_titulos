<?php
session_start();
require '../../model/model_estudiantes.php';

$MES = new Modelo_Estudiantes();

// Recibir datos del formulario
$dni = $_POST['dni'];
$codigo = $_POST['codigo'];
$nom = $_POST['nombres'];
$apepa = $_POST['apepa'];
$apema = $_POST['apema'];
$sexo = $_POST['sexo'];
$movil = $_POST['celular'];
$dire = $_POST['direc'];
$fecha_matr = $_POST['fecha_matr'];
$fecha_egre = $_POST['fecha_egre'];
$id_usuario = $_POST['id_usuario'];

// Variable para la ruta de la foto
$ruta_foto = null;

// ⭐ PROCESAR FOTO SI SE SUBIÓ UNA
if(isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK){
    $foto = $_FILES['foto'];
    $nombre_original = $foto['name'];
    $extension = strtolower(pathinfo($nombre_original, PATHINFO_EXTENSION));
    
    // Validar extensión
    $extensiones_permitidas = ['jpg', 'jpeg', 'png'];
    if(in_array($extension, $extensiones_permitidas)){
        // Crear nombre único para la foto
        $nombre_nuevo = 'estudiante_' . $dni . '_' . time() . '.' . $extension;
        $ruta_destino = '../../imagenes/fotos_estudiantes/' . $nombre_nuevo;
        
        // Crear directorio si no existe
        if(!file_exists('../../imagenes/fotos_estudiantes')){
            mkdir('../../imagenes/fotos_estudiantes', 0777, true);
        }
        
        // Mover archivo
        if(move_uploaded_file($foto['tmp_name'], $ruta_destino)){
            $ruta_foto = 'imagenes/fotos_estudiantes/' . $nombre_nuevo;
        }
    }
}

// Llamar al modelo
try {
    $consulta = $MES->Modificar_Estudiantes(
        $dni, 
        $codigo, 
        $nom, 
        $apepa, 
        $apema, 
        $sexo, 
        $movil, 
        $dire, 
        $fecha_matr, 
        $fecha_egre, 
        $id_usuario,
        $ruta_foto
    );
    
    // Si la consulta devuelve algo, es exitosa
    if($consulta){
        echo $consulta;
    } else {
        // Si devuelve 0 o null, hay un error
        echo "0";
    }
} catch (Exception $e) {
    // Capturar cualquier error y devolver 0
    error_log("Error en modificar estudiante: " . $e->getMessage());
    echo "0";
}
?>