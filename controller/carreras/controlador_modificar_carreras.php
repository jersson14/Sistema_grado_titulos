<?php
    require '../../model/model_carreras.php';
    $MCA = new Modelo_Carreras();//Instaciamos

    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $codesc = strtoupper(htmlspecialchars($_POST['codesc'],ENT_QUOTES,'UTF-8'));
    $nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');
    $gradoaca = htmlspecialchars($_POST['gradoaca'],ENT_QUOTES,'UTF-8');
    $abrevi = strtoupper(htmlspecialchars($_POST['abrevi'],ENT_QUOTES,'UTF-8'));
    $deno = htmlspecialchars($_POST['deno'],ENT_QUOTES,'UTF-8');
    $progra = strtoupper(htmlspecialchars($_POST['progra'],ENT_QUOTES,'UTF-8'));
    $cred = strtoupper(htmlspecialchars($_POST['cred'],ENT_QUOTES,'UTF-8'));
    $facul = strtoupper(htmlspecialchars($_POST['facul'],ENT_QUOTES,'UTF-8'));
    $estado = strtoupper(htmlspecialchars($_POST['estado'],ENT_QUOTES,'UTF-8'));

   

    $consulta = $MCA->Modificar_Carreras($id,$codesc,$nombre,$gradoaca,$abrevi,$deno,$progra,$cred,$facul,$estado);
    echo $consulta;



?>