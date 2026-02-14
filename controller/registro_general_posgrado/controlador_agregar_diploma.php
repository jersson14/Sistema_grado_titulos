<?php
      require '../../model/model_registro_general_posgrado.php';
      require '../../src/PHPMailer.php';
      require '../../src/SMTP.php';
      require '../../src/Exception.php';

      use PHPMailer\PHPMailer\PHPMailer;
      use PHPMailer\PHPMailer\Exception;
      $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
    $idexpe = strtoupper(htmlspecialchars($_POST['idexpe'],ENT_QUOTES,'UTF-8'));
    $id = strtoupper(htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8'));
    $fechacu = strtoupper(htmlspecialchars($_POST['fechacu'],ENT_QUOTES,'UTF-8'));
    $fechafirma = strtoupper(htmlspecialchars($_POST['fechafirma'],ENT_QUOTES,'UTF-8'));
    $numreso = strtoupper(htmlspecialchars($_POST['numreso'],ENT_QUOTES,'UTF-8'));
    $fechareso = strtoupper(htmlspecialchars($_POST['fechareso'],ENT_QUOTES,'UTF-8'));
    $diplonum = strtoupper(htmlspecialchars($_POST['diplonum'],ENT_QUOTES,'UTF-8'));
    $regis = strtoupper(htmlspecialchars($_POST['regis'],ENT_QUOTES,'UTF-8'));
    $regilibro = strtoupper(htmlspecialchars($_POST['regilibro'],ENT_QUOTES,'UTF-8'));
    $regisfolio = strtoupper(htmlspecialchars($_POST['regisfolio'],ENT_QUOTES,'UTF-8'));
    $tipodiplo = strtoupper(htmlspecialchars($_POST['tipodiplo'],ENT_QUOTES,'UTF-8'));
    $fechainiciotra = strtoupper(htmlspecialchars($_POST['fechainiciotra'],ENT_QUOTES,'UTF-8'));
    $nrocred = strtoupper(htmlspecialchars($_POST['nrocred'],ENT_QUOTES,'UTF-8'));
    $nrooficio = strtoupper(htmlspecialchars($_POST['nrooficio'],ENT_QUOTES,'UTF-8'));
    $fechasecre = strtoupper(htmlspecialchars($_POST['fechasecre'],ENT_QUOTES,'UTF-8'));
    $fechamatri = strtoupper(htmlspecialchars($_POST['fechamatri'], ENT_QUOTES, 'UTF-8'));
    $fechaegre = strtoupper(htmlspecialchars($_POST['fechaegre'], ENT_QUOTES, 'UTF-8'));
    $idusuario = strtoupper(htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8'));
    $correo = strtoupper(htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8'));
    $fechacol = strtoupper(htmlspecialchars($_POST['fechacol'], ENT_QUOTES, 'UTF-8'));
    $nom = strtoupper(htmlspecialchars($_POST['nom'], ENT_QUOTES, 'UTF-8'));
    $ape = strtoupper(htmlspecialchars($_POST['ape'], ENT_QUOTES, 'UTF-8'));
    $mate = strtoupper(htmlspecialchars($_POST['mate'], ENT_QUOTES, 'UTF-8'));
    $consulta = $MRGPG->Agregar_diploma($idexpe,$id,$fechacu,$fechafirma,$numreso,$fechareso,$diplonum,$regis,$regilibro,$regisfolio,$tipodiplo,$fechainiciotra,$nrocred,$nrooficio,$fechasecre,$fechamatri,$fechaegre,$idusuario);

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
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{
    font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,sans-serif;
    background:#f5f7fa;
    padding:20px
}
.email-container{
    max-width:560px;
    margin:auto;
    background:#fff;
    border-radius:16px;
    overflow:hidden;
    box-shadow:0 4px 20px rgba(0,0,0,.08)
}
.header{
    background:linear-gradient(135deg,#f59e0b,#d97706);
    padding:30px;
    text-align:center
}
.university-logo{max-width:160px;margin-bottom:10px}
.header-title{color:#fff;font-size:17px;font-weight:600}
.header-subtitle{color:rgba(255,255,255,.9);font-size:13px}
.content{padding:35px 30px;color:#333;line-height:1.7}
.greeting{font-size:16px;font-weight:600;color:#f59e0b;margin-bottom:18px}
.celebration-card{
    background:linear-gradient(135deg,#fef3c7,#fde68a);
    padding:22px;
    border-radius:12px;
    text-align:center;
    border:2px solid #f59e0b;
    margin-bottom:20px
}
.celebration-icon{font-size:36px}
.celebration-title{font-size:20px;font-weight:700;color:#92400e}
.celebration-text{font-size:13px;color:#78350f}
.status-badge{
    display:inline-block;
    background:linear-gradient(135deg,#10b981,#059669);
    color:#fff;
    padding:10px 22px;
    border-radius:25px;
    font-size:13px;
    font-weight:600;
    margin-bottom:20px
}
.divider{
    height:1px;
    background:linear-gradient(90deg,transparent,#e2e8f0,transparent);
    margin:20px 0
}
.main-message{
    background:linear-gradient(135deg,#fffbeb,#fef3c7);
    padding:18px;
    border-radius:10px;
    border-left:4px solid #f59e0b;
    font-size:14px;
    margin-bottom:20px
}
.alert-box{
    background:linear-gradient(135deg,#fef3c7,#fde68a);
    border-left:4px solid #f59e0b;
    padding:18px;
    border-radius:10px;
    margin-bottom:20px
}
.alert-title{font-weight:600;color:#92400e;font-size:14px}
.alert-text{font-size:13px;color:#78350f;margin-top:8px}
.cta-buttons{
    display:flex;
    gap:12px;
    justify-content:center;
    flex-wrap:wrap;
    margin-bottom:25px
}
.cta-button{
    color:#fff!important;
    text-decoration:none;
    padding:12px 24px;
    border-radius:50px;
    font-size:13px;
    font-weight:600;
    min-width:170px;
    text-align:center
}
.cta-button-primary{
    background:linear-gradient(135deg,#f59e0b,#d97706)
}
.cta-button-secondary{
    background:linear-gradient(135deg,#0ea5e9,#0284c7)
}
.contact-section{
    background:#f8fafc;
    padding:20px;
    border-radius:10px;
    margin-bottom:20px
}
.contact-title{
    font-weight:600;
    color:#f59e0b;
    margin-bottom:12px;
    font-size:14px
}
.contact-item{
    display:flex;
    justify-content:space-between;
    font-size:13px;
    padding:6px 0
}
.contact-phone{color:#f59e0b;font-weight:600}
.signature{
    border-top:2px solid #e2e8f0;
    padding-top:18px;
    font-size:13px
}
.footer{
    background:#1e293b;
    color:#94a3b8;
    text-align:center;
    padding:20px;
    font-size:12px
}
.footer-link{color:#60a5fa;text-decoration:none}
@media(max-width:600px){
    .content{padding:25px 20px}
    .cta-buttons{flex-direction:column}
}
</style>
</head>

<body>
<div class="email-container">

<!-- HEADER -->
<div class="header">
    <img src="cid:logo_universidad" class="university-logo" alt="UTEA">
    <p class="header-title">Universidad Tecnológica de los Andes</p>
    <p class="header-subtitle">Ceremonia de Colación de Grados</p>
</div>

<!-- CONTENT -->
<div class="content">

<p class="greeting">Estimado(a) '.$nom.' '.$ape.' '.$mate.',</p>

<div class="celebration-card">
    <div class="celebration-icon">🎉🎓✨</div>
    <div class="celebration-title">¡Felicitaciones!</div>
    <div class="celebration-text">
        Su diploma se encuentra en proceso para la ceremonia de colación
    </div>
</div>

<div style="text-align:center">
    <span class="status-badge">✓ LISTO PARA COLACIÓN</span>
</div>

<div class="divider"></div>

<div class="main-message">
    <strong>📋 Notificación Importante</strong>
    <p>
        Su diploma está siendo elaborado y será entregado durante la próxima
        ceremonia de colación, culminando su formación académica.
    </p>
</div>

<div class="alert-box">
    <div class="alert-title">📅 Fecha y Hora</div>
    <div class="alert-text">
        La fecha y hora oficial serán publicadas en la página de Facebook de la UTEA.
    </div>
</div>

<div class="cta-buttons">
    <a href="https://www.facebook.com/Utea.Abancay" class="cta-button cta-button-primary">
        📱 Facebook UTEA
    </a>
    <a href="https://gradosapp.fun/seguimiento_posgrado.php" class="cta-button cta-button-secondary">
        🔍 Seguimiento
    </a>
</div>

<div class="contact-section">
    <div class="contact-title">📞 Consultas</div>
    <div class="contact-item">
        <span>📍 Abancay</span><span class="contact-phone">970 639 067</span>
    </div>
    <div class="contact-item">
        <span>📍 Andahuaylas</span><span class="contact-phone">957 306 881</span>
    </div>
    <div class="contact-item">
        <span>📍 Cusco</span><span class="contact-phone">970 669 439</span>
    </div>
</div>

<div class="signature">
    <strong>Oficina de Grados y Títulos</strong><br>
    Universidad Tecnológica de los Andes
</div>

</div>

<!-- FOOTER -->
<div class="footer">
    <p><strong>Universidad Tecnológica de los Andes</strong></p>
    <p>Formando profesionales de excelencia</p>
    <p>
        <a href="https://www.utea.edu.pe" class="footer-link">www.utea.edu.pe</a> |
        <a href="https://www.facebook.com/Utea.Abancay" class="footer-link">Facebook</a>
    </p>
    <p>© 2025</p>
</div>

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



?>