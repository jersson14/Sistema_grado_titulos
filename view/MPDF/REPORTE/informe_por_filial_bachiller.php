<?php
setlocale(LC_TIME, 'es_ES.UTF-8'); // Establecer la configuración local para español
$current_year = date('Y');

require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php';
$html = '';
$info = $mysqli->real_escape_string($_GET['info']);
$grado = $mysqli->real_escape_string($_GET['grado']);
$escu = $mysqli->real_escape_string($_GET['escu']);
$fil = $mysqli->real_escape_string($_GET['fil']);
$resp = $mysqli->real_escape_string($_GET['resp']);

$fedes = $mysqli->real_escape_string($_GET['fedes']);
$fehas = $mysqli->real_escape_string($_GET['fehas']);

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
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
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
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
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
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
empresa.emp_logo
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad
INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id
WHERE Grado_academico = '$grado' and escuela_profesional.Id_escuela='$escu' AND expediente.created_at BETWEEN '$fedes' AND '$fehas' AND expediente.Id_cede = '$fil'
ORDER BY diploma.estado, diploma.updated_at  desc";
//CONVERSIÓN DE FECHA
date_default_timezone_set('America/Lima'); // Configura la zona horaria a Lima/Perú
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES.utf8', 'es_ES', 'spanish'); // Configura el locale para español
$fecha_actual = strftime('%d de %B de %Y'); // Obtiene la fecha actual en formato día de mes de año
$fecha_actual_minusculas = mb_strtolower($fecha_actual, 'UTF-8'); 

$resultado = $mysqli ->query($query);
while($row1 =$resultado->fetch_assoc()){
    	$tituloMayuscula = strtoupper($row1['Grado_bachiller_de']);
        $nombreCede = ucfirst(strtolower($row1['cede_nombre']));

// Definir el contenido HTML para la primera página
$html.= '
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INFORME BACHILLERES</title>
    <style>
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px; /* Espacio entre imagen y texto */
        }
        .header img {
            height: 120px;
        }
        .header-text {
            text-align: center;
            font-family: \'Times New Roman\', Times, serif;
        }
        .header-table td {
            padding-bottom: 10px; /* Espacio entre filas */
        }
        hr {
            border-color: black; /* Cambiar color de la línea */
            margin-top: 0px; /* Reducir margen superior del hr */
        }
        .justify-next {
            margin-top: 0; /* Eliminar margen superior */
        }
    </style>
</head>
<body>
        <div class="header" style="margin-top: 0; padding-top: 0;">
    <img src="../../../'. $row1['emp_logo'] .'" alt="Logo" style="text-align: left; width: 350px;">
    <div class="header-text" style="margin-top: 0; padding-top: 0;">
        <p style="margin-top: 0; margin-bottom: 0;font-size: 12px;"><b>SECRETARIA GENERAL</b></p>
        <p style="margin-top: 0; margin-bottom: 0;font-size: 12px;"><b>UNIDAD DE GRADOS Y TITULOS</b></p>
    </div>
</div>
    <div style="text-align:left;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
    <u><b>INFORME N° ' . $info . '-' . $current_year . '-UTEA-SG-GyT</b></u>
    </div><br>
    <table class="header-table" style="font-family: Arial, Helvetica, sans-serif;">
        <tr>
            <td style="padding-right: 40px;font-family: \'Times New Roman\', Times, serif;"><b>A</b></td>
			<td style="padding-right: 0px;font-family: \'Times New Roman\', Times, serif;"><b>:</b></td>
            <td style="font-family: \'Times New Roman\', Times, serif;font-size: 12px;"><b>'.$resp.'<br></b><b>Responsable de Grados y Títulos</b></td>
        </tr>
        <tr>
            <td style="padding-right: 40px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;"><b>ASUNTO</b></td>
			<td style="padding-right: 0px;font-family: \'Times New Roman\', Times, serif;"><b>:</b></td>
            <td><b style="padding-right: 70px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">Conformidad de Expedientes de Grado de Bachiller en '.$row1['Grado_bachiller_de'].'</b></td>
        </tr>
        <tr>
            <td><b style="padding-right: 40px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">FECHA</b></td>
			<td style="padding-right: 0px;font-family: \'Times New Roman\', Times, serif;"><b>:</b></td>
            <td><b style="padding-right: 70px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">'.$nombreCede.', '.$fecha_actual_minusculas.'</b></td>
        </tr>

    </table>
    <hr>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Me dirijo a usted para saludarle y, en estricto cumplimiento al Reglamento General de Grados y Títulos y al Estatuto vigente, remito informe de conformidad de expedientes para optar el Grado de Bachiller en <b>'.$row1['Grado_bachiller_de'].'</b>, Programa Profesional de <b>'.$row1['Escuela'].'</b> de acuerdo al siguiente detalle:</p>
    </div>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <u><b><br>EXPEDIENTE DE BACHILLER EN '.mb_strtoupper($tituloMayuscula).'</b></u>
    </div>
';

