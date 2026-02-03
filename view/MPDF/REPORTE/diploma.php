<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php'; // Incluye tu archivo de conexión si es necesario
$codigo = $mysqli->real_escape_string($_GET['codigo']);
$tamaño = $mysqli->real_escape_string($_GET['tamaño']);
$tamaño2 = $mysqli->real_escape_string($_GET['tamaño2']);
$tamaño3 = $mysqli->real_escape_string($_GET['tamaño3']);
$tamaño4 = $mysqli->real_escape_string($_GET['tamaño4']);

use Mpdf\Mpdf;
$query="SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Abreviatura_grado,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.genero1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.genero2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.genero3,
empresa.emp_cod
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON autoridades.Cod_autoridad = expediente.id_autoridad
INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id
WHERE
diploma.Id_Diploma = '$codigo'";
// Ruta al archivo PDF existente que deseas modificar
$archivoPdf = 'diploma.pdf';

// Crear una instancia de mPDF con orientación paisaje
$fontDir = __DIR__ . '/../vendor/mpdf/mpdf/ttfonts/';

// Asegúrate de registrar la fuente correctamente
$mpdf = new \Mpdf\Mpdf([
    'orientation' => 'L',
    'margin_left' => 50,
    'margin_right' => 0,
    'margin_bottom' => 0,
    'fontDir' => [$fontDir],

    'fontCache' => __DIR__ . '/../tmp/cache'
]);
$mpdf->AddFont('timesnewroman', '', 'Timesnewroman.ttf', true);

$mpdf->AddFont('mtcorsva', '', 'Mtcorsva.ttf', true);
$mpdf->AddFont('eduardian', '', 'Eduardian.ttf', true);

