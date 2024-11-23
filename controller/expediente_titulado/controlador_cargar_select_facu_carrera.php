<?php
    require '../../model/model_expedientes_titulado.php';
    $MET = new Modelo_Expedientes_Titulado();//Instaciamos
    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $consulta = $MET->Cargar_Escuelas($id);
    echo json_encode($consulta);
 
?>
