<?php
    require '../../model/model_expedientes.php';
    $MEB = new Modelo_Expedientes();//Instaciamos
    $consulta = $MEB->Listar_Expedientes_Bachiller2();
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
