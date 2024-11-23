<?php
    require '../../model/model_diploma_titulo.php';
    $MDT = new Modelo_Diplomas_Titulo();//Instaciamos
    $consulta = $MDT->Listar_Diploma_Titulo();
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
