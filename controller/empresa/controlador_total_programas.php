<?php
    require '../../model/model_empresa.php';

    $ME = new Modelo_Empresa();//Instaciamos
    $consulta = $ME->listar_total_progra();
    echo json_encode($consulta);

?>