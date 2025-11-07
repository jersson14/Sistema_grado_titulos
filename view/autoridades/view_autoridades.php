<script src="../js/console_autoridades.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>MANTENIMIENTO DE AUTORIDADES</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">ESTUDIANTES</li>
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
                <h3 class="card-title"><i class="nav-icon fas fa-th"></i>&nbsp;&nbsp;<b>Listado de Autoridades</b></h3>
                <button class="btn btn-success float-right" onclick="AbrirRegistro()"><i class="fas fa-plus"></i> Nuevo Registro</button>
              </div>
              <div class="table-responsive" style="text-align:center">
              <div class="card-body">
              <table id="tabla_autoridad" class="table table-striped table-bordered" style="width:100%">
                  <thead style="background-color:#0A5D86;color:#FFFFFF;">
                      <tr>
                          <th style="text-align:center">Nro.</th>
                          <th style="text-align:center">Autoridad 1</th>
                          <th style="text-align:center">Cargo 1</th>
                          <th style="text-align:center">Autoridad 2</th>
                          <th style="text-align:center">Cargo 2</th>
                          <th style="text-align:center">Autoridad 3</th>
                          <th style="text-align:center">Cargo 3</th>
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
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>REGISTRO DE AUTORIDAD</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12 form-group" style="color:red">
            <h6><b>Campos Obligatorios (*)</b></h6>
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 1<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad1" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 1<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol1" style="width:100%">
                <option value="RECTOR">RECTOR</option>
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="DECANO">DECANO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 1<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero1" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 2<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad2" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 2<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol2" style="width:100%">
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="RECTOR">RECTOR</option>
                <option value="DECANO">DECANO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 2<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero2" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 3<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad3" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 3<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol3" style="width:100%">
                <option value="DECANO">DECANO</option>
                <option value="RECTOR">RECTOR</option>
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="DIRECTOR">DIRECTOR POSGRADO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 3<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero3" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Registrar_Autoridad()"><i class="fas fa-save"></i> Registrar</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR DATOS DE LA AUTORIDAD</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12 form-group" style="color:red">
            <h6><b>Campos Obligatorios (*)</b></h6>
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 1<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_id_autoridad" onkeypress="return sololetras(event)" hidden>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad1_editar" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 1<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol1_editar" style="width:100%">
                <option value="RECTOR">RECTOR</option>
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="DECANO">DECANO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 1<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero1_editar" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 2<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad2_editar" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 2<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol2_editar" style="width:100%">
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="RECTOR">RECTOR</option>
                <option value="DECANO">DECANO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 2<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero2_editar" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
          <div class="col-6 form-group">
            <label for="">Autoridad 3<b style="color:red">(*)</b>:</label>
            <input type="text" autocomplete="on" class="form-control" id="txt_autoridad3_editar" onkeypress="return sololetras(event)">
          </div>
          <div class="col-3 form-group">
            <label for="">Cargo 3<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_rol3_editar" style="width:100%">
                <option value="DECANO">DECANO</option>
                <option value="RECTOR">RECTOR</option>
                <option value="SECRETARIA GENERAL">SECRETARIA GENERAL</option>
                <option value="DIRECTOR">DIRECTOR POSGRADO</option>
              </select>          
          </div>
          <div class="col-3 form-group">
            <label for="">Genero 3<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_genero3_editar" style="width:100%">
                <option value="FEMENINO">FEMENINO</option>
                <option value="MASCULINO">MASCULINO</option>
              </select>          
          </div>
          <div class="col-12 form-group">
            <label for="">Estado<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_estado" style="width:100%">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>          
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Modificar_Autoridad()"><i class="fas fa-check"></i> Modificar</button>
      </div>
    </div>
  </div>
</div>
    <script>
    $(document).ready(function(){
        listar_autoridad();
        $('.js-example-basic-single').select2();   
    });
    $('#modal_registro').on('shown.bs.modal', function () {
      $('#txt_autoridad1').trigger('focus')
    })
    </script>