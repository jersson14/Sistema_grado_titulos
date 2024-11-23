<?php
    require '../../model/model_carreras.php';
    $MCA = new Modelo_Carreras();//Instaciamos
    $consulta = $MCA->Cargar_Facultades();
    echo json_encode($consulta);
 
?>
