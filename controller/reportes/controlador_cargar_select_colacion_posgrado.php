<?php
    require '../../model/reportes.php';
    $MRE = new Modelo_Reportes();
    $consulta = $MRE->Cargar_Select_Colacion_Posgrado();
    echo json_encode($consulta);
?>