// Iniciar la tabla fuera del bucle
$html .= '<table border="1" style="width:100%; border-collapse:collapse; font-size: 10px; margin-top: 10px;">';
$html .= '
    <tr>
        <th style="text-align:center; padding: 5px;"><b>NRO.</b></th>
        <th style="text-align:center; padding: 5px;"><b>APELLIDO PATERNO</b></th>
        <th style="text-align:center; padding: 5px;"><b>APELLIDO MATERNO</b></th>
        <th style="text-align:center; padding: 5px;"><b>NOMBRES</b></th>
        <th style="text-align:center; padding: 5px;"><b>DNI</b></th>
		<th style="text-align:center; padding: 5px;"><b>CÓDIGO</b></th>
    	<th style="text-align:center; padding: 5px;"><b>PROGRAMA</b></th>
		<th style="text-align:center; padding: 5px;"><b>DENOMINACIÓN</b></th>
		<th style="text-align:center; padding: 5px;"><b>SEDE</b></th>
    </tr>
';
$query2="SELECT
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
	expediente.created_at as expe, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	escuela_profesional.Id_escuela, 
	escuela_profesional.Nombre AS Escuela2, 
	escuela_profesional.Grado_academico, 
	escuela_profesional.Denominación_grado, 
	escuela_profesional.Grado_academico, 
	escuela_profesional.Cod_Escuela, 
	escuela_profesional.Id_facultad, 
	estudiante.Dni, 
	estudiante.Codigo, 
	CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante, 
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
	diploma.años_trans,
	diploma.mes_trans,
	diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días')as tiempotrancurrido,
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
	autoridades.Autoridad_2, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3
FROM
	expediente
	INNER JOIN
	escuela_profesional
	ON 
		expediente.Id_escuela = escuela_profesional.Id_escuela
	INNER JOIN
	estudiante
	ON 
		expediente.Dni = estudiante.Dni
	INNER JOIN
	cede
	ON 
		expediente.Id_cede = cede.Id_cede
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
	INNER JOIN
	modalidad
	ON 
		expediente.Id_expediente = modalidad.Id_expediente
	INNER JOIN
	diploma
	ON 
		modalidad.Id_modalidad = diploma.id_modalidad
	INNER JOIN
	autoridades
	ON 
		facultad.Cod_autoridad = autoridades.Cod_autoridad
WHERE Grado_academico = '$grado' and escuela_profesional.Id_escuela='$escu' AND expediente.created_at BETWEEN '$fedes' AND '$fehas' and expediente.Id_cede = '$fil'
ORDER BY diploma.estado, diploma.updated_at  desc";
$resultado2 = $mysqli ->query($query2);
$contador=0;

// Iterar sobre los resultados y añadir cada fila de la tabla al HTML del PDF
while ($row2 = $resultado2->fetch_assoc()) {
	$contador++;

    $html .= '
    <tr>
        <td style="text-align:center; padding: 5px;"><b>'.$contador.'</b></td>
        <td style="text-align:center; padding: 5px;">' . $row2['Apellido_paterno'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['Apellido_materno'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['Nombres'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['Dni'] . '</td>
		<td style="text-align:center; padding: 5px;">' . $row2['Codigo'] . '</td>
		<td style="text-align:center; padding: 5px;">' . $row2['Escuela2'] . '</td>
		<td style="text-align:center; padding: 5px;">' . $row2['Denominación_grado'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['cede_nombre'] . '</td>
    </tr>
    ';
}

// Cerrar la tabla y el resto del HTML del documento
$html .= '
</table>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adjunto expedientes a fin de continuar con el trámite correspondiente, la aprobación por su Facultad y luego elevar al Consejo Universitario, a efecto de programar fecha y hora para la ceremonia.</p>
    </div>
    <div class="justify-next" style="text-align:justify;text-align:center; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <p><br><br>Atentamente,</p>
    </div>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 8px;">
        <p><br><br><br><br><br><br><br><br><br><br><br>FLC/GyT</p>
    </div>
</body>

    <</html>';
}
// Crear una instancia de mPDF con márgenes de 4 cm a la izquierda y derecha
$mpdf = new \Mpdf\Mpdf([
    'mode' => 'utf-8',
    'format' => 'A4', // A4 landscape
    'margin_left' => 32, // 4 cm
    'margin_right' => 32 // 4 cm
]);

// Establecer el pie de página
$mpdf->SetHTMLFooter('
<div class="" style="text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 8px;">
        <p style="text-align:center;"><b>UNIVERSIDAD TECNOLÓGICA DE LOS ANDES</b></p>
        <p style="text-align:center;">Ciudad Universitaria Av Perú N° 7OO, Abancay, Central Telefónica 051 (083) 321559</p>
        <p style="text-align:center;">Filial Cusco Av Grau N° 516, Teléfono (084) 251565</p>
        <p style="text-align:center;">Filial Andahuaylas, san Jerónimo Jr. catalay N° 1OO Teléfono (083) 421752</p>
        <p style="text-align:center;">www.utea.edu.pe</p>

    </div>
');

// Escribir el contenido HTML de la primera página en el PDF
$mpdf->WriteHTML($html);

// Generar el archivo PDF y mostrarlo en el navegador
$mpdf->Output();
