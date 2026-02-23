<?php
require_once 'model/model_conexion.php';

class DBUpdate extends conexionBD {
    public function sanitizeData() {
        $c = $this->conexionPDO();
        // Ensure all existing records have 'PREGRADO' if nivel is null or empty
        $sql = "UPDATE repo_archivos SET nivel = 'PREGRADO' WHERE nivel IS NULL OR nivel = ''";
        try {
            $count = $c->exec($sql);
            echo "Registros actualizados: $count\n";
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage() . "\n";
        }
    }
}

$update = new DBUpdate();
$update->sanitizeData();
?>
