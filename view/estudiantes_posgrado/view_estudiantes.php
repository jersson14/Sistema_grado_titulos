<script src="../js/console_estudiantes_posgrado.js?rev=<?php echo time();?>"></script>
<style>
    .toggle-switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 30px;
    }
    .toggle-switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: .4s;
        border-radius: 34px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 8px;
        color: white;
        font-weight: bold;
        font-size: 10px;
    }
    .slider:before {
        position: absolute;
        content: "";
        height: 22px;
        width: 22px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: .4s;
        border-radius: 50%;
        z-index: 2;
    }
    input:checked + .slider {
        background: linear-gradient(90deg, #1fa0e0 0%, #17a2b8 100%);
    }
    input:checked + .slider:before {
        transform: translateX(30px);
    }
    .slider .on-text, .slider .off-text {
        z-index: 1;
    }
    input:checked + .slider .off-text {
        display: none;
    }
    input:not(:checked) + .slider .on-text {
        display: none;
    }
</style>

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
                          <th style="text-align:center">Declaración</th>
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
          
          <!-- Sección de Foto del Estudiante -->
          <div class="col-12 form-group" id="seccion_foto_estudiante" style="display: block;">
            <div class="card" style="border: 2px solid #17A2B8;">
              <div class="card-header" style="background-color: #17A2B8; color: white;">
                <h6><b><i class="fas fa-camera"></i> Fotografía del Estudiante</b></h6>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-4 text-center">
                    <label><b>Foto Actual:</b></label>
                    <div style="border: 2px solid #ddd; padding: 10px; border-radius: 8px; background-color: #f8f9fa;">
                      <img id="img_foto_actual" 
                           src="../imagenes/no_image.jpg" 
                           alt="Foto actual" 
                           style="width: 100%; max-width: 200px; height: auto; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
                    </div>
                  </div>
                  <div class="col-md-8">
                    <div class="form-group">
                      <label><b>Cambiar Fotografía:</b></label>
                      <input type="file" 
                             class="form-control-file" 
                             id="txt_foto_editar" 
                             accept="image/jpeg,image/jpg,image/png">
                      <small class="form-text text-muted">
                        <i class="fas fa-info-circle"></i> Formatos permitidos: JPG, JPEG, PNG. Tamaño máximo: 2MB
                      </small>
                    </div>
                    <div id="preview_nueva_foto" style="display: none; margin-top: 10px;">
                      <label><b>Vista Previa:</b></label>
                      <div style="border: 2px dashed #28a745; padding: 10px; border-radius: 8px; background-color: #f8f9fa;">
                        <img id="img_preview" 
                             src="" 
                             alt="Vista previa" 
                             style="width: 100%; max-width: 200px; height: auto; border-radius: 5px;">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

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
            <label for="">Dirección:</label>
            <input type="text" class="form-control" id="txt_dire_editar">
          </div>
          <div class="col-6 form-group">
            <label for="">Fecha de matricula:</label>
            <input type="date" class="form-control" id="txt_fecha_matri_editar">
          </div>
          <div class="col-6 form-group">
            <label for="">Fecha de egreso:</label>
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

<!-- ⭐ Modal Ver Estudiante -->
<div class="modal fade" id="modal_ver" tabindex="-1" role="dialog" aria-labelledby="modalVerLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#17A2B8;">
        <h5 class="modal-title" id="modalVerLabel" style="color:white;"><b><i class="fas fa-eye"></i> INFORMACIÓN DEL ESTUDIANTE POSGRADO</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:white;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <!-- Columna Izquierda: Foto -->
          <div class="col-md-4 text-center">
            <div class="form-group">
              <label><b>Fotografía</b></label>
              <div id="foto_container" style="border: 2px solid #17A2B8; padding: 10px; border-radius: 8px; background-color: #f8f9fa;">
                <img id="img_ver_foto" 
                     src="../imagenes/no_image.jpg" 
                     alt="Foto del estudiante" 
                     style="width: 100%; max-width: 250px; height: auto; border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
              </div>
            </div>
          </div>
          
          <!-- Columna Derecha: Datos -->
          <div class="col-md-8">
            <div class="row">
              <div class="col-6 form-group">
                <label><b>N° Documento:</b></label>
                <input type="text" class="form-control" id="txt_dni_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-6 form-group">
                <label><b>Código:</b></label>
                <input type="text" class="form-control" id="txt_codigo_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-12 form-group">
                <label><b>Programa de Posgrado:</b></label>
                <input type="text" class="form-control" id="txt_posgrado_ver" readonly style="background-color: #fff3cd; font-weight: bold; border: 1px solid #ffeeba;">
              </div>
              <div class="col-12 form-group">
                <label><b>Nombres:</b></label>
                <input type="text" class="form-control" id="txt_nom_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-6 form-group">
                <label><b>Apellido Paterno:</b></label>
                <input type="text" class="form-control" id="txt_apepa_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-6 form-group">
                <label><b>Apellido Materno:</b></label>
                <input type="text" class="form-control" id="txt_apema_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-4 form-group">
                <label><b>Sexo:</b></label>
                <input type="text" class="form-control" id="txt_sexo_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-4 form-group">
                <label><b>Celular:</b></label>
                <input type="text" class="form-control" id="txt_movil_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-12 form-group">
                <label><b>Dirección:</b></label>
                <input type="text" class="form-control" id="txt_dire_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-6 form-group">
                <label><b>Fecha Matrícula:</b></label>
                <input type="text" class="form-control" id="txt_fecha_matri_ver" readonly style="background-color: #e9ecef;">
              </div>
              <div class="col-6 form-group">
                <label><b>Fecha Egreso:</b></label>
                <input type="text" class="form-control" id="txt_fecha_egres_ver" readonly style="background-color: #e9ecef;">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">
          <i class="fas fa-times"></i> Cerrar
        </button>
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