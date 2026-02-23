<?php
require_once 'model/model_conexion.php';

class DBCheck extends conexionBD {
    public function checkId99() {
        $c = $this->conexionPDO();
        
        echo "--- Colacion (Pregrado) ---\n";
        $sql = "SELECT id_colacion, nombre_colacion, fecha_colación FROM colacion WHERE id_colacion = 99";
        $res = $c->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        print_r($res);
        
        echo "\n--- Colacion Posgrado ---\n";
        $sql = "SELECT id_colacion, nombre_colacion, fecha_colación FROM colacion_posgrado WHERE id_colacion = 99";
        $res = $c->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        print_r($res);
        
        echo "\n--- Repo Archivos with ID 99 ---\n";
        $sql = "SELECT id_archivo, dni_estudiante, fecha_subida FROM repo_archivos WHERE id_colacion = 99 LIMIT 5";
        $res = $c->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        print_r($res);
    }
}

$check = new DBCheck();
$check->checkId99();
?>
