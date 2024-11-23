<?php
    require '../../model/model_facultad.php';
    $MF = new Modelo_Facultad();//Instaciamos
    $consulta = $MF->Cargar_Autoridad();
    echo json_encode($consulta);
 
?>
