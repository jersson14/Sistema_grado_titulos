<?php
      require '../../model/model_registro_general_posgrado.php';

      $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
      $consulta = $MRGPG->Traer_numero_informe();
    echo json_encode($consulta);
   
?>