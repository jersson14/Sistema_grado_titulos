<?php
require_once __DIR__ . '/../vendor/autoload.php';
$fontPath = __DIR__ . '/../view/MPDF/fonts/Mtcorsva.ttf';

require_once '../conexion.php'; // Incluye tu archivo de conexión si es necesario
$codigo_raw = isset($_GET['codigo']) ? $_GET['codigo'] : '';
if (empty($codigo_raw) || $codigo_raw === 'undefined' || $codigo_raw === 'null' || !is_numeric($codigo_raw)) {
    die('<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Error</title></head><body style="font-family:Arial;padding:40px;text-align:center;"><h2 style="color:#c0392b;">&#9888; Error al generar el diploma</h2><p>No se pudo obtener el ID del diploma (codigo=' . htmlspecialchars($codigo_raw) . ').</p><p>Esto ocurre cuando el stored procedure utilizado no retorna el campo <strong>Id_Diploma</strong>.<br>Verifique que el SP activo incluya <code>diploma_posgrado.Id_Diploma</code> en su SELECT.</p><p><button onclick="window.close()">Cerrar</button></p></body></html>');
}
$codigo = $mysqli->real_escape_string($codigo_raw);
$tamaño = $mysqli->real_escape_string($_GET['tamaño']);
$tamaño2 = $mysqli->real_escape_string($_GET['tamaño2']);
use Mpdf\Mpdf;
$query="SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni AS FECHA_CONSEJO, 
	diploma_posgrado.fecha_firma AS FECHAFIRMA, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion as FECHA_RESO, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio AS OFICIO, 
	diploma_posgrado.fecha_secreatria_general AS FECHA_SECRE, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1,
	autoridades.genero1,
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
		autoridades.genero2,
	autoridades.Cargo_auto3, 
			autoridades.genero3,
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe, 
	empresa.emp_logo,
	empresa.emp_cod
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	empresa
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad AND
		empresa.empresa_id = autoridades.Id_empresa,
	informe_posgrado
WHERE
	diploma_posgrado.Id_Diploma = '$codigo'";
// Ruta al archivo PDF existente que deseas modificar
$archivoPdf = 'maestria2.pdf';
$fontDir = __DIR__ . '/../vendor/mpdf/mpdf/ttfonts/';

