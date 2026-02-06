<?php
/**
 * Script de prueba para verificar generación de PDF
 * Acceder a: http://localhost/ultimogrados/test_pdf.php?dni=72411515
 */

require 'view/MPDF/REPORTE/declaracion_etnica_direct.php';
require 'model/conexion.php';

$dni = isset($_GET['dni']) ? $_GET['dni'] : '72411515';

echo "<h2>Probando generación de PDF</h2>";
echo "<p>DNI: $dni</p>";

try {
    $resultado = generar_pdf_declaracion($dni, $mysqli);
    
    if ($resultado['success']) {
        echo "<p style='color: green;'>✓ PDF generado exitosamente!</p>";
        echo "<p>Archivo: " . $resultado['filename'] . "</p>";
        echo "<p>Ruta: " . $resultado['filepath'] . "</p>";
        echo "<p><a href='" . $resultado['filepath'] . "' target='_blank'>Ver PDF</a></p>";
    } else {
        echo "<p style='color: red;'>✗ Error: " . $resultado['error'] . "</p>";
    }
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Excepción: " . $e->getMessage() . "</p>";
    echo "<pre>" . $e->getTraceAsString() . "</pre>";
}
?>
