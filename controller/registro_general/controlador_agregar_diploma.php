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
$ciclo_inves = strtoupper(htmlspecialchars($_POST['ciclo_inves'], ENT_QUOTES, 'UTF-8'));

$idusuario = strtoupper(htmlspecialchars($_POST['idusuario'], ENT_QUOTES, 'UTF-8'));
$correo = strtoupper(htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8'));
$fechacol = strtoupper(htmlspecialchars($_POST['fechacol'], ENT_QUOTES, 'UTF-8'));
$nom = strtoupper(htmlspecialchars($_POST['nom'], ENT_QUOTES, 'UTF-8'));
$ape = strtoupper(htmlspecialchars($_POST['ape'], ENT_QUOTES, 'UTF-8'));
$mate = strtoupper(htmlspecialchars($_POST['mate'], ENT_QUOTES, 'UTF-8'));

// Registro en la base de datos
$consulta = $MRG->Agregar_diploma($idexpe, $id, $fechacu, $fechafirma, $numreso, $fechareso, $diplonum, $regis, $regilibro, $regisfolio, $tipodiplo, $fechainiciotra, $nrocred, $nrooficio, $fechasecre,$fechamatri,$fechaegre,$ciclo_inves, $idusuario);

header('Content-Type: application/json');
$enable_email = true; // Cambia esto a `true` para habilitar el envío de correos

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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #f5f7fa;
            padding: 20px;
        }
        
        .email-container {
            max-width: 560px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }
        
        .header {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            padding: 30px;
            text-align: center;
        }
        
        .university-logo {
            max-width: 160px;
            height: auto;
            margin-bottom: 12px;
        }
        
        .header-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 13px;
            margin-top: 5px;
        }
        
        .content {
            padding: 35px 30px;
            color: #333333;
            line-height: 1.7;
        }
        
        .greeting {
            font-size: 16px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 20px;
        }
        
        .celebration-card {
            background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            margin: 25px 0;
            border: 2px solid #10b981;
        }
        
        .celebration-icon {
            font-size: 42px;
            margin-bottom: 12px;
        }
        
        .celebration-title {
            font-size: 22px;
            font-weight: 700;
            color: #065f46;
            margin-bottom: 8px;
        }
        
        .celebration-text {
            font-size: 14px;
            color: #047857;
            line-height: 1.6;
        }
        
        .status-badge {
            display: inline-block;
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 12px 24px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 14px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        }
        
        .main-message {
            font-size: 14px;
            color: #1e293b;
            margin-bottom: 25px;
            background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
            padding: 22px;
            border-radius: 10px;
            border-left: 4px solid #10b981;
            line-height: 1.8;
        }
        
        .facebook-highlight {
            background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
            border: 3px solid #1877f2;
            padding: 30px 25px;
            border-radius: 14px;
            margin: 30px 0;
            text-align: center;
            box-shadow: 0 6px 20px rgba(24, 119, 242, 0.25);
        }
        
        .facebook-icon {
            font-size: 50px;
            margin-bottom: 15px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        
        .facebook-title {
            color: #1877f2;
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .facebook-subtitle {
            color: #1e3a8a;
            font-size: 15px;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .facebook-text {
            color: #1e3a8a;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 20px;
        }
        
        .facebook-features {
            background: rgba(255, 255, 255, 0.7);
            padding: 18px;
            border-radius: 8px;
            margin-top: 15px;
        }
        
        .facebook-feature-item {
            color: #1877f2;
            font-size: 13px;
            margin: 8px 0;
            font-weight: 600;
        }
        
        .tracking-box {
            background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
            border: 2px solid #10b981;
            padding: 20px;
            border-radius: 10px;
            margin: 25px 0;
        }
        
        .tracking-title {
            font-weight: 700;
            color: #065f46;
            margin-bottom: 12px;
            font-size: 15px;
        }
        
        .tracking-text {
            color: #047857;
            font-size: 14px;
            line-height: 1.7;
        }
        
        .alert-box {
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            border-left: 4px solid #f59e0b;
            padding: 20px;
            border-radius: 10px;
            margin: 25px 0;
        }
        
        .alert-title {
            font-weight: 700;
            color: #92400e;
            margin-bottom: 12px;
            font-size: 15px;
        }
        
        .alert-text {
            color: #78350f;
            font-size: 14px;
            line-height: 1.7;
        }
        
        .cta-buttons {
            display: flex;
            gap: 12px;
            justify-content: center;
            margin: 25px 0;
            flex-wrap: wrap;
        }
        
        .cta-button {
            display: inline-block;
            color: #ffffff !important;
            text-decoration: none;
            padding: 15px 30px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 14px;
            transition: all 0.3s ease;
            text-align: center;
            min-width: 200px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .cta-button-primary {
            background: linear-gradient(135deg, #1877f2, #0c63d4);
            box-shadow: 0 6px 20px rgba(24, 119, 242, 0.4);
        }
        
        .cta-button-secondary {
            background: linear-gradient(135deg, #10b981, #059669);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        
        .steps-box {
            background-color: #f8fafc;
            padding: 22px;
            border-radius: 10px;
            margin: 25px 0;
            border: 1px solid #e2e8f0;
        }
        
        .steps-title {
            color: #10b981;
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 15px;
        }
        
        .steps-box ol {
            color: #475569;
            font-size: 14px;
            line-height: 2;
            padding-left: 20px;
            margin: 0;
        }
        
        .steps-box li {
            margin-bottom: 8px;
        }
        
        .contact-section {
            background-color: #f8fafc;
            padding: 22px;
            border-radius: 10px;
            margin: 25px 0;
            border: 1px solid #e2e8f0;
        }
        
        .contact-title {
            font-weight: 700;
            color: #10b981;
            margin-bottom: 15px;
            font-size: 16px;
        }
        
        .contact-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #e2e8f0;
            font-size: 14px;
        }
        
        .contact-item:last-child {
            border-bottom: none;
        }
        
        .contact-location {
            font-weight: 600;
            color: #334155;
            min-width: 160px;
        }
        
        .contact-phone {
            color: #10b981;
            font-weight: 700;
        }
        
        .signature {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #e2e8f0;
        }
        
        .signature-name {
            font-weight: 700;
            color: #1e293b;
            font-size: 15px;
        }
        
        .signature-title {
            color: #64748b;
            font-size: 13px;
            margin-top: 5px;
        }
        
        .footer {
            background-color: #1e293b;
            color: #94a3b8;
            text-align: center;
            padding: 25px;
            font-size: 12px;
        }
        
        .footer-link {
            color: #60a5fa;
            text-decoration: none;
            font-weight: 600;
        }
        
        .divider {
            height: 1px;
            background: linear-gradient(90deg, transparent, #e2e8f0, transparent);
            margin: 20px 0;
        }
        
        @media only screen and (max-width: 600px) {
            body {
                padding: 15px;
            }
            
            .content {
                padding: 25px 20px;
            }
            
            .cta-buttons {
                flex-direction: column;
            }
            
            .cta-button {
                width: 100%;
            }
            
            .contact-item {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .contact-location {
                margin-bottom: 5px;
            }
            
            .facebook-icon {
                font-size: 40px;
            }
            
            .facebook-title {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
    <div class="email-container">
        <!-- Header -->
        <div class="header">
            <img src="cid:logo_universidad" alt="Logo UTEA" class="university-logo"/>
            <p class="header-subtitle">Oficina de Grados y Títulos</p>
        </div>
        
        <!-- Content -->
        <div class="content">
            <p class="greeting">Estimado(a) '.$nom.' '.$ape.' '.$mate.':</p>            
            
            <!-- Celebration Card -->
            <div class="celebration-card">
                <div class="celebration-icon">🎉🎓✨</div>
                <div class="celebration-title">¡Felicitaciones!</div>
                <div class="celebration-text">
                    Su diploma ha sido registrado exitosamente y se encuentra en proceso de elaboración para la ceremonia de colación de grados.
                </div>
            </div>
            
            <div style="text-align: center;">
                <span class="status-badge">✓ DIPLOMA EN PROCESO</span>
            </div>
            
            <div class="divider"></div>
            
            <!-- Main Message -->
            <div class="main-message">
                <strong>📋 NOTIFICACIÓN OFICIAL</strong>
                <p style="margin-top: 15px; margin-bottom: 0;">
                    Por medio de la presente, nos es grato comunicarle que su diploma se encuentra actualmente en proceso de elaboración y será entregado en la próxima ceremonia oficial de colación de grados. Este importante logro académico representa la culminación de su esfuerzo, dedicación y compromiso con su formación profesional.
                </p>
            </div>
            
            <!-- FACEBOOK HIGHLIGHT BOX - MAIN FOCUS -->
            <div class="facebook-highlight">
                <div class="facebook-icon">📱💙</div>
                <div class="facebook-title">⚡ PÁGINA OFICIAL DE FACEBOOK ⚡</div>
                <div class="facebook-subtitle">Información Completa y Detallada de su Colación</div>
                <div class="facebook-text">
                    <strong>La lista oficial de colación con toda la información detallada será publicada en nuestra página oficial de Facebook.</strong> Ahí encontrará todos los detalles importantes sobre su ceremonia de colación de grados.
                </div>
                <div class="facebook-features">
                    <div class="facebook-feature-item">📅 FECHA COMPLETA de su colación</div>
                    <div class="facebook-feature-item">🕐 HORA EXACTA de la ceremonia</div>
                    <div class="facebook-feature-item">📍 LUGAR DEL EVENTO</div>
                    <div class="facebook-feature-item">📋 LISTA OFICIAL de graduandos</div>
                    <div class="facebook-feature-item">ℹ️ INDICACIONES y protocolo del evento</div>
                </div>
            </div>
            
            <!-- Buttons -->
            <div class="cta-buttons">
                <a href="https://www.facebook.com/Utea.Abancay" target="_blank" class="cta-button cta-button-primary">
                    📱 Ver Página de Facebook UTEA
                </a>
                <a href="http://localhost/ultimogrados/seguimiento.php" target="_blank" class="cta-button cta-button-secondary">
                    🔍 Consultar Fecha en Línea
                </a>
            </div>
            
            <div class="divider"></div>
            
            <!-- Tracking Box -->
            <div class="tracking-box">
                <div class="tracking-title">🔍 Seguimiento en Línea - Consulta Rápida</div>
                <div class="tracking-text">
                    <p style="margin-bottom: 10px;">
                        También puede consultar la <strong>fecha de su colación</strong> de manera rápida ingresando a nuestro sistema de seguimiento en línea.
                    </p>
                    <p style="margin: 0;">
                        Para obtener la <strong>información completa y detallada</strong> (hora exacta, lugar, lista oficial e indicaciones), por favor revise nuestra página oficial de Facebook.
                    </p>
                </div>
            </div>
            
            <!-- Alert Box -->
            <div class="alert-box">
                <div class="alert-title">📢 INFORMACIÓN IMPORTANTE</div>
                <div class="alert-text">
                    <p style="margin-bottom: 15px;">
                        <strong>¿Dónde encontrar toda la información de mi colación?</strong>
                    </p>
                    <p style="margin-bottom: 12px;">
                        <strong>✓ PÁGINA DE FACEBOOK (INFORMACIÓN COMPLETA):</strong><br>
                        Nuestra página oficial de Facebook publicará la lista completa de colación con todos los detalles: fecha exacta, hora precisa, lugar del evento, protocolo, indicaciones especiales y lista oficial de graduandos.
                    </p>
                    <p style="margin: 0;">
                        <strong>✓ SEGUIMIENTO EN LÍNEA (CONSULTA RÁPIDA):</strong><br>
                        El sistema en línea le permite consultar rápidamente la fecha de su colación.
                    </p>
                </div>
            </div>
            
            <!-- Steps -->
            <div class="steps-box">
                <div class="steps-title">📋 Recomendaciones Importantes</div>
                <ol>
                    <li><strong>Siga la página oficial de Facebook de UTEA</strong> para recibir notificaciones de las publicaciones.</li>
                    <li>Revise <strong>diariamente</strong> la página de Facebook para no perderse la publicación de la lista de colación.</li>
                    <li>Use el sistema de seguimiento en línea para consultas rápidas de la fecha.</li>
                    <li>Una vez publicada la lista en Facebook, revise <strong>todos los detalles</strong> de su ceremonia.</li>
                    <li>Confirme su asistencia según las indicaciones publicadas.</li>
                    <li>Prepare su documentación personal (DNI original y vigente es obligatorio).</li>
                    <li>El día de la ceremonia, preséntese con 30 minutos de anticipación.</li>
                </ol>
            </div>
            
            <!-- Contact -->
            <div class="contact-section">
                <div class="contact-title">📞 Canales de Atención y Consultas</div>
                <p style="color: #64748b; font-size: 14px; margin-bottom: 15px;">
                    Para cualquier consulta o información adicional relacionada con su proceso de colación, puede comunicarse con nuestra oficina a través de los siguientes números telefónicos:
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
                
                <p style="color: #64748b; font-size: 13px; margin-top: 15px; font-style: italic;">
                    <strong>Horario de atención:</strong> Lunes a Viernes de 8:00 a.m. a 4:00 p.m.
                </p>
            </div>
            
            <p style="color: #64748b; font-size: 14px; margin-top: 25px; text-align: center; line-height: 1.7;">
                Agradecemos su paciencia y compromiso durante este proceso. Será un honor contar con su presencia en la ceremonia de colación.
            </p>
            
            <!-- Signature -->
            <div class="signature">
                <p class="signature-name">Atentamente,</p>
                <p class="signature-title">Oficina de Grados y Títulos</p>
                <p class="signature-title">Universidad Tecnológica de los Andes</p>
            </div>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <p style="margin-bottom: 10px; font-weight: 600;"><strong>Universidad Tecnológica de los Andes</strong></p>
            <p style="margin-bottom: 12px;">Formando profesionales comprometidos con el desarrollo de la región</p>
            <p>
                <a href="https://www.utea.edu.pe" class="footer-link">www.utea.edu.pe</a> | 
                <a href="https://www.facebook.com/Utea.Abancay" class="footer-link">Facebook Oficial</a> | 
                <a href="http://localhost/ultimogrados/seguimiento.php" class="footer-link">Seguimiento en Línea</a>
            </p>
            <p style="margin-top: 12px; font-size: 11px;">© 2025 Universidad Tecnológica de los Andes. Todos los derechos reservados.</p>
        </div>
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