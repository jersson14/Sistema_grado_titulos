<?php
require 'model/reportes.php';
$modelo = new Modelo_Reportes();
$resultado = $modelo->Cargar_Select_Colacion_Posgrado();
header('Content-Type: application/json');
echo json_encode($resultado);
?>
