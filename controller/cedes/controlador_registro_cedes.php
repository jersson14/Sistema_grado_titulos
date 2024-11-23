<?php
    require '../../model/model_cedes.php';
    $MCE = new Modelo_Cede();//Instaciamos
    $cede = strtoupper(htmlspecialchars($_POST['cede'],ENT_QUOTES,'UTF-8'));
    $descrip = strtoupper(htmlspecialchars($_POST['descrip'],ENT_QUOTES,'UTF-8'));

    $consulta = $MCE->Registrar_Cede($cede,$descrip);
    echo $consulta;



?>