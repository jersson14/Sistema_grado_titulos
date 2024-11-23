<?php
    require '../../model/model_registro_general.php';

    $MRG = new Modelo_Registro_General();//Instaciamos
    $consulta = $MRG->Traernumero();
    echo json_encode($consulta);
   
?>