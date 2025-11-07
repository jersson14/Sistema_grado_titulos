<?php
    require '../../model/model_registro_general.php';
    $MRG = new Modelo_Registro_General();//Instaciamos
    $consulta = $MRG->Listar_Auditoria_informe();
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
