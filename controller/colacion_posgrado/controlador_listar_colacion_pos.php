<?php
    require '../../model/model_colacion_pos.php';
    $MCOP = new Modelo_Colacion_Pos();//Instaciamos
    $consulta = $MCOP->Listar_Colaciones_Pos();
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
