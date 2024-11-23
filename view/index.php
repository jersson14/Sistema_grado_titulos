<?php
session_start();
if (!isset($_SESSION['S_ID'])) {
  header('Location: ../index.php');
}
?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>UTEA | PERÚ</title>
  <script src="../js/jquery.min.js"></script>
  <script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
  <script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="../plantilla/plugins//fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">

  <link rel="stylesheet" href="../plantilla/dist//css/adminlte.min.css">
  <link href="../utilitario/DataTables/datatables.min.css" type="text/css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
</head>

<body >


  <div class="wrapper">
    <?php if ($_SESSION['S_ROL'] == "Super Administrador" || $_SESSION['S_ROL'] == "Administrador") { ?>
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
          </li>
        </ul>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
          <!-- Notifications Dropdown Menu -->
          <li class="nav-item dropdown" style="text-align:justify;">
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="text-align:justify">
              <div id="div_cuerpo" style="text-align:justify; border: 1px solid #333333;width: 100%;font-size: 100%;overflow-x: scroll;">
              </div>
              <div class="dropdown-divider"></div>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
              <img src="../<?php echo $_SESSION['S_FOTO']; ?>" class="img-circle elevation-1" width="15" height="18">
              <b>Usuario: <?php echo $_SESSION['S_NOMBRE'] ?></b>
              <i class="fas fa-caret-down"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
              <div class="dropdown-divider"></div>
              <a href="../controller/usuario/controlador_cerrar_sesion.php" class="dropdown-item">
                <i class="fas fa-power-off mr-2"></i><u><b>Cerrar Sesión</b></u>
              </a>
              <div class="dropdown-divider"></div>
            </div>
          </li>
        </ul>
      </nav>
    <?php
    }
    ?>
    <?php if ($_SESSION['S_ROL'] == "Secretario (a)" || $_SESSION['S_ROL'] == "Repositorio" ) {
    ?>
      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
          </li>
        </ul>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
          <!-- Notifications Dropdown Menu -->
          <li class="nav-item dropdown" style="text-align:justify;">
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="text-align:justify">
              <div id="div_cuerpo" style="text-align:justify; border: 1px solid #333333;width: 100%;font-size: 100%;overflow-x: scroll;">
              </div>
              <div class="dropdown-divider"></div>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
              <img src="../<?php echo $_SESSION['S_FOTO']; ?>" class="img-circle elevation-1" width="15" height="18">
              <b>Usuario: <?php echo $_SESSION['S_NOMBRE'] ?></b>
              <i class="fas fa-caret-down"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
              <div class="dropdown-divider"></div>
              <a href="../controller/usuario/controlador_cerrar_sesion.php" class="dropdown-item">
                <i class="fas fa-power-off mr-2"></i><u><b>Cerrar Sesión</b></u>
              </a>
              <div class="dropdown-divider"></div>
            </div>
          </li>
        </ul>
      </nav>
    <?php
    }
    ?>
    <!-- /.navbar -->
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="index.php" class="brand-link">
        <img src="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2022/01/logo-utea-2022-2.png?fit=404%2C137&ssl=1" alt="<?php echo $_SESSION['S_RAZON']; ?>" width="100%" height="auto">
      </a>
      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-1 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="../<?php echo $_SESSION['S_FOTO']; ?>" class="img-circle elevation-2" style="max-width: 100%;height: auto;">
          </div>
          <div class="info">
            <a style="text-align:center;" href="#" class="d-block"><i class="fa fa-circle text-success fa-0x"></i> ¡Hola!<br> <b style="color:white"><?php echo $_SESSION['S_APELLIDOS']; ?></b></a>
            <a style="text-align:center;margin:5px;color:white;font-size:13px" href="#" class="d-block">&nbsp;&nbsp;<b style="text-align:center"><i class="fa fa-user text-success fa-0x"></i><em> ROL: <?php echo $_SESSION['S_ROL']; ?></em></b></a>
          </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-1">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <a href="../index.php" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>
                  Dashboard
                </p>
              </a>
            </li>
            <br>
            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
            <?php if ($_SESSION['S_ROL'] == "Super Administrador") {
            ?>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-address-card"></i>
                  <p>
                    <p>Registro General
                      <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general/view_registro_general.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Registro de Título
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general/view_registro_general_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Registro de Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general/view_registro_general_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Registro de Posgrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','colacion/view_colacion.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Colación Pregrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','colacion/view_colacion_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Colación Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-address-card"></i>
                  <p>
                    <p>Área y Empleados
                      <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','empleado/view_empleado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Empleados
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','area/view_area.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Áreas
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-user-graduate"></i>
                  <p>
                    Autoridades y Estudiantes
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes/view_estudiantes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Estudiantes Pregrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes_posgrado/view_estudiantes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Estudiantes Posgrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','autoridades/view_autoridades.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Autoridades
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-school"></i>
                  <p>
                    Facultad y Programas
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','carrera/view_carrera.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Programa Pregrado
                      </p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','facultad/view_facultad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Facultad
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','programa/view_programa.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Programa Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                <p>
                Ver Expedientes
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente_titulo/view_expediente_titulo.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Expediente de Título
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente/view_expediente_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Expediente de Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente_posgrado/view_expediente_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Expediente de Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>

              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                  <p>
                    Ver Modalidades
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_titulo/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Titulo
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_bachiller/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Modalidad Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_posgrado/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                <p>
                Ver Diplomas
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_titulo.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Diploma Titulado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Diploma Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Diploma Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-file-pdf"></i>
                  <p>
                    Reportes e impresión
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/pregrado_sunedu.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Pregrado SUNEDU
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/posgrado_sunedu.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Posgrado SUNEDU
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_sedes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Sedes
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_facultad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Facultad
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_escuela.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Programa
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link" onclick="cargar_contenido('contenido_principal','usuario/view_usuario.php')">
                  <i class="nav-icon fas fa-user"></i>
                  <p>
                    Gestión de Usuario
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" onclick="cargar_contenido('contenido_principal','cede/view_cede.php')" class="nav-link">
                  <i class="nav-icon fas fa-school"></i>
                  <p>
                    Gestión de Sedes
                  </p>
                </a>
              </li>
              <li class="nav-item" hidden>
                <a href="../manual_usuario.pdf" target="_blank" class="nav-link">
                  <i class="nav-icon fas fa-file"></i>
                  <p>
                    Manual de usuario
                  </p>
                </a>
              </li>

            <?php
            }
            ?>
            <?php if ($_SESSION['S_ROL'] == "Administrador") {
            ?>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-address-card"></i>
                  <p>
                    <p>Registro General
                      <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general_admi/view_registro_general.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Registro de Título
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general_admi/view_registro_general_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Registro de Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general_admi/view_registro_general_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Registro de Posgrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','colacion/view_colacion.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Colación Pregrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','colacion/view_colacion_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Colación Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>

              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-user-graduate"></i>
                  <p>
                    Autoridades y Estudiantes
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes/view_estudiantes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Estudiantes Pregrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes_posgrado/view_estudiantes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Estudiantes Posgrado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','autoridades/view_autoridades.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Autoridades
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                <p>
                Ver Expedientes
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente_titulo/view_expediente_titulo.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Expediente de Título
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente/view_expediente_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Expediente de Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','expediente_posgrado/view_expediente_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Expediente de Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>

              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                  <p>
                    Ver Modalidades
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_titulo/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Titulo
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_bachiller/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Modalidad Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_posgrado/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                <p>
                Ver Diplomas
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_titulo.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Diploma Titulado
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Diploma Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_posgrado.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Diploma Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-file-pdf"></i>
                  <p>
                    Reportes e impresión
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/pregrado_sunedu.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Pregrado SUNEDU
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/posgrado_sunedu.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Posgrado SUNEDU
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_sedes.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Sedes
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_facultad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Facultad
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a onclick="cargar_contenido('contenido_principal','reportes/fecha_escuela.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Reporte por fechas y Programa
                      </p>
                    </a>
                  </li>
                </ul>
              </li>


            <?php
            }
            ?>
            <?php if ($_SESSION['S_ROL'] == "Secretario (a)") { ?>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-address-card"></i>
                  <p>
                    <p>Registro General
                      <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general_secre/view_registro_general.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Registro de Título
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','general_secre/view_registro_general_bachiller.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Registro de Bachiller
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
    
             

            <?php
            }
            ?>
             <?php if ($_SESSION['S_ROL'] == "Repositorio") { ?>
          
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-search"></i>
                  <p>
                    Ver Modalidades
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_titulo_repo/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Titulo
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_bachiller_repo/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>
                        Modalidad Bachiller
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" onclick="cargar_contenido('contenido_principal','modalidad_posgrado_repo/view_modalidad.php')" class="nav-link">
                      <i class="nav-icon far fa-circle"></i>
                      <p>Modalidad Posgrado
                      </p>
                    </a>
                  </li>
                </ul>
              </li>
            

            <?php
            }
            ?>
          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>
    <input type="text" id="txtprincipalid" value="<?php echo $_SESSION['S_ID']; ?>" hidden>
    <input type="text" id="txtprincipalusu" value="<?php echo $_SESSION['S_USU']; ?>" hidden>
    <input type="text" id="txtidprincipalarea" value="<?php echo $_SESSION['S_IDAREA']; ?>" hidden>
    <input type="text" id="txtprincipalrol" value="<?php echo $_SESSION['S_ROL']; ?>" hidden>
    <input type="text" id="txtprincipalarea" value="<?php echo $_SESSION['S_AREA']; ?>" hidden>
    <input type="text" id="txtfotoempresa" value="<?php echo $_SESSION['S_FOTO_EMPRESA']; ?>" hidden>
    <input type="text" id="txtrazon" value="<?php echo $_SESSION['S_RAZON']; ?>" hidden>
    <input type="text" id="txtsede" value="<?php echo $_SESSION['S_SEDE']; ?>" hidden>


    <div class="content-wrapper" id="contenido_principal">
      <!-- Content Wrapper. Contains page content -->
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0"><i class="fas fa-school"></i>
                <b>BIENVENIDOS AL SISTEMA</b>
              </h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">MENÚ</a></li>
                <li class="breadcrumb-item active">MENÚ PRINCIPAL</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->
      <?php if ($_SESSION['S_ROL'] == "Super Administrador") { ?>

        <!-- Main content -->
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <!-- /.col-md-6 -->
              <div class="col-lg-12">
                <div class="card-primary">
                  <div class="card-header">
                    <h5 class="m-0" style="font-family:Arial;text-align:center"><i class="fas fa-list-ol"></i><b> DATOS ESTADÍSTICOS</b></h5>
                  </div>
                  <div class="card-body" style="background-color:white">
                    <div class="row">
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                          <div class="inner">
                            <b>Total de Diplomas Bachiller</b>
                            <h3 id="total_diplo_bachiller"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_bachiller.php')" class="small-box-footer"><b>Ver diplomas bachiller</b>&nbsp;<i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                          <div class="inner">
                            <b>Total de Diplomas Título</b>
                            <h3 id="total_diplo_titulo"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_titulo.php')" class="small-box-footer"><b>Ver diplomas titulo</b>&nbsp;<i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                          <div class="inner">

                            <b>Total de Diplomas Posgrado</b>
                            <h3 id="total_diplo_pos"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_posgrado.php')" class="small-box-footer"><b>Ver diplomas posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-dark">
                          <div class="inner">
                            <b>Total de Graduados a Nivel Pregrado</b>
                            <h3 id="total_pregrado"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-user-graduate"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes/view_estudiantes.php')" class="small-box-footer"><b>Ver graduados pregrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                          <div class="inner">
                            <b>Total de Expedientes Bachiller</b>
                            <h3 id="totalexpe_bachiller"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','expediente/view_expediente_bachiller.php')" class="small-box-footer"><b>Ver expedientes bachiller</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-secondary">
                          <div class="inner">
                            <b>Total de Expedientes de Título</b>
                            <h3 id="totalexpe_titulo"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','expediente_titulo/view_expediente_titulo.php')" class="small-box-footer"><b>Ver expedientes titulo</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-light">
                          <div class="inner">
                            <b>Total de Expedientes de Posgrado</b>
                            <h3 id="total_expe_pos"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-file"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','expediente_posgrado/view_expediente_posgrado.php')" class="small-box-footer"><b>Ver expedientes posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-dark">
                          <div class="inner">
                            <b>Total de Graduados a Nivel Posgrado</b>
                            <h3 id="total_posgrado"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-user-graduate"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes_posgrado/view_estudiantes.php')" class="small-box-footer"><b>Ver graduados posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <hr>
                        <div class="small-box bg-dark">
                          <div class="inner">
                            <b>Total Facultades</b>
                            <h3 id="total_facul"><sup style="font-size: 20px"></sup></h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-school"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','facultad/view_facultad.php')" class="small-box-footer"><b>Ver facultades</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <hr>
                        <div class="small-box bg-primary">
                          <div class="inner">
                            <b>Total Programas Pregrado</b>
                            <h3 id="totalescuelas"><sup style="font-size: 20px"></sup>0</h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-layer-group"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','carrera/view_carrera.php')" class="small-box-footer"><b>Ver programas</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <hr>
                        <div class="small-box bg-danger">
                          <div class="inner">
                            <b>Total Programas Posgrado</b>
                            <h3 id="total_program"><sup style="font-size: 20px"></sup>0</h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-layer-group"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','programa/view_programa.php')" class="small-box-footer"><b>Ver programas</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <hr>
                        <div class="small-box bg-info">
                          <div class="inner">
                            <b>Total Autoridades</b>
                            <h3 id="total_autoridad"><sup style="font-size: 20px"></sup>0</h3>

                          </div>
                          <div class="icon">
                            <i class="fas fa-user-graduate"></i>
                          </div>
                          <a href="#" onclick="cargar_contenido('contenido_principal','autoridades/view_autoridades.php')" class="small-box-footer"><b>Ver autoridades</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
          </div><!-- /.container-fluid -->
        </div>

        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <!-- /.col-md-6 -->
              <div class="col-lg-12">
                <div class="card-primary">
                  <div class="card-header">
                    <h5 class="m-0" style="font-family:Arial;text-align:center"><i class="fas fa-school"></i><b> DATOS INSTITUCIÓN</b< /h5>
                  </div>
                  <div class="table-responsive" style="text-align:center">
                    <div class="card-body">
                      <table id="tabla_empresa" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#023D77;color:white;">
                          <tr>
                            <th style="text-align:center">Nro.</th>
                            <th style="text-align:center">Logo</th>
                            <th style="text-align:center">Nombre</th>
                            <th style="text-align:center">Email</th>
                            <th style="text-align:center">Código</th>
                            <th style="text-align:center">Teléfono</th>
                            <th style="text-align:center">Dirección</th>
                            <th style="text-align:center">Acciones</th>

                          </tr>
                        </thead>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- /.col-md-6 -->
              </div>
              <!-- /.row -->
            </div><!-- /.container-fluid -->
          </div>
        </div>

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#1FA0E0;">
            <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR DATOS DE LA INSTITUCIÒN</b></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-12 form-group" style="color:red">
                <h6><b>Campos Obligatorios (*)</b></h6>
              </div><br>
              <div class="col-6 form-group">
                <input type="text" id="txt_id_empresa" hidden>
                <label for="">Nombre(*):</label>
                <input type="text" class="form-control" id="txt_nombre" maxlenght="8">
              </div>
              <div class="col-6 form-group">
                <label for="">Email(*):</label>
                <input type="text" class="form-control" id="txt_email">
              </div>
              <div class="col-6 form-group">
                <label for="">Código(*):</label>
                <input type="text" class="form-control" id="txt_codigo">
              </div>
              <div class="col-6 form-group">
                <label for="">Teléfono / Celular(*):</label>
                <input type="text" class="form-control" id="txt_telefono" maxlenght="9" onkeypress="return soloNumeros(event)">
              </div>
              <div class="col-12 form-group">
                <label for="">Dirección(*):</label>
                <input type="text" class="form-control" id="txt_direccion">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
            <button type="button" class="btn btn-success" onclick="Modificar_Empleado()"><i class="fas fa-check"></i> Modificar</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="modal_editar_foto" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" style="background-color:#1FA0E0;">
            <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR FOTO DE LA INSTITUCIÓN: </b><label for="" id="lb_empresa"></label></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-12">
                <input type="text" id="fotoactual" hidden>
                <input type="text" id="txt_idempresa_foto" hidden>
                <label for="checkboxSuccess2" style="align:justify;color:red">
                  OJO: Una vez cambiado el logo, tambien se cambiara el logo en los reportes y ticket.
                </label>
                <label for="">Subir Foto:</label>
                <input class="form-control" type="file" id="txt_foto">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
            <button type="button" class="btn btn-success" onclick="Modificar_Foto_Empresa()"><i class="fas fa-check"></i> Modificar</button>
          </div>
        </div>
      </div>
    </div>
  <?php
      }
  ?>
   <?php if ($_SESSION['S_ROL'] == "Administrador") { ?>

<!-- Main content -->
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <!-- /.col-md-6 -->
      <div class="col-lg-12">
        <div class="card-primary">
          <div class="card-header">
            <h5 class="m-0" style="font-family:Arial;text-align:center"><i class="fas fa-list-ol"></i><b> DATOS ESTADÍSTICOS</b></h5>
          </div>
          <div class="card-body" style="background-color:white">
            <div class="row">
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-info">
                  <div class="inner">
                    <b>Total de Diplomas Bachiller</b>
                    <h3 id="total_diplo_bachiller"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_bachiller.php')" class="small-box-footer"><b>Ver diplomas bachiller</b>&nbsp;<i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-warning">
                  <div class="inner">
                    <b>Total de Diplomas Título</b>
                    <h3 id="total_diplo_titulo"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_titulo.php')" class="small-box-footer"><b>Ver diplomas titulo</b>&nbsp;<i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                  <div class="inner">

                    <b>Total de Diplomas Posgrado</b>
                    <h3 id="total_diplo_pos"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_posgrado.php')" class="small-box-footer"><b>Ver diplomas posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <!-- ./col -->
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-dark">
                  <div class="inner">
                    <b>Total de Graduados a Nivel Pregrado</b>
                    <h3 id="total_pregrado"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-user-graduate"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes/view_estudiantes.php')" class="small-box-footer"><b>Ver graduados pregrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                  <div class="inner">
                    <b>Total de Expedientes Bachiller</b>
                    <h3 id="totalexpe_bachiller"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','expediente/view_expediente_bachiller.php')" class="small-box-footer"><b>Ver expedientes bachiller</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-secondary">
                  <div class="inner">
                    <b>Total de Expedientes de Título</b>
                    <h3 id="totalexpe_titulo"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','expediente_titulo/view_expediente_titulo.php')" class="small-box-footer"><b>Ver expedientes titulo</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-light">
                  <div class="inner">
                    <b>Total de Expedientes de Posgrado</b>
                    <h3 id="total_expe_pos"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-file"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','expediente_posgrado/view_expediente_posgrado.php')" class="small-box-footer"><b>Ver expedientes posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <div class="small-box bg-dark">
                  <div class="inner">
                    <b>Total de Graduados a Nivel Posgrado</b>
                    <h3 id="total_posgrado"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-user-graduate"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes_posgrado/view_estudiantes.php')" class="small-box-footer"><b>Ver graduados posgrado</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <hr>
                <div class="small-box bg-dark">
                  <div class="inner">
                    <b>Total Facultades</b>
                    <h3 id="total_facul"><sup style="font-size: 20px"></sup></h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-school"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','facultad/view_facultad.php')" class="small-box-footer"><b>Ver facultades</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <hr>
                <div class="small-box bg-primary">
                  <div class="inner">
                    <b>Total Programas Pregrado</b>
                    <h3 id="totalescuelas"><sup style="font-size: 20px"></sup>0</h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-layer-group"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','carrera/view_carrera.php')" class="small-box-footer"><b>Ver programas</b></b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <hr>
                <div class="small-box bg-danger">
                  <div class="inner">
                    <b>Total Programas Posgrado</b>
                    <h3 id="total_program"><sup style="font-size: 20px"></sup>0</h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-layer-group"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','programa/view_programa.php')" class="small-box-footer"><b>Ver programas</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small box -->
                <hr>
                <div class="small-box bg-info">
                  <div class="inner">
                    <b>Total Autoridades</b>
                    <h3 id="total_autoridad"><sup style="font-size: 20px"></sup>0</h3>

                  </div>
                  <div class="icon">
                    <i class="fas fa-user-graduate"></i>
                  </div>
                  <a href="#" onclick="cargar_contenido('contenido_principal','autoridades/view_autoridades.php')" class="small-box-footer"><b>Ver autoridades</b>&nbsp; <i class="fas fa-arrow-circle-right"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- /.col-md-6 -->
    </div>
    <!-- /.row -->
  </div><!-- /.container-fluid -->
</div>



<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<?php
}
?>
  <?php if ($_SESSION['S_ROL'] == "Secretario (a)" || $_SESSION['S_ROL'] == "Repositorio") { ?>

    <!-- Main content -->
    <div class="content">
          <div class="container-fluid">
            <div class="row">
              <!-- /.col-md-6 -->
              <div class="col-lg-12">
                <div class="card-primary">
                  <div class="card-header">
                  </div>
                  <div class="card-body" style="background-color:white">
                   <img src="../img/utea.png" alt="">
                  </div>
                </div>

              </div>
              <!-- /.col-md-6 -->
            </div>
            <!-- /.row -->
          </div><!-- /.container-fluid -->
        </div>

      </div>
  <!-- /.content-wrapper -->
<?php
  }
