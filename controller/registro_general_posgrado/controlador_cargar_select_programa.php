<?php
      require '../../model/model_registro_general_posgrado.php';
      $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
    $consulta = $MRGPG->Cargar_Programa();
    echo json_encode($consulta);
 
?>
