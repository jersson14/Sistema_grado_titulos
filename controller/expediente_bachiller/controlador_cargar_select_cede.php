<?php
    require '../../model/model_expedientes.php';
    $MEB = new Modelo_Expedientes();//Instaciamos
    $consulta = $MEB->Cargar_Cedes();
    echo json_encode($consulta);
 
?>
