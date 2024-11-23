<?php
    require '../../model/reportes.php';
    $MRE= new Modelo_Reportes();//Instaciamos
    $consulta = $MRE->Cargar_Escuelas();
    echo json_encode($consulta);
 
?>
