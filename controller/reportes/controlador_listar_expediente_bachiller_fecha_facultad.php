<?php
    require '../../model/reportes.php';
    $MRE= new Modelo_Reportes();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');
    $facu = htmlspecialchars($_POST['facu'],ENT_QUOTES,'UTF-8');

    $consulta = $MRE->Listar_General_Pos_Fechas_facu_bachi($fechainicio,$fechafin,$facu);
 
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
