<?php
    require '../../model/model_modalidad_titulo.php';
    $MMT = new Modelo_Modalidad_Titulo();//Instaciamos
    $consulta = $MMT->Listar_Modalidad_Titulo_todo();
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
