<?php
require '../../model/model_registro_general.php';
$MRG = new Modelo_Registro_General(); // Instanciamos
    $consulta = $MRG->Cargar_Colacion();
    echo json_encode($consulta);
 
?>
