<?php
    require '../../model/model_cedes.php';
    $MCE = new Modelo_Cede();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));

    $consulta = $MCE->Eliminar_Cede($id);
    echo $consulta;



?>