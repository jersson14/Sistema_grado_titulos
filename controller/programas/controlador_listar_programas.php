<?php
    require '../../model/model_programas.php';
    $MPR = new Modelo_Programas();//Instaciamos
    $consulta = $MPR->Listar_Programas();
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
