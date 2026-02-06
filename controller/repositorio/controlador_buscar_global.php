<?php
    require_once '../../model/model_repositorio.php';

    $MU = new Modelo_Repositorio();
    
    $dni = htmlspecialchars($_POST['dni'], ENT_QUOTES, 'UTF-8');
    
    if($dni){
        $consulta = $MU->Buscar_Archivo_Global($dni);
        echo json_encode($consulta);
    } else {
        echo json_encode([]);
    }
?>
