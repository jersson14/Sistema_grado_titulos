<?php
 session_start();

 // Verificar CSRF token si la solicitud es POST
 if ($_SERVER['REQUEST_METHOD'] === 'POST') {
     if (!isset($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
         // Token inválido o no presente
         http_response_code(403);
         echo json_encode(['status' => 'error', 'message' => 'Token CSRF inválido']);
         exit();
     }
 }
    // Generar nuevo token CSRF para la próxima solicitud
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));

    // Sanitización de inputs
    $idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8');
    $usuario = htmlspecialchars($_POST['usuario'],ENT_QUOTES,'UTF-8');
    $idarea = htmlspecialchars($_POST['idarea'],ENT_QUOTES,'UTF-8');
    $rol = htmlspecialchars($_POST['rol'],ENT_QUOTES,'UTF-8');
    $area = htmlspecialchars($_POST['area'],ENT_QUOTES,'UTF-8');
    $solonombres = htmlspecialchars($_POST['solonombres'],ENT_QUOTES,'UTF-8');
    $nombres = htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8');
    $foto = htmlspecialchars($_POST['foto'],ENT_QUOTES,'UTF-8');
    $foto_empresa = htmlspecialchars($_POST['foto_empresa'],ENT_QUOTES,'UTF-8');
    $razon = htmlspecialchars($_POST['razon'],ENT_QUOTES,'UTF-8');
    $sede = htmlspecialchars($_POST['sede'],ENT_QUOTES,'UTF-8');

    // Establecer variables de sesión
    $_SESSION['S_ID']=$idusuario;
    $_SESSION['S_USU']=$usuario;
    $_SESSION['S_IDAREA']=$idarea;
    $_SESSION['S_ROL']=$rol;
    $_SESSION['S_AREA']=$area;
    $_SESSION['S_APELLIDOS']=$solonombres;
    $_SESSION['S_NOMBRE']=$nombres;
    $_SESSION['S_FOTO']=$foto;
    $_SESSION['S_FOTO_EMPRESA']=$foto_empresa;
    $_SESSION['S_RAZON']=$razon;
    $_SESSION['S_SEDE']=$sede;

    // Agregar timestamp y expiración
    $_SESSION['created_at'] = time();
    $_SESSION['expires_at'] = time() + (60 * 60); // 2 minutos de expiración
    // Regenerar ID de sesión para prevenir ataques de fijación de sesión
    
    echo json_encode(['status' => 'success']);
?>