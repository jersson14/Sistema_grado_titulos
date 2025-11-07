<?php
require '../../model/model_registro_general.php';
require '../../src/PHPMailer.php';
require '../../src/SMTP.php';
require '../../src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$MRG = new Modelo_Registro_General(); // Instanciamos

// Obtener datos enviados desde JavaScript
$id = strtoupper(htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8'));
$nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
$correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');

// Validar registro
$consulta = $MRG->Validar_registro_titulo($id);
$config = include('../../config/config.php');
$enable_email = $config['enable_email']; // Leer de la configuración

if ($consulta) {
    if ($enable_email) { // Solo envía si está habilitado en la configuración
        try {
            $mail = new PHPMailer(true);
            $mail->isSMTP();
            $mail->Host = $config['smtp_host'];
            $mail->SMTPAuth = true;
            $mail->Username = $config['smtp_username'];
            $mail->Password = $config['smtp_password'];
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mail->Port = $config['smtp_port'];

            $mail->setFrom('uteaperu@gradosapp.fun', 'Oficina de Grados y Títulos - Universidad Tecnológica de los Andes');
            $mail->addAddress($correo);
            $mail->isHTML(true);
            $mail->CharSet = 'UTF-8';

            $mail->Subject = 'Confirmación de Registro - Oficina de Grados y Títulos';
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
                </style>
            </head>
            <body>
                <div class="content">
                    <img src="cid:logo_universidad" alt="Logo Universidad Tecnológica de los Andes"/><br><br>
                    <p><b>Estimado(a) Graduado(a), ' . $nombre . '</b></p>
                    <p>Su expediente fue aprobado y remitido a su Decanatura.</p>
                    <p>Atentamente,<br>
                    Oficina de Grados y Títulos<br>
                    Universidad Tecnológica de los Andes</p>
                </div>
                <div class="footer">
                    <p>Universidad Tecnológica de los Andes | Todos los derechos reservados</p>
                </div>
            </body>
            </html>';
            $mail->addEmbeddedImage('../../img/utea.png', 'logo_universidad', 'logo.png');

            $mail->send();
            $response = ['status' => true, 'message' => 'Validación exitosa y correo enviado correctamente', 'code' => 1];
        } catch (Exception $e) {
            $response = ['status' => true, 'message' => 'Validación exitosa pero error al enviar el correo: ' . $mail->ErrorInfo, 'code' => 1];
        }
    } else {
        $response = ['status' => true, 'message' => 'Validación exitosa pero el envío de correo está deshabilitado', 'code' => 1];
    }
} else {
    $response = ['status' => false, 'message' => 'Error al validar el registro del titulado', 'code' => 0];
}

header('Content-Type: application/json');
echo json_encode($response);
exit;