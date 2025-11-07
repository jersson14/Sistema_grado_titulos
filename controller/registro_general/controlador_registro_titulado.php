<?php
require '../../model/model_registro_general.php';
require '../../src/PHPMailer.php';
require '../../src/SMTP.php';
require '../../src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$MRG = new Modelo_Registro_General(); // Instanciamos

// DATOS DE ESTUDIANTE
$tipodoc = strtoupper(htmlspecialchars($_POST['tipodoc'], ENT_QUOTES, 'UTF-8'));
$documentoFinal = strtoupper(htmlspecialchars($_POST['documentoFinal'], ENT_QUOTES, 'UTF-8'));
$nombres = strtoupper(htmlspecialchars($_POST['nombres'], ENT_QUOTES, 'UTF-8'));
$apepa = strtoupper(htmlspecialchars($_POST['apepa'], ENT_QUOTES, 'UTF-8'));
$apema = strtoupper(htmlspecialchars($_POST['apema'], ENT_QUOTES, 'UTF-8'));
$codigo = strtoupper(htmlspecialchars($_POST['codigo'], ENT_QUOTES, 'UTF-8'));
$sexo = strtoupper(htmlspecialchars($_POST['sexo'], ENT_QUOTES, 'UTF-8'));
$celular = strtoupper(htmlspecialchars($_POST['celular'], ENT_QUOTES, 'UTF-8'));
$direc = strtoupper(htmlspecialchars($_POST['direc'], ENT_QUOTES, 'UTF-8'));
$emaper = htmlspecialchars($_POST['emaper'], ENT_QUOTES, 'UTF-8');
$emainsti = htmlspecialchars($_POST['emainsti'], ENT_QUOTES, 'UTF-8');
$fecha_matr = strtoupper(htmlspecialchars($_POST['fecha_matr'], ENT_QUOTES, 'UTF-8'));
$fecha_egre = strtoupper(htmlspecialchars($_POST['fecha_egre'], ENT_QUOTES, 'UTF-8'));
$observa = strtoupper(htmlspecialchars($_POST['observa'], ENT_QUOTES, 'UTF-8'));
// DATOS DE EXPEDIENTE
$ced = strtoupper(htmlspecialchars($_POST['ced'], ENT_QUOTES, 'UTF-8'));
$esc = strtoupper(htmlspecialchars($_POST['esc'], ENT_QUOTES, 'UTF-8'));
$titu = htmlspecialchars($_POST['titu'], ENT_QUOTES, 'UTF-8');
$moda = strtoupper(htmlspecialchars($_POST['moda'], ENT_QUOTES, 'UTF-8'));
$idauto = strtoupper(htmlspecialchars($_POST['idauto'], ENT_QUOTES, 'UTF-8'));
$fecha = strtoupper(htmlspecialchars($_POST['fecha'], ENT_QUOTES, 'UTF-8'));
$acad = strtoupper(htmlspecialchars($_POST['acad'], ENT_QUOTES, 'UTF-8'));
$acu = strtoupper(htmlspecialchars($_POST['acu'], ENT_QUOTES, 'UTF-8'));
$res = strtoupper(htmlspecialchars($_POST['res'], ENT_QUOTES, 'UTF-8'));
$exped = strtoupper(htmlspecialchars($_POST['exped'], ENT_QUOTES, 'UTF-8'));
$lib = strtoupper(htmlspecialchars($_POST['lib'], ENT_QUOTES, 'UTF-8'));
$fol = strtoupper(htmlspecialchars($_POST['fol'], ENT_QUOTES, 'UTF-8'));
$reg = strtoupper(htmlspecialchars($_POST['reg'], ENT_QUOTES, 'UTF-8'));
$nombrearchivo = htmlspecialchars($_POST['nombrearchivo'], ENT_QUOTES, 'UTF-8');

// DATOS DE LA MODALIDAD
$mod_estu = strtoupper(htmlspecialchars($_POST['mod_estu'], ENT_QUOTES, 'UTF-8'));
$tra_inv = strtoupper(htmlspecialchars($_POST['tra_inv'], ENT_QUOTES, 'UTF-8'));
$turn = strtoupper(htmlspecialchars($_POST['turn'], ENT_QUOTES, 'UTF-8'));
$porc = strtoupper(htmlspecialchars($_POST['porc'], ENT_QUOTES, 'UTF-8'));
$cent = strtoupper(htmlspecialchars($_POST['cent'], ENT_QUOTES, 'UTF-8'));
$meta = htmlspecialchars($_POST['meta'], ENT_QUOTES, 'UTF-8');
$proce_bach = strtoupper(htmlspecialchars($_POST['proce_bach'], ENT_QUOTES, 'UTF-8'));
$proce_insti = strtoupper(htmlspecialchars($_POST['proce_insti'], ENT_QUOTES, 'UTF-8'));
$proce_titu = strtoupper(htmlspecialchars($_POST['proce_titu'], ENT_QUOTES, 'UTF-8'));
$fecha_matri = strtoupper(htmlspecialchars($_POST['fecha_matri'], ENT_QUOTES, 'UTF-8'));
$fecha_inici = strtoupper(htmlspecialchars($_POST['fecha_inici'], ENT_QUOTES, 'UTF-8'));
$fecha_fin = strtoupper(htmlspecialchars($_POST['fecha_fin'], ENT_QUOTES, 'UTF-8'));
$mod_sustenta = strtoupper(htmlspecialchars($_POST['mod_sustenta'], ENT_QUOTES, 'UTF-8'));
$idusuario = strtoupper(htmlspecialchars($_POST['idusuario'], ENT_QUOTES, 'UTF-8'));

