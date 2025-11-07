<?php
require '../../model/model_registro_general.php';
require '../../src/PHPMailer.php';
require '../../src/SMTP.php';
require '../../src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$MRG = new Modelo_Registro_General(); // Instanciamos

// Captura de datos del formulario
$idexpe = strtoupper(htmlspecialchars($_POST['idexpe'], ENT_QUOTES, 'UTF-8'));
$id = strtoupper(htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8'));
$fechacu = strtoupper(htmlspecialchars($_POST['fechacu'], ENT_QUOTES, 'UTF-8'));
$fechafirma = strtoupper(htmlspecialchars($_POST['fechafirma'], ENT_QUOTES, 'UTF-8'));
$numreso = strtoupper(htmlspecialchars($_POST['numreso'], ENT_QUOTES, 'UTF-8'));
$fechareso = strtoupper(htmlspecialchars($_POST['fechareso'], ENT_QUOTES, 'UTF-8'));
$diplonum = strtoupper(htmlspecialchars($_POST['diplonum'], ENT_QUOTES, 'UTF-8'));
$regis = strtoupper(htmlspecialchars($_POST['regis'], ENT_QUOTES, 'UTF-8'));
$regilibro = strtoupper(htmlspecialchars($_POST['regilibro'], ENT_QUOTES, 'UTF-8'));
$regisfolio = strtoupper(htmlspecialchars($_POST['regisfolio'], ENT_QUOTES, 'UTF-8'));
$tipodiplo = strtoupper(htmlspecialchars($_POST['tipodiplo'], ENT_QUOTES, 'UTF-8'));
$fechainiciotra = strtoupper(htmlspecialchars($_POST['fechainiciotra'], ENT_QUOTES, 'UTF-8'));
$nrocred = strtoupper(htmlspecialchars($_POST['nrocred'], ENT_QUOTES, 'UTF-8'));
$nrooficio = strtoupper(htmlspecialchars($_POST['nrooficio'], ENT_QUOTES, 'UTF-8'));
$fechasecre = strtoupper(htmlspecialchars($_POST['fechasecre'], ENT_QUOTES, 'UTF-8'));
$fechamatri = strtoupper(htmlspecialchars($_POST['fechamatri'], ENT_QUOTES, 'UTF-8'));
$fechaegre = strtoupper(htmlspecialchars($_POST['fechaegre'], ENT_QUOTES, 'UTF-8'));

$idusuario = strtoupper(htmlspecialchars($_POST['idusuario'], ENT_QUOTES, 'UTF-8'));
$correo = strtoupper(htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8'));
$fechacol = strtoupper(htmlspecialchars($_POST['fechacol'], ENT_QUOTES, 'UTF-8'));
$nom = strtoupper(htmlspecialchars($_POST['nom'], ENT_QUOTES, 'UTF-8'));
$ape = strtoupper(htmlspecialchars($_POST['ape'], ENT_QUOTES, 'UTF-8'));
$mate = strtoupper(htmlspecialchars($_POST['mate'], ENT_QUOTES, 'UTF-8'));

// Registro en la base de datos
$consulta = $MRG->Agregar_diploma_Titulo($idexpe, $id, $fechacu, $fechafirma, $numreso, $fechareso, $diplonum, $regis, $regilibro, $regisfolio, $tipodiplo, $fechainiciotra, $nrocred, $nrooficio, $fechasecre,$fechamatri,$fechaegre, $idusuario);

header('Content-Type: application/json');
$enable_email = false; // Cambia esto a `true` para habilitar el envío de correos

if ($consulta) {
    if ($enable_email) {


    try {
        $mail = new PHPMailer(true);

        // Configuración del servidor SMTP
        $mail->isSMTP();
        $config = include('../../config/config.php');

        $mail->Host = $config['smtp_host'];
        $mail->SMTPAuth = true;
        $mail->Username = $config['smtp_username'];
        $mail->Password = $config['smtp_password'];
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port = $config['smtp_port'];

        // Configuración del correo
        $mail->setFrom('uteaperu@gradosapp.fun', 'Oficina de Grados y Títulos - Universidad Tecnológica de los Andes');
        $mail->addAddress($correo);
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $mail->Subject = 'Confirmación de Registro - Oficina de Grados y Títulos';

        // Función para formatear fecha
        function formatearFechaCompleta($fecha) {
            $fecha_obj = new DateTime($fecha);
            $dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
            $meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

            return $dias[(int)$fecha_obj->format('w')] . " " . $fecha_obj->format('d') . " de " . $meses[(int)$fecha_obj->format('n') - 1] . " del " . $fecha_obj->format('Y');
        }

        $fecha_formateada = formatearFechaCompleta($fechacol);

        // Cuerpo del mensaje
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
                
                <div class="note">
                    <p><strong>Nota importante:</strong> La lista de colación saldrá en la página de Facebook de la Universidad puede visitarlo en el siguiente enlace: https://www.facebook.com/Utea.Abancay.
                    </p>
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

        // Adjuntar PDF
        $rutaPDF = '../../manual_usuario.pdf';
        if (file_exists($rutaPDF)) {
            $mail->addAttachment($rutaPDF, 'Tutorial_Seguimiento_Expediente.pdf');
        }

        $mail->send();
    } catch (Exception $e) {
        echo json_encode(["status" => false, "message" => "Error en el envío del correo: " . $mail->ErrorInfo]);
        exit;
    }
}

echo json_encode([
    "status" => true, 
    "message" => "El Diploma ha sido agregado correctamente.", 
    "id" => $consulta
]);
} else {
echo json_encode(["status" => false, "message" => "Error al agregar el diploma."]);
}