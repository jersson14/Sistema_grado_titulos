<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../conexion.php'; // Incluye tu archivo de conexión si es necesario
$codigo = $mysqli->real_escape_string($_GET['codigo']);

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
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
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
        $mpdf->SetXY(10, 60);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -330px;">' . $day . '</h1>');
        
        $mpdf->SetXY(50, 63.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -35px;">' . $month . '</h1>');
        
        $mpdf->SetXY(50, 63.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: 320px;">' . $year . '</h1>');
        $mpdf->SetXY(0, 81);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 27px;margin-left: -70px;">'.$row1['Denominación_grado'].'</h1>');

        $estudiante = ucwords(strtolower($row1['Estudiante']));
        $mpdf->SetXY(0, 89.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 37px;margin-left: -70px;">'.$estudiante.'</h1>');
        
        $mpdf->SetXY(0, 104);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 27px;margin-left: -70px;">'.$row1['Facultad'].'</h1>');
        
        $mpdf->SetXY(0, 112.5);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 27px;margin-left: -70px;">'.$row1['Escuela'].'</h1>');



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
        $mpdf->SetXY(0, 140);
        $mpdf->WriteHTML('<h1 style="font-size: 20px;margin-left: 270px;">'.$day.'</h1>');

        $mpdf->SetXY(0, 140);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: -60px;">'.$month.'</h1>');

        $mpdf->SetXY(0, 140);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 20px;margin-left: 330px;">'.$year.'</h1>');

        $autoridad1 = ucwords(strtolower($row1['Autoridad_1']));
        $autoridad2 = ucwords(strtolower($row1['Autoridad_2']));
        $autoridad3 = ucwords(strtolower($row1['Autoridad_3']));
        $mpdf->SetXY(0, 160);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: 510px;">'. $autoridad3 .'</h1>');

        $mpdf->SetXY(0, 176);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -70px;">'. $autoridad2 .'</h1>');

        $mpdf->SetXY(0, 176);
        $mpdf->WriteHTML('<h1 style="text-align:center;font-size: 12px;margin-left: -665px;">'. $autoridad1 .'</h1>');
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
$mpdf->Output('BACHILLER.pdf', 'I'); // 'I' para mostrar en el navegador
