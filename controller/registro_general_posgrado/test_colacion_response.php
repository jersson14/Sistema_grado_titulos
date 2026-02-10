<?php
require '../../model/model_registro_general_posgrado.php';
$MUO = new Modelo_Registro_General_Posgrado();
$consulta = $MUO->Cargar_Select_Colacion();
echo "RESULTADO DEL CONTROLADOR:\n";
echo json_encode($consulta, JSON_PRETTY_PRINT);
?>
