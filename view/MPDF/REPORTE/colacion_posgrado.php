<?php
setlocale(LC_TIME, 'es_ES.UTF-8'); // Establecer la configuración local para español
$current_year = date('Y');

require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php';
$html = '';
$last_career='';
$last_career2='';
$sede = $mysqli->real_escape_string($_GET['sede']);
$fecha1 = $mysqli->real_escape_string($_GET['fecha1']);
$hora = $mysqli->real_escape_string($_GET['hora']);
$fechaaper = $mysqli->real_escape_string($_GET['fechaaper']);


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
	Grado_academico = 'MAESTRIA' AND cede.Id_cede = '$sede' AND colacion_posgrado.fecha_colación='$fecha1'

ORDER BY
programa_posgrado.`Denominación_grado` ASC,
expediente_posgrado.Grado_maestro_de ASC,
estudiante_posgrado.Apellido_paterno ASC
";
//CONVERSIÓN DE FECHA
date_default_timezone_set('America/Lima'); // Configura la zona horaria a Lima/Perú

// Configura el locale para español
setlocale(LC_TIME, 'es_ES.UTF-8', 'es_ES.utf8', 'es_ES', 'spanish'); 
$fecha_actual = strftime('%B de %Y'); // Obtiene la fecha actual en formato día de mes de año
$fecha_actual_minusculas = mb_strtolower($fecha_actual, 'UTF-8'); 
// Ejemplo de fecha desde la base de datos en formato 'Y-m-d'

