<?php
    require '../../model/model_autoridad.php';
    $MAU = new Modelo_Autoridad();//Instaciamos
    $consulta = $MAU->Listar_Autoridad();
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
