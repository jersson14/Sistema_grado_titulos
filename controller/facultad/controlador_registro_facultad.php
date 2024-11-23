<?php
    require '../../model/model_facultad.php';
    $MF = new Modelo_Facultad();
    $facultad = htmlspecialchars($_POST['facultad'],ENT_QUOTES,'UTF-8');
    $autoridad = strtoupper(htmlspecialchars($_POST['autoridad'],ENT_QUOTES,'UTF-8'));

    $consulta = $MF->Registrar_Facultad($facultad,$autoridad);
    echo $consulta;



?>