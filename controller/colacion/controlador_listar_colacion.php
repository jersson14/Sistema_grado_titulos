<?php
    require '../../model/model_colacion.php';
    $MCO = new Modelo_Colacion();//Instaciamos
    $consulta = $MCO->Listar_Colaciones();
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData": []
        }';
    }
?>
