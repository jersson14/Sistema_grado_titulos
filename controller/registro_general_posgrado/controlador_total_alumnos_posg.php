<?php
    require '../../model/model_registro_general_posgrado.php';

    $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
    $consulta = $MRGPG->listar_total_alumnos();
    echo json_encode($consulta);

?>