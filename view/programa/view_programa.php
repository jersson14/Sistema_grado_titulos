<script src="../js/console_programa.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>MANTENIMIENTO DE PROGRAMAS POSGRADO</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">PROGRAMAS POSGRADO</li>
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
                <h3 class="card-title"><i class="nav-icon fas fa-th"></i>&nbsp;&nbsp;<b>Listado de Programas Posgrado</b></h3>
                <button class="btn btn-success float-right" onclick="AbrirRegistro()"><i class="fas fa-plus"></i> Nuevo Registro</button>
              </div>
              <div class="table-responsive" style="text-align:center">
              <div class="card-body">
              <table id="tabla_programa" class="table table-striped table-bordered" style="width:100%">
                  <thead style="background-color:#0A5D86;color:#FFFFFF;">
                      <tr>
                          <th style="text-align:center">Nro.</th>
                          <th style="text-align:center">Programa</th>
                          <th style="text-align:center">Grado Académico</th>
                          <th style="text-align:center">Denominación</th>
                          <th style="text-align:center">Programa de Estudios</th>
                          <th style="text-align:center">Total de Creditos</th>
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
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>REGISTRO DE PROGRAMA POSGRADO</b></h5>
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
            <label for="">Programa<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txte_nombre" onkeypress="return sololetras(event)" required>
          </div>
          <div class="col-4 form-group">
            <label for="">Grado Académico<b style="color:red">(*)</b>:</label>
            <select class="form-control" id="select_grado" style="width:100%">
                <option value="MAESTRIA">MAESTRIA</option>
                <option value="DOCTORADO">DOCTORADO</option>
                <option value="SEGUNDA ESPECIALIDAD">SEGUNDA ESPECIALIDAD</option>
              </select>             
          </div>
          <div class="col-2 form-group">
            <label for="">Abreviatura<b style="color:red"></b>:</label>
            <input type="text" class="form-control" id="txt_abreviatura" onkeypress="return sololetras(event)" disabled>
          </div>
          <div class="col-6 form-group">
            <label for="">Denominación<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_deno" onkeypress="return sololetras(event)" required>
          </div>
          <div class="col-6 form-group">
            <label for="">Programa de Estudio<b style="color:red">(*)</b>:</label>
            <input type="text" value='CICLO REGULAR' class="form-control" id="txt_programa" onkeypress="return sololetras(event)" required>         
          </div>
          <div class="col-6 form-group">
            <label for="">Creditos<b style="color:red">(*)</b>:</label >
            <input type="number" class="form-control" id="txt_credito" required>
          </div>
          <div class="col-6 form-group">
            <label for="">Director<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_director" style="width:100%">
              </select>            
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Registrar_Programa()"><i class="fas fa-save"></i> Registrar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_editar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>MODIFICAR ESCUELA PROFESIONAL</b></h5>
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
            <label for="">Programa<b style="color:red">(*)</b>:</label>
            <input type="text" id="txt_id_programa" hidden>
            <input type="text" class="form-control" id="txte_nombre_editar" onkeypress="return sololetras(event)" required>
          </div>
          <div class="col-4 form-group">
            <label for="">Grado Académico<b style="color:red">(*)</b>:</label>
            <select class="form-control" id="select_grado_editar" style="width:100%">
                <option value="MAESTRIA">MAESTRIA</option>
                <option value="DOCTORADO">DOCTORADO</option>
                <option value="SEGUNDA ESPECIALIDAD">SEGUNDA ESPECIALIDAD</option>
              </select>             
          </div>
          <div class="col-2 form-group">
            <label for="">Abreviatura<b style="color:red"></b>:</label>
            <input type="text" class="form-control" id="txt_abreviatura_editar" onkeypress="return sololetras(event)" disabled>
          </div>
          <div class="col-6 form-group">
            <label for="">Denominación<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_deno_editar" onkeypress="return sololetras(event)" required>
          </div>
          <div class="col-6 form-group">
            <label for="">Programa de Estudio<b style="color:red">(*)</b>:</label>
            <input type="text" value='CICLO REGULAR' class="form-control" id="txt_programa_editar" onkeypress="return sololetras(event)" required>         
          </div>
          <div class="col-5 form-group">
            <label for="">Creditos<b style="color:red">(*)</b>:</label >
            <input type="number" class="form-control" id="txt_credito_editar" required>
          </div>
          <div class="col-5 form-group">
            <label for="">Director<b style="color:red">(*)</b>:</label>
              <select class="form-control" id="select_director_editar" style="width:100%">
              </select>            
          </div>
          <div class="col-2 form-group">
            <label for="">Estado<b style="color:red">(*)</b>:</label>
            <select name="" id="txt_estatus" class="form-control">
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>            
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Modificarr_Estudiante()"><i class="fas fa-save"></i> Registrar</button>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function() {
    listar_programas();
    $('.js-example-basic-single').select2();
    Cargar_Select_Autoridad();

    $('#modal_registro').on('shown.bs.modal', function() {
      $('#txt_codigo_escuela').trigger('focus');
    });

    // Función para manejar el registro
    function manejarRegistro() {
      const selectGrado = document.querySelector('#select_grado');
      document.getElementById("txt_abreviatura").value = 'M';

      selectGrado.addEventListener('change', (event) => {
        const seleccionado = event.target.value;

        if (seleccionado === 'MAESTRIA') {
          document.getElementById("txt_abreviatura").value = 'M';
        } else if (seleccionado === 'DOCTORADO') {
          document.getElementById("txt_abreviatura").value = 'D';
        }else if (seleccionado === 'SEGUNDA ESPECIALIDAD') {
          document.getElementById("txt_abreviatura").value = 'SE';
        }
      });
    }

    // Función para manejar la edición
    function manejarEdicion() {
      const selectGradoEditar = document.querySelector('#select_grado_editar');
      document.getElementById("txt_abreviatura_editar").value = 'M';

      selectGradoEditar.addEventListener('change', (event) => {
        const seleccionado = event.target.value;

       
        if (seleccionado === 'MAESTRIA') {
          document.getElementById("txt_abreviatura_editar").value = 'M';
        } else if (seleccionado === 'DOCTORADO') {
          document.getElementById("txt_abreviatura_editar").value = 'D';
        }else if (seleccionado === 'SEGUNDA ESPECIALIDAD') {
          document.getElementById("txt_abreviatura_editar").value = 'SE';
        }
      });
    }

    // Llama a las funciones
    manejarRegistro();
    manejarEdicion();
  });
</script>