$ruta = 'controller/registro_general/documentos/' . $nombrearchivo;

$consulta = $MRG->Registrar_Titulado($tipodoc,$documentoFinal, $nombres, $apepa, $apema, $codigo, $sexo, $celular, $direc, $emaper, $emainsti, $fecha_matr, $fecha_egre, $observa, $ced, $esc, $titu, $moda, $idauto, $fecha, $acad, $acu, $res, $exped, $lib, $fol, $reg, $ruta, $mod_estu, $tra_inv, $turn, $porc, $cent, $meta, $proce_bach, $proce_insti, $proce_titu, $fecha_matri, $fecha_inici, $fecha_fin, $mod_sustenta, $idusuario);

$config = include('../../config/config.php');
$enable_email = $config['enable_email']; // Leer de la configuración

if ($consulta) {
    if ($nombrearchivo != "") {
        move_uploaded_file($_FILES['achivoobj']['tmp_name'], "documentos/" . $nombrearchivo);
    }
    if ($enable_email) { // Solo envía si está habilitado en la configuración

    try {
        $mail = new PHPMailer(true);

        // Configuración del servidor SMTP
        $mail->isSMTP();
        $mail->Host = $config['smtp_host'];
        $mail->SMTPAuth = true;
        $mail->Username = $config['smtp_username'];
        $mail->Password = $config['smtp_password'];
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port = $config['smtp_port'];

        // Configuración del correo
        $mail->setFrom('uteaperu@gradosapp.fun', 'Oficina de Grados y Títulos - Universidad Tecnológica de los Andes');
        $mail->addAddress($emaper); // Correo del estudiante
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $mail->Subject = 'Confirmación de Registro - Oficina de Grados y Títulos';
        
        // Cuerpo del mensaje con el logo de la universidad
        $mail->Body = '
        <html>
        <head>
            <meta charset="UTF-8">
            <style>
                .content {
                    font-family: Arial, sans-serif;
                    color: #333;
                }
                .footer {
                    font-size: 12px;
                    color: #888;
                    margin-top: 20px;
                }

                .note {
                    background-color: #f8f9fa;
                    padding: 15px;
                    border-left: 4px solid #c9b701;
                    margin: 20px 0;
                }
            </style>
        </head>
        <body>
            <div class="content">
                <img src="cid:logo_universidad" alt="Logo Universidad Tecnológica de los Andes" class="university-logo"/><br><br>
    
                <p><b>Estimado(a) Graduado(a), '.$nombres.' '.$apepa.' '.$apema.'.</b></p>
    
                <p>Previo un cordial saludo, se comunica a todo los Bachilleres y Titulandos que su  expediente fue aprobado y se remitió a su Decanatura.</p>
    
    


                <p>Le agradecemos por su paciencia y compromiso.</p>
    
                <p>Atentamente,<br>
                Oficina de Grados y Títulos<br>
                Universidad Tecnológica de los Andes</p><br>
                <p>Contacto en la Sede Central de Abancay: <b>970 639 067</b> (Unidad de Grados y Títulos)</p>
                <p>Contacto en la Filial de Andahuaylas: <b>957 306 881</b> (Unidad de Grados y Títulos)</p>
                <p>Contacto en la Filial de Cusco: <b>970 639 067</b> (Unidad de Grados y Títulos)</p>
            </div>
            <div class="footer">
                <p>Universidad Tecnológica de los Andes | Todos los derechos reservados</p>
            </div>
        </body>
        </html>';
        
        // Adjuntar el logo como una imagen incrustada
        $mail->addEmbeddedImage('../../img/utea.png', 'logo_universidad', 'logo.png');

        // Adjuntar el PDF del tutorial
   

        $mail->send();
        
        $response = array(
            'status' => true,
            'message' => 'Registro exitoso de titulado y correo enviado correctamente',
            'code' => 1
        );
    } catch (Exception $e) {
        $response = array(
            'status' => true,
            'message' => 'Registro exitoso pero hubo un error al enviar el correo: ' . $mail->ErrorInfo,
            'code' => 1
        );
    }
    } else {
        $response = ['status' => true, 'message' => 'Registro exitoso pero el envío de correo está deshabilitado', 'code' => 1];
    }
} else {
    $response = array(
        'status' => false,
        'message' => 'Error al realizar el registro del titulado',
        'code' => 0
    );
}

// Enviar la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);
exit;

?>