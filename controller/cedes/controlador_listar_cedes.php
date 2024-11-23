<?php
    require '../../model/model_cedes.php';
    $MCE = new Modelo_Cede();//Instaciamos
    $consulta = $MCE->Listar_Cede();
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
