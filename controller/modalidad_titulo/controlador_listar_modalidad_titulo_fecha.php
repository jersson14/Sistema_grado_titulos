<?php
    require '../../model/model_modalidad_titulo.php';
    $MMT = new Modelo_Modalidad_Titulo();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');

    $consulta = $MMT->Listar_Modalidad_Ti_Fecha_Area($fechainicio,$fechafin);
 
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData":[]
        }';
    }    
?>
