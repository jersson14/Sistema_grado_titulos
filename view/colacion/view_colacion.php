<script src="../js/console_colacion.js?rev=<?php echo time(); ?>"></script>

<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0"><b>MANTENIMIENTO DE COLACIONES PREGRADO</b></h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
          <li class="breadcrumb-item active">COLACIONES PREGRADO</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <!-- /.col-md-6 -->
      <div class="col-lg-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title"><i class="nav-icon fas fa-th"></i>&nbsp;&nbsp;<b>Listado de Colaciones Pregrado</b></h3>
            <button class="btn btn-success float-right" onclick="AbrirRegistro()"><i class="fas fa-plus"></i> Nuevo Registro</button>
          </div>
          <div class="table-responsive" style="text-align:center">
            <div class="card-body">
              <table id="tabla_colacion" class="table table-striped table-bordered" style="width:100%">
                <thead style="background-color:#0A5D86;color:#FFFFFF;">
                  <tr>
                    <th style="text-align:center">Nro.</th>
                    <th style="text-align:center">Colación</th>
                    <th style="text-align:center">Año</th>
                    <th style="text-align:center">Fecha Colación - Central</th>
                    <th style="text-align:center">Fecha Colación - Cusco</th>
                    <th style="text-align:center">Fecha Colación - Andahuaylas</th>
                    <th style="text-align:center">Fecha Consejo Uni.</th>
                    <th style="text-align:center">Fecha Firma Cons.</th>
                    <th style="text-align:center">Fecha Resolución</th>
                    <th style="text-align:center">Nro. de Oficio</th>
                    <th style="text-align:center">Estado</th>
                    <th style="text-align:center">Acción</th>
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
  <!-- /.content -->

  <!-- Modal -->
  <div class="modal fade" id="modal_registro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1FA0E0;">
          <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>REGISTRO DE COLACIÓN</b></h5>
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
              <label for="">Nombre Colación<b style="color:red">(*)</b>:</label>
              <input type="text" class="form-control" id="txt_nombre_colacion" placeholder="Ingrese el nombre de la colación">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Central<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Cusco<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola_cusco">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Andah.<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola_andahuylas">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Consejo Universitario<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_consejo">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Firma Consejo<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_firma_con">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Resolución<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_resol">
            </div>
            <div class="col-12 form-group">
              <label for="">Nro. Oficio<b style="color:red">(*)</b>:</label>
              <input type="text" class="form-control" id="txt_oficio" placeholder="Ingrese el Nro. de Oficio">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
          <button type="button" class="btn btn-success" onclick="Registrar_colacion()"><i class="fas fa-save"></i> Registrar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1FA0E0;">
          <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR DATOS DE LA COLACIÓN</b></h5>
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
              <label for="">Nombre Colación<b style="color:red">(*)</b>:</label>
              <input type="text" id="txt_id_colacion" hidden>
              <input type="text" class="form-control" id="txt_nombre_colacion_editar" placeholder="Ingrese el nombre de la colación">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Central<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola_editar">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Cusco<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola_cusco_editar">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Colación - Andah.<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_cola_andahuylas_editar">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Consejo Universitario<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_consejo_editar">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Firma Consejo<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_firma_con_editar">
            </div>
            <div class="col-6 form-group">
              <label for="">Fecha Resolución<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_fecha_resol_editar">
            </div>
            <div class="col-12 form-group">
              <label for="">Nro. Oficio<b style="color:red">(*)</b>:</label>
              <input type="text" class="form-control" id="txt_oficio_editar" placeholder="Ingrese el Nro. de Oficio">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
          <button type="button" class="btn btn-success" onclick="Modificar_Colacion()"><i class="fas fa-check"></i> Modificar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal_colacion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1FA0E0;">
          <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>IMPRIMIR INFORME</b></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-12 form-group" style="color:red">
              <h7><b>OJO: Estos datos son importantes a la hora de imprimir la colación.</b></h7>
            </div>
            <div class="col-12 form-group">
              <label for="">Sede<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="txt_sede" style="width:100%">
              </select>
            </div>
            <div class="col-12 form-group">
              <label for="">Fecha Colación<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="fechacola">

            </div>
            <div class="col-6 form-group">
              <label for="">Hora de Inicio de Colación<b style="color:red">(*)</b>:</label>
              <input type="time" class="form-control" id="txt_hora">
            </div>

            <div class="col-6 form-group">
              <label for="">Fecha de Apersonarse<b style="color:red">(*)</b>:</label>
              <input type="date" class="form-control" id="txt_aper">

            </div>

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="AbrirPDFColacion()"><i class="fas fa-print"></i> Imprimir colación</button>
          <button type="button" class="btn btn-success" onclick="EnviarCorreosColacion()"><i class="fas fa-envelope"></i> Enviar correos</button>
        </div>
      </div>
    </div>
  </div>
  <script>
    $(document).ready(function() {
      listar_colacion();
      Cargar_Select_Cede();
    });
    $('#modal_registro').on('shown.bs.modal', function() {
      $('#txt_cede').trigger('focus')
    })

    var n = new Date();
    var y = n.getFullYear();
    var m = n.getMonth() + 1;
    var d = n.getDate();
    if (d < 10) {
      d = '0' + d;
    }
    if (m < 10) {
      m = '0' + m;

    }

    document.getElementById('txt_fecha_cola').value = y + "-" + m + "-" + d;
    document.getElementById('txt_fecha_cola_cusco').value = y + "-" + m + "-" + d;
    document.getElementById('txt_fecha_cola_andahuylas').value = y + "-" + m + "-" + d;

    document.getElementById('txt_fecha_consejo').value = y + "-" + m + "-" + d;
    document.getElementById('txt_fecha_firma_con').value = y + "-" + m + "-" + d;
    document.getElementById('txt_fecha_resol').value = y + "-" + m + "-" + d;
    document.getElementById('txt_aper').value = y + "-" + m + "-" + d;
  </script>