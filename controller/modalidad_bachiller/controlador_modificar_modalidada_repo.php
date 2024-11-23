<?php
    require '../../model/model_modalidad_bachiller.php';
    $MMB = new Modelo_Modalidad_Bachiller();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $modo = htmlspecialchars($_POST['modo'],ENT_QUOTES,'UTF-8');
    $mod_estu = strtoupper(htmlspecialchars($_POST['mod_estu'],ENT_QUOTES,'UTF-8'));
    $trabaj = strtoupper(htmlspecialchars($_POST['trabaj'],ENT_QUOTES,'UTF-8'));
    $turni = htmlspecialchars($_POST['turni'],ENT_QUOTES,'UTF-8');
    $porce = strtoupper(htmlspecialchars($_POST['porce'],ENT_QUOTES,'UTF-8'));
    $centro = strtoupper(htmlspecialchars($_POST['centro'],ENT_QUOTES,'UTF-8'));
    $meta = htmlspecialchars($_POST['meta'],ENT_QUOTES,'UTF-8');
    $probach = strtoupper(htmlspecialchars($_POST['probach'],ENT_QUOTES,'UTF-8'));
    $pro_ins = strtoupper(htmlspecialchars($_POST['pro_ins'],ENT_QUOTES,'UTF-8'));
    $pro_titu = htmlspecialchars($_POST['pro_titu'],ENT_QUOTES,'UTF-8');
    $fechamatrimoda = strtoupper(htmlspecialchars($_POST['fechamatrimoda'],ENT_QUOTES,'UTF-8'));
    $fechamodaini = strtoupper(htmlspecialchars($_POST['fechamodaini'],ENT_QUOTES,'UTF-8'));
    $fechamodafin = strtoupper(htmlspecialchars($_POST['fechamodafin'],ENT_QUOTES,'UTF-8'));
    $susten = strtoupper(htmlspecialchars($_POST['susten'],ENT_QUOTES,'UTF-8'));
    $idusuer = strtoupper(htmlspecialchars($_POST['idusuer'],ENT_QUOTES,'UTF-8'));
    
    $consulta = $MMB->Modificar_Modalidad_repo_BACHI($id,$modo,$mod_estu,$trabaj,$turni,$porce,$centro,$meta,$probach,$pro_ins,$pro_titu,$fechamatrimoda,$fechamodaini,$fechamodafin,$susten,$idusuer);
    echo $consulta;



?>