<?php
    require '../../model/model_registro_general.php';
    $MRG = new Modelo_Registro_General();//Instaciamos
    $fechacol = htmlspecialchars($_POST['fechacol'],ENT_QUOTES,'UTF-8');

    $consulta = $MRG->Listar_General_Ti_Colacion($fechacol);
 
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
