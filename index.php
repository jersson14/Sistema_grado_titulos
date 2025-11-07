<?php
  session_start();
  if(isset($_SESSION['S_ID'])){
    header('Location: view/index.php');
  }
   // Generar token CSRF si no existe
   if (!isset($_SESSION['csrf_token']) || 
   !isset($_SESSION['csrf_token_time']) || 
   (time() - $_SESSION['csrf_token_time']) > 3600) {
   
   $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
   $_SESSION['csrf_token_time'] = time();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="<?php echo $_SESSION['csrf_token']; ?>">

  <title>Portal Académico UTEA - Acceso</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plantilla/dist/css/adminlte.min.css">
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">
  
  <style>
    /* Estilos mejorados con esquinas redondeadas solo para la tarjeta */
    .card {
      border-radius: 20px !important;
      overflow: hidden;
      border: none;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    }
    
    .login-card-body {
      border-radius: 20px !important;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      padding-bottom: 30px;
    }
    
    .title-banner {
      background: linear-gradient(45deg, #005bea, #00c6fb);
      color: white;
      padding: 15px;
      margin: -10px -10px 20px -10px;
      border-radius: 20px 20px 0 0;
      text-align: center;
      font-weight: bold;
      font-size: 22px;
      text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
    }
    
    .btn-primary {
      background-color: #005bea;
      border-color: #005bea;
      transition: all 0.3s;
      /* Mantenemos el botón con bordes normales */
    }
    
    .btn-primary:hover {
      background-color: #0046b5;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 91, 234, 0.3);
    }
    
    .input-group-text {
      background-color: #f8f9fa;
    }
    
    .toggle-password-button {
      background: none;
      border: none;
      padding: 0;
      cursor: pointer;
      color: #6c757d;
    }
    
    /* Quitamos los estilos personalizados de border-radius para los form-control */
    .form-control:focus {
      border-color: #005bea;
      box-shadow: 0 0 0 0.2rem rgba(0, 91, 234, 0.25);
    }
    
    .logo-container {
      text-align: center;
      margin-bottom: 15px;
    }
    
    .login-box {
      margin-top: -30px;
    }
    
    /* Animación suave al cargar la página */
    .card {
      animation: fadeIn 0.8s ease;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body class="hold-transition login-page" style="background-image: url('img/img1.jpg'); background-size: cover; background-position: center;">
<div class="login-box">
  <form id="loginForm" method="POST" onsubmit="return false;">
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
        
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <div class="title-banner">
          <i class="fas fa-user-graduate mr-2"></i>GRADOS Y TÍTULOS - UTEA
        </div>
        
        <div class="logo-container">
          <img src="img/utea.png" alt="UTEA Logo" width="280" height="auto">
        </div>
        
        <p class="text-center mb-4" style="font-size:20px; color:#555;">
          <b>Accede a tu cuenta</b>
        </p>
        
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Usuario o correo electrónico" id="txt_usuario">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Contraseña" id="txt_contra">
          <div class="input-group-append">
            <div class="input-group-text">
              <button type="button" class="toggle-password-button" id="togglePassword" title="Mostrar/Ocultar contraseña">
                <i class="fas fa-eye" id="toggleIcon"></i>
              </button>
            </div>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-7">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Recuerdarme
              </label>
            </div>
          </div>

        </div>
        
        <div class="row">
          <div class="col-12">
            <button class="btn btn-primary btn-block py-2" id="entrar" type="button" onclick="Iniciar_Sesion()">
              <i class="fas fa-sign-in-alt mr-2"></i><b>INGRESAR</b>
            </button>
          </div>
        </div>
      </form>
      
    
      
      <div class="text-center mt-3">
        <p class="text-muted">© <?php echo date('Y'); ?> Universidad Tecnológica de los Andes</p>
      </div>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plantilla/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="plantilla/dist/js/adminlte.min.js"></script>
<script src="js/console_usuario.js?rev=<?php echo time();?>"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  const rmcheck       = document.getElementById('remember'),
        usuarioInput  = document.getElementById('txt_usuario'),
        passInput     = document.getElementById('txt_contra');
      if(localStorage.checkbox && localStorage.checkbox !=""){
        rmcheck.setAttribute("checked","checked");
        usuarioInput.value = localStorage.usuario;
        passInput.value    = localStorage.pass;
      }else{
        rmcheck.removeAttribute("checked");
        usuarioInput.value = "";
        passInput.value    = "";
      }
      
</script>
<script>
  // Auto-focus en el campo de usuario al cargar la página
  txt_usuario.focus();
  
  // Event listener para permitir login al presionar Enter
  var input = document.getElementById("txt_contra");
  input.addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      document.getElementById("entrar").click();
    }
  });
  
  // Botón mostrar/ocultar contraseña
  document.getElementById("togglePassword").addEventListener("click", function() {
    const passwordField = document.getElementById("txt_contra");
    const toggleIcon = document.getElementById("toggleIcon");
    const isPassword = passwordField.getAttribute("type") === "password";

    // Cambia el tipo del input
    passwordField.setAttribute("type", isPassword ? "text" : "password");

    // Cambia el ícono
    toggleIcon.classList.toggle("fa-eye");
    toggleIcon.classList.toggle("fa-eye-slash");
  });
</script>

<!-- ChatWoot integration -->
<script>
  (function(d,t) {
    var BASE_URL="https://dhhfkhmz8sbbu.cloudfront.net";
    var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=BASE_URL+"/packs/js/sdk.js";
    g.defer = true;
    g.async = true;
    s.parentNode.insertBefore(g,s);
    g.onload=function(){
      window.chatwootSDK.run({
        websiteToken: 'JA5RBoDMsdCr51mGpf1CxVST',
        baseUrl: BASE_URL
      })
    }
  })(document,"script");
</script>

</body>
</html>