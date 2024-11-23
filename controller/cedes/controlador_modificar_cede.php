<?php
    require '../../model/model_cedes.php';
    $MCE = new Modelo_Cede();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $cede = strtoupper(htmlspecialchars($_POST['cede'],ENT_QUOTES,'UTF-8'));
    $descrip = strtoupper(htmlspecialchars($_POST['descrip'],ENT_QUOTES,'UTF-8'));
    $esta = strtoupper(htmlspecialchars($_POST['esta'],ENT_QUOTES,'UTF-8'));

    $consulta = $MCE->Modificar_Cede($id,$cede,$descrip,$esta);
    echo $consulta;



?>