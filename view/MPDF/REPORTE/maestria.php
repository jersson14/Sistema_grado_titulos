<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php'; // Incluye tu archivo de conexión si es necesario
$codigo = $mysqli->real_escape_string($_GET['codigo']);
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
	diploma_posgrado.Id_Diploma = '$codigo'";
// Ruta al archivo PDF existente que deseas modificar
$archivoPdf = 'maestria.pdf';

// Crear una instancia de mPDF con orientación paisaje
$mpdf = new \Mpdf\Mpdf([
    'orientation' => 'L', // Orientación paisaje
    'margin_left' => 50,  // Margen izquierdo en milímetros
    'margin_right' => 0,  // Margen derecho en milímetros
    'margin_bottom' => 0, // Margen inferior en milímetros (sin límite)
]);

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
        $mpdf->SetXY(10, 68);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -475px;">' . $day . '</h1>');
        
        $mpdf->SetXY(50, 72);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -185px;">' . $month . '</h1>');
        
        $mpdf->SetXY(50, 72);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: 170px;">' . $year . '</h1>');
        $mpdf->SetXY(0, 87);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 30px;margin-left: -150px;">'.$row1['posgrado'].'</h1>');

        $estudiante = ucwords(strtolower($row1['Estudiante']));
        $mpdf->SetXY(0, $tamaño2);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: '.$tamaño.'px;margin-left: -150px;">'.$estudiante.'</h1>');
        
    



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
        $mpdf->SetXY(0, 130);
        $mpdf->WriteHTML('<h1 style="font-size: 20px;margin-left: 190px;">'.$day.'</h1>');

        $mpdf->SetXY(0, 130);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -210px;">'.$month.'</h1>');

        $mpdf->SetXY(0, 130);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: 180px;">'.$year.'</h1>');

        $autoridad1 = ucwords(strtolower($row1['Autoridad_1']));
        $autoridad2 = ucwords(strtolower($row1['Autoridad_2']));
        $autoridad3 = ucwords(strtolower($row1['Autoridad_3']));
        $mpdf->SetXY(0, 160);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: 440px;">'. $autoridad3 .'</h1>');

        $mpdf->SetXY(0, 170);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -150px;">'. $autoridad2 .'</h1>');

        $mpdf->SetXY(0, 170);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -710px;">'. $autoridad1 .'</h1>');
    } elseif ($i == 2) {
        // Contenido específico para la segunda página
        $mpdf->SetXY(10, 42);
        $mpdf->WriteHTML('<h1 style="font-size: 14px;margin-left: 173px;">00'.$row1['Diploma_numero'].'</h1>');

        $mpdf->SetXY(10, 42);
        $mpdf->WriteHTML('<h1 style="font-size: 14px;margin-left: 680px;">0'.$row1['emp_cod'].'</h1>');


        $mpdf->SetXY(0, 49.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -665px;">C.U.</h1>');

        $mpdf->SetXY(0, 49.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -510px;">'.$row1['Resolucion_numero'].'</h1>');

       // Asumiendo que $row1['fecha_resolucion'] contiene una fecha en formato 'Y-m-d' (por ejemplo, '2024-07-13')
        $fecha_resolucion = $row1['fecha_resolucion'];
        // Dividir la fecha en componentes (año, mes, día)
        list($year, $month, $day) = explode('-', $fecha_resolucion);
        // Formatear la fecha en el formato deseado 'día-mes-año'
        $formattedDate = $day . '-' . $month . '-' . $year;
        $mpdf->SetXY(0, 49.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -225px;">' . $formattedDate . '</h1>');


        $mpdf->SetXY(0, 49.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 185px;">D.N.I</h1>');

        $mpdf->SetXY(0, 49.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 600px;">'.$row1['Dni'].'</h1>');


        $mpdf->SetXY(0, 57);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -630px;">'.$row1['Registro_libro'].'</h1>');
        
        $mpdf->SetXY(0, 57);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -260px;">'.$row1['Registro_folio'].'</h1>');

        $mpdf->SetXY(0, 57);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 165px;">'.$row1['Abreviatura_grado'].'</h1>');

        $modalidad = ucwords(strtolower($row1['Modalidad']));

        $mpdf->SetXY(0, 57);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 585px;">'.$modalidad.'</h1>');

        $mpdf->SetXY(0, 64);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -525px;">'.$row1['Registro_numero'].'</h1>');

        $mpdf->SetXY(0, 64);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 300px;">'.$row1['Abreviatura_modo_estudio'].'</h1>');

        $mpdf->SetXY(0, 64);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: 680px;">'.$row1['Diploma_tipo_emitido'].'</h1>');
     
        $mpdf->SetXY(0, 112);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -680px;">'. $autoridad2 .'</h1>');


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
        $mpdf->SetXY(0, 77.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -850px;">'.$day.'</h1>');

        $mpdf->SetXY(0, 77.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -580px;">'.$month.'</h1>');

        $mpdf->SetXY(0, 77.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 14px;margin-left: -275px;">'.$year.'</h1>');





    }

    // Puedes agregar más contenido si es necesario para otras páginas
}
}
// Salida del PDF modificado en el navegador
$mpdf->Output('TIULO_PROFESIONAL.pdf', 'I'); // 'I' para mostrar en el navegador
