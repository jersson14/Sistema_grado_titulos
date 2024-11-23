<?php
    require '../../model/model_registro_general_bachiller.php';
    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    $consulta = $MRGB->Cargar_Numerito();
    echo json_encode($consulta);
 
?>
