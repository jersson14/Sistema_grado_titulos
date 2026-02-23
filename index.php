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

  <title>UTEA | PERÚ</title>

  <!-- Google Font: Poppins -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plantilla/dist/css/adminlte.min.css">
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">
  
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    
    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-image: url('img/sede.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      position: relative;
      overflow: hidden;
      padding: 20px;
    }
    
    /* Overlay con el mismo color del sidebar #024383 */
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
    
    /* Capa adicional de brillo sutil */
    body::after {
      content: '';
      position: absolute;
      width: 100%;
      height: 100%;
      background: 
        radial-gradient(circle at 20% 30%, rgba(79, 195, 247, 0.15) 0%, transparent 40%),
        radial-gradient(circle at 80% 70%, rgba(2, 67, 131, 0.20) 0%, transparent 50%);
      animation: float 8s ease-in-out infinite;
      z-index: 0;
    }
    
    @keyframes float {
      0%, 100% { transform: translate(0, 0) scale(1); }
      50% { transform: translate(30px, -30px) scale(1.1); }
    }
    
    .login-wrapper {
      display: flex;
      width: 900px;
      max-width: 95%;
      background: white;
      border-radius: 30px;
      overflow: hidden;
      box-shadow: 0 30px 80px rgba(0, 0, 0, 0.3);
      position: relative;
      z-index: 1;
      animation: slideIn 0.8s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }
    
    @keyframes slideIn {
      from {
        opacity: 0;
        transform: scale(0.8) translateY(50px);
      }
      to {
        opacity: 1;
        transform: scale(1) translateY(0);
      }
    }
    
    /* Left side con los mismos colores del sidebar */
    .left-side {
      flex: 1;
      background: linear-gradient(135deg, #024383 0%, #012a52 100%);
      padding: 60px 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: white;
      position: relative;
      overflow: hidden;
    }
    
    .left-side::before {
      content: '';
      position: absolute;
      width: 300px;
      height: 300px;
      background: rgba(79, 195, 247, 0.15);
      border-radius: 50%;
      top: -100px;
      left: -100px;
      animation: pulse 4s ease-in-out infinite;
    }
    
    .left-side::after {
      content: '';
      position: absolute;
      width: 200px;
      height: 200px;
      background: rgba(79, 195, 247, 0.15);
      border-radius: 50%;
      bottom: -50px;
      right: -50px;
      animation: pulse 3s ease-in-out infinite;
    }
    
    @keyframes pulse {
      0%, 100% { transform: scale(1); opacity: 0.3; }
      50% { transform: scale(1.2); opacity: 0.5; }
    }
    
    .left-content {
      position: relative;
      z-index: 2;
      text-align: center;
    }
    
    .left-side h1 {
      font-size: 42px;
      font-weight: 800;
      margin-bottom: 20px;
      text-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }
    
    .left-side .subtitle {
      font-size: 18px;
      font-weight: 300;
      margin-bottom: 40px;
      opacity: 0.95;
    }
    
    .illustration {
      width: 100%;
      max-width: 300px;
      margin-top: 30px;
    }
    
    .illustration i {
      font-size: 180px;
      opacity: 0.2;
      animation: rotate 20s linear infinite;
    }
    
    @keyframes rotate {
      from { transform: rotate(0deg); }
      to { transform: rotate(360deg); }
    }
    
    .right-side {
      flex: 1;
      padding: 60px 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    
    .logo-section {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .logo-section img {
      max-width: 280px;
      width: 100%;
      height: auto;
      margin-bottom: 20px;
    }
    
    .welcome-text {
      text-align: center;
      margin-bottom: 40px;
    }
    
    .welcome-text h2 {
      font-size: 32px;
      font-weight: 700;
      color: #024383;
      margin-bottom: 10px;
    }
    
    .welcome-text p {
      font-size: 15px;
      color: #718096;
    }
    
    .form-group {
      margin-bottom: 25px;
      position: relative;
    }
    
    .form-group label {
      display: block;
      font-size: 14px;
      font-weight: 600;
      color: #2d3748;
      margin-bottom: 10px;
    }
    
    .input-container {
      position: relative;
    }
    
    .input-container input {
      width: 100%;
      padding: 15px 20px 15px 50px;
      border: 2px solid #e2e8f0;
      border-radius: 12px;
      font-size: 15px;
      transition: all 0.3s ease;
      background: #f7fafc;
    }
    
    .input-container input:focus {
      outline: none;
      border-color: #024383;
      background: white;
      box-shadow: 0 0 0 4px rgba(2, 67, 131, 0.1);
    }
    
    .input-icon {
      position: absolute;
      left: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: #a0aec0;
      font-size: 18px;
      transition: color 0.3s;
    }
    
    .input-container input:focus ~ .input-icon {
      color: #024383;
    }
    
    .toggle-password {
      position: absolute;
      right: 18px;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      color: #a0aec0;
      cursor: pointer;
      padding: 5px;
      transition: color 0.3s;
    }
    
    .toggle-password:hover {
      color: #024383;
    }
    
    .form-options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }
    
    .remember-me {
      display: flex;
      align-items: center;
    }
    
    .remember-me input {
      margin-right: 8px;
      width: 18px;
      height: 18px;
      cursor: pointer;
      accent-color: #024383;
    }
    
    .remember-me label {
      font-size: 14px;
      color: #4a5568;
      cursor: pointer;
      margin: 0;
    }
    
    /* Botón con los mismos colores del sidebar */
    .btn-login {
      width: 100%;
      padding: 16px;
      background: linear-gradient(135deg, #024383 0%, #012a52 100%);
      border: none;
      border-radius: 12px;
      color: white;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 6px 20px rgba(2, 67, 131, 0.4);
      position: relative;
      overflow: hidden;
    }
    
    .btn-login::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 50%;
      width: 0;
      height: 0;
      border-radius: 50%;
      background: rgba(79, 195, 247, 0.3);
      transform: translate(-50%, -50%);
      transition: width 0.6s, height 0.6s;
    }
    
    .btn-login:hover::before {
      width: 300px;
      height: 300px;
    }
    
    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(2, 67, 131, 0.5);
    }
    
    .btn-login:active {
      transform: translateY(0);
    }
    
    .btn-content {
      position: relative;
      z-index: 1;
    }
    
    .footer-text {
      text-align: center;
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #e2e8f0;
      font-size: 13px;
      color: #a0aec0;
    }
    
    /* ========== RESPONSIVE MEJORADO ========== */
    
    /* Tablets grandes y pantallas medianas */
    @media (max-width: 992px) {
      .login-wrapper {
        width: 85%;
      }
      
      .left-side {
        padding: 50px 40px;
      }
      
      .right-side {
        padding: 50px 40px;
      }
      
      .left-side h1 {
        font-size: 38px;
      }
      
      .illustration i {
        font-size: 150px;
      }
    }
    
    /* Tablets y dispositivos medianos */
    @media (max-width: 768px) {
      body {
        padding: 15px;
        background-size: cover;
        align-items: flex-start;
        padding-top: 30px;
      }
      
      .login-wrapper {
        flex-direction: column;
        width: 100%;
        max-width: 500px;
        border-radius: 20px;
      }
      
      .left-side {
        padding: 35px 25px;
        min-height: auto;
      }
      
      .left-side h1 {
        font-size: 32px;
        margin-bottom: 10px;
      }
      
      .left-side .subtitle {
        font-size: 16px;
        margin-bottom: 20px;
      }
      
      .illustration {
        margin-top: 15px;
      }
      
      .illustration i {
        font-size: 100px;
      }
      
      .right-side {
        padding: 35px 25px;
      }
      
      .logo-section {
        margin-bottom: 25px;
      }
      
      .logo-section img {
        max-width: 220px;
        margin-bottom: 15px;
      }
      
      .welcome-text {
        margin-bottom: 30px;
      }
      
      .welcome-text h2 {
        font-size: 26px;
      }
      
      .welcome-text p {
        font-size: 14px;
      }
      
      .form-group {
        margin-bottom: 20px;
      }
      
      .input-container input {
        padding: 14px 18px 14px 45px;
        font-size: 14px;
      }
      
      .input-icon {
        left: 15px;
        font-size: 16px;
      }
      
      .toggle-password {
        right: 15px;
      }
      
      .btn-login {
        padding: 14px;
        font-size: 15px;
      }
      
      .footer-text {
        margin-top: 25px;
        padding-top: 15px;
        font-size: 12px;
      }
    }
    
    /* Móviles pequeños */
    @media (max-width: 480px) {
      body {
        padding: 10px;
        padding-top: 20px;
      }
      
      .login-wrapper {
        border-radius: 16px;
        max-width: 100%;
      }
      
      .left-side {
        padding: 25px 20px;
      }
      
      .left-side h1 {
        font-size: 28px;
        margin-bottom: 8px;
      }
      
      .left-side .subtitle {
        font-size: 14px;
        margin-bottom: 15px;
      }
      
      .illustration i {
        font-size: 80px;
      }
      
      .right-side {
        padding: 25px 20px;
      }
      
      .logo-section {
        margin-bottom: 20px;
      }
      
      .logo-section img {
        max-width: 180px;
        margin-bottom: 10px;
      }
      
      .welcome-text {
        margin-bottom: 25px;
      }
      
      .welcome-text h2 {
        font-size: 22px;
        margin-bottom: 8px;
      }
      
      .welcome-text p {
        font-size: 13px;
      }
      
      .form-group {
        margin-bottom: 18px;
      }
      
      .form-group label {
        font-size: 13px;
        margin-bottom: 8px;
      }
      
      .input-container input {
        padding: 12px 16px 12px 42px;
        font-size: 14px;
        border-radius: 10px;
      }
      
      .input-icon {
        left: 14px;
        font-size: 15px;
      }
      
      .toggle-password {
        right: 14px;
      }
      
      .form-options {
        margin-bottom: 25px;
      }
      
      .remember-me input {
        width: 16px;
        height: 16px;
        margin-right: 6px;
      }
      
      .remember-me label {
        font-size: 13px;
      }
      
      .btn-login {
        padding: 13px;
        font-size: 14px;
        border-radius: 10px;
      }
      
      .footer-text {
        margin-top: 20px;
        padding-top: 12px;
        font-size: 11px;
      }
    }
    
    /* Móviles muy pequeños (320px - 375px) */
    @media (max-width: 375px) {
      .left-side h1 {
        font-size: 24px;
      }
      
      .left-side .subtitle {
        font-size: 13px;
      }
      
      .illustration i {
        font-size: 70px;
      }
      
      .logo-section img {
        max-width: 160px;
      }
      
      .welcome-text h2 {
        font-size: 20px;
      }
      
      .input-container input {
        padding: 11px 14px 11px 40px;
        font-size: 13px;
      }
      
      .btn-login {
        padding: 12px;
        font-size: 13px;
      }
    }
    
    /* Ajustes para modo landscape en móviles */
    @media (max-height: 600px) and (orientation: landscape) {
      body {
        padding: 10px;
        align-items: center;
      }
      
      .login-wrapper {
        flex-direction: row;
        max-width: 90%;
      }
      
      .left-side {
        padding: 20px 15px;
        display: flex;
      }
      
      .left-side h1 {
        font-size: 24px;
        margin-bottom: 5px;
      }
      
      .left-side .subtitle {
        font-size: 12px;
        margin-bottom: 10px;
      }
      
      .illustration {
        margin-top: 10px;
      }
      
      .illustration i {
        font-size: 60px;
      }
      
      .right-side {
        padding: 20px 15px;
      }
      
      .logo-section {
        margin-bottom: 15px;
      }
      
      .logo-section img {
        max-width: 120px;
        margin-bottom: 10px;
      }
      
      .welcome-text {
        margin-bottom: 15px;
      }
      
      .welcome-text h2 {
        font-size: 18px;
        margin-bottom: 5px;
      }
      
      .welcome-text p {
        font-size: 12px;
      }
      
      .form-group {
        margin-bottom: 12px;
      }
      
      .form-group label {
        margin-bottom: 5px;
        font-size: 12px;
      }
      
      .input-container input {
        padding: 10px 14px 10px 38px;
        font-size: 13px;
      }
      
      .form-options {
        margin-bottom: 15px;
      }
      
      .btn-login {
        padding: 10px;
        font-size: 13px;
      }
      
      .footer-text {
        margin-top: 15px;
        padding-top: 10px;
        font-size: 11px;
      }
    }
  </style>
</head>
<body>
<div class="login-wrapper">
  <!-- Left Side - Branding -->
  <div class="left-side">
    <div class="left-content">
      <h1>UTEA</h1>
      <p class="subtitle">Sistema de Grados y Títulos</p>
      <div class="illustration">
        <i class="fas fa-graduation-cap"></i>
      </div>
    </div>
  </div>
  
  <!-- Right Side - Login Form -->
  <div class="right-side">
    <div class="logo-section">
      <img src="img/utea.png" alt="UTEA Logo">
    </div>
    
    <div class="welcome-text">
      <h2>Bienvenido</h2>
      <p>Ingresa tus credenciales para acceder</p>
    </div>
    
    <form id="loginForm" method="POST" onsubmit="return false;">
      <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
      
      <div class="form-group">
        <label>Usuario o Correo Electrónico</label>
        <div class="input-container">
          <input type="text" id="txt_usuario" placeholder="Ingresa tu usuario">
          <i class="fas fa-user input-icon"></i>
        </div>
      </div>
      
      <div class="form-group">
        <label>Contraseña</label>
        <div class="input-container">
          <input type="password" id="txt_contra" placeholder="Ingresa tu contraseña">
          <i class="fas fa-lock input-icon"></i>
          <button type="button" class="toggle-password" id="togglePassword">
            <i class="fas fa-eye" id="toggleIcon"></i>
          </button>
        </div>
      </div>
      
      <div class="form-options">
        <div class="remember-me">
          <input type="checkbox" id="remember">
          <label for="remember">Recuérdame</label>
        </div>
      </div>
      
      <button type="button" class="btn-login" id="entrar" onclick="Iniciar_Sesion()">
        <span class="btn-content">
          <i class="fas fa-sign-in-alt"></i> INGRESAR
        </span>
      </button>
      
      <div class="footer-text">
        © <?php echo date('Y'); ?> Universidad Tecnológica de los Andes
      </div>
    </form>
  </div>
</div>

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