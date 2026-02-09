<?php
/**
 * Controlador: Buscar estudiante por DNI
 * Retorna datos del estudiante si existe en la BD
 */

header('Content-Type: application/json');
require '../../model/model_estudiante_publico.php';

try {
    $dni = isset($_POST['dni']) ? trim($_POST['dni']) : '';
    $nivel = isset($_POST['nivel']) ? $_POST['nivel'] : 'PREGRADO';
    
    // Validar DNI
    if (empty($dni)) {
        echo json_encode([
            'success' => false,
            'message' => 'DNI es requerido'
        ]);
        exit;
    }
    
    if (strlen($dni) != 8 || !is_numeric($dni)) {
        echo json_encode([
            'success' => false,
            'message' => 'DNI debe tener 8 dígitos numéricos'
        ]);
        exit;
    }
    
    $modelo = new Modelo_Estudiante_Publico();
    
    // Buscar estudiante
    $estudiante = $modelo->Buscar_Estudiante_Por_DNI($dni, $nivel);
    
    if ($estudiante) {
        // Verificar si puede actualizar
        $puede_actualizar = $modelo->Puede_Actualizar($dni);
        
        // Verificar si puede editar declaración étnica
        $puede_editar_var_etnica = $modelo->Puede_Editar_Var_Etnica($dni);
        
        echo json_encode([
            'success' => true,
            'existe' => true,
            'puede_actualizar' => $puede_actualizar,
            'puede_editar_var_etnica' => $puede_editar_var_etnica,
            'datos' => $estudiante,
            'message' => $puede_actualizar 
                ? 'Estudiante encontrado. Puede actualizar sus datos.' 
                : 'Estudiante encontrado pero ya tiene diploma registrado. No puede modificar datos.',
            'message_var_etnica' => $puede_editar_var_etnica
                ? 'Puede editar su declaración étnica.'
                : 'Ya llenó su declaración étnica. Si necesita modificarla, contacte al administrador.'
        ]);
    } else {
        echo json_encode([
            'success' => true,
            'existe' => false,
            'message' => 'DNI no encontrado. Procederá a consultar RENIEC.'
        ]);
    }
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error al buscar estudiante: ' . $e->getMessage()
    ]);
}
?>
