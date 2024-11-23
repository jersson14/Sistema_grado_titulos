<script src="../js/console_modalidad_bachiller.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>MODALIDAD BACHILLERES</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">MODALIDAD</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Modalidad Bachiller</b></h3>
              </div>
                <div class="table-responsive" style="text-align:left">
                  <div class="card-body">
                  <div class="row">
                <div class="col-12 col-md-4" role="document">
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
                
                <div class="col-12 col-md-4" role="document">
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
                <div class="col-12 col-md-4" role="document">
                    <label for="">&nbsp;</label><br>
                    <button onclick="listar_fechas_busqueda()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Documentos</button>
                </div>
                </div>
                </div>

                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                    <table id="tabla_modalidad_bachiller" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                            <tr>
                                <th style="text-align:center">Nro.</th>
                                <th style="text-align:center">Tipo Documento</th>
                                <th style="text-align:center">N° Documento</th>                                
                                <th style="text-align:center">Estudiante</th>
                                <th style="text-align:center">Facultad</th>
                                <th style="text-align:center">Escuela</th>
                                <th style="text-align:center">Modo de obtención</th>
                                <th style="text-align:center">Modalidad de estudio</th>
                                <th style="text-align:center">Fecha de registro</th>
                                <th style="text-align:center">Mostrar</th>
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



    <!-- /MODAL MAS DATOS -->
<div class="modal fade" id="modal_mas" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>MODALIDAD DE BACHILLER</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-4 form-group">
                <label for="" style="font-size:small;">Expediente<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_expediente_mas" readonly>
            </div>
            <div class="col-4 form-group">
              <label for="" style="font-size:small;">Dni y Estudiante<b style="color:red">(*)</b>:</label>
              <input type="text" class="form-control" id="txt_estudiante_mas" readonly>
            </div>
            <div class="col-4 form-group">
              <label for="" style="font-size:small;">Facultad y Escuela<b style="color:red">(*)</b>:</label>
              <input type="text" class="form-control" id="txt_escuela_mas" readonly>
            </div>
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Modo obtención<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_modo_obtencion_mas" value="BACHILLER AUTOMATICO" readonly>                           
            </div>
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_modo_estudio_mas" value="PRESENCIAL" readonly>                           
            </div>  
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Procedencia de Bachiller:</label>
                <textarea class="form-control" id="txt_pro_bachiller_mas"  rows="2" style="resize:none" readonly></textarea>
                </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Procedencia de Institución Origen:</label>
                <textarea class="form-control" id="txt_pro_institu_mas"  rows="2" style="resize:none" readonly></textarea>
                </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Procedencia Titulo Pedagógico:</label>
                <textarea class="form-control" id="txt_pro_titulo_mas"  rows="2" style="resize:none" readonly></textarea>
                </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
      </div>
    </div>
  </div>
</div>


<script>

$(document).ready(function () {
  listar_modalidad_bachiller();

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
</script>