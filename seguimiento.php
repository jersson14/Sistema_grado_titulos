<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>UTEA | PERÚ</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.min.css">
  
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: 'Source Sans Pro', sans-serif;
      background: #0f172a;
      min-height: 100vh;
      padding: 20px;
      position: relative;
      overflow-x: hidden;
    }
    
    /* Fondo animado de graduación académica */
    .animated-background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: 0;
      overflow: hidden;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }
    
    .graduation-cap {
      position: absolute;
      font-size: 40px;
      opacity: 0.15;
      animation: float 20s infinite ease-in-out;
      color: white;
    }
    
    @keyframes float {
      0%, 100% {
        transform: translateY(0) rotate(0deg);
        opacity: 0.15;
      }
      50% {
        transform: translateY(-100px) rotate(180deg);
        opacity: 0.25;
      }
    }
    
    .book {
      position: absolute;
      font-size: 35px;
      opacity: 0.12;
      animation: drift 25s infinite ease-in-out;
      color: white;
    }
    
    @keyframes drift {
      0%, 100% {
        transform: translate(0, 0) rotate(0deg);
        opacity: 0.12;
      }
      50% {
        transform: translate(50px, -80px) rotate(90deg);
        opacity: 0.22;
      }
    }
    
    .diploma {
      position: absolute;
      font-size: 30px;
      opacity: 0.1;
      animation: sway 18s infinite ease-in-out;
      color: white;
    }
    
    @keyframes sway {
      0%, 100% {
        transform: translateX(0) rotate(-10deg);
        opacity: 0.1;
      }
      50% {
        transform: translateX(-60px) rotate(10deg);
        opacity: 0.2;
      }
    }
    
    .academic-circle {
      position: absolute;
      border-radius: 50%;
      border: 2px solid rgba(255, 255, 255, 0.1);
      animation: pulse-circle 15s infinite ease-in-out;
    }
    
    @keyframes pulse-circle {
      0%, 100% {
        transform: scale(1);
        opacity: 0.3;
      }
      50% {
        transform: scale(1.2);
        opacity: 0.1;
      }
    }
    
    .container-fluid {
      max-width: 1400px;
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
    
    /* Navegación moderna */
    .nav-links {
      display: flex;
      justify-content: center;
      gap: 15px;
      flex-wrap: wrap;
      margin-top: 25px;
    }
    
    .nav-btn {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 12px 24px;
      border-radius: 50px;
      text-decoration: none;
      font-weight: 600;
      font-size: 14px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    .nav-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
    }
    
    .nav-btn.login {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
    }
    
    .nav-btn.posgrado {
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
    }
    
    .nav-btn.manual {
      background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
      color: white;
    }
    
    /* Card principal */
    .main-card {
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 40px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      margin-bottom: 30px;
    }
    
    .info-banner {
      background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
      border-left: 4px solid #667eea;
      padding: 20px;
      border-radius: 12px;
      margin-bottom: 30px;
      color: #333;
      line-height: 1.8;
    }
    
    .search-section {
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
      padding: 30px;
      border-radius: 16px;
      margin-bottom: 30px;
      box-shadow: 0 8px 32px rgba(0, 101, 178, 0.4);
    }
    
    .search-title {
      font-size: 22px;
      font-weight: 700;
      margin-bottom: 25px;
      display: flex;
      align-items: center;
      gap: 10px;
    }
    
    .search-form {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      align-items: end;
    }
    
    @media (max-width: 768px) {
      .search-form {
        grid-template-columns: 1fr;
      }
    }
    
    .form-group {
      display: flex;
      flex-direction: column;
      gap: 8px;
    }
    
    .form-label {
      font-weight: 600;
      font-size: 14px;
    }
    
    .form-control {
      padding: 14px 18px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 12px;
      font-size: 16px;
      background: rgba(255, 255, 255, 0.95);
      transition: all 0.3s ease;
      color: #333;
    }
    
    .form-control:focus {
      outline: none;
      border-color: white;
      background: white;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    .btn-search {
      padding: 14px 32px;
      background: white;
      color: #0065B2;
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
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }
    
    .btn-search:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    }
    
    .btn-search:active {
      transform: translateY(0);
    }
    
    /* Tabla mejorada */
    .table-container {
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      overflow: hidden;
    }
    
    .table-responsive {
      overflow-x: auto;
    }
    
    #tabla_registro_general {
      font-family: "Times New Roman", Times, serif;
      width: 100% !important;
      border-collapse: separate;
      border-spacing: 0;
    }
    
    #tabla_registro_general thead {
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
    }
    
    #tabla_registro_general thead th {
      padding: 16px;
      font-weight: 600;
      text-align: center;
      font-size: 14px;
      border: none;
    }
    
    #tabla_registro_general tbody td {
      padding: 14px;
      text-align: center;
      border-bottom: 1px solid #e0e0e0;
      transition: background 0.2s ease;
    }
    
    #tabla_registro_general tbody tr:hover {
      background: #f8f9fa;
    }
    
    /* Footer moderno */
    .footer {
      background: rgba(255, 255, 255, 0.98);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 25px;
      text-align: center;
      box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
      color: #666;
    }
    
    .footer a {
      color: #0065B2;
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s ease;
    }
    
    .footer a:hover {
      color: #00a8ff;
    }
    
    .required {
      color: #e74c3c;
      font-weight: bold;
    }
    
    /* Animaciones sutiles */
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
    
    .main-card, .table-container {
      animation: fadeIn 0.6s ease;
    }
    
    /* Ocultar elementos */
    .hidden {
      display: none;
    }
  </style>
