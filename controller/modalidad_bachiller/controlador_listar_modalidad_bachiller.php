<?php
    require '../../model/model_modalidad_bachiller.php';
    $MMB = new Modelo_Modalidad_Bachiller();//Instaciamos
    $consulta = $MMB->Listar_Modalidad_Bachiller();
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
