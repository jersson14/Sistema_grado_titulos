<?php
    require '../../model/model_registro_general_posgrado.php';
    $MRGPG = new Modelo_Registro_General_Posgrado();
    $dni = htmlspecialchars($_POST['dni'],ENT_QUOTES,'UTF-8');
    $consulta = $MRGPG->Buscar_Estudiante_Posgrado($dni);
    echo json_encode($consulta);
?>
