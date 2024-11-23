<?php
    require '../../model/model_estudiantes.php';
    $MES = new Modelo_Estudiantes();//Instaciamos
    $dni = strtoupper(htmlspecialchars($_POST['dni'],ENT_QUOTES,'UTF-8'));
    $codigo = strtoupper(htmlspecialchars($_POST['codigo'],ENT_QUOTES,'UTF-8'));
    $nombres = strtoupper(htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8'));
    $apepa = strtoupper(htmlspecialchars($_POST['apepa'],ENT_QUOTES,'UTF-8'));
    $apema = strtoupper(htmlspecialchars($_POST['apema'],ENT_QUOTES,'UTF-8'));
    $sexo = strtoupper(htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8'));
    $celular = strtoupper(htmlspecialchars($_POST['celular'],ENT_QUOTES,'UTF-8'));
    $direc = strtoupper(htmlspecialchars($_POST['direc'],ENT_QUOTES,'UTF-8'));
    $fecha_matr = strtoupper(htmlspecialchars($_POST['fecha_matr'],ENT_QUOTES,'UTF-8'));
    $fecha_egre = strtoupper(htmlspecialchars($_POST['fecha_egre'],ENT_QUOTES,'UTF-8'));
    $id_usuario = strtoupper(htmlspecialchars($_POST['id_usuario'],ENT_QUOTES,'UTF-8'));

    $consulta = $MES->Registrar_Estudiantes($dni,$codigo,$nombres,$apepa,$apema,$sexo,$celular,$direc,$fecha_matr,$fecha_egre,$id_usuario);
    echo $consulta;



?>