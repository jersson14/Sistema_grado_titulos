<?php
/**
 * Generador de PDF - Declaración Jurada Variable Étnica y Lengua Indígena
 * Basado en formato SUNEDU
 */

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../conexion.php';

use Mpdf\Mpdf;

// Obtener DNI del estudiante
$dni = isset($_GET['dni']) ? $_GET['dni'] : '';

if (empty($dni)) {
    die('DNI no proporcionado');
}

// Verificar conexion
if ($mysqli->connect_error) {
    die('Conexion fallida: ' . $mysqli->connect_error);
}

// Consultar datos del estudiante
$query = "SELECT 
    estudiante.Dni,
    estudiante.Codigo,
    estudiante.Nombres,
    estudiante.Apellido_paterno,
    estudiante.Apellido_materno,
    estudiante.DET_ETNICA,
    estudiante.COD_ETNIA,
    estudiante.DET_LENGUA,
    estudiante.COD_LENGUA,
    estudiante.fecha_declaracion_etnica
FROM estudiante
WHERE estudiante.Dni = '$dni'";

$resultado = $mysqli->query($query);

if (!$resultado || $resultado->num_rows === 0) {
    die('Estudiante no encontrado');
}

$estudiante = $resultado->fetch_assoc();

// Catálogos de etnias y lenguas (basado en imagen 2)
$ETNIAS = [
    1 => 'Achuar', 2 => 'Aimara', 3 => 'Amahuaca', 4 => 'Arabela', 5 => 'Ashaninka',
    6 => 'Asheninka', 7 => 'Awajún', 8 => 'Bora', 9 => 'Cashinahua', 10 => 'Chamicuro',
    11 => 'Chapra', 12 => 'Chitonahua', 13 => 'Ese Eja', 14 => 'Harakbut', 15 => 'Ikitu',
    16 => 'Iñapari', 17 => 'Iskonawa', 18 => 'Jaqaru', 19 => 'Jibaro', 20 => 'Kakataibo',
    21 => 'Kakinte', 22 => 'Kandozi-Chapra', 23 => 'Kapanawa', 24 => 'Kichwa', 25 => 'Kukama',
    26 => 'Kukamirla', 27 => 'Madija', 28 => 'Marinahua', 29 => 'Mashco', 30 => 'Piro',
    31 => 'Mastanahua', 32 => 'Matsigenka', 33 => 'Murui-Muinani', 34 => 'Nahua', 35 => 'Nomatsigenga',
    36 => 'Ocaina', 37 => 'Omagua', 38 => 'Quechua', 39 => 'Resígaro', 40 => 'Secoya',
    41 => 'Sharanahua', 42 => 'Shawi', 43 => 'Shipibo-Konibo', 44 => 'Shiwilu', 45 => 'Taushiro',
    46 => 'Ticuna', 47 => 'Urarina', 48 => 'Wampis', 49 => 'Yagua', 50 => 'Yaminahua',
    51 => 'Yanesha', 52 => 'Yine', 53 => 'Vacacocha'
];

$LENGUAS = [
    31 => 'Achuar', 32 => 'Aimara', 33 => 'Amahuaca', 34 => 'Arabela', 35 => 'Ashaninka',
    36 => 'Asheninka', 37 => 'Awajún', 38 => 'Bora', 39 => 'Cashinahua', 40 => 'Chamicuro',
    41 => 'Ese Eja', 42 => 'Harakbut', 43 => 'Ikitu', 44 => 'Iñapari', 45 => 'Iskonawa',
    46 => 'Jaqaru', 47 => 'Kakataibo', 48 => 'Kakinte', 49 => 'Kandozi-Chapra', 50 => 'Kapanawa',
    51 => 'Kawki', 52 => 'Kukama', 53 => 'Kukamirla', 54 => 'Madija', 55 => 'Majiki',
    56 => 'Matsés', 57 => 'Matsigenka', 58 => 'Montetokuninri', 59 => 'Munichi', 60 => 'Murui-Muinani',
    61 => 'Nahua', 62 => 'Nomatsigenga', 63 => 'Ocaina', 64 => 'Omagua', 65 => 'Quechua',
    66 => 'Resígaro', 67 => 'Secoya', 68 => 'Sharanahua', 69 => 'Shawi', 70 => 'Shipibo-Konibo',
    71 => 'Shiwilu', 72 => 'Taushiro', 73 => 'Ticuna', 74 => 'Urarina', 75 => 'Wampis',
    76 => 'Yagua', 77 => 'Yaminahua', 78 => 'Yanesha', 79 => 'Yine'
];

// Determinar selecciones
$det_etnica = $estudiante['DET_ETNICA'];
$cod_etnia = $estudiante['COD_ETNIA'];
$det_lengua = $estudiante['DET_LENGUA'];
$cod_lengua = $estudiante['COD_LENGUA'];

$nombre_etnia = ($det_etnica === 'A' && $cod_etnia) ? ($ETNIAS[$cod_etnia] ?? '') : '';
$nombre_lengua = ($det_lengua === 'A' && $cod_lengua) ? ($LENGUAS[$cod_lengua] ?? '') : '';

// Crear PDF
$mpdf = new Mpdf([
    'mode' => 'utf-8',
    'format' => 'A4',
    'margin_left' => 20,
    'margin_right' => 20,
    'margin_top' => 15,
    'margin_bottom' => 15
]);

// Fecha actual
$fecha_actual = date('d/m/Y');

