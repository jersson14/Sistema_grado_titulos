<script src="../js/console_reporte_fecha_cede.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>REPORTE DE GRADUADOS POR SEDE</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">GRADUADOS POR SEDE</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Titulados por SEDE</b></h3>
              </div>
                <div class="table-responsive" style="text-align:left">
                  <div class="card-body">
                  <div class="row">
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechainicio">Fecha Desde:</label>
                        <div class="input-group mb-2">
                         <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-calendar"></i>
                            </div>
                        </div>
                        <input type="date" class="form-control" id="txtfechainicio" name="txtfechainicio" required>
                        <div class="valid-input invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechafin">Fecha Hasta:</label>
                        <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-calendar"></i>
                            </div>
                        </div>
                        <input type="date" class="form-control" id="txtfechafin" name="txtfechafin" required>
                        <div class="valid-input invalid-feedback"></div>
                    </div>
                    </div>
                </div>
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechafin">Sede:</label>
                        <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-home"></i>
                            </div>
                        </div>
                        <select class="form-control" id="select_cede" style="width:90%"></select>
                        <div class="valid-input invalid-feedback"></div>
                    </div>
                    </div>
                </div>
                <div class="col-12 col-md-3" role="document">
                    <label for="">&nbsp;</label><br>
                    <button onclick="listar_fechas_busqueda()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Graduados</button>
                </div>
                </div>
                </div>

                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                    <table id="tabla_expediente_titulado" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                            <tr>
                                <th style="text-align:center">Nro.</th>
                                <th style="text-align:center">Tipo Documento</th>
                                <th style="text-align:center">N° Documento</th>                           
                                <th style="text-align:center">Estudiante</th>
                                <th style="text-align:center">Facultad</th>
                                <th style="text-align:center">Escuela</th>
                                <th style="text-align:center">Titulo de</th>
                                <th style="text-align:center">Modalidad</th>
                                <th style="text-align:center">Cede</th>
                                <th style="text-align:center">Estado</th>
                            </tr>
                        </thead>
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
    <!-- /.content -->
    </div>

    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Bachilleres por SEDE</b></h3>
              </div>
                <div class="table-responsive" style="text-align:left">
                  <div class="card-body">
                  <div class="row">
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechainicio">Fecha Desde:</label>
                        <div class="input-group mb-2">
                         <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-calendar"></i>
                            </div>
                        </div>
                        <input type="date" class="form-control" id="txtfechainicio_bach" name="txtfechainicio" required>
                        <div class="valid-input invalid-feedback"></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechafin">Fecha Hasta:</label>
                        <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-calendar"></i>
                            </div>
                        </div>
                        <input type="date" class="form-control" id="txtfechafin_bach" name="txtfechafin" required>
                        <div class="valid-input invalid-feedback"></div>
                    </div>
                    </div>
                </div>
                <div class="col-12 col-md-3" role="document">
                    <div class="form-group">
                    <label for="txtfechafin">Sede:</label>
                        <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-home"></i>
                            </div>
                        </div>
                        <select class="form-control" id="select_cede_bach" style="width:90%"></select>
                        <div class="valid-input invalid-feedback"></div>
                    </div>
                    </div>
                </div>
                <div class="col-12 col-md-3" role="document">
                    <label for="">&nbsp;</label><br>
                    <button onclick="listar_fechas_busqueda_bachi()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Graduados</button>
                </div>
                </div>
                </div>

                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                    <table id="tabla_expediente_bachiller" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                            <tr>
                                <th style="text-align:center">Nro.</th>
                                <th style="text-align:center">Tipo Documento</th>
                                <th style="text-align:center">N° Documento</th>                     
                                <th style="text-align:center">Estudiante</th>
                                <th style="text-align:center">Facultad</th>
                                <th style="text-align:center">Escuela</th>
                                <th style="text-align:center">Grado de bachiller en</th>
                                <th style="text-align:center">Modalidad</th>
                                <th style="text-align:center">Cede</th>
                                <th style="text-align:center">Estado</th>
                            </tr>
                        </thead>
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
    <!-- /.content -->
    </div>








<script>
$(document).ready(function () {
  
  $('.js-example-basic-single').select2();
  Cargar_Select_Cede();

});
var n = new Date();
var y= n.getFullYear();
var m= n.getMonth()+1;
var d= n.getDate();
if(d<10){
    d='0' + d;
}
if(m<10){
    m='0' + m;

}
document.getElementById('txtfechainicio').value = y + "-" + m + "-" + d;
document.getElementById('txtfechafin').value = y + "-" + m + "-" + d;
document.getElementById('txtfechainicio_bach').value = y + "-" + m + "-" + d;
document.getElementById('txtfechafin_bach').value = y + "-" + m + "-" + d;


</script>