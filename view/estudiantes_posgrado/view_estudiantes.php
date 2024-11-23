<script src="../js/console_estudiantes_posgrado.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>MANTENIMIENTO DE ESTUDIANTES POSGRADO</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">ESTUDIANTES POSGRADO</li>
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
                <h3 class="card-title"><i class="nav-icon fas fa-th"></i>&nbsp;&nbsp;<b>Listado de Estudiantes Posgrado</b></h3>
              </div>
              <div class="table-responsive" style="text-align:center">
              <div class="card-body">
              <table id="tabla_estudiantes" class="table table-striped table-bordered" style="width:100%">
                  <thead style="background-color:#0A5D86;color:#FFFFFF;">
                      <tr>
                      <th style="text-align:center">Tipo Documento</th>
                          <th style="text-align:center">N° Documento</th>
                          <th style="text-align:center">Código</th>
                          <th style="text-align:center">Estudiante</th>
                          <th style="text-align:center">Sexo</th>
                          <th style="text-align:center">Celular</th>
                          <th style="text-align:center">Dirección</th>
                          <th style="text-align:center">Fecha de Matricula</th>
                          <th style="text-align:center">Fecha de Egreso</th>
                          <th style="text-align:center">Tiempo Transcurrido</th>
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



<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>MODIFICAR DE ESTUDIANTE</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12 form-group" style="color:red">
            <h6><b>Campos Obligatorios (*)</b></h6>
          </div><br>
          <div class="col-4 form-group">
            <label for="">N° Documento<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_dni_editar" onkeypress="return soloNumeros(event)" maxlenght="8" disabled required>
          </div>
          <div class="col-4 form-group">
            <label for="">Código<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_codigo_editar"  maxlenght="11" required>
          </div>
          <div class="col-4 form-group">
            <label for="">Nombres<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_nom_editar" onkeypress="return sololetras(event)"required>
          </div>
          <div class="col-4 form-group">
            <label for="">Apellido Paterno<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_apepa_editar" onkeypress="return sololetras(event)"required>
          </div>
          <div class="col-4 form-group">
            <label for="">Apellido Materno<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_apema_editar" onkeypress="return sololetras(event)"required>
          </div>
          <div class="col-4 form-group">
            <label for="">Sexo<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_sexo_editar" style="width:100%">
                <option value="F">FEMENINO</option>
                <option value="M">MASCULINO</option>
              </select>          
          </div>
          <div class="col-4 form-group">
            <label for="">Celular<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_movil_editar" onkeypress="return soloNumeros(event)" maxlenght="9"required>
          </div>
          <div class="col-8 form-group">
            <label for="">Dirección<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_dire_editar" required>
          </div>
          <div class="col-6 form-group">
            <label for="">Fecha de matricula<b style="color:red">(*)</b>:</label>
            <input type="date" class="form-control" id="txt_fecha_matri_editar">
          </div>
          <div class="col-6 form-group">
            <label for="">Fecha de egreso<b style="color:red">(*)</b>:</label>
            <input type="date" class="form-control" id="txt_fecha_egres_editar">
          </div>
         
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Modificarr_Estudiante()"><i class="fas fa-edit"></i> Modificar</button>
      </div>
    </div>
  </div>
</div>
    <script>
    $(document).ready(function(){
        listar_estudiantes();
        $('.js-example-basic-single').select2();      
    });
    $('#modal_registro').on('shown.bs.modal', function () {
      $('#txt_dni').trigger('focus')
    })


var input=  document.getElementById('txt_dni_editar');
input.addEventListener('input',function(){
  if (this.value.length > 8) 
     this.value = this.value.slice(0,8); 
})
var input=  document.getElementById('txt_movil_editar');
input.addEventListener('input',function(){
  if (this.value.length > 9) 
     this.value = this.value.slice(0,9); 
})
var input=  document.getElementById('txt_codigo_editar');
input.addEventListener('input',function(){
  if (this.value.length > 10) 
     this.value = this.value.slice(0,9); 
})

    </script>