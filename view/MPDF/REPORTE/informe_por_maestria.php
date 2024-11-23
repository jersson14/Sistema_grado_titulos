<?php
setlocale(LC_TIME, 'es_ES.UTF-8'); // Establecer la configuración local para español
$current_year = date('Y');

require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php';
$html = '';
$info = $mysqli->real_escape_string($_GET['info']);
$grado = $mysqli->real_escape_string($_GET['grado']);
$fedes = $mysqli->real_escape_string($_GET['fedes']);
$fehas = $mysqli->real_escape_string($_GET['fehas']);

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
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
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
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
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
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe, 
	empresa.emp_logo
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
	Grado_academico = '$grado' AND expediente_posgrado.created_at BETWEEN '$fedes' AND '$fehas'
	
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC";
//CONVERSIÓN DE FECHA
date_default_timezone_set('America/Lima'); // Configura la zona horaria a Lima/Perú
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES.utf8', 'es_ES', 'spanish'); // Configura el locale para español
$fecha_actual = strftime('%d de %B de %Y'); // Obtiene la fecha actual en formato día de mes de año
$fecha_actual_minusculas = mb_strtolower($fecha_actual, 'UTF-8'); 

$resultado = $mysqli ->query($query);
while($row1 =$resultado->fetch_assoc()){
// Definir el contenido HTML para la primera página
$html.= '
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INFORME POSGRADO</title>
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
            <td style="font-family: \'Times New Roman\', Times, serif;font-size: 12px;"><b>'.$row1['Autoridad_3'].'<br></b><b>Director (e) de la Escuela de Posgrado</b></td>
        </tr>
        <tr>
            <td style="padding-right: 40px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;"><b>ASUNTO</b></td>
			<td style="padding-right: 0px;font-family: \'Times New Roman\', Times, serif;"><b>:</b></td>
            <td><b style="padding-right: 70px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">Conformidad de Expedientes de Grado de Maestro</b></td>
        </tr>
        <tr>
            <td><b style="padding-right: 40px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">FECHA</b></td>
			<td style="padding-right: 0px;font-family: \'Times New Roman\', Times, serif;"><b>:</b></td>
            <td><b style="padding-right: 70px;font-family: \'Times New Roman\', Times, serif;font-size: 12px;">Abancay, '.$fecha_actual_minusculas.'</b></td>
        </tr>

    </table>
    <hr>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mediante el presente me dirijo a usted, para saludarle coordialmente y en estricto cumplimiento al Reglamento General de Grados y Títulos y el Estatuto vigente, remito informe de conformidad de los expedientes para optar el grado de <b>MAESTRO</b> de acuerdo al siguiente detalle:</p>
    </div>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <u><b><br>EXPEDIENTES DE GRADO DE MAESTRO:</b></u>
    </div>
';

// Iniciar la tabla fuera del bucle
$html .= '<table border="1" style="width:100%; border-collapse:collapse; font-size: 8px; margin-top: 10px;">';
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
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
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
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
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
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe, 
	empresa.emp_logo
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
	Grado_academico = '$grado' AND expediente_posgrado.created_at BETWEEN '$fedes' AND '$fehas'
	
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC";
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
		<td style="text-align:center; padding: 5px;">' . $row2['posgrado'] . '</td>
		<td style="text-align:center; padding: 5px;">' . $row2['Denominación_grado'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['cede_nombre'] . '</td>
    </tr>
    ';
}

// Cerrar la tabla y el resto del HTML del documento
$html .= '
</table>
    <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 12px;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adjunto expedientes a fin de continuar con el trámite correspondiente, la aprobación por su Dirección y luego elevar al Consejo Universitario, a efecto de programar fecha y hora para la ceremonia.</p>
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
    'margin_left' => 30, // 4 cm
    'margin_right' => 30 // 4 cm
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
