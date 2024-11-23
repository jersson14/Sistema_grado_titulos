<?php
    require '../../model/model_autoridad.php';
    $MAU = new Modelo_Autoridad();//Instaciamos
    $autoridad1 = strtoupper(htmlspecialchars($_POST['autoridad1'],ENT_QUOTES,'UTF-8'));
    $cargo1 = strtoupper(htmlspecialchars($_POST['cargo1'],ENT_QUOTES,'UTF-8'));
    $autoridad2 = strtoupper(htmlspecialchars($_POST['autoridad2'],ENT_QUOTES,'UTF-8'));
    $cargo2 = strtoupper(htmlspecialchars($_POST['cargo2'],ENT_QUOTES,'UTF-8'));
    $autoridad3 = strtoupper(htmlspecialchars($_POST['autoridad3'],ENT_QUOTES,'UTF-8'));
    $cargo3 = strtoupper(htmlspecialchars($_POST['cargo3'],ENT_QUOTES,'UTF-8'));

    $consulta = $MAU->Registrar_Autoridad($autoridad1,$cargo1,$autoridad2,$cargo2,$autoridad3,$cargo3);
    echo $consulta;



?>