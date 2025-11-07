<?php
    require '../../model/model_autoridad.php';
    $MAU = new Modelo_Autoridad();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $autoridad1 = strtoupper(htmlspecialchars($_POST['autoridad1'],ENT_QUOTES,'UTF-8'));
    $cargo1 = strtoupper(htmlspecialchars($_POST['cargo1'],ENT_QUOTES,'UTF-8'));
    $genero1 = strtoupper(htmlspecialchars($_POST['genero1'],ENT_QUOTES,'UTF-8'));
    $autoridad2 = strtoupper(htmlspecialchars($_POST['autoridad2'],ENT_QUOTES,'UTF-8'));
    $cargo2 = strtoupper(htmlspecialchars($_POST['cargo2'],ENT_QUOTES,'UTF-8'));
    $genero2 = strtoupper(htmlspecialchars($_POST['genero2'],ENT_QUOTES,'UTF-8'));
    $autoridad3 = strtoupper(htmlspecialchars($_POST['autoridad3'],ENT_QUOTES,'UTF-8'));
    $cargo3 = strtoupper(htmlspecialchars($_POST['cargo3'],ENT_QUOTES,'UTF-8'));
    $genero3 = strtoupper(htmlspecialchars($_POST['genero3'],ENT_QUOTES,'UTF-8'));
    $esta = strtoupper(htmlspecialchars($_POST['esta'],ENT_QUOTES,'UTF-8'));

    $consulta = $MAU->Modificar_Autoridad($id,$autoridad1,$genero1,$cargo1,$autoridad2,$genero2,$cargo2,$autoridad3,$cargo3,$genero3,$esta);
    echo $consulta;



?>