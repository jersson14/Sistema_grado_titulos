<?php
    require '../../model/model_expedientes_titulado.php';
    $MET = new Modelo_Expedientes_Titulado();//Instaciamos
    $consulta = $MET->Listar_Expedientes_Titulado2();
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
