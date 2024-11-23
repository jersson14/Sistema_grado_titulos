<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>UTEA | PERÚ</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="icon" href="https://i0.wp.com/utea.edu.pe/wp-content/uploads/2021/12/logo-utea2022.png?w=485&ssl=1" type="image/jpg">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
  <!-- Swal CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.min.css">
</head>

<body>
  <link rel="stylesheet" href="plantilla/dist/css/adminlte.min.css">
  </head>

  <body class="hold-transition layout-top-nav">
    <div class="wrapper">

      <!-- Navbar -->
      <nav class="main-header navbar navbar-expand-md navbar-light navbar-white" style="background-color:#0A9BF9">
        <div class="container">

          <img src="img/utea.png" alt="" width="20%">


          <div class="collapse navbar-collapse order-3" id="navbarCollapse">
            <!-- SEARCH FORM -->
          </div>

        </div>

        <!-- Right navbar links -->

    </div>
    </nav>
    <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
      <div class="container">

        <a href="seguimiento.php" class="navbar-brand">
          <i class="fa fa-search" style="color:green"></i>

          <span class="brand-text font-weight-light"><b>SEGUIMIENTO DE EXPEDIENTE POSGRADO</b></span>
        </a>

        <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse order-3" id="navbarCollapse">
          <!-- Left navbar links -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a style="color:black" href="index.php" class="nav-link"><i class="fa fa-user"></i><b> Login(click👇)</b></a>
            </li>
            <li class="nav-item">
              <a style="color:blue" href="seguimiento.php" class="nav-link"><i class="fa fa-user"></i><b> Seguimiento Pregrado(click👇)</b></a>
            </li>
            <li class="nav-item">
              <a style="color:green" href="manual_usu_externo.pdf" target="_blank" class="nav-link"><i class="fa fa-file"></i><b> Manual de usuario(click👇)</b></a>
            </li>
          </ul>

          <!-- SEARCH FORM -->
        </div>

      </div>

      <!-- Right navbar links -->

      </div>
    </nav>
    <!-- /.navbar -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <div class="col-3">
        <select type="text" class="form-control" id="txt_id" hidden>
        </select>
        <input type="text" class="form-control" id="txt_fecha_inicio" hidden>
        <input type="text" class="form-control" id="txt_fecha_fin" hidden>

      </div>
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container">
          <div class="row mb-12">
            <div class="col-sm-12" style="text-align:center;color:#0D7BC2">
              <h4 class="m-0"><b>UNIVERSIDAD TECNOLÓGICA DE LOS ANDES</b></h4>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container">
          <div class="row">

            <!-- /.col-md-6 -->
            <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <hr>
                  <p style="font-size:14px; text-align:justify"><b>La UNIVERSIDAD TECNOLÓGICA DE LOS ANDES le ofrece la plataforma de Seguimiento de Graduados, que le permite consultar el estado de su expediente y mantenerse actualizado con la información relevante. Para realizar una búsqueda precisa y obtener los detalles de su expediente, es fundamental ingresar el DNI del graduado sin espacios en blanco. Asegúrese de completar el campo correctamente para garantizar una búsqueda efectiva.</b></p>
                  <hr>
                  <div class="card-header bg-dark">
                    <h5 class="card-title m-0"><b>Buscador de Trámite Posgrado</b></h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-6 col-sm-12 mb-3">
                        <label for="txt_dni">Número de DNI del Posgraduado <b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_dni" onkeypress="return soloNumeros(event)" maxlength="9">
                      </div>
                      <div class="col-md-6 col-sm-12 mb-3">
                        <label for="">&nbsp;</label><br>

                        <button class="btn btn-success w-100" style="font-size:18px" id="buscar" onclick="Traer_Datos_Seguimiento_posgrado()">
                          <i class="fa fa-search"></i> Buscar Expediente Posgrado
                        </button>
                      </div>
                    </div>
                  </div>

              </div>
            </div>
            <div class="col-lg-12" id="div_buscador" style="display:none">
              <div class="card">
                <div class="card-header bg-primary">
                  <h5 class="card-title m-0" id="lbl_titulo"><b>Seguimiento</b></h5>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table id="tabla_registro_general" class="table table-striped table-bordered table-sm" style="width:100%; font-size: 0.85rem;">
                      <thead style="background-color:#0A5D86;color:#FFFFFF;">
                        <tr>
                          <th style="text-align:center; font-size: 0.9rem;">Tipo</th>
                          <th style="text-align:center; font-size: 0.9rem;">Denominación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Dni</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estudiante</th>
                          <th style="text-align:center; font-size: 0.9rem;">Programa</th>
                          <th style="text-align:center; font-size: 0.9rem;">Modalidad</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estado</th>
                          <th style="text-align:center; font-size: 0.9rem;">Fecha Colación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Trabajo de Investigación</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- Tu contenido aquí -->
                      </tbody>
                    </table>
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

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
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
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->

    <!-- jQuery -->
    <script src="plantilla/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="plantilla/dist/js/adminlte.min.js"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="js/console_usuario.js?rev=<?php echo time(); ?>"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <!-- Swal JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.2/dist/sweetalert2.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
      var input = document.getElementById('txt_dni');
      input.addEventListener('input', function() {
        if (this.value.length > 8)
          this.value = this.value.slice(0, 8);
      })

      function sololetras(e) {
        key = e.keyCode || e.which;

        teclado = String.fromCharCode(key).toLowerCase();

        letras = "qwertyuiopasdfghjklñzxcvbnmáéíóú ";

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
    </script>
    <script>
      $('#ticket').click(function() {
        var codigo = $("#txt_numero").val();
        window.open("view/MPDF/REPORTE/ticket_tramite.php?codigo=" + codigo +
          "#zoom=100%", "Ticket", "scrollbars=NO");

      })
      $('#seguimiento').click(function() {
        var codigo = $("#txt_numero").val();
        window.open("view/MPDF/REPORTE/ficha_seguimiento_automatico.php?codigo=" + codigo +
          "#zoom=100%", "Seguimiento", "scrollbars=NO");

      })
      input.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
          event.preventDefault();
          document.getElementById("buscar").click();
        }
      });
    </script>
  </body>

</html>

<style>
  .card-body {
    overflow-x: auto;
  }

  table.dataTable {
    width: 100% !important;
  }

  .dataTables_wrapper .dataTables_scroll {
    overflow: auto;
  }

  /* Aplica Times New Roman a toda la tabla */
  #tabla_registro_general {
    font-family: "Times New Roman", Times, serif;
  }

  /* Centra el texto en todas las celdas del cuerpo de la tabla */
  #tabla_registro_general tbody td {
    text-align: center;
  }
</style>
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