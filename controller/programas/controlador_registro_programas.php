<?php
    require '../../model/model_programas.php';
    $MPR = new Modelo_Programas();//Instaciamos

    $pro = htmlspecialchars($_POST['pro'],ENT_QUOTES,'UTF-8');
    $grado = htmlspecialchars($_POST['grado'],ENT_QUOTES,'UTF-8');
    $abre = htmlspecialchars($_POST['abre'],ENT_QUOTES,'UTF-8');
    $deno = htmlspecialchars($_POST['deno'],ENT_QUOTES,'UTF-8');
    $estu = strtoupper(htmlspecialchars($_POST['estu'],ENT_QUOTES,'UTF-8'));
    $cred = strtoupper(htmlspecialchars($_POST['cred'],ENT_QUOTES,'UTF-8'));
    $dire = strtoupper(htmlspecialchars($_POST['dire'],ENT_QUOTES,'UTF-8'));
   

    $consulta = $MPR->Registrar_Programas($pro,$grado,$abre,$deno,$estu,$cred,$dire);
    echo $consulta;



?>