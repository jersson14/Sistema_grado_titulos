<?php
    require '../../model/model_facultad.php';
    $MF = new Modelo_Facultad();
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $facultad = htmlspecialchars($_POST['facultad'],ENT_QUOTES,'UTF-8');
    $autoridad = strtoupper(htmlspecialchars($_POST['autoridad'],ENT_QUOTES,'UTF-8'));
    $esta = strtoupper(htmlspecialchars($_POST['esta'],ENT_QUOTES,'UTF-8'));

    $consulta = $MF->Modificar_Facultad($id,$facultad,$autoridad,$esta);
    echo $consulta;



?>