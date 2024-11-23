<?php
    require '../../model/model_estudiantes.php';
    $MES = new Modelo_Estudiantes();//Instaciamos
    $consulta = $MES->Listar_Estudiantes();
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
