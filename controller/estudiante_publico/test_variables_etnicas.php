<?php
// Test simple de conexión y consulta
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "Iniciando prueba...\n";

require '../../model/model_conexion.php';

echo "Model cargado correctamente\n";

$dni = '73745613';

try {
    $db = new conexionBD();
    $conexion = $db->conexionPDO();
    echo "Conexión establecida\n";
    
    $sql = "SELECT COD_ETNIA, COD_LENGUA, DET_ETNICA, DET_LENGUA FROM estudiante WHERE Dni = ? LIMIT 1";
    
    $stmt = $conexion->prepare($sql);
    echo "Query preparado\n";
    
    $stmt->execute([$dni]);
    echo "Query ejecutado\n";
    
    $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
    
    echo "Resultado:\n";
    print_r($resultado);
    
    $db->cerrar_conexion();
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    echo "Trace: " . $e->getTraceAsString();
}
