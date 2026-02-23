<?php
require_once 'model/model_conexion.php';

class DBUpdate extends conexionBD {
    public function updateTable() {
        $c = $this->conexionPDO();
        $sql = "ALTER TABLE repo_archivos ADD COLUMN nivel VARCHAR(20) DEFAULT 'PREGRADO' AFTER id_colacion";
        try {
            $c->query($sql);
            echo "Columna 'nivel' añadida satisfactoriamente.\n";
        } catch (PDOException $e) {
            echo "Error o la columna ya existe: " . $e->getMessage() . "\n";
        }
    }
}

$update = new DBUpdate();
$update->updateTable();
?>
 