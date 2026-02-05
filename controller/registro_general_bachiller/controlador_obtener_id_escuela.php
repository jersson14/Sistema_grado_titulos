<?php
    require '../../model/model_registro_general_bachiller.php';
    
    // Log para debugging
    error_log("Controlador obtener_id_escuela - POST data: " . print_r($_POST, true));
    
    $id_expediente = isset($_POST['id_expediente']) ? $_POST['id_expediente'] : '';
    
    if(empty($id_expediente)){
        error_log("Controlador obtener_id_escuela - ERROR: ID de expediente vacío");
        echo json_encode(array('success' => false, 'message' => 'ID de expediente no proporcionado'));
        exit;
    }
    
    $MRGB = new Modelo_Registro_General_Bachiller();
    $resultado = $MRGB->Obtener_Id_Escuela_Por_Expediente($id_expediente);
    
    error_log("Controlador obtener_id_escuela - Resultado: " . $resultado);
    
    if($resultado){
        echo json_encode(array('success' => true, 'Id_escuela' => $resultado));
    } else {
        echo json_encode(array('success' => false, 'message' => 'No se encontró la escuela'));
    }
?>
