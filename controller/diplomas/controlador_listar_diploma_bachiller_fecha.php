<?php
    require '../../model/model_diploma_bachiller.php';
    $MDB = new Modelo_Diplomas_Bachiller();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');

    $consulta = $MDB->Listar_Diploma_Bachiller_fechas($fechainicio,$fechafin);
 
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
