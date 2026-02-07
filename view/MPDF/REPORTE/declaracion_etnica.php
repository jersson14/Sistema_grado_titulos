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
    estudiante.fecha_declaracion_etnica,
    estudiante.Facultad,
    estudiante.Escuela
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
    21 => 'Kakinte', 22 => 'Kandozi-Chapra', 23 => 'Kapanawa', 24 => 'Kichwa', 25 => 'Kukama - Kukamirla',
    26 => 'Madija', 27 => 'Maijuna', 28 => 'Marinahua', 29 => 'Mashco Piro', 30 => 'Mastanahua',
    31 => 'Matsés', 32 => 'Matsigenka', 33 => 'Muniche', 34 => 'Murui-Muinani', 35 => 'Nahua',
    36 => 'Nanti', 37 => 'Nomatsigenga', 38 => 'Ocaina', 39 => 'Omagua', 40 => 'Quechuas',
    41 => 'Resigaro', 42 => 'Secoya', 43 => 'Sharanahua', 44 => 'Shawi', 45 => 'Shipibo-Konibo',
    46 => 'Shiwilu', 47 => 'Ticuna', 48 => 'Urarina', 49 => 'Uro', 50 => 'Vacacocha',
    51 => 'Wampis', 52 => 'Yagua', 53 => 'Yaminahua', 54 => 'Yanesha', 55 => 'Yine  '
];

