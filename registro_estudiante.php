<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Registro de Estudiante | UTEA</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.min.css">

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Source Sans Pro', sans-serif;
      min-height: 100vh;
      padding: 20px;
      position: relative;
      overflow-x: hidden;
      background-image: url('img/sede.png');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
    }

    .hidden {
      display: none !important;
    }

    /* Overlay con transparencia igual al login */
    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(135deg, rgba(2, 67, 131, 0.45) 0%, rgba(1, 42, 82, 0.55) 100%);
      z-index: 0;
      backdrop-filter: blur(1px);
    }

    .container-fluid {
      max-width: 1200px;
      margin: 0 auto;
      position: relative;
      z-index: 1;
    }

    /* Header modernizado */
    .header-section {
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 30px;
      margin-bottom: 30px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .header-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 5px;
      background: linear-gradient(90deg, #0065B2, #00a8ff);
    }

    .logo-container {
      margin-bottom: 20px;
    }

    .logo-container img {
      max-width: 200px;
      height: auto;
      filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
    }

    .header-title {
      color: #0065B2;
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 10px;
      letter-spacing: 0.5px;
    }

    .header-subtitle {
      color: #666;
      font-size: 16px;
      font-weight: 400;
    }

    /* Card principal */
    .main-card {
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 40px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      margin-bottom: 30px;
      animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .welcome-banner {
      background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
      border-left: 4px solid #667eea;
      padding: 25px;
      border-radius: 12px;
      margin-bottom: 30px;
      color: #333;
      line-height: 1.8;
    }

    .welcome-banner h3 {
      color: #0065B2;
      font-size: 22px;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .welcome-banner p {
      font-size: 15px;
      margin-bottom: 10px;
    }

    .step-indicator {
      display: flex;
      justify-content: space-between;
      margin-bottom: 30px;
      gap: 10px;
    }

    .step {
      flex: 1;
      text-align: center;
      padding: 15px;
      background: #f8f9fa;
      border-radius: 12px;
      position: relative;
      transition: all 0.3s ease;
    }

    .step.active {
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
      box-shadow: 0 4px 15px rgba(0, 101, 178, 0.3);
    }

    .step.completed {
      background: #28a745;
      color: white;
    }

    .step-number {
      display: inline-block;
      width: 30px;
      height: 30px;
      line-height: 30px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.3);
      margin-bottom: 8px;
      font-weight: 700;
    }

    .step.active .step-number {
      background: white;
      color: #0065B2;
    }

    .step-title {
      font-size: 13px;
      font-weight: 600;
    }

    /* Secciones del formulario */
    .form-section {
      display: none;
      animation: slideIn 0.4s ease;
    }

    .form-section.active {
      display: block;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateX(20px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    .section-title {
      color: #0065B2;
      font-size: 20px;
      font-weight: 700;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 2px solid #e0e0e0;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .form-row {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-bottom: 20px;
    }

    .form-group {
      display: flex;
      flex-direction: column;
      gap: 8px;
    }

    .form-label {
      font-weight: 600;
      font-size: 14px;
      color: #333;
    }

    .form-label .required {
      color: #e74c3c;
      margin-left: 3px;
    }

    .form-control {
      padding: 12px 16px;
      border: 2px solid #e0e0e0;
      border-radius: 10px;
      font-size: 15px;
      transition: all 0.3s ease;
      background: white;
    }

    .form-control:focus {
      outline: none;
      border-color: #0065B2;
      box-shadow: 0 0 0 3px rgba(0, 101, 178, 0.1);
    }

    .form-control:disabled {
      background: #f5f5f5;
      cursor: not-allowed;
    }

    .photo-upload {
      border: 2px dashed #0065B2;
      border-radius: 12px;
      padding: 30px;
      text-align: center;
      background: #f8f9fa;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .photo-upload:hover {
      background: #e9ecef;
      border-color: #00a8ff;
    }

    .photo-upload input[type="file"] {
      display: none;
    }

    .photo-preview {
      max-width: 200px;
      max-height: 250px;
      margin: 15px auto;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .radio-group {
      display: flex;
      flex-direction: column;
      gap: 12px;
    }

    .radio-option {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px;
      border: 2px solid #e0e0e0;
      border-radius: 10px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .radio-option:hover {
      background: #f8f9fa;
      border-color: #0065B2;
    }

    .radio-option input[type="radio"] {
      width: 20px;
      height: 20px;
      cursor: pointer;
    }

    .radio-option.selected {
      background: #e3f2fd;
      border-color: #0065B2;
    }

    .btn-group {
      display: flex;
      justify-content: space-between;
      gap: 15px;
      margin-top: 30px;
    }

    .btn {
      padding: 14px 32px;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 700;
      cursor: pointer;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }

    .btn-primary {
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
    }

    .btn-secondary {
      background: #6c757d;
      color: white;
    }

    .btn-success {
      background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
      color: white;
    }

    .hidden {
      display: none !important;
    }

    /* Responsive */
    @media (max-width: 768px) {
      body {
        padding: 10px;
      }

      .header-section {
        padding: 20px;
      }

      .main-card {
        padding: 20px;
      }

      .step-indicator {
        flex-direction: column;
      }

      .form-row {
        grid-template-columns: 1fr;
      }

      .btn-group {
        flex-direction: column;
      }

      .btn {
        width: 100%;
      }
    }
  </style>
</head>

<body>

  <div class="container-fluid">
    <!-- Header -->
    <div class="header-section">
      <div class="logo-container">
        <img src="img/utea.png" alt="UTEA Logo">
      </div>
      <h1 class="header-title">UNIVERSIDAD TECNOLÓGICA DE LOS ANDES</h1>
      <p class="header-subtitle">Registro de Estudiante - Grados y Títulos</p>
    </div>

    <!-- Contenido principal -->
    <div class="main-card">
          <!-- Mensaje de bienvenida -->
          <div class="welcome-banner">
      <h3>
        <i class="fas fa-heart"></i>
        ¡Bienvenido(a), estimado(a) egresado(a)!
      </h3>

      <p>
        <strong>Felicitaciones por haber culminado tu etapa académica.</strong>
        Este formulario te permitirá registrar tus datos personales y tu declaración étnica
        para iniciar el trámite de tu grado o título académico.
      </p>

      <p>
        La <strong>Universidad Tecnológica de los Andes</strong> te acompaña en este importante
        paso hacia tu desarrollo profesional. Por favor, completa la información solicitada
        con atención y veracidad.
      </p>

      <p>
        <i class="fas fa-info-circle"></i>
        Los campos marcados con
        <span style="color: #e74c3c; font-weight: bold;">*</span>
        son obligatorios.
      </p>
    </div>


      <!-- Indicador de pasos -->
      <div class="step-indicator">
        <div class="step active" id="step1-indicator">
          <div class="step-number">1</div>
          <div class="step-title">Buscar DNI</div>
        </div>
        <div class="step" id="step2-indicator">
          <div class="step-number">2</div>
          <div class="step-title">Datos Personales</div>
        </div>
        <div class="step" id="step3-indicator">
          <div class="step-number">3</div>
          <div class="step-title">Declaración Étnica</div>
        </div>
        <div class="step" id="step4-indicator">
          <div class="step-number">4</div>
          <div class="step-title">Confirmación</div>
        </div>
      </div>

      <!-- PASO 1: Buscar por DNI -->
      <div class="form-section active" id="step1">
        <h2 class="section-title">
          <i class="fas fa-search"></i>
          Paso 1: Ingrese su DNI
        </h2>

        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Nivel de Estudios <span class="required">*</span></label>
            <select id="select_nivel" class="form-control">
              <option value="PREGRADO">PREGRADO (Bachiller / Título)</option>
              <option value="POSGRADO">POSGRADO (Maestría)</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Número de DNI <span class="required">*</span></label>
            <input type="text" id="txt_dni" class="form-control" placeholder="Ingrese 8 dígitos" maxlength="8" pattern="[0-9]{8}">
          </div>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-primary" onclick="buscarDNI()">
            <i class="fas fa-search"></i>
            Buscar DNI
          </button>
        </div>
      </div>

      <!-- PASO 2: Datos Personales -->
      <div class="form-section" id="step2">
        <h2 class="section-title">
          <i class="fas fa-user"></i>
          Paso 2: Datos Personales y Académicos
        </h2>

        <!-- Datos de RENIEC (solo lectura) -->
        <div style="background: #e3f2fd; padding: 20px; border-radius: 12px; margin-bottom: 25px;">
          <h4 style="color: #0065B2; margin-bottom: 15px;">
            <i class="fas fa-id-card"></i> Datos de RENIEC
          </h4>
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">DNI</label>
              <input type="text" id="txt_dni_readonly" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label class="form-label">Nombres</label>
              <input type="text" id="txt_nombres" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label class="form-label">Apellido Paterno</label>
              <input type="text" id="txt_apellido_paterno" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label class="form-label">Apellido Materno</label>
              <input type="text" id="txt_apellido_materno" class="form-control" disabled>
            </div>
            <div class="form-group">
              <label class="form-label">Sexo <span class="required">*</span></label>
              <select id="cbo_sexo" class="form-control">
                <option value="">Seleccione Sexo</option>
                <option value="M">MASCULINO</option>
                <option value="F">FEMENINO</option>
              </select>
            </div>
            <div class="form-group" style="grid-column: span 3;">
              <label class="form-label">Dirección</label>
              <input type="text" id="txt_direccion" class="form-control" placeholder="Ej: Av. Los Andes 123">
            </div>
          </div>
        </div>

        <!-- Datos académicos -->
        <h4 style="color: #0065B2; margin-bottom: 15px;">
          <i class="fas fa-graduation-cap"></i> Datos Académicos
        </h4>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Código de Estudiante <span class="required">*</span></label>
            <input type="text" id="txt_codigo" class="form-control" placeholder="Ej: 2020001234">
          </div>
          
          <!-- Contenedor Pregrado -->
          <div id="container_pregrado" class="form-row" style="grid-column: span 2; margin-bottom: 0; gap: 20px;">
            <div class="form-group">
              <label class="form-label">Facultad <span class="required">*</span></label>
              <select id="select_facultad" class="form-control" style="width: 100%;">
                <option value="">Seleccione Facultad</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label">Escuela Profesional <span class="required">*</span></label>
              <select id="select_escuela" class="form-control" style="width: 100%;">
                <option value="">Seleccione Escuela</option>
              </select>
            </div>
          </div>

          <!-- Contenedor Posgrado -->
          <div id="container_posgrado" class="form-group hidden" style="grid-column: span 2;">
            <label class="form-label">Programa de Posgrado <span class="required">*</span></label>
            <select id="select_posgrado" class="form-control" style="width: 100%;">
              <option value="">Seleccione Programa</option>
            </select>
          </div>
        </div>

        <!-- Datos de contacto -->
        <h4 style="color: #0065B2; margin: 25px 0 15px;">
          <i class="fas fa-phone"></i> Datos de Contacto
        </h4>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Celular <span class="required">*</span></label>
            <input type="tel" id="txt_celular" class="form-control" placeholder="999999999" maxlength="9">
          </div>
          <div class="form-group">
            <label class="form-label">Correo Personal <span class="required">*</span></label>
            <input type="email" id="txt_correo_personal" class="form-control" placeholder="ejemplo@gmail.com">
          </div>
        </div>

        <!-- Foto tamaño pasaporte -->
        <h4 style="color: #0065B2; margin: 25px 0 15px;">
          <i class="fas fa-camera"></i> Foto Tamaño Pasaporte (Opcional)
        </h4>
        <div class="photo-upload" onclick="document.getElementById('file_foto').click()">
          <input type="file" id="file_foto" accept="image/jpeg,image/jpg,image/png" onchange="previewFoto(this)">
          <i class="fas fa-cloud-upload-alt" style="font-size: 48px; color: #0065B2; margin-bottom: 15px;"></i>
          <p style="font-weight: 600; color: #333;">Haz clic para seleccionar tu foto</p>
          <p style="font-size: 13px; color: #666;">Formato: JPG o PNG | Tamaño máximo: 2MB</p>
          <img id="preview_foto" class="photo-preview hidden" alt="Vista previa">
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-secondary" onclick="volverPaso(1)">
            <i class="fas fa-arrow-left"></i>
            Volver
          </button>
          <button type="button" class="btn btn-primary" onclick="siguientePaso(3)">
            Siguiente
            <i class="fas fa-arrow-right"></i>
          </button>
        </div>
      </div>

      <!-- PASO 3: Declaración Étnica -->
      <div class="form-section" id="step3">
        <h2 class="section-title">
          <i class="fas fa-file-signature"></i>
          Paso 3: Declaración Étnica y Lengua Indígena
        </h2>

        <div style="background: #fff3cd; padding: 15px; border-radius: 10px; margin-bottom: 20px; border-left: 4px solid #ffc107;">
          <p style="margin: 0; font-size: 14px;">
            <i class="fas fa-info-circle"></i> Esta información es importante para fines estadísticos y de inclusión. Por favor, responda con sinceridad.
          </p>
        </div>

        <!-- Mensaje de bloqueo -->
        <div id="msg_bloqueo_etnica" class="hidden" style="background: #e2e3e5; padding: 15px; border-radius: 10px; margin-bottom: 20px; border-left: 4px solid #6c757d;">
          <p style="margin: 0; font-size: 14px; color: #383d41;">
            <i class="fas fa-lock"></i> <strong>Declaración completada.</strong> Ya ha registrado su declaración étnica. Si necesita corregir algún dato, por favor contacte con la oficina de Grados y Títulos.
          </p>
        </div>

        <!-- Autoidentificación étnica -->
        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; margin-bottom: 25px; box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);">
          <label style="display: flex; align-items: center; cursor: pointer; color: white; font-size: 18px; font-weight: 600; margin: 0;">
            <input type="checkbox" id="chk_declaracion_etnica" style="width: 28px; height: 28px; margin-right: 15px; cursor: pointer; accent-color: #ffd700;">
            <span style="flex: 1;">
              <i class="fas fa-file-signature" style="margin-right: 10px;"></i>
              Declaro bajo juramento de ley de autoidentificación étnica
            </span>
          </label>
        </div>

        <div id="seccion_etnica" class="hidden">
          <h4 style="color: #0065B2; margin-bottom: 15px;">Seleccione el grupo étnico al que pertenece:</h4>
          <div class="radio-group">
            <label class="radio-option">
              <input type="radio" name="autoidentificacion" value="Pueblo indígena u originario" onchange="toggleEtniaInput(true)">
              <span>a) Pueblo indígena u originario (especificar)</span>
            </label>
            <div id="input_etnia" class="form-group hidden" style="margin-left: 40px;">
              <select id="cbo_etnia" class="form-control">
                <option value="">-- Seleccione Etnia --</option>
              </select>
              <input type="hidden" id="txt_nombre_etnia">
            </div>

            <label class="radio-option">
              <input type="radio" name="autoidentificacion" value="Población afroperuana" onchange="toggleEtniaInput(false)">
              <span>b) Población afroperuana, negra, morena, zambo, mulata, afrodescendiente</span>
            </label>

            <label class="radio-option">
              <input type="radio" name="autoidentificacion" value="No" onchange="toggleEtniaInput(false)">
              <span>c) No</span>
            </label>

            <label class="radio-option">
              <input type="radio" name="autoidentificacion" value="No sabe / No responde" onchange="toggleEtniaInput(false)">
              <span>d) No sabe / No responde</span>
            </label>
          </div>

          <!-- Lengua indígena -->
          <h4 style="color: #0065B2; margin: 30px 0 15px;">Declaro bajo juramento de ley de lengua indígena u originaria:</h4>
          <div class="radio-group">
            <label class="radio-option">
              <input type="radio" name="lengua_indigena" value="Sí" onchange="toggleLenguaInput(true)">
              <span>a) Sí (especificar)</span>
            </label>
            <div id="input_lengua" class="form-group hidden" style="margin-left: 40px;">
              <select id="cbo_lengua" class="form-control">
                <option value="">-- Seleccione Lengua --</option>
              </select>
              <input type="hidden" id="txt_nombre_lengua">
            </div>

            <label class="radio-option">
              <input type="radio" name="lengua_indigena" value="No" onchange="toggleLenguaInput(false)">
              <span>b) No</span>
            </label>

            <label class="radio-option">
              <input type="radio" name="lengua_indigena" value="No sabe / No responde" onchange="toggleLenguaInput(false)">
              <span>c) No sabe / No responde</span>
            </label>
          </div>
        </div>

        <div class="btn-group">
          <button type="button" class="btn btn-secondary" onclick="volverPaso(2)">
            <i class="fas fa-arrow-left"></i>
            Volver
          </button>
          <button type="button" class="btn btn-primary" onclick="siguientePaso(4)">
            Siguiente
            <i class="fas fa-arrow-right"></i>
          </button>
        </div>
      </div>

      <!-- PASO 4: Confirmación -->
      <div class="form-section" id="step4">
        <h2 class="section-title">
          <i class="fas fa-check-circle"></i>
          Paso 4: Confirmación de Datos
        </h2>

        <div style="background: #d4edda; padding: 20px; border-radius: 12px; border-left: 4px solid #28a745; margin-bottom: 25px;">
          <h4 style="color: #155724; margin-bottom: 10px;">
            <i class="fas fa-info-circle"></i> Revise sus datos antes de enviar
          </h4>
          <p style="margin: 0; color: #155724;">Por favor, verifique que toda la información sea correcta. Una vez enviado, solo podrá modificar sus datos si aún no tiene un diploma registrado.</p>
        </div>

        <div id="resumen_datos"></div>

        <div class="btn-group">
          <button type="button" class="btn btn-secondary" onclick="volverPaso(3)">
            <i class="fas fa-arrow-left"></i>
            Volver
          </button>
          <button type="button" class="btn btn-success" id="btn_guardar_final" onclick="guardarDatos()">
            <i class="fas fa-save"></i>
            Guardar y Finalizar
          </button>
        </div>
      </div>
    </div>
  </div>

  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.all.min.js"></script>
  <script src="js/catalogos_sunedu.js"></script>
  
  <script>
    let datosEstudiante = {};
    let fotoSubida = null;

    // Inicializar catálogos
    $(document).ready(function() {
        // Cargar Facultades
        Cargar_Select_Facultad();
        
        // Poblar Etnia
        if (typeof CATALOGO_ETNIAS !== 'undefined') {
            const $cboEtnia = $('#cbo_etnia');
            CATALOGO_ETNIAS.forEach(item => {
                $cboEtnia.append(new Option(`${item.id}. ${item.nombre}`, item.id));
            });
        }

        // Poblar Lengua
        if (typeof CATALOGO_LENGUAS !== 'undefined') {
            const $cboLengua = $('#cbo_lengua');
            CATALOGO_LENGUAS.forEach(item => {
                $cboLengua.append(new Option(`${item.id}. ${item.nombre}`, item.id));
            });
        }

        // Eventos change para capturar nombres
        $('#cbo_etnia').change(function() {
            const id = $(this).val();
            const item = CATALOGO_ETNIAS.find(x => x.id === id);
            $('#txt_nombre_etnia').val(item ? item.nombre : '');
        });

        $('#cbo_lengua').change(function() {
            const id = $(this).val();
            const item = CATALOGO_LENGUAS.find(x => x.id === id);
            $('#txt_nombre_lengua').val(item ? item.nombre : '');
        });

        // Manejar cambio de Nivel de Estudios
        $('#select_nivel').change(function() {
            const nivel = $(this).val();
            if (nivel === 'POSGRADO') {
                $('#container_pregrado').addClass('hidden');
                $('#container_posgrado').removeClass('hidden');
                Cargar_Select_Posgrado();
            } else {
                $('#container_pregrado').removeClass('hidden');
                $('#container_posgrado').addClass('hidden');
            }
        });
    });

    // Cargar Programas de Posgrado
    function Cargar_Select_Posgrado() {
      $.ajax({
        url: "controller/registro_general_posgrado/controlador_cargar_select_programa.php",
        type: 'POST',
        dataType: 'json'
      }).done(function(data) {
        let cadena = "<option value=''>Seleccione Programa</option>";
        if (data && data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                cadena += "<option value='" + data[i][1] + "'>" + data[i][1] + "</option>";
            }
            $('#select_posgrado').html(cadena);
        }
      }).fail(function() {
        Swal.fire('Error', 'No se pudieron cargar los programas de posgrado', 'error');
      });
    }

    // Cargar Facultades
    function Cargar_Select_Facultad() {
      $.ajax({
        url: "controller/carreras/controlador_cargar_select_facultad.php",
        type: 'POST',
        dataType: 'json'
      }).done(function(data) {
        console.log('Facultades cargadas:', data);
        let cadena = "<option value=''>Seleccione Facultad</option>";
        if (data && data.length > 0) {
          for (var i = 0; i < data.length; i++) {
            // Guardar el NOMBRE como value, no el ID
            cadena += "<option value='" + data[i][1] + "' data-id='" + data[i][0] + "'>" + data[i][1] + "</option>";
          }
          $('#select_facultad').html(cadena);
          
          // Listener para cambios
          $('#select_facultad').off('change').on('change', function() {
            const selectedOption = $(this).find('option:selected');
            const idFacultad = selectedOption.attr('data-id');
            console.log('Facultad seleccionada - ID:', idFacultad, 'Nombre:', $(this).val());
            
            if (idFacultad) {
              Cargar_Select_Escuela(idFacultad);
            } else {
              $('#select_escuela').html("<option value=''>Seleccione Escuela</option>");
            }
          });
        } else {
          cadena += "<option value=''>No se encontraron registros</option>";
          $('#select_facultad').html(cadena);
        }
      }).fail(function(xhr, status, error) {
        console.error('Error cargando facultades:', error);
        Swal.fire('Error', 'No se pudieron cargar las facultades', 'error');
      });
    }

    // Cargar Escuelas según Facultad
    function Cargar_Select_Escuela(idFacultad) {
      console.log('Cargando escuelas para facultad ID:', idFacultad);
      $.ajax({
        url: "controller/carreras/controlador_cargar_select_escuela.php",
        type: 'POST',
        data: { id: idFacultad },
        dataType: 'json'
      }).done(function(data) {
        console.log('Escuelas cargadas:', data);
        let cadena = "<option value=''>Seleccione Escuela</option>";
        if (data && data.length > 0) {
          for (var i = 0; i < data.length; i++) {
            // Guardar el NOMBRE como value, no el ID
            cadena += "<option value='" + data[i][1] + "' data-id='" + data[i][0] + "'>" + data[i][1] + "</option>";
          }
          $('#select_escuela').html(cadena);
        } else {
          cadena += "<option value=''>No hay escuelas disponibles</option>";
          $('#select_escuela').html(cadena);
        }
      }).fail(function(xhr, status, error) {
        console.error('Error cargando escuelas:', error);
        Swal.fire('Error', 'No se pudieron cargar las escuelas', 'error');
      });
    }

    // Buscar DNI
    function buscarDNI() {
      const dni = $('#txt_dni').val().trim();
      const nivel = $('#select_nivel').val();

      if (dni.length !== 8 || !/^\d{8}$/.test(dni)) {
        Swal.fire('Error', 'Por favor ingrese un DNI válido de 8 dígitos', 'error');
        return;
      }

      Swal.fire({
        title: 'Buscando...',
        text: 'Consultando información de ' + nivel,
        allowOutsideClick: false,
        didOpen: () => {
          Swal.showLoading();
        }
      });

      // Primero buscar en BD
      $.ajax({
        url: 'controller/estudiante_publico/controlador_buscar_estudiante.php',
        type: 'POST',
        data: { 
          dni: dni,
          nivel: nivel
        },
        dataType: 'json',
        success: function(response) {
          if (response.success && response.existe) {
            // Estudiante existe
            if (!response.puede_actualizar) {
              Swal.fire('Información', response.message, 'info');
              return;
            }
            // Pasar también el flag de edición de étnica (si no viene, asumir true)
            const puedeEditarEtnica = response.puede_editar_var_etnica !== undefined ? response.puede_editar_var_etnica : true;
            cargarDatosExistentes(response.datos, puedeEditarEtnica);
            siguientePaso(2);
          } else {
            // No existe, consultar RENIEC
            consultarRENIEC(dni);
          }
        },
        error: function() {
          Swal.fire('Error', 'Error al buscar estudiante', 'error');
        }
      });
    }

    // Consultar RENIEC
    function consultarRENIEC(dni) {
      $.ajax({
        url: 'consulta-dni-ajax.php',
        type: 'POST',
        data: { dni: dni },
        dataType: 'json',
        success: function(data) {
          Swal.close();
          
          if (data === 1 || data.error || !data.first_name) {
            Swal.fire('Error', 'No se pudo obtener información de RENIEC. Verifique el DNI.', 'error');
            return;
          }

          // Llenar datos de RENIEC con los campos correctos
          $('#txt_dni_readonly').val(dni);
          $('#txt_nombres').val(data.first_name);
          $('#txt_apellido_paterno').val(data.first_last_name);
          $('#txt_apellido_materno').val(data.second_last_name);
          
          if (data.gender || data.sexo) {
             const sexo = data.gender || data.sexo;
             $('#cbo_sexo').val((sexo === 'M' || sexo === '1') ? 'M' : 'F');
          }

          datosEstudiante = {
            dni: dni,
            nombres: data.first_name,
            apellido_paterno: data.first_last_name,
            apellido_materno: data.second_last_name,
            sexo: $('#cbo_sexo').val() // 'M' o 'F'
          };

          Swal.fire('Éxito', 'Datos obtenidos correctamente. Por favor complete la información adicional.', 'success');
          siguientePaso(2);
        },
        error: function() {
          Swal.close();
          Swal.fire('Error', 'Error al consultar RENIEC', 'error');
        }
      });
    }

    // Cargar datos existentes
    function cargarDatosExistentes(datos, puedeEditarEtnica = true) {
      $('#txt_dni_readonly').val(datos.Dni);
      $('#txt_nombres').val(datos.Nombres);
      $('#txt_apellido_paterno').val(datos.Apellido_paterno);
      $('#txt_apellido_materno').val(datos.Apellido_materno);
      $('#cbo_sexo').val(datos.Sexo || '');
      $('#txt_codigo').val(datos.Codigo || '');
      $('#txt_celular').val(datos.Celular || '');
      $('#txt_correo_personal').val(datos.correo_personal || '');

      // Pre-llenar datos étnicos si existen
      // Cargar datos de declaración étnica (mapeo inverso)
      if (datos.DET_ETNICA) {
          let valRadio = '';
          if (datos.DET_ETNICA === 'A') {
              valRadio = 'Pueblo indígena u originario';
              toggleEtniaInput(true);
              if (datos.COD_ETNIA) {
                  // Necesitamos esperar a que cargue el catálogo o setearlo
                  setTimeout(() => {
                     $('#cbo_etnia').val(datos.COD_ETNIA).trigger('change'); 
                  }, 500);
              }
          } else if (datos.DET_ETNICA === 'B') {
              valRadio = 'Población afroperuana';
          } else if (datos.DET_ETNICA === 'C') {
              valRadio = 'No';
          } else if (datos.DET_ETNICA === 'D') {
              valRadio = 'No sabe / No responde';
          }
          
          if (valRadio) {
              $(`input[name="autoidentificacion"][value="${valRadio}"]`).prop('checked', true);
              $('#chk_declaracion_etnica').prop('checked', true).trigger('change');
              $('#step3-indicator').addClass('completed'); // Visual aid
          }
      }

      if (datos.DET_LENGUA) {
          let valRadio = '';
          if (datos.DET_LENGUA === 'A') {
              valRadio = 'Sí';
              toggleLenguaInput(true);
              if (datos.COD_LENGUA) {
                   setTimeout(() => {
                     $('#cbo_lengua').val(datos.COD_LENGUA).trigger('change');
                   }, 500);
              }
          } else if (datos.DET_LENGUA === 'B') {
              valRadio = 'No';
          } else if (datos.DET_LENGUA === 'C') {
              valRadio = 'No sabe / No responde';
          }
          
          if (valRadio) {
              $(`input[name="lengua_indigena"][value="${valRadio}"]`).prop('checked', true);
          }
      }

      // Manejar bloqueo de edición étnica
      if (!puedeEditarEtnica) {
        $('#msg_bloqueo_etnica').removeClass('hidden');
        $('#chk_declaracion_etnica').prop('disabled', true);
        $('input[name="autoidentificacion"]').prop('disabled', true);
        $('input[name="lengua_indigena"]').prop('disabled', true);
        $('#cbo_etnia').prop('disabled', true);
        $('#cbo_lengua').prop('disabled', true);
      } else {
        $('#msg_bloqueo_etnica').addClass('hidden');
        $('#chk_declaracion_etnica').prop('disabled', false);
        $('input[name="autoidentificacion"]').prop('disabled', false);
        $('input[name="lengua_indigena"]').prop('disabled', false);
        // Los selects se habilitan/deshabilitan en los toggles
      }

      datosEstudiante = {
        dni: datos.Dni,
        nombres: datos.Nombres,
        apellido_paterno: datos.Apellido_paterno,
        apellido_materno: datos.Apellido_materno,
        sexo: datos.Sexo
      };

      Swal.close();
      Swal.fire('Información', 'Datos cargados. Puede actualizar su información.', 'info');
    }

    // Preview de foto
    function previewFoto(input) {
      if (input.files && input.files[0]) {
        const file = input.files[0];
        if (file.size > 2 * 1024 * 1024) {
          Swal.fire('Error', 'La foto no debe superar los 2MB', 'error');
          input.value = '';
          return;
        }
        const reader = new FileReader();
        reader.onload = function(e) {
          $('#preview_foto').attr('src', e.target.result).removeClass('hidden');
        };
        reader.readAsDataURL(file);
      }
    }

    // Toggle inputs
    function toggleEtniaInput(show) {
      if (show) {
        $('#input_etnia').removeClass('hidden');
      } else {
        $('#input_etnia').addClass('hidden');
        $('#cbo_etnia').val('');
        $('#txt_nombre_etnia').val('');
      }
    }

    function toggleLenguaInput(show) {
      if (show) {
        $('#input_lengua').removeClass('hidden');
      } else {
        $('#input_lengua').addClass('hidden');
        $('#cbo_lengua').val('');
        $('#txt_nombre_lengua').val('');
      }
    }

    // Checkbox declaración
    $('#chk_declaracion_etnica').change(function() {
      if ($(this).is(':checked')) {
        $('#seccion_etnica').removeClass('hidden');
      } else {
        $('#seccion_etnica').addClass('hidden');
        $('input[name="autoidentificacion"]').prop('checked', false);
        $('input[name="lengua_indigena"]').prop('checked', false);
        toggleEtniaInput(false);
        toggleLenguaInput(false);
      }
    });

    // Navegación entre pasos
    function siguientePaso(paso) {
      // Validaciones para pasar al paso 3 (Datos Académicos y Contacto)
      if (paso === 3) {
        // Validar Código
        if (!$('#txt_codigo').val().trim()) {
          Swal.fire('Atención', 'El código de estudiante es obligatorio', 'warning');
          return;
        }

        const nivel = $('#select_nivel').val();
        if (nivel === 'PREGRADO') {
            // Validar Facultad
            if (!$('#select_facultad').val()) {
              Swal.fire('Atención', 'Debe seleccionar una Facultad', 'warning');
              return;
            }

            // Validar Escuela
            if (!$('#select_escuela').val()) {
              Swal.fire('Atención', 'Debe seleccionar una Escuela Profesional', 'warning');
              return;
            }
        } else {
            // Validar Posgrado
            if (!$('#select_posgrado').val()) {
              Swal.fire('Atención', 'Debe seleccionar un Programa de Posgrado', 'warning');
              return;
            }
        }

        // Validar Celular
        if (!$('#txt_celular').val().trim()) {
          Swal.fire('Atención', 'El número de celular es obligatorio', 'warning');
          return;
        }

        // Validar Correo Personal (al menos uno de los dos, pero priorizamos personal por solicitud)
        if (!$('#txt_correo_personal').val().trim()) {
          Swal.fire('Atención', 'El correo personal es obligatorio', 'warning');
          return;
        }
        
        // El resto (fechas, dirección, correo inst) son opcionales
      }
      // Validación paso 4 (previo a confirmar)
      if (paso === 4) {
        if ($('#chk_declaracion_etnica').is(':checked')) {
            // Validar si seleccionó algo
            if (!$('input[name="autoidentificacion"]:checked').val()) {
                Swal.fire('Atención', 'Debe seleccionar una opción de autoidentificación étnica', 'warning');
                return;
            }
            if ($('input[name="autoidentificacion"]:checked').val() == 'Pueblo indígena u originario' && !$('#cbo_etnia').val()) {
                Swal.fire('Atención', 'Debe seleccionar el grupo étnico de la lista', 'warning');
                return;
            }
            if (!$('input[name="lengua_indigena"]:checked').val()) {
                Swal.fire('Atención', 'Debe seleccionar una opción de lengua indígena', 'warning');
                return;
            }
            if ($('input[name="lengua_indigena"]:checked').val() == 'Sí' && !$('#cbo_lengua').val()) {
                Swal.fire('Atención', 'Debe seleccionar la lengua indígena de la lista', 'warning');
                return;
            }
        }
      }

      $('.form-section').removeClass('active');
      $('#step' + paso).addClass('active');
      
      $('.step').removeClass('active completed');
      for (let i = 1; i < paso; i++) {
        $('#step' + i + '-indicator').addClass('completed');
      }
      $('#step' + paso + '-indicator').addClass('active');

      if (paso === 4) {
        mostrarResumen();
      }

      window.scrollTo(0, 0);
    }

    function volverPaso(paso) {
      siguientePaso(paso);
    }

    // Mostrar resumen
    function mostrarResumen() {
      let html = '<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">';
      
      // Tarjeta: Datos Personales
      html += '<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3); color: white;">';
      html += '<h5 style="margin: 0 0 20px 0; font-size: 18px; font-weight: 700; display: flex; align-items: center; gap: 10px;"><i class="fas fa-user-circle"></i> DATOS PERSONALES</h5>';
      
      const nivel = $('#select_nivel').val();
      const datosPersonales = [
        { icon: 'id-card', label: 'DNI', value: $('#txt_dni_readonly').val() },
        { icon: 'user', label: 'Nombres', value: $('#txt_nombres').val() },
        { icon: 'users', label: 'Apellidos', value: $('#txt_apellido_paterno').val() + ' ' + $('#txt_apellido_materno').val() },
        { icon: 'graduation-cap', label: 'Código', value: $('#txt_codigo').val() }
      ];

      if (nivel === 'PREGRADO') {
        datosPersonales.push({ icon: 'university', label: 'Facultad', value: $('#select_facultad').val() || 'No especificado' });
        datosPersonales.push({ icon: 'book-open', label: 'Escuela Profesional', value: $('#select_escuela').val() || 'No especificado' });
      } else {
        datosPersonales.push({ icon: 'university', label: 'Programa de Posgrado', value: $('#select_posgrado').val() || 'No especificado' });
      }

      datosPersonales.forEach(item => {
        html += `<div style="margin-bottom: 12px; padding: 12px; background: rgba(255,255,255,0.15); border-radius: 8px; backdrop-filter: blur(10px);">
                  <div style="font-size: 11px; opacity: 0.9; margin-bottom: 4px;"><i class="fas fa-${item.icon}"></i> ${item.label}</div>
                  <div style="font-size: 15px; font-weight: 600;">${item.value}</div>
                </div>`;
      });
      html += '</div>';

      // Tarjeta: Contacto (con correo destacado)
      html += '<div style="background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%); padding: 25px; border-radius: 15px; box-shadow: 0 8px 20px rgba(0, 101, 178, 0.3); color: white;">';
      html += '<h5 style="margin: 0 0 20px 0; font-size: 18px; font-weight: 700; display: flex; align-items: center; gap: 10px;"><i class="fas fa-address-book"></i> CONTACTO</h5>';
      
      html += `<div style="margin-bottom: 12px; padding: 12px; background: rgba(255,255,255,0.15); border-radius: 8px; backdrop-filter: blur(10px);">
                <div style="font-size: 11px; opacity: 0.9; margin-bottom: 4px;"><i class="fas fa-phone"></i> Celular</div>
                <div style="font-size: 15px; font-weight: 600;">${$('#txt_celular').val()}</div>
              </div>`;
      
      // Correo destacado con animación
      html += `<div style="margin-bottom: 0; padding: 15px; background: rgba(255,255,255,0.25); border: 2px solid rgba(255,255,255,0.5); border-radius: 10px; backdrop-filter: blur(10px); box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
                <div style="font-size: 11px; opacity: 0.95; margin-bottom: 6px; font-weight: 600;"><i class="fas fa-envelope"></i> CORREO ELECTRÓNICO</div>
                <div style="font-size: 16px; font-weight: 700; word-break: break-all;">${$('#txt_correo_personal').val()}</div>
              </div>`;
      html += '</div>';
      
      // Tarjeta: Declaración Étnica (si aplica)
      if ($('#chk_declaracion_etnica').is(':checked')) {
        html += '<div style="background: linear-gradient(135deg, #28a745 0%, #20c997 100%); padding: 25px; border-radius: 15px; box-shadow: 0 8px 20px rgba(40, 167, 69, 0.3); color: white; grid-column: 1 / -1;">';
        html += '<h5 style="margin: 0 0 20px 0; font-size: 18px; font-weight: 700; display: flex; align-items: center; gap: 10px;"><i class="fas fa-fingerprint"></i> DECLARACIÓN ÉTNICA Y LINGÜÍSTICA</h5>';
        
        html += '<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 15px;">';
        
        const autoident = $('input[name="autoidentificacion"]:checked').val();
        let displayEtnia = autoident;
        if (autoident === 'Pueblo indígena u originario') {
          displayEtnia = $('#cbo_etnia option:selected').text();
        }

        const lengua = $('input[name="lengua_indigena"]:checked').val();
        let displayLengua = lengua;
        if (lengua === 'Sí') {
          displayLengua = $('#cbo_lengua option:selected').text();
        }

        html += `<div style="padding: 12px; background: rgba(255,255,255,0.15); border-radius: 8px; backdrop-filter: blur(10px);">
                  <div style="font-size: 11px; opacity: 0.9; margin-bottom: 4px;"><i class="fas fa-user-tag"></i> Autoidentificación</div>
                  <div style="font-size: 15px; font-weight: 600;">${displayEtnia || 'No especificado'}</div>
                </div>`;
        
        html += `<div style="padding: 12px; background: rgba(255,255,255,0.15); border-radius: 8px; backdrop-filter: blur(10px);">
                  <div style="font-size: 11px; opacity: 0.9; margin-bottom: 4px;"><i class="fas fa-language"></i> Lengua Indígena</div>
                  <div style="font-size: 15px; font-weight: 600;">${displayLengua || 'No especificado'}</div>
                </div>`;
        
        html += '</div></div>';
      }
      
      html += '</div>';
      
      // Mensaje de advertencia
      html += '<div style="margin-top: 20px; padding: 15px; background: #fff3cd; border-left: 4px solid #ffc107; border-radius: 8px;">';
      html += '<p style="margin: 0; color: #856404; font-size: 14px;"><i class="fas fa-exclamation-triangle"></i> <strong>Importante:</strong> Verifique que su correo electrónico sea correcto. Recibirá una copia de su declaración jurada en ese correo.</p>';
      html += '</div>';
      
      $('#resumen_datos').html(html);
    }

    // Guardar datos
    async function guardarDatos() {
      // Bloquear botón para evitar doble clic
      const btnGuardar = $('#btn_guardar_final');
      const textoOriginal = btnGuardar.html();
      btnGuardar.prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Procesando...');

      Swal.fire({
        title: 'Guardando...',
        text: 'Por favor espere mientras procesamos su registro',
        allowOutsideClick: false,
        didOpen: () => {
          Swal.showLoading();
        }
      });

      // Subir foto si existe
      let rutaFoto = null;
      let rutaPdf = null;
      if ($('#file_foto')[0].files.length > 0) {
        const formDataFoto = new FormData();
        formDataFoto.append('foto', $('#file_foto')[0].files[0]);
        formDataFoto.append('dni', $('#txt_dni_readonly').val());

        try {
          const respFoto = await $.ajax({
            url: 'controller/estudiante_publico/controlador_subir_foto.php',
            type: 'POST',
            data: formDataFoto,
            processData: false,
            contentType: false,
            dataType: 'json'
          });

          if (respFoto.success) {
            rutaFoto = respFoto.ruta;
          }
        } catch (error) {
          console.error('Error al subir foto:', error);
        }
      }
      
      // Determinar valores étnicos para guardar
      let valAutoIdentificacion = $('input[name="autoidentificacion"]:checked').val();
      let detEtnica = '';
      let codEtnia = null;

      if (valAutoIdentificacion === 'Pueblo indígena u originario') {
          detEtnica = 'A';
          codEtnia = $('#cbo_etnia').val();
      } else if (valAutoIdentificacion === 'Población afroperuana') {
          detEtnica = 'B';
      } else if (valAutoIdentificacion === 'No') {
          detEtnica = 'C';
      } else if (valAutoIdentificacion === 'No sabe / No responde') {
          detEtnica = 'D';
      }

      let valLenguaIndigena = $('input[name="lengua_indigena"]:checked').val();
      let detLengua = '';
      let codLengua = null;

      if (valLenguaIndigena === 'Sí') {
          detLengua = 'A';
          codLengua = $('#cbo_lengua').val();
      } else if (valLenguaIndigena === 'No') {
          detLengua = 'B';
      } else if (valLenguaIndigena === 'No sabe / No responde') {
          detLengua = 'C';
      }

      // Preparar datos
      const formData = {
        tipo_documento: 'DNI',
        nivel: $('#select_nivel').val(),
        dni: $('#txt_dni_readonly').val(),
        nombres: $('#txt_nombres').val(),
        apellido_paterno: $('#txt_apellido_paterno').val(),
        apellido_materno: $('#txt_apellido_materno').val(),
        sexo: $('#cbo_sexo').val(),
        codigo: $('#txt_codigo').val(),
        // Campos académicos condicionales
        facultad: $('#select_nivel').val() === 'PREGRADO' ? $('#select_facultad').val() : '',
        escuela: $('#select_nivel').val() === 'PREGRADO' ? $('#select_escuela').val() : '',
        posgrado: $('#select_nivel').val() === 'POSGRADO' ? $('#select_posgrado').val() : '',
        
        celular: $('#txt_celular').val(),
        direccion: $('#txt_direccion').val() || '',
        correo_personal: $('#txt_correo_personal').val(),
        correo_institucional: '', // Campo removido del formulario
        fecha_matricula: '', // Campo removido del formulario
        fecha_egreso: '', // Campo removido del formulario
        foto_pasaporte: rutaFoto,
        observaciones: '',
        // Nuevos campos
        det_etnica: detEtnica,
        cod_etnia: codEtnia,
        det_lengua: detLengua,
        cod_lengua: codLengua,
        
        declaracion_etnica_pdf: rutaPdf
      };

      // Guardar
      $.ajax({
        url: 'controller/estudiante_publico/controlador_guardar_estudiante.php',
        type: 'POST',
        data: formData,
        dataType: 'json',
        success: function(response) {
          Swal.close();
          if (response.success) {
            // Llamar al procesador de PDF y correo
            $.ajax({
              url: 'controller/estudiante_publico/procesar_pdf_email.php',
              type: 'POST',
              data: {
                dni: $('#txt_dni').val(),
                codigo: $('#txt_codigo').val(),
                nombres: $('#txt_nombres').val(),
                apellido_paterno: $('#txt_apellido_paterno').val(),
                apellido_materno: $('#txt_apellido_materno').val(),
                correo_personal: $('#txt_correo_personal').val(),
                nivel: $('#select_nivel').val()
              },
              dataType: 'json',
              success: function(pdfResponse) {
                if (pdfResponse.success && pdfResponse.pdf_url) {
                  // Descargar PDF
                  const link = document.createElement('a');
                  link.href = pdfResponse.pdf_url;
                  link.download = 'Declaracion_Etnica.pdf';
                  document.body.appendChild(link);
                  link.click();
                  document.body.removeChild(link);
                  
                  Swal.fire({
                    icon: 'success',
                    title: '¡Registro Exitoso!',
                    html: '<div style="text-align: left;">' +
                          '<p>Se han registrado sus datos correctamente.</p>' +
                          '<p style="margin-top: 10px; color: #28a745;"><strong><i class="fas fa-check-circle"></i> Declaración Jurada descargada.</strong></p>' +
                          (pdfResponse.email_sent ? '<p style="margin-top: 5px; color: #0065B2;"><strong><i class="fas fa-envelope"></i> Se envió una copia a su correo personal.</strong></p>' : '') +
                          '</div>',
                    confirmButtonText: 'Aceptar',
                    allowOutsideClick: false
                  }).then(() => { location.reload(); });
                } else {
                  Swal.fire({
                    icon: 'success',
                    title: '¡Registro Completado!',
                    text: 'Sus datos se guardaron, pero hubo un inconveniente al generar el PDF. Por favor contacte a la oficina.',
                    confirmButtonText: 'Aceptar'
                  }).then(() => { location.reload(); });
                }
              },
              error: function() {
                Swal.fire({
                  icon: 'success',
                  title: '¡Registro Completado!',
                  text: 'Sus datos se guardaron correctamente. (El PDF no pudo generarse en este momento)',
                  confirmButtonText: 'Aceptar'
                }).then(() => { location.reload(); });
              }
            });
          } else {
            // Rehabilitar botón si hubo error en lógica de negocio
            btnGuardar.prop('disabled', false).html(textoOriginal);
            Swal.fire('Error', response.message, 'error');
          }

        },
        error: function() {
          // Rehabilitar botón si hubo error de conexión
          btnGuardar.prop('disabled', false).html(textoOriginal);
          Swal.close();
          Swal.fire('Error', 'Ocurrió un error al intentar guardar los datos. Intente nuevamente.', 'error');
        }
      });
    }
  </script>
</body>
</html>