$resultado = $mysqli ->query($query);
while($row1 =$resultado->fetch_assoc()){
    $fecha_colacion = $row1['fecha_colación']; // Por ejemplo: '2024-04-05'

// Convertir la fecha a un timestamp
$timestamp_colacion = strtotime($fecha_colacion);

// Formatear la fecha en formato largo en español
$fecha_colacion_formateada = strftime('%d de %B de %Y', $timestamp_colacion);

// Convertir la fecha formateada a mayúsculas
$fecha_colacion_formateada_mayuscula = mb_strtoupper($fecha_colacion_formateada, 'UTF-8');
// Definir el contenido HTML para la primera página
$html.= '
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COLACIÓN  ' . $fecha_colacion_formateada_mayuscula . '</title>
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
    <div class="header">
        <img src="../../../'. $row1['emp_logo'] .'" alt="Logo" style="text-align: left; width: 400px;">
        <div class="header-text">
            <p style="margin-top: 0; margin-bottom: 0;font-size: 14px;"><b>SECRETARIA GENERAL</b></p>
            <p style="margin-top: 0; margin-bottom: 0;font-size: 14px;"><b>UNIDAD DE GRADOS Y TITULOS</b></p>
        </div>
    </div>
    <div style="text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
        <u><b>LISTA GENERAL DE GRADOS Y TITULOS</b></u><br>
        <u><b>CEREMONIA DE COLACIÓN ' . $fecha_colacion_formateada_mayuscula . '</b></u>
    </div><br>
   
    <div class="justify-next" style="text-align: justify; font-family: Impact, sans-serif;">
            <h3 style="font-family: Impact; color: #0056E3;">'.$row1['cede_nombre'].'</h3>
            <h3 style="font-family: Impact; color: #0056E3;">GRADO ACADÉMICO</h3>
    </div>

    ';


// Iniciar la tabla fuera del bucle

$query2="SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante2, 
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
	Grado_academico = 'MAESTRIA' AND cede.Id_cede = '$sede' AND colacion_posgrado.fecha_colación='$fecha1'

ORDER BY
programa_posgrado.`Denominación_grado` ASC,
expediente_posgrado.Grado_maestro_de ASC,
estudiante_posgrado.Apellido_paterno ASC";
$resultado2 = $mysqli ->query($query2);
$contador=0;

// Iterar sobre los resultados y añadir cada fila de la tabla al HTML del PDF
while ($row2 = $resultado2->fetch_assoc()) {
    // Si la carrera ha cambiado, imprime el nombre de la carrera
    if ($last_career != $row2['Grado_maestro_de']) {
        if ($last_career != '') {
            // Cierra la tabla de la carrera anterior si es necesario
            $html .= '</table><br><br>';
        }
        
        // Actualiza la carrera actual
        $last_career = $row2['Grado_maestro_de'];
        
        // Imprime el nombre de la nueva carrera
        $html .= '
        <div style="text-align:left;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
            <u><b>MAESTRO EN ' . $last_career . '</b></u><br>
        </div>
        <table border="1" style="width:100%; border-collapse:collapse; font-size: 10px; margin-top: 10px;">
            <tr>
                <th style="text-align:center; padding: 5px;"><b>NRO.</b></th>
                <th style="text-align:center; padding: 5px;"><b>DNI</b></th>
                <th style="text-align:center; padding: 5px;"><b>BACHILLER</b></th>
                <th style="text-align:center; padding: 5px;"><b>CÓDIGO</b></th>
            </tr>
        ';
    }
    
    $contador++;
    
    // Añadir la fila de datos
    $html .= '
    <tr>
        <td style="text-align:center; padding: 5px;"><b>' . $contador . '</b></td>
        <td style="text-align:center; padding: 5px;">' . $row2['Dni'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['Estudiante2'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row2['Codigo'] . '</td>
    </tr>';
}

// Cerrar la última tabla si no está cerrada
if ($last_career != '') {
    $html .= '</table>';
}


// Crea un objeto DateTime a partir de la fecha
$fecha = new DateTime($fecha1);

// Obtén el día del mes en número
$dia = $fecha->format('j'); // 'j' para obtener el día del mes sin ceros a la izquierda

// Obtén el mes en número
$mesNumero = $fecha->format('n'); // 'n' para obtener el mes en número sin ceros a la izquierda

// Mapear el número del mes a nombre en español
$meses = [
    1 => 'Enero',
    2 => 'Febrero',
    3 => 'Marzo',
    4 => 'Abril',
    5 => 'Mayo',
    6 => 'Junio',
    7 => 'Julio',
    8 => 'Agosto',
    9 => 'Septiembre',
    10 => 'Octubre',
    11 => 'Noviembre',
    12 => 'Diciembre'
];

$mes = $meses[$mesNumero];
$mesminu=mb_strtolower($mes); 
// Muestra el resultado
// Crea un objeto DateTime a partir de la hora
$fechaHora = new DateTime($hora);

// Obtén la hora en formato de 12 horas con AM/PM
$horaAmPm = $fechaHora->format('g:i A'); 
$horaminu=mb_strtolower($horaAmPm); 


$fecha11 = new DateTime($fechaaper);

// Formatea la fecha con el día en número y el mes en letra
$fechaFormateada = strftime('%d de %B', $fecha11->getTimestamp());

    $html .= '
<br><br><div class="justify-next" style="text-align: justify; font-family: Impact, sans-serif;">
            <h3 style="font-family: Impact; color: #B60A04;">IMPORTANTE</h3>
    </div>
     <div class="justify-next" style="text-align:justify; font-family: \'Times New Roman\', Times, serif; margin-top: 0;font-size: 13px;">
        <p>Para la firma de sus respectivos diplomas y el libro de registro de grados y títulos,
        deberán apersonarse a la Unidad de Grados y Títulos el '.$fechaFormateada.' en hora de oficina.
        </p>
        <p>La ceremonia se cumplirá el '.$dia.' de '.$mesminu.' a las '.$horaminu.' en el auditorio José María
        Arguedas, para ello se ruega puntual asistencia (se iniciará en la hora citada con los
        presentes y no se aceptará ninguna reprogramación por tardanza). 
        </p>
            <p><b>Contacto para más información:
        </b></p>
        <p>970 639 067 (Unidad de Grados y Títulos)
        </p>
    </div>

    <div style="text-align:center;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
    <i>Ciudad universitaria, '.$fecha_actual_minusculas.'</i>
    </div>
 </body>
 
     <</html>';
}
// Crear una instancia de mPDF con márgenes de 4 cm a la izquierda y derecha
$mpdf = new \Mpdf\Mpdf([
    'mode' => 'utf-8',
    'format' => 'A4', // A4
    'margin_left' => 32, // 4 cm
    'margin_right' => 32, // 4 cm
    'margin_bottom' => 27 // 5 cm
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
