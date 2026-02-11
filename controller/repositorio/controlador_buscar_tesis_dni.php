<?php
require '../../model/model_repositorio_dspace.php';

// Obtener DNI del POST
$dni = $_POST['dni'] ?? '';

// Validar que se proporcionó un DNI
if (empty($dni)) {
    echo json_encode([
        'success' => false, 
        'message' => 'DNI no proporcionado'
    ]);
    exit;
}

// Crear instancia del modelo
$modelo = new Modelo_Repositorio_DSpace();

// Buscar tesis por DNI
$resultado = $modelo->obtenerTesisPorDni($dni);

// Retornar resultado
if ($resultado) {
    echo json_encode([
        'success' => true,
        'data' => $resultado
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'No se encontró tesis para este DNI en el repositorio'
    ]);
}
?>
