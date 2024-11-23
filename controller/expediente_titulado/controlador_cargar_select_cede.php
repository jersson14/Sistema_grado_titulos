<?php
    require '../../model/model_expedientes_titulado.php';
    $MET = new Modelo_Expedientes_Titulado();//Instaciamos
    $consulta = $MET->Cargar_Cedes();
    echo json_encode($consulta);
 
?>
