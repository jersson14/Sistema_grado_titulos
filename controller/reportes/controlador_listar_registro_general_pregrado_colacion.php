<?php
    require '../../model/reportes.php';
    $MRE= new Modelo_Reportes();//Instaciamos
    $fechacol = htmlspecialchars($_POST['fechacol'],ENT_QUOTES,'UTF-8');

    $consulta = $MRE->Listar_General_Pre_colacion($fechacol);
 
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
