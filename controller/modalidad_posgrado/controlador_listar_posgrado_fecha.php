<?php
      require '../../model/model_modalidad_posgrado.php';
      $MMPOS = new Modelo_Modalidad_Posgrado();//Instaciamos
    $fechainicio = htmlspecialchars($_POST['fechainicio'],ENT_QUOTES,'UTF-8');
    $fechafin = htmlspecialchars($_POST['fechafin'],ENT_QUOTES,'UTF-8');

    $consulta = $MMPOS->Listar_Modalidad_Posgrado_fecha($fechainicio,$fechafin);
 
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData":[]
        }';
    }    
?>
