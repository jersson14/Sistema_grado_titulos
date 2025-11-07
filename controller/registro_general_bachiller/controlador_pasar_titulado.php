<?php
    require '../../model/model_registro_general_bachiller.php';
    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    $idexpe = strtoupper(htmlspecialchars($_POST['idexpe'],ENT_QUOTES,'UTF-8'));
    $idautori = htmlspecialchars($_POST['idautori'],ENT_QUOTES,'UTF-8');
    $escue = strtoupper(htmlspecialchars($_POST['escue'],ENT_QUOTES,'UTF-8'));
    $grado = strtoupper(htmlspecialchars($_POST['grado'],ENT_QUOTES,'UTF-8'));
    $moda = strtoupper(htmlspecialchars($_POST['moda'],ENT_QUOTES,'UTF-8'));

    $consulta = $MRGB->Pasar_titulado($idexpe,$idautori,$escue,$grado,$moda);
    echo $consulta;



?>