<?php
    require '../../model/model_registro_general_posgrado.php';
    $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $consulta = $MRGPG->Eliminar_registro_posgrado($id);
    echo $consulta;



?>