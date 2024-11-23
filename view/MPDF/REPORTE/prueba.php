<?php
require_once __DIR__ . '/../vendor/autoload.php'; // Incluye autoload de Composer
use Mpdf\Mpdf;

// Crear instancia de mPDF

$mpdf = new \Mpdf\Mpdf([
    'fontDir' => __DIR__ . '/../fonts',
    'fontdata' => [
        'charm' => [
            'R' => 'Charm-Regular.ttf',
        ],
    ],
    'default_font' => 'sans-serif',
    'orientation' => 'L',
    'margin_left' => 50,
    'margin_right' => 0,
    'margin_bottom' => 0,
]);

$html = '
<!DOCTYPE html>
<html>
<head>
    <style>
        .charm-font {
            font-family: "charm";
        }
    </style>
</head>
<body>
    <h1>Este es un título con la fuente predeterminada</h1>
    <p class="charm-font">Este texto está usando la fuente Charm.</p>
    <p>Este es otro texto con la fuente predeterminada.</p>
</body>
</html>
';

$mpdf->WriteHTML($html);
$mpdf->Output();