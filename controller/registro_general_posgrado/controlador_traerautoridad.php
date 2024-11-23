<?php
 require '../../model/model_registro_general_posgrado.php';

 $MRGPG = new Modelo_Registro_General_Posgrado(); // Instanciamos
 
 // Verificamos si el valor existe
 if (isset($_POST['id_auto'])) {
     $id_auto = htmlspecialchars($_POST['id_auto'], ENT_QUOTES, 'UTF-8');
     $consulta = $MRGPG->TraerAutoridad($id_auto);
     echo json_encode($consulta);
 } else {
     echo json_encode(['error' => 'El parámetro id_auto no fue enviado']);
 }
 
   
?>