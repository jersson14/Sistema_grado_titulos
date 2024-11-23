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
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Apellido_paterno, estudiante.Apellido_materno,estudiante.Nombres) AS Estudiante2,
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
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.id_informe,
informe.number_informe,
colacion.`año`,
colacion.id_colacion,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
colacion.estado,
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
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN informe
INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id
WHERE Grado_academico = 'BACHILLER' and cede.Id_cede = '$sede' AND colacion.fecha_colación='$fecha1'

ORDER BY
escuela_profesional.Grado_academico ASC,
expediente.Grado_bachiller_de ASC,
estudiante.Apellido_paterno ASC
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
    escuela_profesional.Denominación_grado,
    escuela_profesional.Cod_Escuela,
    escuela_profesional.Id_facultad,
    estudiante.Dni,
    estudiante.Codigo,
    CONCAT_WS(' ',estudiante.Apellido_paterno, estudiante.Apellido_materno,estudiante.Nombres) AS Estudiante2,
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
    autoridades.Autoridad_2,
    autoridades.Cargo_auto2,
    autoridades.Autoridad_3,
    autoridades.Cargo_auto3,
    informe.id_informe,
    informe.number_informe,
    colacion.año,
    colacion.id_colacion,
    colacion.nombre_colacion,
    colacion.fecha_colación,
    colacion.fecha_consejo_uni,
    colacion.fecha_firma_consejo,
    colacion.fecha_resolucion,
    colacion.numero_oficio,
    colacion.estado
FROM
    expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN informe 
WHERE Grado_academico = 'BACHILLER' and cede.Id_cede = '$sede' AND colacion.fecha_colación='$fecha1'
ORDER BY Grado_academico,Grado_bachiller_de,Apellido_paterno asc";
$resultado2 = $mysqli ->query($query2);
$contador=0;

// Iterar sobre los resultados y añadir cada fila de la tabla al HTML del PDF
while ($row2 = $resultado2->fetch_assoc()) {
    // Si la carrera ha cambiado, imprime el nombre de la carrera
    if ($last_career != $row2['Grado_bachiller_de']) {
        if ($last_career != '') {
            // Cierra la tabla de la carrera anterior si es necesario
            $html .= '</table><br><br>';
        }
        
        // Actualiza la carrera actual
        $last_career = $row2['Grado_bachiller_de'];
        
        // Imprime el nombre de la nueva carrera
        $html .= '
        <div style="text-align:left;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
            <u><b>BACHILLER EN ' . $last_career . '</b></u><br>
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


// Cerrar la tabla y el resto del HTML del documento
$html .= '
   <br><br><div class="justify-next" style="text-align: justify; font-family: Impact, sans-serif;">
            <h3 style="font-family: Impact; color: #0056E3;">TÍTULO PROFESIONAL</h3>
    </div>';

    $query3="SELECT
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
    escuela_profesional.Denominación_grado,
    escuela_profesional.Cod_Escuela,
    escuela_profesional.Id_facultad,
    estudiante.Dni,
    estudiante.Codigo,
    CONCAT_WS(' ',estudiante.Apellido_paterno, estudiante.Apellido_materno,estudiante.Nombres) AS Estudiante2,
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
    autoridades.Autoridad_2,
    autoridades.Cargo_auto2,
    autoridades.Autoridad_3,
    autoridades.Cargo_auto3,
    informe.id_informe,
    informe.number_informe,
    colacion.año,
    colacion.id_colacion,
    colacion.nombre_colacion,
    colacion.fecha_colación,
    colacion.fecha_consejo_uni,
    colacion.fecha_firma_consejo,
    colacion.fecha_resolucion,
    colacion.numero_oficio,
    colacion.estado
FROM
    expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN informe 
WHERE Grado_academico = 'TITULO' and cede.Id_cede = '$sede' AND colacion.fecha_colación='$fecha1'
ORDER BY Grado_academico,Titulo_de,Apellido_paterno asc";
$resultado3 = $mysqli ->query($query3);
$contador=0;

// Iterar sobre los resultados y añadir cada fila de la tabla al HTML del PDF
while ($row3 = $resultado3->fetch_assoc()) {
    // Si la carrera ha cambiado, imprime el nombre de la carrera
    if ($last_career2 != $row3['Titulo_de']) {
        if ($last_career2 != '') {
            // Cierra la tabla de la carrera anterior si es necesario
            $html .= '</table><br><br>';
        }
        
        // Actualiza la carrera actual
        $last_career2 = $row3['Titulo_de'];
        
        // Imprime el nombre de la nueva carrera
        $html .= '
        <div style="text-align:left;font-family: Arial, Helvetica, sans-serif;font-size: 14px;">
            <u><b>TÍTULO DE ' . $last_career2 . '</b></u><br>
        </div>
        <table border="1" style="width:100%; border-collapse:collapse; font-size: 10px; margin-top: 10px;">
            <tr>
                <th style="text-align:center; padding: 5px;"><b>NRO.</b></th>
                <th style="text-align:center; padding: 5px;"><b>DNI</b></th>
                <th style="text-align:center; padding: 5px;"><b>TITULADO</b></th>
                <th style="text-align:center; padding: 5px;"><b>CÓDIGO</b></th>
            </tr>
        ';
    }
    
    $contador++;
    
    // Añadir la fila de datos
    $html .= '
    <tr>
        <td style="text-align:center; padding: 5px;"><b>' . $contador . '</b></td>
        <td style="text-align:center; padding: 5px;">' . $row3['Dni'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row3['Estudiante2'] . '</td>
        <td style="text-align:center; padding: 5px;">' . $row3['Codigo'] . '</td>
    </tr>';
}

// Cerrar la última tabla si no está cerrada
if ($last_career2 != '') {
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
