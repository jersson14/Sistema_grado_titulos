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
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="<?php echo $_SESSION['csrf_token']; ?>">

  <title>Iniciar Sesión</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plantilla/dist/css/adminlte.min.css">
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">

</head>
<body class="hold-transition login-page" style="background-image: url('img/fondo2.jpg'); background-size: 25px 50px; background-size: 100% 100%;"  >
<div class="login-box">
<form id="loginForm" method="POST" onsubmit="return false;">
    <input type="hidden" name="csrf_token" value="<?php echo $_SESSION['csrf_token']; ?>">
        
  <!-- /.login-logo -->
  <div class="card" style="border-radius: 10px;">
    <div class="card-body login-card-body" style="border-radius: 40px;">
    <img src="img/utea.png" alt="" width="100%" height="100%">		      	
      <p class="login-box-msg" style="font-family:Arial black; font-size:15px; color:black"><b>DATOS DEL USUARIO</b></p>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Ingrese su usuario" id="txt_usuario">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Ingrese su contraseña" id="txt_contra">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="icheck-primary" style="color:black">
              <input type="checkbox" id="remember">
              <label for="remember">
                Recuerdame
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-6">
          <button class="btn btn-primary btn-block" id="entrar" type="button" onclick="Iniciar_Sesion()">
    <i class='fas fa-share-square ml-1 mr-1'></i>&nbsp;<b>Iniciar Sesión</b>
</button>          </div>
          <!-- /.col -->
        </div>
        </form>
        <br>
        <div class="col-12" style="text-align:center">
        <p class="mb-1">
        <a href="seguimiento.php" class="btn btn-success btn-block"><i class="fas fa-search" style="color:white"></i>   <b>Seguimiento</b></a>

        </p>

        </div>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<script>
   function sololetras(e) {
        key=e.keyCode || e.which;
 
        teclado=String.fromCharCode(key).toLowerCase();
 
        letras="qwertyuiopasdfghjklñzxcvbnmáéíóú ";
 
        especiales="8-37-38-46-164";
 
        teclado_especial=false;
 
        for(var i in especiales){
            if(key==especiales[i]){
                teclado_especial=true;
                break;
            }
        }
 
        if(letras.indexOf(teclado)==-1 && !teclado_especial){
            return false;
        }
    }


  function soloNumeros(e){
      tecla = (document.all) ? e.keyCode : e.which;
      if (tecla==8){
          return true;
      }
      // Patron de entrada, en este caso solo acepta numeros
      patron =/[0-9]/;
      tecla_final = String.fromCharCode(tecla);
      return patron.test(tecla_final);
  }


</script>
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
  txt_usuario.focus();
  var input = document.getElementById("txt_contra");
  
  input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
   event.preventDefault();
   document.getElementById("entrar").click();
  }
});
</script>
</body>
</html>
