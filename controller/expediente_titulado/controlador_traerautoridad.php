<?php
    require '../../model/model_expedientes_titulado.php';

    $MET = new Modelo_Expedientes_Titulado();//Instaciamos
    $id_auto = htmlspecialchars($_POST['id_auto'],ENT_QUOTES,'UTF-8');
    $consulta = $MET->TraerAutoridad($id_auto);
    echo json_encode($consulta);
   
?>