<?php
    require '../../model/model_registro_general_posgrado.php';
    $MUO = new Modelo_Registro_General_Posgrado();
    $consulta = $MUO->Cargar_Select_Colacion();
    echo json_encode($consulta);
?>
