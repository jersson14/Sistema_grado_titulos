<?php
require_once 'model/model_conexion.php';
$c = new conexionBD();
$conn = $c->conexionPDO();
$sql = "SHOW CREATE PROCEDURE SP_REGISTRAR_BACHILLER";
$query = $conn->query($sql);
$row = $query->fetch(PDO::FETCH_ASSOC);
echo $row['Create Procedure'];
?>
