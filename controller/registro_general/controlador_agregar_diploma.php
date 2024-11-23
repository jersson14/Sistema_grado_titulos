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
$idusuario = strtoupper(htmlspecialchars($_POST['idusuario'], ENT_QUOTES, 'UTF-8'));
$correo = strtoupper(htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8'));
$fechacol = strtoupper(htmlspecialchars($_POST['fechacol'], ENT_QUOTES, 'UTF-8'));
$nom = strtoupper(htmlspecialchars($_POST['nom'], ENT_QUOTES, 'UTF-8'));
$ape = strtoupper(htmlspecialchars($_POST['ape'], ENT_QUOTES, 'UTF-8'));
$mate = strtoupper(htmlspecialchars($_POST['mate'], ENT_QUOTES, 'UTF-8'));

// Registro en la base de datos
$consulta = $MRG->Agregar_diploma($idexpe, $id, $fechacu, $fechafirma, $numreso, $fechareso, $diplonum, $regis, $regilibro, $regisfolio, $tipodiplo, $fechainiciotra, $nrocred, $nrooficio, $fechasecre, $idusuario);

header('Content-Type: application/json');

if ($consulta) {
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
        $mail->setFrom('jerssongrados@gradosapp.fun', 'Oficina de Grados y Títulos - Universidad Tecnológica de los Andes');
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
                <p><b>Estimado(a) egresado(a), '.$nom.' '.$ape.' '.$mate.'.</b></p>
                <p>Su diploma ha sido registrado exitosamente en el sistema de GRADOS Y TITULOS. Puede hacerle seguimiento en el siguiente enlace:</p>
                <p><a href="https://gradosapp.fun/seguimiento.php" target="_blank">Hacer seguimiento (Clic)</a></p>
                <p>Su expediente se encuentra en estado: <b style="color:#0eb34a">LISTO PARA COLACIÓN</b></p>
                                <p><b style="color:#0eb34a">FECHA DE COLACIÓN: '.$fecha_formateada.'</b></p>

                 <p><b style="color:#0eb34a">LA HORA SE LE INDICARA EN LA PUBLICACIÓN OFICIAL EN LA PAGINA DE FACEBOOK</b></p>
                <div class="note">
                    <p><strong>Nota importante:</strong> La lista de colación saldrá en la página de Facebook de la Universidad puede visitarlo en el siguiente enlace: https://www.facebook.com/Utea.Abancay.</p>
                </div>
                <div class="note">
                    <p><strong>Nota importante:</strong> Se adjunta a este correo el tutorial en PDF en la parte final, con instrucciones detalladas de cómo realizar el seguimiento de su expediente en nuestro sistema, revíselo cuidadosamente.</p>
                </div>
                <p>Gracias por utilizar nuestros servicios.</p>
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
        } else {
            throw new Exception('No se pudo encontrar el archivo del tutorial');
        }

        $mail->send();
    } catch (Exception $e) {
        echo json_encode(["status" => false, "message" => "Error en el envío del correo: " . $mail->ErrorInfo]);
        exit;
    }

    echo json_encode([
        "status" => true, 
        "message" => "El Diploma ha sido agregado correctamente.", 
        "id" => $consulta
    ]);
} else {
    echo json_encode(["status" => false, "message" => "Error al agregar el diploma."]);
}