$LENGUAS = [
  // COLUMNA 1 (1–30)
  1  => 'Achuar',
  2  => 'Aimara',
  3  => 'Amahuaca',
  4  => 'Arabela',
  5  => 'Ashaninka',
  6  => 'Asheninka',
  7  => 'Awajún',
  8  => 'Bora',
  9  => 'Cashinahua',
  10 => 'Chamikuro',
  11 => 'Ese Eja',
  12 => 'Harakbut',
  13 => 'Ikitu',
  14 => 'Iñapari',
  15 => 'Iskonawa',
  16 => 'Jaqaru',
  17 => 'Kakataibo',
  18 => 'Kakinte',
  19 => 'Kandozi-Chapra',
  20 => 'Kapanawa',
  21 => 'Kawki',
  22 => 'Kukama - Kukamiria',
  23 => 'Madija',
  24 => 'Majiki',
  25 => 'Matsés',
  26 => 'Matsigenka',
  27 => 'Matsigenka Montetokuninri',
  28 => 'Munichi',
  29 => 'Murui-Muinani',
  30 => 'Nahua',

  // COLUMNA 2 (31–48)
  31 => 'Nomatsigenga',
  32 => 'Ocaina',
  33 => 'Omagua',
  34 => 'Quechua',
  35 => 'Resígaro',
  36 => 'Secoya',
  37 => 'Sharanahua',
  38 => 'Shawi',
  39 => 'Shipibo-Konibo',
  40 => 'Shiwilu',
  41 => 'Taushiro',
  42 => 'Ticuna',
  43 => 'Urarina',
  44 => 'Wampis',
  45 => 'Yagua',
  46 => 'Yaminahua',
  47 => 'Yanesha',
  48 => 'Yine'
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

// Fecha actual en formato largo español
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES', 'spanish');
$meses = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
$dia = date('d');
$mes = $meses[date('n') - 1];
$anio = date('Y');
$fecha_actual = $dia . ' de ' . $mes . ' de ' . $anio;

// Funciones auxiliares para generar las filas de las tablas (4 columnas)
function generarFilasEtnias($cod_seleccionado) {
    $etnias = [
  ['1','Achuar'], ['2','Aimara'], ['3','Amahuaca'], ['4','Arabela'],
  ['5','Ashaninka'], ['6','Asheninka'], ['7','Awajún'], ['8','Bora'],
  ['9','Cashinahua'], ['10','Chamicuro'], ['11','Chapra'], ['12','Chitonahua'],
  ['13','Ese Eja'], ['14','Harakbut'], ['15','Ikitu'], ['16','Iñapari'],
  ['17','Iskonawa'], ['18','Jaqaru'], ['19','Jibaro'], ['20','Kakataibo'],
  ['21','Kakinte'], ['22','Kandozi-Chapra'], ['23','Kapanawa'], ['24','Kichwa'],
  ['25','Kukama - Kukamirla'], ['26','Madija'], ['27','Maijuna'],
  ['28','Marinahua'], ['29','Mashco Piro'], ['30','Mastanahua'],
  ['31','Matsés'], ['32','Matsigenka'], ['33','Muniche'],
  ['34','Murui-Muinani'], ['35','Nahua'], ['36','Nanti'],
  ['37','Nomatsigenga'], ['38','Ocaina'], ['39','Omagua'],
  ['40','Quechuas'], ['41','Resigaro'], ['42','Secoya'],
  ['43','Sharanahua'], ['44','Shawi'], ['45','Shipibo-Konibo'],
  ['46','Shiwilu'], ['47','Ticuna'], ['48','Urarina'],
  ['49','Uro'], ['50','Vacacocha'], ['51','Wampis'],
  ['52','Yagua'], ['53','Yaminahua'], ['54','Yanesha'], ['55','Yine']
    ];
    
    // Dividir en dos columnas: 1-30 y 31-55
    $col1 = array_slice($etnias, 0, 30);  // 1-30
    $col2 = array_slice($etnias, 30);      // 31-55
    
    $html = '';
    $max_rows = max(count($col1), count($col2));
    
    for ($i = 0; $i < $max_rows; $i++) {
        $html .= '<tr>';
        
        // Columna 1 (códigos 1-30)
        if (isset($col1[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 10px; font-size: 6pt;">' . ($col1[$i][0] == $cod_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 15px; font-size: 6pt;">' . $col1[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px 2px; font-size: 6pt;">' . $col1[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        // Columna 2 (códigos 31-55)
        if (isset($col2[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 10px; font-size: 6pt;">' . ($col2[$i][0] == $cod_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 15px; font-size: 6pt;">' . $col2[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px 2px; font-size: 6pt;">' . $col2[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        $html .= '</tr>';
    }
    return $html;
}

function generarFilasLenguas($cod_seleccionado) {
    $lenguas = [
       ['1','Achuar'], ['2','Aimara'], ['3','Amahuaca'], ['4','Arabela'],
  ['5','Ashaninka'], ['6','Asheninka'], ['7','Awajún'], ['8','Bora'],
  ['9','Cashinahua'], ['10','Chamicuro'], ['11','Ese Eja'], ['12','Harakbut'],
  ['13','Ikitu'], ['14','Iñapari'], ['15','Iskonawa'], ['16','Jaqaru'],
  ['17','Kakataibo'], ['18','Kakinte'], ['19','Kandozi-Chapra'],
  ['20','Kapanawa'], ['21','Kawki'], ['22','Kukama - Kukamiria'],
  ['23','Madija'], ['24','Majiki'], ['25','Matsés'],
  ['26','Matsigenka'], ['27','Matsigenka Montetokuninri'],
  ['28','Munichi'], ['29','Murui-Muinani'], ['30','Nahua'],

  // 31–48
  ['31','Nomatsigenga'], ['32','Ocaina'], ['33','Omagua'],
  ['34','Quechua'], ['35','Resígaro'], ['36','Secoya'],
  ['37','Sharanahua'], ['38','Shawi'], ['39','Shipibo-Konibo'],
  ['40','Shiwilu'], ['41','Taushiro'], ['42','Ticuna'],
  ['43','Urarina'], ['44','Wampis'], ['45','Yagua'],
  ['46','Yaminahua'], ['47','Yanesha'], ['48','Yine']
    ];
    
    // Dividir en dos columnas: 1-30 y 31-48
    $col1 = array_slice($lenguas, 0, 30);  // 1-30
    $col2 = array_slice($lenguas, 30);      // 31-48
    
    $html = '';
    $max_rows = max(count($col1), count($col2));
    
    for ($i = 0; $i < $max_rows; $i++) {
        $html .= '<tr>';
        
        // Columna 3 (códigos 1-30)
        if (isset($col1[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 10px; font-size: 6pt;">' . ($col1[$i][0] == $cod_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 15px; font-size: 6pt;">' . $col1[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px 2px; font-size: 6pt;">' . $col1[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        // Columna 4 (códigos 31-48)
        if (isset($col2[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 10px; font-size: 6pt;">' . ($col2[$i][0] == $cod_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px; text-align: center; width: 15px; font-size: 6pt;">' . $col2[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 1px 2px; font-size: 6pt;">' . $col2[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        $html .= '</tr>';
    }
    return $html;
}

function generarFilasTablaCompleta($cod_etnia_seleccionado, $cod_lengua_seleccionado) {
    // VARIABLE ÉTNICA
    $etnias = [
  ['1','Achuar'], ['2','Aimara'], ['3','Amahuaca'], ['4','Arabela'],
  ['5','Ashaninka'], ['6','Asheninka'], ['7','Awajún'], ['8','Bora'],
  ['9','Cashinahua'], ['10','Chamicuro'], ['11','Chapra'], ['12','Chitonahua'],
  ['13','Ese Eja'], ['14','Harakbut'], ['15','Ikitu'], ['16','Iñapari'],
  ['17','Iskonawa'], ['18','Jaqaru'], ['19','Jibaro'], ['20','Kakataibo'],
  ['21','Kakinte'], ['22','Kandozi-Chapra'], ['23','Kapanawa'], ['24','Kichwa'],
  ['25','Kukama - Kukamirla'], ['26','Madija'], ['27','Maijuna'],
  ['28','Marinahua'], ['29','Mashco Piro'], ['30','Mastanahua'],
  ['31','Matsés'], ['32','Matsigenka'], ['33','Muniche'],
  ['34','Murui-Muinani'], ['35','Nahua'], ['36','Nanti'],
  ['37','Nomatsigenga'], ['38','Ocaina'], ['39','Omagua'],
  ['40','Quechuas'], ['41','Resigaro'], ['42','Secoya'],
  ['43','Sharanahua'], ['44','Shawi'], ['45','Shipibo-Konibo'],
  ['46','Shiwilu'], ['47','Ticuna'], ['48','Urarina'],
  ['49','Uro'], ['50','Vacacocha'], ['51','Wampis'],
  ['52','Yagua'], ['53','Yaminahua'], ['54','Yanesha'], ['55','Yine']
    ];
    
    // LENGUA INDÍGENA
    $lenguas = [
['1','Achuar'], ['2','Aimara'], ['3','Amahuaca'], ['4','Arabela'],
  ['5','Ashaninka'], ['6','Asheninka'], ['7','Awajún'], ['8','Bora'],
  ['9','Cashinahua'], ['10','Chamicuro'], ['11','Ese Eja'], ['12','Harakbut'],
  ['13','Ikitu'], ['14','Iñapari'], ['15','Iskonawa'], ['16','Jaqaru'],
  ['17','Kakataibo'], ['18','Kakinte'], ['19','Kandozi-Chapra'],
  ['20','Kapanawa'], ['21','Kawki'], ['22','Kukama - Kukamiria'],
  ['23','Madija'], ['24','Majiki'], ['25','Matsés'],
  ['26','Matsigenka'], ['27','Matsigenka Montetokuninri'],
  ['28','Munichi'], ['29','Murui-Muinani'], ['30','Nahua'],

  // 31–48
  ['31','Nomatsigenga'], ['32','Ocaina'], ['33','Omagua'],
  ['34','Quechua'], ['35','Resígaro'], ['36','Secoya'],
  ['37','Sharanahua'], ['38','Shawi'], ['39','Shipibo-Konibo'],
  ['40','Shiwilu'], ['41','Taushiro'], ['42','Ticuna'],
  ['43','Urarina'], ['44','Wampis'], ['45','Yagua'],
  ['46','Yaminahua'], ['47','Yanesha'], ['48','Yine']
    ];
    
    // Dividir etnias: 1-30 y 31-55
    $etnia_col1 = array_slice($etnias, 0, 30);
    $etnia_col2 = array_slice($etnias, 30);
    
    // Dividir lenguas: 1-30 y 31-48
    $lengua_col1 = array_slice($lenguas, 0, 30);
    $lengua_col2 = array_slice($lenguas, 30);
    
    $html = '';
    $max_rows = 30; // Máximo 30 filas
    
    for ($i = 0; $i < $max_rows; $i++) {
        $html .= '<tr>';
        
        // VARIABLE ÉTNICA - Columna 1 (códigos 1-30)
        if (isset($etnia_col1[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 8px;">' . ($etnia_col1[$i][0] == $cod_etnia_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 12px;">' . $etnia_col1[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px 2px; width: 60px;">' . $etnia_col1[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        // VARIABLE ÉTNICA - Columna 2 (códigos 31-55)
        if (isset($etnia_col2[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 8px;">' . ($etnia_col2[$i][0] == $cod_etnia_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 12px;">' . $etnia_col2[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px 2px; width: 60px;">' . $etnia_col2[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        // LENGUA INDÍGENA - Columna 3 (códigos 1-30)
        if (isset($lengua_col1[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 8px;">' . ($lengua_col1[$i][0] == $cod_lengua_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 12px;">' . $lengua_col1[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px 2px; width: 60px;">' . $lengua_col1[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        // LENGUA INDÍGENA - Columna 4 (códigos 31-48)
        if (isset($lengua_col2[$i])) {
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 8px;">' . ($lengua_col2[$i][0] == $cod_lengua_seleccionado ? 'X' : '') . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px; text-align: center; width: 12px;">' . $lengua_col2[$i][0] . '</td>';
            $html .= '<td style="border: 1px solid #000; padding: 0.5px 2px; width: 60px;">' . $lengua_col2[$i][1] . '</td>';
        } else {
            $html .= '<td colspan="3" style="border: 1px solid #000;"></td>';
        }
        
        $html .= '</tr>';
    }
    return $html;
}

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
        <img src="C:/xampp/htdocs/ultimogrados/img/utea.png" style="width: 150px; height: auto; margin-bottom: 10px;">
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
        <strong>De la Escuela Profesional de:</strong> ' . strtoupper($estudiante['Escuela'] ?? 'NO ESPECIFICADO') . '
    </div>
    
    <div class="info-line">
        <strong>Facultad:</strong> ' . strtoupper($estudiante['Facultad'] ?? 'NO ESPECIFICADO') . '
    </div>
    
    <div class="section">
        <div class="section-title">Declaro bajo juramento de ley autoidentificación étnica</div>
        <p style="font-size: 10pt; margin: 5px 0;">
            Seleccione el grupo étnico al que se autoidentifica, conforme a las opciones establecidas por el Ministerio de Cultura:
        </p>
        
        <div class="option">
            <span class="checkbox ' . ($det_etnica === 'A' ? 'checked' : '') . '">' . ($det_etnica === 'A' ? 'X' : '') . '</span>
            a) Un pueblo indígena u originario (especificar): <strong>' . ($det_etnica === 'A' ? $nombre_etnia : '') . '</strong>
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
            a) Sí (especificar): <strong>' . ($det_lengua === 'A' ? $nombre_lengua : '') . '</strong>
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
    
<div class="signature-section" style="margin-top: 100px;">
    <p style="text-align: right; margin-right: 20px;">Abancay, ' . $fecha_actual . '</p>
    <div class="signature-line" style="margin-top: 120px;"></div>
    <p><strong>Firma</strong></p>
</div>
    
    <!-- PÁGINA 2: SOLO TABLAS DE CÓDIGOS -->
    <div style="page-break-before: always;"></div>
    
    <p style="font-size: 8pt; margin: 5px 0 5px 0; text-align: center;"><strong>NOTA:</strong> Marcar con X la opción elegida.</p>
    
    <table style="width: 100%; border-collapse: collapse; font-size: 5.5pt;">
        <tr style="background-color: #f0f0f0;">
            <th colspan="6" style="border: 1px solid #000; padding: 3px; text-align: center; font-weight: bold; font-size: 7pt;">VARIABLE ÉTNICA</th>
            <th colspan="6" style="border: 1px solid #000; padding: 3px; text-align: center; font-weight: bold; font-size: 7pt;">LENGUA INDÍGENA</th>
        </tr>
        ' . generarFilasTablaCompleta($cod_etnia, $cod_lengua) . '
    </table>
    
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
