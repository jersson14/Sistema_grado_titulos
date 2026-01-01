<?php
    require '../../model/model_colacion.php';
    $MCO = new Modelo_Colacion();//Instaciamos
    $cola = strtoupper(htmlspecialchars($_POST['cola'],ENT_QUOTES,'UTF-8'));
    $fecha_cola = strtoupper(htmlspecialchars($_POST['fecha_cola'],ENT_QUOTES,'UTF-8'));
    $fecha_cola_cusco = strtoupper(htmlspecialchars($_POST['fecha_cola_cusco'],ENT_QUOTES,'UTF-8'));
    $fecha_cola_andahuylas = strtoupper(htmlspecialchars($_POST['fecha_cola_andahuylas'],ENT_QUOTES,'UTF-8'));

    $fecha_conse = strtoupper(htmlspecialchars($_POST['fecha_conse'],ENT_QUOTES,'UTF-8'));
    $fecha_firma = strtoupper(htmlspecialchars($_POST['fecha_firma'],ENT_QUOTES,'UTF-8'));
    $fecha_resol = strtoupper(htmlspecialchars($_POST['fecha_resol'],ENT_QUOTES,'UTF-8'));
    $oficio = strtoupper(htmlspecialchars($_POST['oficio'],ENT_QUOTES,'UTF-8'));

    $consulta = $MCO->Registrar_Colacion($cola,$fecha_cola,$fecha_cola_cusco,$fecha_cola_andahuylas,$fecha_conse,$fecha_firma,$fecha_resol,$oficio);
    echo $consulta;



?>