// Obtener el número de páginas del PDF existente
$pagecount = $mpdf->SetSourceFile($archivoPdf);
$resultado = $mysqli ->query($query);
while($row1 =$resultado->fetch_assoc()){
// Iterar sobre cada página del PDF
for ($i = 1; $i <= $pagecount; $i++) {
    if ($i > 1) {
        $mpdf->AddPage(); // Añadir una nueva página después de la primera
    }
    
    $tplId = $mpdf->ImportPage($i); // Importar la página del PDF existente
    $mpdf->UseTemplate($tplId);

    // Contenido específico para la primera página
    if ($i == 1) {

        $fecha_consejo_uni = $row1['fecha_consejo_uni'];
        // Crear una instancia de DateTime a partir de la fecha proporcionada
        $date = new DateTime($fecha_consejo_uni);
                // Obtener el día, mes y año por separado
        $day = $date->format('d'); // Día
        $monthNum = $date->format('m'); // Número del mes
        $year = $date->format('Y'); // Año
                // Convertir el número del mes al nombre del mes en español
        $months = [
            1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
            5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
            9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
        ];
        $month = $months[(int)$monthNum];
        
        // Utilizar las variables para insertar en el PDF
        $mpdf->SetXY(10, 64);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 23.94px;margin-left: -330px;font-family: mtcorsva;">' . $day . '</h1>');
        
        $mpdf->SetXY(50, 66);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 29.26px;margin-left: -35px;font-family: mtcorsva;">' . $month . '</h1>');
        
        $mpdf->SetXY(50, 67.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 26px;margin-left: 320px;font-family: eduardian;">' . $year . '</h1>');
        $mpdf->SetXY(0, $tamaño3);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: '.$tamaño4.'px;margin-left: -70px;font-family: mtcorsva;">'.$row1['Titulo_de'].'</h1>');
     function mb_ucwords($string, $encoding = 'UTF-8') {
    $words = explode(' ', mb_strtolower($string, $encoding)); // Convierte todo a minúsculas
    $capitalizedWords = array_map(function($word) use ($encoding) {
        return mb_strtoupper(mb_substr($word, 0, 1, $encoding), $encoding) . mb_substr($word, 1, null, $encoding);
    }, $words);
    return implode(' ', $capitalizedWords);
}

// Usamos la función personalizada
$estudiante = mb_ucwords($row1['Estudiante'], 'UTF-8');

// Renderiza el texto del estudiante
$mpdf->SetXY(0, $tamaño2);
$mpdf->WriteHTML('<h1 style="text-align:center; font-size: '.$tamaño.'px;margin-left: -70px;font-family: mtcorsva;">'.$estudiante.'</h1>');


        $mpdf->SetXY(0, 110);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 40px;margin-left: -70px;font-family: mtcorsva;">'.$row1['Facultad'].'</h1>');
        
        $mpdf->SetXY(0, 120.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 36px;margin-left: -70px;font-family: mtcorsva;">'.$row1['Escuela'].'</h1>');



        $fecha_firma = $row1['fecha_firma'];
        // Crear una instancia de DateTime a partir de la fecha proporcionada
        $date = new DateTime($fecha_firma);
                // Obtener el día, mes y año por separado
        $day = $date->format('d'); // Día
        $monthNum = $date->format('m'); // Número del mes
        $year = $date->format('Y'); // Año
                // Convertir el número del mes al nombre del mes en español
        $months = [
            1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
            5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
            9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
        ];
        $month = $months[(int)$monthNum];
        $mpdf->SetXY(0, 149);
        $mpdf->WriteHTML('<h1 style="font-size: 23.94px;margin-left: 270px;font-family: mtcorsva;">'.$day.'</h1>');

        $mpdf->SetXY(0, 147);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 29.26px;margin-left: -60px;font-family: mtcorsva;">'.$month.'</h1>');

        $mpdf->SetXY(0, 148);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 26px;margin-left: 330px;font-family: eduardian;">'.$year.'</h1>');

  $autoridad1 = mb_convert_case($row1['Autoridad_1'], MB_CASE_TITLE, "UTF-8");
  
          $autoridad1 = str_replace(['Del', 'De La', 'La'], ['del', 'de la', 'la'], $autoridad1);

        $genero1 = $row1['genero1']; // Suponiendo que tienes un campo 'Genero_1' en $row1
        
        // Determinar el título basado en el género
        if ($genero1 === 'FEMENINO') {
            $titulo1 = 'Rectora';
        } else if ($genero1 === 'MASCULINO') {
            $titulo1 = 'Rector';
        } else {
            $titulo1 = 'Rector/Rectora'; // Por si no se especifica el género
        }
        $autoridad2 = ucwords(strtolower($row1['Autoridad_2']));
        $genero2 = $row1['genero2']; // Suponiendo que tienes un campo 'Genero_1' en $row1
        
        // Determinar el título basado en el género
        if ($genero2 === 'FEMENINO') {
            $titulo2 = 'Secretaria General';
        } else if ($genero2 === 'MASCULINO') {
            $titulo2 = 'Secretario General';
        } else {
            $titulo2 = 'Secretario/Secretario General'; // Por si no se especifica el género
        }
        $autoridad3 = ucwords(strtolower($row1['Autoridad_3']));
        $genero3 = $row1['genero3']; // Suponiendo que tienes un campo 'Genero_1' en $row1
        
        // Determinar el título basado en el género
        if ($genero3 === 'FEMENINO') {
            $titulo = 'Decana de Facultad';
        } else if ($genero3 === 'MASCULINO') {
            $titulo = 'Decano de Facultad';
        } else {
            $titulo = 'Decano/Decana de Facultad'; // Por si no se especifica el género
        }
        
        // Generar el contenido en el PDF
                $autoridad3 = str_replace(['Del', 'De La', 'La'], ['del', 'de la', 'la'], $autoridad3);

        $mpdf->SetXY(0, 175);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: 610px;">'. $autoridad3 .'</h1>');
        
        $mpdf->SetXY(0, 176.5);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: 610px;font-family: tempting;">' . $titulo . '</p>');


        $autoridad2 = str_replace(['Del', 'De La', 'La'], ['del', 'de la', 'la'], $autoridad2);
        
        // Asegurar que "M. Sc." esté correctamente formateado
        $autoridad2 = preg_replace('/\bM\s*\.\s*Sc\b/i', 'M. Sc.', $autoridad2);
        
        // Convertir a título con iniciales en mayúscula y resto en minúscula, manteniendo caracteres acentuados correctamente
        $autoridad2 = mb_convert_case($autoridad2, MB_CASE_TITLE, "UTF-8");
        
        $mpdf->SetXY(0, 179);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -70px;">'. $autoridad2 .'</h1>');



        $mpdf->SetXY(0, 181);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -70px;font-family: tempting;">' . $titulo2 . '</p>');
        

        $mpdf->SetXY(0, 179);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -675px;">' . $autoridad1. '</h1>');

        $mpdf->SetXY(0, 181);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -675px;font-family: tempting;">' . $titulo1 . '</p>');
    } elseif ($i == 2) {
        // Contenido específico para la segunda página
        $mpdf->SetXY(10, 42);

        $mpdf->WriteHTML('<h1 style="font-size: 14.67px;margin-left: 173px;font-family: timesnewroman;">00'.$row1['Diploma_numero'].'</h1>');

        $mpdf->SetXY(10, 42.5);
        $mpdf->WriteHTML('<h1 style="font-size: 14.67px;margin-left: 680px;font-family: timesnewroman;">0'.$row1['emp_cod'].'</h1>');


        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -665px;font-family: timesnewroman;">C.U.</h1>');

       $resolucionNumero = $row1['Resolucion_numero'];
        $formattedResolucion = str_pad($resolucionNumero, 4, '0', STR_PAD_LEFT);
        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -510px;font-family: timesnewroman;">'.$formattedResolucion.'</h1>');


       // Asumiendo que $row1['fecha_resolucion'] contiene una fecha en formato 'Y-m-d' (por ejemplo, '2024-07-13')
        $fecha_resolucion = $row1['fecha_resolucion'];
        // Dividir la fecha en componentes (año, mes, día)
        list($year, $month, $day) = explode('-', $fecha_resolucion);
        // Formatear la fecha en el formato deseado 'día-mes-año'
        $formattedDate = $day . '-' . $month . '-' . $year;
        $mpdf->SetXY(0, 51.3);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 13px;margin-left: -225px;font-family: timesnewroman;">' . $formattedDate . '</h1>');


        $mpdf->SetXY(0, 50.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 185px;font-family: timesnewroman;">D.N.I</h1>');

        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 600px;font-family: timesnewroman;">'.$row1['Dni'].'</h1>');


        $mpdf->SetXY(0, 59.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -630px;font-family: timesnewroman;">'.$row1['Registro_libro'].'</h1>');
        
        $mpdf->SetXY(0, 59.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -260px;font-family: timesnewroman;">'.$row1['Registro_folio'].'</h1>');

        $mpdf->SetXY(0, 59.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 165px;font-family: timesnewroman;">'.$row1['Abreviatura_grado'].'</h1>');

        $modalidad = ucwords(strtoupper($row1['Modalidad']));

        // Dividir el texto en dos partes

        
        // Crear el texto dividido en dos líneas
        if ($modalidad=="TESIS")

        {

            $mpdf->SetXY(0, 60);
            $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: 585px;font-family: timesnewroman;">' . $modalidad . '</h1>');
        }else{

            $mpdf->SetXY(0, 60.5);
            $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 10px;margin-left: 585px;font-family: timesnewroman;">' . $modalidad . '</h1>');
        }
     
        
        $mpdf->SetXY(0, 67.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -525px;font-family: timesnewroman;">'.$row1['Registro_numero'].'</h1>');

     $mpdf->SetXY(0, 68);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 480px;font-family: timesnewroman;">'.$row1['Diploma_tipo_emitido'].'</h1>');
     
        $mpdf->SetXY(0, 118);
        $mpdf->WriteHTML('<h1 style="text-align:center; font-size: 14.67px; margin-left: -680px; font-style: italic;">' . $autoridad2 . '</h1>');
        
        $mpdf->SetXY(0, 121);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -680px;font-family: tempting;">' . $titulo2 . '</p>');


        $fecha_secretaria = $row1['fecha_secreatria_general'];
        // Crear una instancia de DateTime a partir de la fecha proporcionada
        $date = new DateTime($fecha_secretaria);
                // Obtener el día, mes y año por separado
        $day = $date->format('d'); // Día
        $monthNum = $date->format('m'); // Número del mes
        $year = $date->format('Y'); // Año
                // Convertir el número del mes al nombre del mes en español
        $months = [
            1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
            5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
            9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
        ];
        $month = $months[(int)$monthNum];
        $mpdf->SetXY(0, 85);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -850px;font-family: timesnewroman;">'.$day.'</h1>');

        $mpdf->SetXY(0, 85);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -580px;font-family: timesnewroman;">'.$month.'</h1>');

        $mpdf->SetXY(0, 85);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -275px;font-family: timesnewroman;">'.$year.'</h1>');

    }

    // Puedes agregar más contenido si es necesario para otras páginas
}
}
// Salida del PDF modificado en el navegador
$mpdf->Output('TIULO_PROFESIONAL.pdf', 'I'); // 'I' para mostrar en el navegador
