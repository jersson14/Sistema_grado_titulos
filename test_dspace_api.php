<?php
// Archivo de prueba para verificar la integración con DSpace
require 'model/model_repositorio_dspace.php';

$modelo = new Modelo_Repositorio_DSpace();

// DNI de prueba proporcionado por el usuario
$dni_prueba = "72543061";

echo "=== PRUEBA DE INTEGRACIÓN CON DSPACE ===\n\n";
echo "Buscando tesis para DNI: $dni_prueba\n\n";

$resultado = $modelo->obtenerTesisPorDni($dni_prueba);

if ($resultado) {
    echo "✓ TESIS ENCONTRADA\n\n";
    echo "Título:\n";
    echo $resultado['titulo'] . "\n\n";
    echo "Enlace:\n";
    echo $resultado['enlace'] . "\n\n";
    echo "JSON completo:\n";
    echo json_encode($resultado, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} else {
    echo "✗ NO SE ENCONTRÓ TESIS\n";
    echo "Verifica que el DNI tenga una tesis registrada en el repositorio.\n";
}

echo "\n\n=== FIN DE LA PRUEBA ===\n";
?>
