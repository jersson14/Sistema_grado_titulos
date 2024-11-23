<?php
    require '../../model/model_expedientes.php';

    $MEB = new Modelo_Expedientes();//Instaciamos
    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $consulta = $MEB->TraerGrado($id);
    echo json_encode($consulta);
   
?>