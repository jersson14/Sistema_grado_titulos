<?php
    require '../../model/model_expedientes.php';
    $MEB = new Modelo_Expedientes();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');

    $consulta = $MEB->Listar_Expediente_Ba_Fecha_Area($fechainicio,$fechafin);
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
