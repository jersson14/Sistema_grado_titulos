<?php
    require '../../model/model_facultad.php';
    $MF = new Modelo_Facultad();//Instaciamos
    $consulta = $MF->Listar_Facultad();
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
