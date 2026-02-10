<?php
    require '../../model/model_registro_general_posgrado.php';
    $MUO = new Modelo_Registro_General_Posgrado();
    $fechacol = htmlspecialchars($_POST['fechacol'], ENT_QUOTES, 'UTF-8');
    $consulta = $MUO->Listar_General_Pos_colacion($fechacol);
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
