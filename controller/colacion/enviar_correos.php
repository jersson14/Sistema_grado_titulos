<?php
require '../../src/PHPMailer.php';
require '../../src/SMTP.php';
require '../../src/Exception.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Conexión a la base de datos
require_once '../../model/model_conexion.php';

// Recibir datos POST
// Si los correos se envían como un array directamente, no hace falta json_decode()
$emails = isset($_POST['emails']) ? $_POST['emails'] : [];  // Asegurarse de que emails sea un array
$sede = $_POST['sede'] ?? '';  
$fecha1 = $_POST['fecha1'] ?? '';  
$hora = $_POST['hora'] ?? '';  
$fechaaper = $_POST['fechaaper'] ?? '';  

// Validar datos
if (empty($emails)) {
    echo json_encode(['status' => 'error', 'message' => 'No se proporcionaron correos electrónicos']);
    exit;
}

if (empty($sede) || empty($fecha1) || empty($hora) || empty($fechaaper)) {
    echo json_encode(['status' => 'error', 'message' => 'Faltan datos requeridos']);
    exit;
}

foreach ($emails as $email) {
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(['status' => 'error', 'message' => "El correo $email no es válido"]);
        exit;
    }
}

// Preparar correo
$mail = new PHPMailer(false);

try {
    // Configuraciones del servidor
    $mail->isSMTP();
    $config = include('../../config/config.php');
    $mail->Host = $config['smtp_host'];
    $mail->SMTPAuth = true;
    $mail->Username = $config['smtp_username'];
    $mail->Password = $config['smtp_password'];
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port = $config['smtp_port'];

    // Remitente
    $mail->setFrom($config['smtp_username'], 'Oficina de Grados y Títulos - Universidad Tecnológica de los Andes');

    // Destinatarios
    foreach ($emails as $email) {
        $mail->addAddress($email);
    }

    // Contenido
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';

    $mail->Subject = 'Confirmación de Registro - Oficina de Grados y Títulos';
    // Configurar locale para español
    setlocale(LC_TIME, 'es_ES.UTF-8');
    date_default_timezone_set('America/Lima');

   // Configurar formato en español usando IntlDateFormatter
$formatter = new IntlDateFormatter('es_ES', IntlDateFormatter::FULL, IntlDateFormatter::NONE);
$formatter->setPattern('EEEE, d \'de\' MMMM \'de\' yyyy');

// Formatear fechas
$fechaLarga = $formatter->format(new DateTime($fecha1));
$horaFormato12 = date('h:i A', strtotime($hora));
$fechaLarga2 = $formatter->format(new DateTime($fechaaper));
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
                <img src="cid:logo_universidad" alt="Logo Universidad Tecnológica de los Andes"/><br><br>
                <p><b>Estimado(a) Graduado(a), '.$nom.' '.$ape.' '.$mate.'.</b></p>
                <p>Se comunica a todos los Graduandos y Titulandos que los Diplomas  se vienen  procesando, para mayor información de fecha  y hora de colación ingrese a  transparencia de la Universidad Tecnológica de los Andes. 
                
                Usted podrá hacer seguimiento de su expediente a través del siguiente enlace:</p>
                <p><a href="https://gradosapp.fun/seguimiento.php" target="_blank">Hacer seguimiento (Clic)</a></p>
                
                <div class="note">
                    <p><strong>Nota importante:</strong> La lista de colación se le enviara al correo y a su vez saldrá en la página de Facebook de la Universidad puede visitarlo en el siguiente enlace: https://www.facebook.com/Utea.Abancay.
                    </p>
                </div>
                <div class="note">
                    <p><strong>Nota importante:</strong> Se adjunta a este correo el tutorial en PDF en la parte final, con instrucciones detalladas de cómo realizar el seguimiento de su expediente en nuestro sistema, revíselo cuidadosamente.</p>
                </div>
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
        $mail->addEmbeddedImage('../../img/utea.png', 'logo_universidad', 'logo.png');
        $rutaPDF = '../../manual_usuario.pdf'; // Ajusta esta ruta según donde tengas el PDF
        if (file_exists($rutaPDF)) {
            $mail->addAttachment($rutaPDF, 'Tutorial_Seguimiento_Expediente.pdf');
        } else {
            throw new Exception('No se pudo encontrar el archivo del tutorial');
        }
    // Enviar correo
    $mail->send();
    echo json_encode(['status' => 'success', 'message' => 'Correos enviados']);
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => "Error al enviar correos: {$e->getMessage()}"]);
}