// Crear una instancia de mPDF con orientación paisaje
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
$mpdf->AddFont('tempting', '', 'Tempting.ttf', true);


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

        $fecha_consejo_uni = $row1['FECHA_CONSEJO'];
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
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 23.94px;margin-left: -475px;font-family: mtcorsva;">' . $day . '</h1>');
        
        $mpdf->SetXY(50, 66);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 29.26px;margin-left: -185px;font-family: mtcorsva;">' . $month . '</h1>');
        
        $mpdf->SetXY(50, 67.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 26px;margin-left: 170px;font-family: eduardian;">' . $year . '</h1>');
        $mpdf->SetXY(0, 85);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 41px;margin-left: -150px;font-family: mtcorsva;">'.$row1['posgrado'].'</h1>');

        $estudiante = mb_convert_case(
    mb_strtolower($row1['Estudiante'], 'UTF-8'),
    MB_CASE_TITLE,
    'UTF-8'
);

        $mpdf->SetXY(0, $tamaño2);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: '.$tamaño.'px;margin-left: -150px;font-family: mtcorsva;">'.$estudiante.'</h1>');

        
    



        $fecha_firma = $row1['FECHAFIRMA'];
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
        $mpdf->SetXY(0, 134);
        $mpdf->WriteHTML('<h1 style="font-size: 23.94px;margin-left: 190px;font-family: mtcorsva;">'.$day.'</h1>');

        $mpdf->SetXY(0, 131.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 29.26px;margin-left: -210px;font-family: mtcorsva;">'.$month.'</h1>');

        $mpdf->SetXY(0, 132.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 26px;margin-left: 180px;font-family: eduardian;">'.$year.'</h1>');

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
            $titulo = 'Directora de la Escuela de Posgrado';
        } else if ($genero3 === 'MASCULINO') {
            $titulo = 'Director de la Escuela de Posgrado';
        } 
        
// Normalizar a minúsculas
        $autoridad3 = mb_strtolower($autoridad3, 'UTF-8');
        
        // Reemplazar palabras específicas con minúsculas exactas
        $autoridad3 = str_replace(['del', 'de la', 'la'], ['del', 'de la', 'la'], $autoridad3);
        
        // Poner solo iniciales en mayúscula
        $autoridad3 = mb_convert_case($autoridad3, MB_CASE_TITLE, 'UTF-8');
        
        // Generar el contenido en el PDF
        $mpdf->SetXY(0, 173);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: 460px;">' . $autoridad3 . '</h1>');

        
        $mpdf->SetXY(0, 174);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: 455px;font-family: tempting;">' . $titulo . '</p>');


        $autoridad2 = str_replace(['Del', 'De La', 'La'], ['del', 'de la', 'la'], $autoridad2);
        
        // Asegurar que "M. Sc." esté correctamente formateado
        $autoridad2 = preg_replace('/\bM\s*\.\s*Sc\b/i', 'M. Sc.', $autoridad2);
        
        // Convertir a título con iniciales en mayúscula y resto en minúscula, manteniendo caracteres acentuados correctamente
        $autoridad2 = mb_convert_case($autoridad2, MB_CASE_TITLE, "UTF-8");
        
        $mpdf->SetXY(0, 174);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -180px;">'. $autoridad2 .'</h1>');

        $mpdf->SetXY(0, 176);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -180px;font-family: tempting;">' . $titulo2 . '</p>');
        

        $mpdf->SetXY(0,174);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -778px;">' . $autoridad1. '</h1>');
        
        
        $mpdf->SetXY(0, 174);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -770px;font-family: tempting;">' . $titulo1. '</p>');
    } elseif ($i == 2) {
        // Contenido específico para la segunda página
        $mpdf->SetXY(10, 42.5);
        $mpdf->WriteHTML('<h1 style="font-size: 14.67px;margin-left: 173px;font-family: timesnewroman;">00'.$row1['Diploma_numero'].'</h1>');

        $mpdf->SetXY(10, 42);
        $mpdf->WriteHTML('<h1 style="font-size: 14.67px;margin-left: 680px;font-family: timesnewroman;">0'.$row1['emp_cod'].'</h1>');


        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -665px;font-family: timesnewroman;">C.U.</h1>');

  $resolucionNumero = $row1['Resolucion_numero'];
        $formattedResolucion = str_pad($resolucionNumero, 4, '0', STR_PAD_LEFT);
        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -510px;font-family: timesnewroman;">'.$formattedResolucion.'</h1>');

       // Asumiendo que $row1['fecha_resolucion'] contiene una fecha en formato 'Y-m-d' (por ejemplo, '2024-07-13')
        $fecha_resolucion = $row1['FECHA_RESO'];
        // Dividir la fecha en componentes (año, mes, día)
        list($year, $month, $day) = explode('-', $fecha_resolucion);
        // Formatear la fecha en el formato deseado 'día-mes-año'
        $formattedDate = $day . '-' . $month . '-' . $year;
        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 13px;margin-left: -225px;font-family: timesnewroman;">' . $formattedDate . '</h1>');


        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 185px;font-family: timesnewroman;">D.N.I</h1>');

        $mpdf->SetXY(0, 51);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 600px;font-family: timesnewroman;">'.$row1['Dni'].'</h1>');


        $mpdf->SetXY(0, 59);
$registro = str_pad($row1['Registro_libro'], 3, '0', STR_PAD_LEFT);
$mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -630px;font-family: timesnewroman;">'.$registro.'</h1>');

        
        $mpdf->SetXY(0, 59);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -260px;font-family: timesnewroman;">'.$row1['Registro_folio'].'</h1>');

        $mpdf->SetXY(0, 59);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 165px;font-family: timesnewroman;">'.$row1['Abreviatura_grado'].'</h1>');

        $modalidad = ucwords(strtolower($row1['Modalidad']));

        $mpdf->SetXY(0, 59);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 585px;font-family: timesnewroman;">'.$modalidad.'</h1>');

        $mpdf->SetXY(0, 67.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -525px;font-family: timesnewroman;">'.$row1['Registro_numero'].'</h1>');

   
        $mpdf->SetXY(0, 68);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: 480px;font-family: timesnewroman;">'.$row1['Diploma_tipo_emitido'].'</h1>');
     
        $mpdf->SetXY(0, 118);
        $mpdf->WriteHTML('<h1 style="text-align:center; font-size: 14.67px; margin-left: -680px; font-style: italic;">'. $autoridad2 .'</h1>');
        $mpdf->SetXY(0, 120);
        $mpdf->WriteHTML('<p style="text-align:center;font-size: 17px;margin-left: -680px;font-family: tempting;">' . $titulo2 . '</p>');


        $fecha_secretaria = $row1['FECHA_SECRE'];
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
        $mpdf->SetXY(0, 84.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -850px;font-family: timesnewroman;">'.$day.'</h1>');

        $mpdf->SetXY(0, 84.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -580px;font-family: timesnewroman;">'.$month.'</h1>');

        $mpdf->SetXY(0, 84.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14.67px;margin-left: -275px;font-family: timesnewroman;">'.$year.'</h1>');





    }

    // Puedes agregar más contenido si es necesario para otras páginas
}
}
// Salida del PDF modificado en el navegador
$mpdf->Output('MAESTRIA.pdf', 'I'); // 'I' para mostrar en el navegador
