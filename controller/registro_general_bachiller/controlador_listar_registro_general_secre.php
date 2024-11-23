<?php
    require '../../model/model_registro_general_bachiller.php';
    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    $sede = htmlspecialchars($_POST['sede'],ENT_QUOTES,'UTF-8');

    $consulta = $MRGB->Listar_Registro_General_Secre($sede);
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
