<?php
    require '../../model/model_carreras.php';
    $MCA = new Modelo_Carreras();//Instaciamos
    $consulta = $MCA->Listar_Carreras();
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
