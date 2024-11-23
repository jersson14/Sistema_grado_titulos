<?php
    require '../../model/model_registro_general.php';
    $MRG = new Modelo_Registro_General();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $consulta = $MRG->Eliminar_registro_titulo($id);
    echo $consulta;



?>