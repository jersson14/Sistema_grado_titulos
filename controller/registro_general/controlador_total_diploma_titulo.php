<?php
    require '../../model/model_registro_general.php';

    $MRG = new Modelo_Registro_General();//Instaciamos
    $consulta = $MRG->listar_total_diplo_titulo();
    echo json_encode($consulta);

?>