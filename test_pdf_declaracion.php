<?php
// Script de prueba para generar PDF de declaración étnica
// Ruta: C:\xampp\htdocs\ultimogrados\test_pdf_declaracion.php

// Datos de prueba
$dni = '12345678';
$cod_etnia = '10';  // Chamicuro
$cod_lengua = '34'; // Quechua

// Incluir el archivo que genera el PDF
include('view/MPDF/REPORTE/declaracion_etnica.php');

echo "PDF generado exitosamente. Revisa la carpeta: uploads/declaraciones_etnicas/";
?>
