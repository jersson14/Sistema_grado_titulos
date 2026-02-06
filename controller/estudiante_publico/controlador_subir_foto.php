<?php
/**
 * Controlador: Subir foto tamaño pasaporte
 * Valida y guarda la foto del estudiante
 */

header('Content-Type: application/json');

try {
    $dni = isset($_POST['dni']) ? trim($_POST['dni']) : '';
    
    // Validar DNI
    if (empty($dni) || strlen($dni) != 8) {
        echo json_encode([
            'success' => false,
            'message' => 'DNI inválido'
        ]);
        exit;
    }
    
    // Verificar que se subió un archivo
    if (!isset($_FILES['foto']) || $_FILES['foto']['error'] !== UPLOAD_ERR_OK) {
        echo json_encode([
            'success' => false,
            'message' => 'No se recibió ninguna foto o hubo un error en la subida'
        ]);
        exit;
    }
    
    $archivo = $_FILES['foto'];
    $nombre_temporal = $archivo['tmp_name'];
    $nombre_original = $archivo['name'];
    $tamano = $archivo['size'];
    
    // Validar tamaño (máximo 2MB)
    $tamano_maximo = 2 * 1024 * 1024; // 2MB en bytes
    if ($tamano > $tamano_maximo) {
        echo json_encode([
            'success' => false,
            'message' => 'La foto no debe superar los 2MB'
        ]);
        exit;
    }
    
    // Validar que es una imagen real
    $info_imagen = getimagesize($nombre_temporal);
    if ($info_imagen === false) {
        echo json_encode([
            'success' => false,
            'message' => 'El archivo no es una imagen válida'
        ]);
        exit;
    }
    
    // Validar tipo MIME
    $tipos_permitidos = ['image/jpeg', 'image/jpg', 'image/png'];
    if (!in_array($info_imagen['mime'], $tipos_permitidos)) {
        echo json_encode([
            'success' => false,
            'message' => 'Solo se permiten imágenes JPG, JPEG o PNG'
        ]);
        exit;
    }
    
    // Obtener extensión
    $extension = strtolower(pathinfo($nombre_original, PATHINFO_EXTENSION));
    
    // Crear directorio si no existe
    $directorio = '../../uploads/fotos_pasaporte/';
    if (!file_exists($directorio)) {
        mkdir($directorio, 0755, true);
    }
    
    // Nombre del archivo: DNI_foto.ext
    $nombre_archivo = $dni . '_foto.' . $extension;
    $ruta_completa = $directorio . $nombre_archivo;
    $ruta_relativa = 'uploads/fotos_pasaporte/' . $nombre_archivo;
    
    // Eliminar foto anterior si existe
    if (file_exists($ruta_completa)) {
        unlink($ruta_completa);
    }
    
    // Mover archivo
    if (move_uploaded_file($nombre_temporal, $ruta_completa)) {
        echo json_encode([
            'success' => true,
            'ruta' => $ruta_relativa,
            'nombre_archivo' => $nombre_archivo,
            'message' => 'Foto subida correctamente'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Error al guardar la foto'
        ]);
    }
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}
?>
