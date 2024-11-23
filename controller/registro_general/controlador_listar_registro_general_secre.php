<?php
    require '../../model/model_registro_general.php';
    $MRG = new Modelo_Registro_General();//Instaciamos

    $sede = htmlspecialchars($_POST['sede'],ENT_QUOTES,'UTF-8');

    $consulta = $MRG->Listar_Registro_General_Secre($sede);
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
