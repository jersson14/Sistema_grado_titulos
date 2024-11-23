<?php
      require '../../model/model_modalidad_posgrado.php';
      $MMPOS = new Modelo_Modalidad_Posgrado();//Instaciamos
      $consulta = $MMPOS->Listar_Vista_Posgrado_todo();
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