?>
<!-- Control Sidebar -->

<!-- /.control-sidebar -->

<!-- Main Footer -->
<footer class="main-footer">
  <!-- To the right -->
  <div class="float-right d-none d-sm-inline">
    <em>Versión 1.0.0</em>

  </div>

  <!-- Default to the left -->
  <strong>Copyright &copy; 2024 <a href="https://utea.edu.pe/" target="_blank"><em>UTEA - ABANCAY</em></a></strong>

</footer>


<!-- ./wrapper -->
<!-- MODAL EDITAR HORARIO -->

<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR HORARIO DE ATENCIÓN</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12 form-group" style="color:red">
            <h6><b>Campos Obligatorios (*)</b></h6>
          </div>
          <div class="col-12 form-group">
            <label for="">Hora Inicio(*):</label>
            <input type="text" class="form-control" id="txt_hora_inicio">
            <input type="text" id="txt_idhora" hidden>
          </div>
          <div class="col-12 form-group">
            <label for="">Hora Fin(*):</label>
            <input type="text" class="form-control" id="txt_hora_fin">

          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Modificar_Horario()"><i class="fas fa-check"></i> Modificar</button>
      </div>
    </div>
  </div>
</div>


<!-- REQUIRED SCRIPTS -->
<script>
  function cargar_contenido(id, vista) {
    $("#" + id).load(vista);
  }
  var idioma_espanol = {
    select: {
      rows: "%d fila seleccionada"
    },
    "sProcessing": "Procesando...",
    "sLengthMenu": "Mostrar _MENU_ registros",
    "sZeroRecords": "No se encontraron resultados",
    "sEmptyTable": "Ning&uacute;n dato disponible en esta tabla",
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
      "sPrevious": "Atras"
    },
    "oAria": {
      "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
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


  function soloNumeros(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8) {
      return true;
    }
    // Patron de entrada, en este caso solo acepta numeros
    patron = /[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
  }



  ///////VALIDAR EMAIL
  function validar_email(email) {
    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email) ? true : false;
  }
</script>
<!-- jQuery -->

<script src="../plantilla/plugins//jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plantilla/plugins//bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../plantilla/dist/js/adminlte.min.js"></script>

<script src="../utilitario/DataTables/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="../js/console_registro_general_bachiller.js?rev=<?php echo time(); ?>"></script>
<script src="../js/console_registro_general_posgrado.js?rev=<?php echo time(); ?>"></script>
<script src="../js/console_empresa.js?rev=<?php echo time(); ?>"></script>
<script src="../js/console_usuario.js?rev=<?php echo time(); ?>"></script>

</body>

</html>
<script>
  $(document).ready(function() {
    listar_empresa();
    Total_diploma_bachiller();
    Total_diploma_titulo();
    Total_expediente_bach();
    Total_expediente_titu();
    Total_pregrado();
    Total_diploma_posgrado();
    Total_expediente_posgrado();
    Total_posgraduados();
    Total_facultad();
    Total_escuelas();
    Total_programada();
    Total_autoridad();
  });
</script>