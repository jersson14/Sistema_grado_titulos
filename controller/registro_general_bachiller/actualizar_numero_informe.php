<?php
    require '../../model/model_registro_general_bachiller.php';
    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $numero = strtoupper(htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8'));


    $consulta = $MRGB->Modificar_informe($id,$numero);
    echo $consulta;



?>