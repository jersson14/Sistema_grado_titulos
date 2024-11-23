<?php
    require '../../model/model_diploma_bachiller.php';
    $MDB = new Modelo_Diplomas_Bachiller();//Instaciamos
    $consulta = $MDB->Listar_Diploma_Bachiller();
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
