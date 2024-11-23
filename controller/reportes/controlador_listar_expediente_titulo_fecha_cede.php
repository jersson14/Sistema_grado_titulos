<?php
    require '../../model/reportes.php';
    $MRE= new Modelo_Reportes();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');
    $cede = htmlspecialchars($_POST['cede'],ENT_QUOTES,'UTF-8');

    $consulta = $MRE->Listar_General_Pos_Fechas_cede($fechainicio,$fechafin,$cede);
 
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
