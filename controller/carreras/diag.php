<?php
    require '../../model/model_conexion.php';
    $conn = (new conexionBD())->conexionPDO();
    header('Content-Type: application/json');

    try {
        $tables = $conn->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
        $result = ['tables' => $tables];
        
        foreach ($tables as $table) {
            if (stripos($table, 'carrera') !== false || stripos($table, 'escuela') !== false) {
                $columns = $conn->query("DESCRIBE $table")->fetchAll(PDO::FETCH_ASSOC);
                $result['details'][$table] = $columns;
            }
        }
        
        echo json_encode($result, JSON_PRETTY_PRINT);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
?>
