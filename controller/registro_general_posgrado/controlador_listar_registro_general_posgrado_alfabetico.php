<?php
      require '../../model/model_registro_general_posgrado.php';
      $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
      $consulta = $MRGPG->Listar_Registro_General_Posgrado_Alfabeto();
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData": []
        }';
    }
?>
