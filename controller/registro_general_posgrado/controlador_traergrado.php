<?php
require '../../model/model_registro_general_posgrado.php';

// Verificar si el parámetro 'id' existe en la solicitud POST
if (isset($_POST['id']) && !empty($_POST['id'])) {
    $MRGPG = new Modelo_Registro_General_Posgrado(); // Instanciamos la clase

    // Sanitizar la entrada
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');

    // Ejecutar la consulta
    $consulta = $MRGPG->TraerGrado($id);

    // Enviar la respuesta en formato JSON
    echo json_encode($consulta);
} else {
    // Manejo de errores si no se envía el parámetro 'id'
    echo json_encode(['error' => 'El parámetro id es obligatorio.']);
}
?>
