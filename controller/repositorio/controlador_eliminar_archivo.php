<?php
    require_once '../../model/model_repositorio.php';

    $MU = new Modelo_Repositorio();
    
    $id_archivo = htmlspecialchars($_POST['id_archivo'], ENT_QUOTES, 'UTF-8');
    
    if($id_archivo){
        $consulta = $MU->Eliminar_Archivo($id_archivo);
        echo $consulta;
    } else {
        echo 0;
    }
?>