// HTML del PDF
$html = '
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 11pt;
            line-height: 1.4;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header-bg {
            background-color: #4A90E2;
            color: white;
            padding: 8px;
            font-weight: bold;
            font-size: 13pt;
            margin-bottom: 5px;
        }
        .title {
            font-size: 14pt;
            font-weight: bold;
            text-align: center;
            margin: 15px 0;
            color: #333;
        }
        .info-line {
            margin: 8px 0;
            border-bottom: 1px solid #ccc;
            padding-bottom: 3px;
        }
        .checkbox {
            display: inline-block;
            width: 15px;
            height: 15px;
            border: 2px solid #000;
            text-align: center;
            line-height: 13px;
            font-weight: bold;
            margin-right: 5px;
        }
        .checked {
            background-color: #000;
            color: white;
        }
        .section {
            margin: 15px 0;
        }
        .section-title {
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 11pt;
        }
        .option {
            margin: 5px 0 5px 20px;
        }
        .table-container {
            margin: 15px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 9pt;
        }
        table th {
            background-color: #f0f0f0;
            border: 1px solid #000;
            padding: 4px;
            text-align: center;
            font-weight: bold;
        }
        table td {
            border: 1px solid #000;
            padding: 3px 5px;
        }
        .signature-section {
            margin-top: 40px;
            text-align: center;
        }
        .signature-line {
            border-top: 1px solid #000;
            width: 200px;
            margin: 50px auto 5px;
        }
        .logo {
            position: absolute;
            right: 20px;
            top: 15px;
            width: 80px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-bg">UNIVERSIDAD TECNOLÓGICA DE LOS ANDES</div>
    </div>
    
    <div class="title">
        DECLARACIÓN JURADA VARIABLE<br>
        ÉTNICA Y LENGUA INDÍGENA U ORIGINARIA
    </div>
    
    <div class="info-line">
        <strong>Yo:</strong> ' . strtoupper($estudiante['Nombres'] . ' ' . $estudiante['Apellido_paterno'] . ' ' . $estudiante['Apellido_materno']) . '
    </div>
    
    <div class="info-line">
        <strong>DNI:</strong> ' . $estudiante['Dni'] . ' &nbsp;&nbsp;&nbsp; <strong>Código:</strong> ' . $estudiante['Codigo'] . '
    </div>
    
    <div class="info-line">
        <strong>De la Escuela Profesional de:</strong> _________________________________
    </div>
    
    <div class="info-line">
        <strong>Facultad:</strong> _________________________________
    </div>
    
    <div class="section">
        <div class="section-title">Declaro bajo juramento de ley autoidentificación étnica</div>
        <p style="font-size: 10pt; margin: 5px 0;">
            Seleccione el grupo étnico al que se autoidentifica, conforme a las opciones establecidas por el Ministerio de Cultura:
        </p>
        
        <div class="option">
            <span class="checkbox ' . ($det_etnica === 'A' ? 'checked' : '') . '">' . ($det_etnica === 'A' ? 'X' : '') . '</span>
            a) Un pueblo indígena u originario (especificar): <strong>' . $nombre_etnia . '</strong>
        </div>
        
        <div class="option">
            <span class="checkbox ' . ($det_etnica === 'B' ? 'checked' : '') . '">' . ($det_etnica === 'B' ? 'X' : '') . '</span>
            b) Población afroperuana, negra, morena, zambo, mulata, afrodescendiente o parte del pueblo afroperuano
        </div>
        
        <div class="option">
            <span class="checkbox ' . ($det_etnica === 'C' ? 'checked' : '') . '">' . ($det_etnica === 'C' ? 'X' : '') . '</span>
            c) No
        </div>
        
        <div class="option">
            <span class="checkbox ' . ($det_etnica === 'D' ? 'checked' : '') . '">' . ($det_etnica === 'D' ? 'X' : '') . '</span>
            d) No sabe / No responde
        </div>
    </div>
    
    <div class="section">
        <div class="section-title">Declaro bajo juramento de ley de lengua indígena u originaria</div>
        <p style="font-size: 10pt; margin: 5px 0;">
            Seleccione si habla alguna lengua indígena u originaria, conforme a la clasificación Oficial de Lenguas Indígenas u Originarias del Perú. Las instrucciones de llenado están al reverso.
        </p>
        
        <div class="option">
            <span class="checkbox ' . ($det_lengua === 'A' ? 'checked' : '') . '">' . ($det_lengua === 'A' ? 'X' : '') . '</span>
            a) Sí (especificar): <strong>' . $nombre_lengua . '</strong>
        </div>
        
        <div class="option">
            <span class="checkbox ' . ($det_lengua === 'B' ? 'checked' : '') . '">' . ($det_lengua === 'B' ? 'X' : '') . '</span>
            b) No
        </div>
        
        <div class="option">
            <span class="checkbox ' . ($det_lengua === 'C' ? 'checked' : '') . '">' . ($det_lengua === 'C' ? 'X' : '') . '</span>
            c) No sabe / No responde
        </div>
    </div>
    
    <div class="signature-section">
        <p>Abancay, ' . $fecha_actual . '</p>
        <div class="signature-line"></div>
        <p><strong>Firma</strong></p>
    </div>
</body>
</html>
';

// Generar PDF
$mpdf->WriteHTML($html);

// Guardar PDF
$upload_dir = __DIR__ . '/../../../uploads/declaraciones_etnicas/';
if (!file_exists($upload_dir)) {
    mkdir($upload_dir, 0777, true);
}

$filename = 'declaracion_etnica_' . $dni . '_' . time() . '.pdf';
$filepath = $upload_dir . $filename;

$mpdf->Output($filepath, 'F');

// Retornar ruta relativa
echo json_encode([
    'success' => true,
    'filename' => $filename,
    'filepath' => 'uploads/declaraciones_etnicas/' . $filename
]);
?>
