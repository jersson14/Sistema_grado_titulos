<?php
    require '../../model/model_registro_general_posgrado.php';
    require '../../src/PHPMailer.php';
    require '../../src/SMTP.php';
    require '../../src/Exception.php';

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    $MRGPG = new Modelo_Registro_General_Posgrado();//Instaciamos
    //DATOS DE ESTUDIANTE
    $tipodoc = strtoupper(htmlspecialchars($_POST['tipodoc'],ENT_QUOTES,'UTF-8'));
    $documentoFinal = strtoupper(htmlspecialchars($_POST['documentoFinal'],ENT_QUOTES,'UTF-8'));
    $nombres = strtoupper(htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8'));
    $apepa = strtoupper(htmlspecialchars($_POST['apepa'],ENT_QUOTES,'UTF-8'));
    $apema = strtoupper(htmlspecialchars($_POST['apema'],ENT_QUOTES,'UTF-8'));
    $codigo = strtoupper(htmlspecialchars($_POST['codigo'],ENT_QUOTES,'UTF-8'));
    $sexo = strtoupper(htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8'));
    $celular = strtoupper(htmlspecialchars($_POST['celular'],ENT_QUOTES,'UTF-8'));
    $direc = strtoupper(htmlspecialchars($_POST['direc'],ENT_QUOTES,'UTF-8'));
    $emaper = htmlspecialchars($_POST['emaper'],ENT_QUOTES,'UTF-8');
    $emainsti = htmlspecialchars($_POST['emainsti'],ENT_QUOTES,'UTF-8');
    $fecha_matr = strtoupper(htmlspecialchars($_POST['fecha_matr'],ENT_QUOTES,'UTF-8'));
    $fecha_egre = strtoupper(htmlspecialchars($_POST['fecha_egre'],ENT_QUOTES,'UTF-8'));
    $observa = strtoupper(htmlspecialchars($_POST['observa'],ENT_QUOTES,'UTF-8'));
    //DATOS DE EXPEDIENTE
    $ced = strtoupper(htmlspecialchars($_POST['ced'],ENT_QUOTES,'UTF-8'));
    $pro = strtoupper(htmlspecialchars($_POST['pro'],ENT_QUOTES,'UTF-8'));
    $den = htmlspecialchars($_POST['den'],ENT_QUOTES,'UTF-8');
    $moda = strtoupper(htmlspecialchars($_POST['moda'],ENT_QUOTES,'UTF-8'));
    $idauto = strtoupper(htmlspecialchars($_POST['idauto'],ENT_QUOTES,'UTF-8'));
    $fecha = strtoupper(htmlspecialchars($_POST['fecha'],ENT_QUOTES,'UTF-8'));
    $acad = strtoupper(htmlspecialchars($_POST['acad'],ENT_QUOTES,'UTF-8'));
    $acu = strtoupper(htmlspecialchars($_POST['acu'],ENT_QUOTES,'UTF-8'));
    $res = strtoupper(htmlspecialchars($_POST['res'],ENT_QUOTES,'UTF-8'));
    $exped = strtoupper(htmlspecialchars($_POST['exped'],ENT_QUOTES,'UTF-8'));
    $lib = strtoupper(htmlspecialchars($_POST['lib'],ENT_QUOTES,'UTF-8'));
    $fol = strtoupper(htmlspecialchars($_POST['fol'],ENT_QUOTES,'UTF-8'));
    $reg = strtoupper(htmlspecialchars($_POST['reg'],ENT_QUOTES,'UTF-8'));
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8');

    //DATOS DE LA MODALIDAD
    $mod_estu = strtoupper(htmlspecialchars($_POST['mod_estu'],ENT_QUOTES,'UTF-8'));
    $tra_inv = strtoupper(htmlspecialchars($_POST['tra_inv'],ENT_QUOTES,'UTF-8'));
    $turn = strtoupper(htmlspecialchars($_POST['turn'],ENT_QUOTES,'UTF-8'));
    $porc = strtoupper(htmlspecialchars($_POST['porc'],ENT_QUOTES,'UTF-8'));
    $cent = strtoupper(htmlspecialchars($_POST['cent'],ENT_QUOTES,'UTF-8'));
    $meta = htmlspecialchars($_POST['meta'],ENT_QUOTES,'UTF-8');
    $proce_pais = strtoupper(htmlspecialchars($_POST['proce_pais'],ENT_QUOTES,'UTF-8'));
    $proce_univ = strtoupper(htmlspecialchars($_POST['proce_univ'],ENT_QUOTES,'UTF-8'));
    $proce_grado = strtoupper(htmlspecialchars($_POST['proce_grado'],ENT_QUOTES,'UTF-8'));
    $fecha_matri = strtoupper(htmlspecialchars($_POST['fecha_matri'],ENT_QUOTES,'UTF-8'));
    $fecha_inici = strtoupper(htmlspecialchars($_POST['fecha_inici'],ENT_QUOTES,'UTF-8'));
    $fecha_fin = strtoupper(htmlspecialchars($_POST['fecha_fin'],ENT_QUOTES,'UTF-8'));
    $mod_sustenta = strtoupper(htmlspecialchars($_POST['mod_sustenta'],ENT_QUOTES,'UTF-8'));
    $idusuario = strtoupper(htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8'));


        $ruta='controller/registro_general_posgrado/documentos/'.$nombrearchivo;
    
        $consulta = $MRGPG->Registrar_Posgrado($tipodoc,$documentoFinal,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$ced,$pro,$den,$moda,$idauto,$fecha,$acad,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_pais,$proce_univ,$proce_grado,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$idusuario);
 
 
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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{
    font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    background:#f5f7fa;
    padding:20px
}
.email-container{
    max-width:600px;
    margin:auto;
    background:#fff;
    border-radius:16px;
    overflow:hidden;
    box-shadow:0 4px 20px rgba(0,0,0,.08)
}
.header{
    background:linear-gradient(135deg,#0065B2,#00a8ff);
    padding:30px;
    text-align:center
}
.university-logo{max-width:180px;margin-bottom:15px}
.header-title{color:#fff;font-size:18px;font-weight:600}
.content{padding:40px 35px;color:#333;line-height:1.7}
.greeting{font-size:18px;font-weight:600;color:#0065B2;margin-bottom:20px}

.main-message{
    background:linear-gradient(135deg,#f0f9ff,#e0f2fe);
    padding:20px;
    border-radius:12px;
    border-left:4px solid #0065B2;
    font-size:15px;
    margin-bottom:25px
}

.status-badge{
    display:inline-block;
    background:linear-gradient(135deg,#f59e0b,#d97706);
    color:#fff;
    padding:10px 22px;
    border-radius:25px;
    font-weight:600;
    font-size:14px;
    margin:15px 0
}

.divider{
    height:1px;
    background:linear-gradient(90deg,transparent,#e2e8f0,transparent);
    margin:22px 0
}

/* ALERTA DATOS */
.alert-datos{
    background:linear-gradient(135deg,#e0f2fe,#bae6fd);
    border-left:6px solid #0065B2;
    padding:22px;
    border-radius:12px;
    margin:25px 0
}
.alert-datos strong{
    color:#003f7f;
    font-size:15px
}

/* BOTÓN */
.cta-wrapper{text-align:center;margin:35px 0}
.cta-button{
    display:inline-block;
    background:linear-gradient(135deg,#003f7f,#0065B2,#00a8ff);
    color:#fff!important;
    text-decoration:none;
    padding:20px 48px;
    border-radius:50px;
    font-weight:800;
    font-size:17px;
    box-shadow:0 12px 28px rgba(0,101,178,.45);
    border:2px solid #fff
}

.info-card{
    background:#f8fafc;
    padding:22px;
    border-radius:12px;
    margin:25px 0;
    border:1px solid #e2e8f0
}
.info-card-title{
    font-weight:600;
    color:#0065B2;
    margin-bottom:12px;
    font-size:15px
}

.steps-list{list-style:none;margin-top:10px}
.steps-list li{
    padding:10px 0;
    border-bottom:1px solid #e2e8f0;
    font-size:14px;
    color:#475569
}
.steps-list li:last-child{border-bottom:none}
.steps-list li:before{
    content:"✓";
    color:#10b981;
    font-weight:bold;
    margin-right:10px
}

.contact-section{
    background:linear-gradient(135deg,#f1f5f9,#e2e8f0);
    padding:25px;
    border-radius:12px;
    margin:25px 0
}
.contact-title{font-weight:600;color:#0065B2;font-size:16px;margin-bottom:15px}
.contact-item{display:flex;justify-content:space-between;padding:8px 0;font-size:14px}
.contact-phone{color:#0065B2;font-weight:600}

.signature{
    border-top:2px solid #e2e8f0;
    padding-top:20px;
    margin-top:30px
}
.signature-name{font-weight:600;font-size:15px;color:#1e293b}
.signature-title{font-size:14px;color:#64748b;margin-top:4px}

.footer{
    background:#1e293b;
    color:#94a3b8;
    text-align:center;
    padding:25px;
    font-size:13px
}
.footer-link{color:#60a5fa;text-decoration:none}

@media(max-width:600px){
    .content{padding:30px 20px}
    .cta-button{width:100%;text-align:center}
    .contact-item{flex-direction:column;align-items:flex-start}
}
</style>
</head>

<body>
<div class="email-container">

<!-- HEADER -->
<div class="header">
    <img src="cid:logo_universidad" alt="Logo UTEA" class="university-logo">
    <p class="header-title">Universidad Tecnológica de los Andes</p>
</div>

<!-- CONTENT -->
<div class="content">

<p class="greeting">
    Estimado(a) Posgraduado(a) '.$nombres.' '.$apepa.' '.$apema.',
</p>

<p style="margin-bottom:20px">
    Reciba un cordial saludo de la Oficina de Grados y Títulos de la Universidad Tecnológica de los Andes.
</p>

<div class="main-message">
    <strong>📋 Notificación de Expediente de Posgrado</strong>
    <p style="margin-top:12px">
        Su expediente de posgrado se encuentra actualmente en la <strong>Oficina de Grados y Títulos</strong>
        para su revisión y validación académica correspondiente.
    </p>
</div>

<div style="text-align:center">
    <span class="status-badge">⏳ PENDIENTE DE REVISIÓN</span>
</div>

<div class="divider"></div>

<div class="info-card">
    <div class="info-card-title">🔍 Seguimiento en Línea</div>
    <p style="font-size:14px;color:#64748b">
        Puede consultar el estado actualizado de su expediente en el sistema de seguimiento de posgrado.
    </p>
</div>

<!-- ALERTA DATOS -->
<div class="alert-datos">
    <strong>
        ⚠️ OBLIGATORIO: Revise cuidadosamente que TODOS SUS DATOS PERSONALES
        estén correctos en el portal de seguimiento. Cualquier observación
        deberá realizarla antes de continuar con el proceso de colación.
    </strong>
</div>

<!-- BOTÓN -->
<div class="cta-wrapper">
    <a href="https://gradosapp.fun/seguimiento_posgrado.php" class="cta-button">
        🔍 REVISAR Y CONFIRMAR MIS DATOS DE POSGRADO
    </a>
</div>

<div class="divider"></div>

<!-- CONTACTO -->
<div class="contact-section">
    <div class="contact-title">📞 Consultas Posgrado</div>

  <div class="contact-item">
    <span class="contact-location">📍 Sede Abancay:</span>
    <span class="contact-phone">970 639 067</span>
    </div>
       
</div>

<div class="signature">
    <p class="signature-name">Atentamente,</p>
    <p class="signature-title">Oficina de Grados y Títulos</p>
    <p class="signature-title">Universidad Tecnológica de los Andes</p>
</div>

</div>

<!-- FOOTER -->
<div class="footer">
    <p><strong>Universidad Tecnológica de los Andes</strong></p>
    <p>
        <a href="https://www.utea.edu.pe" class="footer-link">www.utea.edu.pe</a> |
        <a href="https://gradosapp.fun/seguimiento_posgrado.php" class="footer-link">Seguimiento Posgrado</a>
    </p>
    <p>© 2025</p>
</div>

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