</head>

<body>
  <!-- Fondo animado académico -->
  <div class="animated-background">
    <!-- Birretes flotantes -->
    <div class="graduation-cap" style="top: 10%; left: 15%; animation-delay: 0s;">🎓</div>
    <div class="graduation-cap" style="top: 60%; left: 80%; animation-delay: 3s;">🎓</div>
    <div class="graduation-cap" style="top: 30%; left: 70%; animation-delay: 7s;">🎓</div>
    <div class="graduation-cap" style="top: 80%; left: 20%; animation-delay: 5s;">🎓</div>
    <div class="graduation-cap" style="top: 45%; left: 40%; animation-delay: 9s;">🎓</div>
    
    <!-- Libros flotantes -->
    <div class="book" style="top: 20%; left: 50%; animation-delay: 2s;">📚</div>
    <div class="book" style="top: 70%; left: 60%; animation-delay: 6s;">📚</div>
    <div class="book" style="top: 40%; left: 10%; animation-delay: 4s;">📚</div>
    <div class="book" style="top: 85%; left: 75%; animation-delay: 8s;">📚</div>
    
    <!-- Diplomas flotantes -->
    <div class="diploma" style="top: 15%; left: 85%; animation-delay: 1s;">📜</div>
    <div class="diploma" style="top: 55%; left: 25%; animation-delay: 5s;">📜</div>
    <div class="diploma" style="top: 75%; left: 45%; animation-delay: 7s;">📜</div>
    
    <!-- Círculos decorativos -->
    <div class="academic-circle" style="top: 10%; left: 5%; width: 150px; height: 150px; animation-delay: 0s;"></div>
    <div class="academic-circle" style="top: 50%; right: 10%; width: 200px; height: 200px; animation-delay: 3s;"></div>
    <div class="academic-circle" style="bottom: 15%; left: 30%; width: 120px; height: 120px; animation-delay: 6s;"></div>
  </div>
  
  <div class="container-fluid">
    <!-- Header -->
    <div class="header-section">
      <div class="logo-container">
        <img src="img/utea.png" alt="UTEA Logo">
      </div>
      <h1 class="header-title">UNIVERSIDAD TECNOLÓGICA DE LOS ANDES</h1>
      <p class="header-subtitle">Seguimiento de Expediente Pregrado</p>
      
      <div class="nav-links">

        <a href="seguimiento_posgrado.php" class="nav-btn posgrado">
          <i class="fa fa-graduation-cap"></i>
          <span>Seguimiento Posgrado</span>
        </a>
        <a href="manual_usuario.pdf" target="_blank" class="nav-btn manual">
          <i class="fa fa-file-pdf"></i>
          <span>Manual de Usuario</span>
        </a>
      </div>
    </div>
    
    <!-- Contenido principal -->
    <div class="main-card">
      <div class="info-banner">
        <p><strong>Bienvenido al Sistema de Seguimiento de Expedientes de pregrado.</strong> La Universidad Tecnológica de los Andes pone a su disposición esta plataforma para consultar el estado de su expediente de manera rápida y segura. Para una búsqueda exitosa, ingrese su <strong>Número de Documento</strong> (DNI, Pasaporte o Carnet de Extranjería) sin espacios ni guiones y luego de clic en Buscar Expediente.</p>
      </div>
      
      <div class="search-section">
        <h2 class="search-title">
          <i class="fa fa-search"></i>
          Buscar Expediente
        </h2>
        
        <div class="search-form">
          <div class="form-group">
            <label class="form-label">
              Número de Documento <span class="required">(*)</span>
            </label>
            <input 
              type="text" 
              class="form-control" 
              id="txt_dni" 
              placeholder="Ingrese su DNI, Pasaporte o Carnet"
              onkeypress="return soloNumeros(event)">
          </div>
          
          <div class="form-group">
            <button class="btn-search" id="buscar" onclick="Traer_Datos_Seguimiento()">
              <i class="fa fa-search"></i>
              <span>Buscar Expediente</span>
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Tabla de resultados -->
    <div id="div_buscador" class="table-container hidden">
      <div class="table-responsive">
        <table id="tabla_registro_general" class="table">
          <thead>
            <tr>
              <th>Tipo</th>
              <th>Denominación</th>
              <th>N° Documento</th>
              <th>Estudiante</th>
              <th>Facultad</th>
              <th>Escuela</th>
              <th>Modalidad</th>
              <th>Estado</th>
              <th>Fecha Colación</th>
              <th>Trabajo de Investigación</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
    
    <!-- Footer -->
    <div class="footer">
      <p>
        <strong>Copyright © 2025 <a href="https://utea.edu.pe/" target="_blank">UTEA - ABANCAY</a></strong>
        <span style="margin: 0 15px;">|</span>
        <em>Versión 1.0.0</em>
      </p>
    </div>
  </div>
  
  <!-- Campos ocultos -->
  <div class="hidden">
    <select id="txt_id"></select>
    <input type="text" id="txt_fecha_inicio">
    <input type="text" id="txt_fecha_fin">
  </div>
  
  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.min.js"></script>
  <script src="js/console_usuario.js"></script>
  
  <script>
    function soloNumeros(e) {
      tecla = (document.all) ? e.keyCode : e.which;
      if (tecla == 8) return true;
      patron = /[0-9]/;
      tecla_final = String.fromCharCode(tecla);
      return patron.test(tecla_final);
    }
    
    function sololetras(e) {
      key = e.keyCode || e.which;
      teclado = String.fromCharCode(key).toLowerCase();
      letras = "qwertyuiopasdfghjklñzxcvbnmáéíóúÁÉÍÓÚ.- ";
      especiales = "8-37-38-46-164";
      teclado_especial = false;
      for (var i in especiales) {
        if (key == especiales[i]) {
          teclado_especial = true;
          break;
        }
      }
      if (letras.indexOf(teclado) == -1 && !teclado_especial) {
        return false;
      }
    }
    
    function validar_email(email) {
      var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email) ? true : false;
    }
    
    // Enter key para buscar
    document.getElementById('txt_dni').addEventListener('keyup', function(event) {
      if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById('buscar').click();
      }
    });
    
    var idioma_espanol = {
      select: { rows: "%d fila seleccionada" },
      "sProcessing": "Procesando...",
      "sLengthMenu": "Mostrar _MENU_ registros",
      "sZeroRecords": "No se encontraron resultados",
      "sEmptyTable": "Ningún dato disponible en esta tabla",
      "sInfo": "Registros del (_START_ al _END_) total de _TOTAL_ registros",
      "sInfoEmpty": "Registros del (0 al 0) total de 0 registros",
      "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix": "",
      "sSearch": "Buscar:",
      "sUrl": "",
      "sInfoThousands": ",",
      "sLoadingRecords": "<b>No se encontraron datos</b>",
      "oPaginate": {
        "sFirst": "Primero",
        "sLast": "Último",
        "sNext": "Siguiente",
        "sPrevious": "Atrás"
      },
      "oAria": {
        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
    }
  </script>
  <script>
var tbl_general_titulo;

function Traer_Datos_Seguimiento() {
  let dni = document.getElementById("txt_dni").value;
  
  if (dni.length == 0) {
    return Swal.fire({
      icon: "warning",
      title: "Campo Requerido",
      text: "Por favor, ingrese su número de documento (DNI, Pasaporte o Carnet)",
      confirmButtonColor: "#0065B2"
    });
  }

  Swal.fire({
    title: 'Buscando Expediente...',
    html: 'Por favor espere mientras consultamos su información',
    allowOutsideClick: false,
    didOpen: () => {
      Swal.showLoading();
    }
  });

  $.ajax({
    url: "controller/usuario/controlador_traer_seguimiento.php",
    type: "POST",
    data: { dni: dni }
  }).done(function(resp) {
    let data = JSON.parse(resp);
    console.log("Datos usuario:", data);

    if (data.length > 0) {
      Swal.close();
      document.getElementById("div_buscador").style.display = "block";
      
      limpiarTablasExistentes();

      $.ajax({
        url: "controller/usuario/controlador_traer_seguimiento_detalle.php",
        type: "POST",
        data: { codigo: data[0][0] }
      }).done(function(resp) {
        let datadetalle = JSON.parse(resp);
        console.log("Datos detalle:", datadetalle);

        if (datadetalle.length > 0) {
          datadetalle.sort((a, b) => new Date(b.expe) - new Date(a.expe));
          
          let ultimoEstado = datadetalle[0].estadoexpediente;
          let ultimaSede = datadetalle[0].Id_cede;
          
          crearTablaEstados(ultimoEstado);
          crearInfoEstudiante(datadetalle[0]);
          crearTablaExpedientes(datadetalle);
          
        } else {
          Swal.fire({
            icon: "warning",
            title: "Sin Resultados",
            text: "No se encontraron detalles del expediente",
            confirmButtonColor: "#0065B2"
          });
        }
      }).fail(function() {
        Swal.fire({
          icon: "error",
          title: "Error de Conexión",
          text: "No se pudo consultar los detalles del expediente. Intente nuevamente.",
          confirmButtonColor: "#dc3545"
        });
      });
      
    } else {
      document.getElementById("div_buscador").style.display = "none";
      Swal.fire({
        icon: "info",
        title: "Expediente No Encontrado",
        html: "No se encontraron datos del documento ingresado.<br><br>Si está buscando un <b>expediente de Posgrado</b>, haga clic en el botón <b>'Seguimiento Posgrado'</b> en la parte superior.",
        confirmButtonColor: "#0065B2",
        confirmButtonText: "Entendido"
      });
    }
  }).fail(function() {
    Swal.fire({
      icon: "error",
      title: "Error de Conexión",
      text: "No se pudo conectar con el servidor. Verifique su conexión a internet.",
      confirmButtonColor: "#dc3545"
    });
  });
}

function limpiarTablasExistentes() {
  let divBuscador = document.getElementById("div_buscador");
  divBuscador.innerHTML = "";
}

function crearTablaEstados(ultimoEstado) {
  let estadoPendiente = ultimoEstado === "PENDIENTE" || ultimoEstado === "EN PROCESO" || ultimoEstado === "COLACION";
  let estadoProceso = ultimoEstado === "EN PROCESO" || ultimoEstado === "COLACION";
  let estadoColacion = ultimoEstado === "COLACION";
  
  let colorPendiente = estadoPendiente ? "#f59e0b" : "#d1d5db";
  let colorProceso = estadoProceso ? "#00a8ff" : "#d1d5db";
  let colorColacion = estadoColacion ? "#10b981" : "#d1d5db";
  
  let iconoPendiente = estadoPendiente ? "✓" : "○";
  let iconoProceso = estadoProceso ? "✓" : "○";
  let iconoColacion = estadoColacion ? "✓" : "○";
  
  let tablaEstados = `
    <div style="margin-bottom: 30px; padding: 0 10px;">
      <h3 style="font-weight: 700; color: #0065B2; text-align: center; margin-bottom: 30px; font-size: 20px;">
        <i class="fas fa-chart-line"></i> ESTADO DE SU EXPEDIENTE
      </h3>
      
      <div style="display: flex; justify-content: space-between; align-items: flex-start; position: relative; margin-bottom: 25px; gap: 15px;">
        <!-- Línea de conexión -->
        <div style="position: absolute; top: 28px; left: calc(16.66% + 20px); right: calc(16.66% + 20px); height: 3px; background: linear-gradient(90deg, ${colorPendiente} 0%, ${colorPendiente} 33%, ${colorProceso} 33%, ${colorProceso} 66%, ${colorColacion} 66%, ${colorColacion} 100%); z-index: 0; border-radius: 2px;"></div>
        
        <!-- Estado 1: PENDIENTE -->
        <div style="flex: 1; text-align: center; position: relative; z-index: 1; min-width: 0;">
          <div style="
            width: 50px; 
            height: 50px; 
            background: ${colorPendiente}; 
            color: white; 
            border-radius: 50%; 
            margin: 0 auto 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 24px; 
            font-weight: bold;
            box-shadow: 0 4px 12px ${colorPendiente}40;
            border: 3px solid white;
          ">
            ${iconoPendiente}
          </div>
          <div style="
            background: ${colorPendiente}; 
            color: white; 
            padding: 8px 10px; 
            border-radius: 10px; 
            font-weight: 600;
            box-shadow: 0 3px 10px ${colorPendiente}30;
            font-size: 11px;
            word-wrap: break-word;
          ">
            <i class="fas fa-clock"></i> PENDIENTE
          </div>
          <small style="display: block; margin-top: 6px; color: #666; font-size: 10px;">
            Expediente registrado
          </small>
        </div>
        
        <!-- Estado 2: EN PROCESO -->
        <div style="flex: 1; text-align: center; position: relative; z-index: 1; min-width: 0;">
          <div style="
            width: 50px; 
            height: 50px; 
            background: ${colorProceso}; 
            color: white; 
            border-radius: 50%; 
            margin: 0 auto 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 24px; 
            font-weight: bold;
            box-shadow: 0 4px 12px ${colorProceso}40;
            border: 3px solid white;
          ">
            ${iconoProceso}
          </div>
          <div style="
            background: ${colorProceso}; 
            color: white; 
            padding: 8px 10px; 
            border-radius: 10px; 
            font-weight: 600;
            box-shadow: 0 3px 10px ${colorProceso}30;
            font-size: 11px;
            word-wrap: break-word;
          ">
            <i class="fas fa-spinner"></i> EN PROCESO
          </div>
          <small style="display: block; margin-top: 6px; color: #666; font-size: 10px;">
            Revisión académica
          </small>
        </div>
        
        <!-- Estado 3: COLACIÓN -->
        <div style="flex: 1; text-align: center; position: relative; z-index: 1; min-width: 0;">
          <div style="
            width: 50px; 
            height: 50px; 
            background: ${colorColacion}; 
            color: white; 
            border-radius: 50%; 
            margin: 0 auto 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 24px; 
            font-weight: bold;
            box-shadow: 0 4px 12px ${colorColacion}40;
            border: 3px solid white;
          ">
            ${iconoColacion}
          </div>
          <div style="
            background: ${colorColacion}; 
            color: white; 
            padding: 8px 10px; 
            border-radius: 10px; 
            font-weight: 600;
            box-shadow: 0 3px 10px ${colorColacion}30;
            font-size: 11px;
            word-wrap: break-word;
          ">
            <i class="fas fa-check-circle"></i> COLACIÓN
          </div>
          <small style="display: block; margin-top: 6px; color: #666; font-size: 10px;">
            Listo para ceremonia
          </small>
        </div>
      </div>
      
      <!-- Mensaje de estado actual -->
      <div style="
        background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
        border-left: 4px solid ${ultimoEstado === 'COLACION' ? '#10b981' : ultimoEstado === 'EN PROCESO' ? '#00a8ff' : '#f59e0b'};
        padding: 15px;
        border-radius: 10px;
        margin-top: 20px;
        text-align: center;
      ">
        <strong style="color: #333; font-size: 14px; display: block; line-height: 1.5;">
          ${ultimoEstado === 'COLACION' ? 
            '🎉 ¡Felicitaciones! Su expediente está listo para la ceremonia de colación' : 
            ultimoEstado === 'EN PROCESO' ? 
            '⏳ Su expediente está siendo revisado por el área académica' : 
            '📋 Su expediente ha sido registrado y se encuentra en su decanatura'}
        </strong>
      </div>
    </div>
  `;
  
  let divBuscador = document.getElementById("div_buscador");
  divBuscador.innerHTML += tablaEstados;
}

function crearInfoEstudiante(datos) {
  let infoEstudiante = `
    <div style="
      background: linear-gradient(135deg, #0065B2 0%, #00a8ff 100%);
      color: white;
      padding: 20px;
      border-radius: 14px;
      margin: 0 10px 25px 10px;
      box-shadow: 0 6px 24px rgba(0, 101, 178, 0.3);
    ">
      <h4 style="margin: 0 0 18px 0; font-weight: 700; display: flex; align-items: center; gap: 8px; font-size: 16px;">
        <i class="fas fa-user-graduate"></i> Información del Estudiante
      </h4>
      <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 12px;">
        <div>
          <small style="opacity: 0.9; display: block; margin-bottom: 4px; font-size: 11px;">Estudiante:</small>
          <strong style="font-size: 14px; display: block; word-wrap: break-word;">${datos.Estudiante}</strong>
        </div>
        <div>
          <small style="opacity: 0.9; display: block; margin-bottom: 4px; font-size: 11px;">Documento:</small>
          <strong style="font-size: 14px;">${datos.Dni}</strong>
        </div>
        <div>
          <small style="opacity: 0.9; display: block; margin-bottom: 4px; font-size: 11px;">Facultad:</small>
          <strong style="font-size: 14px; display: block; word-wrap: break-word;">${datos.Facultad}</strong>
        </div>
        <div>
          <small style="opacity: 0.9; display: block; margin-bottom: 4px; font-size: 11px;">Escuela:</small>
          <strong style="font-size: 14px; display: block; word-wrap: break-word;">${datos.Escuela}</strong>
        </div>
      </div>
    </div>
  `;
  
  let divBuscador = document.getElementById("div_buscador");
  divBuscador.innerHTML += infoEstudiante;
}

function crearTablaExpedientes(datadetalle) {
  let tablaGeneral = `
    <div style="margin: 25px 10px 20px 10px;">
      <h4 style="color: #0065B2; font-weight: 700; margin-bottom: 18px; display: flex; align-items: center; gap: 8px; font-size: 16px;">
        <i class="fas fa-list-alt"></i> Detalle de Expedientes
      </h4>
      <div class="table-responsive">
        <table id="tabla_registro_general" class="table table-striped table-bordered" style="width:100%; font-size: 12px;">
          <thead style="background: linear-gradient(135deg, #0065B2, #00a8ff); color: white;">
            <tr>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Tipo</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Denominación</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">DNI</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Estudiante</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Facultad</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Escuela</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Sede</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Modalidad</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Estado</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Fecha Colación</th>
              <th style="text-align:center; padding: 10px 8px; font-size: 11px;">Tesis</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
    </div>
  `;
  
  let divBuscador = document.getElementById("div_buscador");
  divBuscador.innerHTML += tablaGeneral;
  
  $("#tabla_registro_general").DataTable({
    data: datadetalle,
    columns: [
      {
        data: "Grado_academico",
        render: function(data, type, row) {
          if (data == "TITULO") {
            return '<span class="badge" style="background: linear-gradient(135deg, #667eea, #764ba2); color: white; padding: 5px 10px; border-radius: 15px; font-weight: 600; font-size: 10px; white-space: nowrap;"><i class="fas fa-certificate"></i> TÍTULO</span>';
          } else if (data == "BACHILLER") {
            return '<span class="badge" style="background: linear-gradient(135deg, #f59e0b, #d97706); color: white; padding: 5px 10px; border-radius: 15px; font-weight: 600; font-size: 10px; white-space: nowrap;"><i class="fas fa-graduation-cap"></i> BACHILLER</span>';
          } else {
            return '<span class="badge" style="background: linear-gradient(135deg, #1e3c72, #2a5298); color: white; padding: 5px 10px; border-radius: 15px; font-weight: 600; font-size: 10px; white-space: nowrap;"><i class="fas fa-user-graduate"></i> MAESTRÍA</span>';
          }
        }
      },
      { 
        data: "Denominación_grado",
        render: function(data) {
          return '<span style="font-weight: 500; font-size: 11px;">' + data + '</span>';
        }
      },
      { 
        data: "Dni",
        render: function(data) {
          return '<span style="font-size: 11px;">' + data + '</span>';
        }
      },
      { 
        data: "Estudiante",
        render: function(data) {
          return '<span style="font-weight: 500; font-size: 11px;">' + data + '</span>';
        }
      },
      {
        data: "Facultad",
        render: function(data) {
          if (data == 'Ingeniería') {
            return '<span class="badge" style="background: #10b981; color: white; padding: 4px 8px; border-radius: 12px; font-size: 10px; white-space: nowrap;">INGENIERÍA</span>';
          } else if (data == 'Ciencias de la Salud') {
            return '<span class="badge" style="background: #0ea5e9; color: white; padding: 4px 8px; border-radius: 12px; font-size: 10px; white-space: nowrap;">SALUD</span>';
          } else {
            return '<span class="badge" style="background: #f59e0b; color: white; padding: 4px 8px; border-radius: 12px; font-size: 10px; white-space: nowrap;">SOCIALES</span>';
          }
        }
      },
      { 
        data: "Escuela",
        render: function(data) {
          return '<span style="font-size: 11px;">' + data + '</span>';
        }
      },
      {
        data: "Id_cede",
        render: function(data) {
          if (data == 1) {
            return '<span class="badge" style="background: #0065B2; color: white; padding: 5px 10px; border-radius: 12px; font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-map-marker-alt"></i> ABANCAY</span>';
          } else if (data == 2) {
            return '<span class="badge" style="background: #7e22ce; color: white; padding: 5px 10px; border-radius: 12px; font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-map-marker-alt"></i> ANDAHUAYLAS</span>';
          } else if (data == 3) {
            return '<span class="badge" style="background: #dc2626; color: white; padding: 5px 10px; border-radius: 12px; font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-map-marker-alt"></i> CUSCO</span>';
          } else {
            return '<span class="badge" style="background: #6b7280; color: white; padding: 5px 10px; border-radius: 12px; font-size: 10px; white-space: nowrap;">NO DEFINIDO</span>';
          }
        }
      },
      { 
        data: "Modo_obtencion",
        render: function(data) {
          return '<span style="font-size: 10px;">' + data + '</span>';
        }
      },
      {
        data: "estadoexpediente",
        render: function(data) {
          if (data == "PENDIENTE") {
            return '<span class="badge" style="background: #f59e0b; color: white; padding: 6px 12px; border-radius: 15px; font-weight: 600; box-shadow: 0 2px 6px rgba(245, 158, 11, 0.3); font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-clock"></i> PENDIENTE</span>';
          } else if (data == "EN PROCESO") {
            return '<span class="badge" style="background: #00a8ff; color: white; padding: 6px 12px; border-radius: 15px; font-weight: 600; box-shadow: 0 2px 6px rgba(0, 168, 255, 0.3); font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-spinner"></i> EN PROCESO</span>';
          } else {
            return '<span class="badge" style="background: #10b981; color: white; padding: 6px 12px; border-radius: 15px; font-weight: 600; box-shadow: 0 2px 6px rgba(16, 185, 129, 0.3); font-size: 10px; white-space: nowrap; display: inline-flex; align-items: center; gap: 4px;"><i class="fas fa-check-circle"></i> COLACIÓN</span>';
          }
        }
      },
      {
        data: null,
        render: function(data, type, row) {
          if (row.estadoexpediente === "COLACION") {
            let fechaColacion = "";
            
            if (row.Id_cede == 1) {
              fechaColacion = row.fecha_larga || "No programada";
            } else if (row.Id_cede == 2) {
              fechaColacion = row.fecha_larga_andahuaylas || "No programada";
            } else if (row.Id_cede == 3) {
              fechaColacion = row.fecha_larga_cusco || "No programada";
            } else {
              fechaColacion = "Sede no definida";
            }
            
            if (fechaColacion && fechaColacion !== "No programada" && fechaColacion !== "Sede no definida") {
              return '<span style="color: #10b981; font-weight: 600; font-size: 11px; white-space: nowrap;"><i class="fas fa-calendar-check"></i> ' + fechaColacion + '</span>';
            } else {
              return '<span style="color: #f59e0b; font-weight: 500; font-size: 11px; white-space: nowrap;"><i class="fas fa-calendar-times"></i> Por programar</span>';
            }
          } else if (row.estadoexpediente === "EN PROCESO") {
            return '<span style="color: #6b7280; font-style: italic; font-size: 11px; white-space: nowrap;"><i class="fas fa-hourglass-half"></i> En revisión</span>';
          } else {
            return '<span style="color: #6b7280; font-style: italic; font-size: 11px; white-space: nowrap;"><i class="fas fa-minus-circle"></i> No disponible</span>';
          }
        }
      },
      {
        data: "Reglamento_metadado",
        render: function(data, type, row) {
          if (data == "" || data == null) {
            return `
              <button disabled style='
                font-size: 10px; 
                padding: 5px 10px; 
                background: #e5e7eb; 
                color: #9ca3af; 
                border: none; 
                border-radius: 6px; 
                cursor: not-allowed;
                font-weight: 500;
                white-space: nowrap;
              ' type='button' title='No disponible'>
                <i class='fas fa-eye-slash'></i> No disponible
              </button>
            `;
          } else {
            return `
              <a href='${data}' target='_blank'>
                <button style='
                  font-size: 10px; 
                  padding: 5px 10px; 
                  background: linear-gradient(135deg, #0065B2, #00a8ff); 
                  color: white; 
                  border: none; 
                  border-radius: 6px; 
                  cursor: pointer;
                  font-weight: 600;
                  transition: all 0.3s;
                  box-shadow: 0 2px 6px rgba(0, 101, 178, 0.3);
                  white-space: nowrap;
                ' type='button' title='Ver Trabajo de Investigación'
                onmouseover="this.style.transform='translateY(-2px)'; this.style.boxShadow='0 4px 10px rgba(0, 101, 178, 0.4)';"
                onmouseout="this.style.transform='translateY(0)'; this.style.boxShadow='0 2px 6px rgba(0, 101, 178, 0.3)';">
                  <i class='fas fa-file-pdf'></i> Ver Tesis
                </button>
              </a>
            `;
          }
        }
      }
    ],
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: "Exportar a Excel",
        className: "btn-excel-custom",
        filename: "Expediente_UTEA_" + new Date().toISOString().slice(0,10),
        title: "EXPEDIENTE ACADÉMICO - UTEA"
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: "Exportar a PDF",
        className: "btn-pdf-custom",
        filename: "Expediente_UTEA_" + new Date().toISOString().slice(0,10),
        title: "EXPEDIENTE ACADÉMICO - UTEA",
        orientation: 'landscape',
        pageSize: 'A4'
      },
      {
        extend: "print",
        text: '<i class="fas fa-print"></i> Imprimir',
        titleAttr: "Imprimir",
        className: "btn-print-custom",
        title: "EXPEDIENTE ACADÉMICO - UTEA"
      }
    ],
    language: idioma_espanol,
    ordering: false,
    lengthChange: false,
    paging: false,
    searching: false,
    destroy: true,
    scrollX: true,
    scrollCollapse: true,
    responsive: true,
    processing: true,
    autoWidth: false,
    columnDefs: [
      { width: "80px", targets: 0 },
      { width: "150px", targets: 1 },
      { width: "80px", targets: 2 },
      { width: "150px", targets: 3 },
      { width: "100px", targets: 4 },
      { width: "120px", targets: 5 },
      { width: "110px", targets: 6 },
      { width: "120px", targets: 7 },
      { width: "110px", targets: 8 },
      { width: "130px", targets: 9 },
      { width: "110px", targets: 10 }
    ]
  });
  
  $("<style>")
    .prop("type", "text/css")
    .html(`
      .btn-excel-custom {
        background: linear-gradient(135deg, #10b981, #059669) !important;
        color: white !important;
        border: none !important;
        padding: 7px 14px !important;
        border-radius: 8px !important;
        font-weight: 600 !important;
        margin: 0 4px !important;
        transition: all 0.3s !important;
        font-size: 12px !important;
      }
      .btn-excel-custom:hover {
        transform: translateY(-2px) !important;
        box-shadow: 0 4px 10px rgba(16, 185, 129, 0.4) !important;
      }
      .btn-pdf-custom {
        background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
        color: white !important;
        border: none !important;
        padding: 7px 14px !important;
        border-radius: 8px !important;
        font-weight: 600 !important;
        margin: 0 4px !important;
        transition: all 0.3s !important;
        font-size: 12px !important;
      }
      .btn-pdf-custom:hover {
        transform: translateY(-2px) !important;
        box-shadow: 0 4px 10px rgba(220, 38, 38, 0.4) !important;
      }
      .btn-print-custom {
        background: linear-gradient(135deg, #0065B2, #00a8ff) !important;
        color: white !important;
        border: none !important;
        padding: 7px 14px !important;
        border-radius: 8px !important;
        font-weight: 600 !important;
        margin: 0 4px !important;
        transition: all 0.3s !important;
        font-size: 12px !important;
      }
      .btn-print-custom:hover {
        transform: translateY(-2px) !important;
        box-shadow: 0 4px 10px rgba(0, 101, 178, 0.4) !important;
      }
      .dt-buttons {
        margin-bottom: 15px !important;
      }
      .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
      }
      #tabla_registro_general td {
        padding: 8px 6px !important;
        vertical-align: middle !important;
      }
      #tabla_registro_general th {
        padding: 10px 8px !important;
        vertical-align: middle !important;
      }
    `)
    .appendTo("head");
}

var idioma_espanol = {
  select: { rows: "%d fila seleccionada" },
  "sProcessing": "Procesando...",
  "sLengthMenu": "Mostrar _MENU_ registros",
  "sZeroRecords": "No se encontraron resultados",
  "sEmptyTable": "Ningún dato disponible en esta tabla",
  "sInfo": "Registros del (_START_ al _END_) total de _TOTAL_ registros",
  "sInfoEmpty": "Registros del (0 al 0) total de 0 registros",
  "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
  "sInfoPostFix": "",
  "sSearch": "Buscar:",
  "sUrl": "",
  "sInfoThousands": ",",
  "sLoadingRecords": "<b>Cargando información...</b>",
  "oPaginate": {
    "sFirst": "Primero",
    "sLast": "Último",
    "sNext": "Siguiente",
    "sPrevious": "Anterior"
  },
  "oAria": {
    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
  }
};
  </script>
</body>
</html>