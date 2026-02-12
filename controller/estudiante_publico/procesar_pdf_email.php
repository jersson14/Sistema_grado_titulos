<?php
/**
 * Procesar PDF y Correo - Declaración Étnica
 * Este archivo es llamado después de guardar el estudiante
 */

// Desactivar salida de errores al navegador para prevenir JSON inválido
error_reporting(0);
ini_set('display_errors', 0);

// Log personalizado
function log_msg($msg) {
    file_put_contents(__DIR__ . '/../../debug_pdf_email.log', date('[Y-m-d H:i:s] ') . $msg . PHP_EOL, FILE_APPEND);
}

log_msg("Inicio de procesamiento para DNI: " . ($_POST['dni'] ?? 'NO_DNI'));

// Configurar zona horaria
date_default_timezone_set('America/Lima');

// Limpiar cualquier salida previa
if (ob_get_length()) ob_clean();

header('Content-Type: application/json');

require_once __DIR__ . '/../../src/PHPMailer.php';
require_once __DIR__ . '/../../src/SMTP.php';
require_once __DIR__ . '/../../src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

try {
    // Recibir datos
    $dni = isset($_POST['dni']) ? $_POST['dni'] : '';
    $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : '';
    $nombres = isset($_POST['nombres']) ? $_POST['nombres'] : '';
    $apellido_paterno = isset($_POST['apellido_paterno']) ? $_POST['apellido_paterno'] : '';
    $apellido_materno = isset($_POST['apellido_materno']) ? $_POST['apellido_materno'] : '';
    $correo_personal = isset($_POST['correo_personal']) ? $_POST['correo_personal'] : '';

    if (empty($dni)) {
        log_msg("Error: DNI requerido");
        echo json_encode(['success' => false, 'error' => 'DNI requerido']);
        exit;
    }

    // Generar PDF
    log_msg("Generando PDF...");
    $_GET['dni'] = $dni;
    $_GET['nivel'] = isset($_POST['nivel']) ? $_POST['nivel'] : 'PREGRADO';
    
    // Buffer para capturar salida del generador PDF
    ob_start();
    include __DIR__ . '/../../view/MPDF/REPORTE/declaracion_etnica.php';
    $pdf_response = ob_get_clean();
    
    log_msg("Respuesta raw del generador PDF: " . substr($pdf_response, 0, 100) . "...");
    
    $pdf_data = json_decode($pdf_response, true);
    
    if (!$pdf_data || !isset($pdf_data['success']) || !$pdf_data['success']) {
        log_msg("Error generando PDF. JSON inválido o success false.");
        echo json_encode(['success' => false, 'error' => 'Error generando PDF: ' . substr(strip_tags($pdf_response), 0, 200)]);
        exit;
    }
    
    $pdf_url = $pdf_data['filepath'];
    $pdf_fullpath = __DIR__ . '/../../' . $pdf_data['filepath'];
    log_msg("PDF generado en: " . $pdf_fullpath);
    
    // Enviar correo
    $email_sent = false;
    if (!empty($correo_personal) && file_exists($pdf_fullpath)) {
        log_msg("Intentando enviar correo a: " . $correo_personal);
        try {
            $mail = new PHPMailer(true);
            $config = include(__DIR__ . '/../../config/config.php');
            
            $mail->isSMTP();
            $mail->Host = $config['smtp_host'];
            $mail->SMTPAuth = true;
            $mail->Username = $config['smtp_username'];
            $mail->Password = $config['smtp_password'];
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mail->Port = $config['smtp_port'];
            
            $mail->setFrom('uteaperu@gradosapp.fun', 'Oficina de Grados y Títulos - UTEA');
            $mail->addAddress($correo_personal);
            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';
            
            $mail->Subject = 'Confirmación de Registro - Declaración Jurada Étnica';
            
            // Ruta del logo
            $logo_path = __DIR__ . '/../../img/utea.png';
            $cid_logo = 'utea_logo';
            if (file_exists($logo_path)) {
                $mail->addEmbeddedImage($logo_path, $cid_logo);
            }
            
            $nombre_completo = strtoupper($nombres . ' ' . $apellido_paterno . ' ' . $apellido_materno);
            
            $mail->Body = '
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 0; background-color: #f4f4f4; }
        .container { max-width: 600px; margin: 20px auto; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); overflow: hidden; }
        .header { background-color: #ffffff; padding: 20px; text-align: center; border-bottom: 3px solid #722f37; }
        .header img { max-height: 80px; }
        .content { padding: 30px; }
        .h2 { color: #722f37; margin-top: 0; }
        .info-box { background-color: #f9f9f9; border-left: 4px solid #722f37; padding: 15px; margin: 20px 0; }
        .footer { background-color: #333; color: #fff; text-align: center; padding: 15px; font-size: 12px; }
        .contact-item { margin-top: 10px; font-size: 14px; }
        .contact-location { font-weight: bold; }
        .contact-phone { color: #722f37; font-weight: bold; margin-left: 5px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="cid:' . $cid_logo . '" alt="Logo UTEA">
        </div>
        <div class="content">
            <h2>Estimado/a ' . $nombre_completo . ':</h2>
            
            <p>Reciba un cordial saludo de la <strong>Oficina de Grados y Títulos</strong> de la Universidad Tecnológica de los Andes.</p>
            
            <p>Le confirmamos que su <strong>Declaración Jurada de Variable Étnica y Lengua Indígena</strong> ha sido registrada y procesada correctamente en nuestro sistema.</p>
            
            <div class="info-box">
                <p><strong>Detalles del Registro:</strong></p>
                <ul style="list-style: none; padding-left: 0;">
                    <li><strong>DNI:</strong> ' . $dni . '</li>
                    <li><strong>Código de Estudiante:</strong> ' . $codigo . '</li>
                    <li><strong>Fecha de Emisión:</strong> ' . date('d/m/Y H:i A') . '</li>
                </ul>
            </div>
            
            <p>Adjunto a este correo encontrará su declaración jurada en formato PDF. Le recomendamos guardar este documento para sus archivos personales.</p>
            
            <p style="font-size: 0.9em; color: #666; margin-top: 30px;">
                Si usted no realizó este trámite, por favor comuníquese inmediatamente con nosotros:
            </p>

            <div class="contact-item">
                <span class="contact-location">📍 Sede Abancay:</span>
                <span class="contact-phone">970 639 067</span>
            </div>
            
            <div class="contact-item">
                <span class="contact-location">📍 Filial Andahuaylas:</span>
                <span class="contact-phone">957 306 881</span>
            </div>
            
            <div class="contact-item">
                <span class="contact-location">📍 Filial Cusco:</span>
                <span class="contact-phone">970 669 439</span>
            </div>
        </div>
        <div class="footer">
            <p> universidad Tecnológica de los Andes<br>Oficina de Grados y Títulos</p>
            <p>&copy; ' . date('Y') . ' Todos los derechos reservados.</p>
        </div>
    </div>
</body>
</html>';
            
            $mail->addAttachment($pdf_fullpath, 'Declaracion_Jurada_' . $dni . '.pdf');
            $mail->send();
            $email_sent = true;
            log_msg("Correo enviado exitosamente.");
        } catch (Exception $e) {
            log_msg("Error enviando correo: " . $e->getMessage());
        }
    } else {
        log_msg("No se envía correo: Correo vacío o PDF no existe.");
    }
    
    echo json_encode([
        'success' => true,
        'pdf_url' => $pdf_url,
        'email_sent' => $email_sent
    ]);
    
} catch (Exception $e) {
    log_msg("Excepción general: " . $e->getMessage());
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}

