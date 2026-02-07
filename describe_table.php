<?php
require_once 'model/model_conexion.php';
$c = new conexionBD();
$conn = $c->conexionPDO();
$sql = "DESCRIBE expediente";
$query = $conn->query($sql);
$rows = $query->fetchAll(PDO::FETCH_ASSOC);
foreach($rows as $row) {
    echo $row['Field'] . " - " . $row['Type'] . "\n";
}
?>
