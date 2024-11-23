<?php
    require '../../model/reportes.php';
    $MRE= new Modelo_Reportes();//Instaciamos
    $consulta = $MRE->Cargar_Escuela_bach();
    echo json_encode($consulta);
 
?>
