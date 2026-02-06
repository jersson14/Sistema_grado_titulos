<?php
    require_once '../../model/model_repositorio.php';

    $MU = new Modelo_Repositorio();
    
    $id_colacion = htmlspecialchars($_POST['id_colacion'], ENT_QUOTES, 'UTF-8');
    
    if($id_colacion){
        $consulta = $MU->Listar_Archivos_x_Colacion($id_colacion);
        echo json_encode($consulta);
    } else {
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData": []
        }';
    }
?>
