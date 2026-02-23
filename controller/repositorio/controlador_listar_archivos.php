<?php
    require_once '../../model/model_repositorio.php';

    $MU = new Modelo_Repositorio();
    
    $id_colacion = htmlspecialchars($_POST['id_colacion'], ENT_QUOTES, 'UTF-8');
    $nivel = htmlspecialchars($_POST['nivel'], ENT_QUOTES, 'UTF-8');
    if(empty($nivel)) $nivel = 'PREGRADO';
    
    if($id_colacion){
        $consulta = $MU->Listar_Archivos_x_Colacion($id_colacion, $nivel);
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
