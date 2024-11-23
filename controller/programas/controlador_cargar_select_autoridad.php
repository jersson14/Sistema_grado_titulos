<?php
    require '../../model/model_programas.php';
    $MPR = new Modelo_Programas();//Instaciamos
    $consulta = $MPR->Cargar_Autoridad_pos();
    echo json_encode($consulta);
 
?>
