<?php
    require_once '../../model/model_estudiantes.php';
    $ME = new Modelo_Estudiantes();
    $dni = htmlspecialchars($_POST['dni'], ENT_QUOTES, 'UTF-8');
    $estatus = htmlspecialchars($_POST['estatus'], ENT_QUOTES, 'UTF-8');
    $consulta = $ME->Modificar_Estatus_Etnica($dni, $estatus);
    echo $consulta;
?>
