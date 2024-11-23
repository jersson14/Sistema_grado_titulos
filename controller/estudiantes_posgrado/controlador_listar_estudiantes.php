<?php
    require '../../model/model_estudiantes_posgrado.php';
    $MESP = new Modelo_Estudiantes_Posgrado();//Instaciamos
    $consulta = $MESP->Listar_Estudiantes_Posg();
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
