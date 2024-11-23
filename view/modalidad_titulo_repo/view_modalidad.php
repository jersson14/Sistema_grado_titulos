<script src="../js/console_modalidad_titulado_repo.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>MODALIDAD TITULADOS</b></h1>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Modalidad Titulo</b></h3>
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
                    <label for="">&nbsp;</label><br>
                    <button onclick="listar_fechas_busqueda()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Modalidad</button>
                </div>
                <div class="col-12 col-md-3" role="document">
                    <label for="">&nbsp;</label><br>
                    <button onclick="listar_todo()" class="btn btn-success mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Listar Todos</button>
                </div>
                </div>
                </div>

                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                    <table id="tabla_modalidad_titulo" class="table table-striped table-bordered" style="width:100%">
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
                                <th style="text-align:center">Sede</th>
                                <th style="text-align:center">Fecha de registro</th>
                                <th style="text-align:center">Trabajo de Investigación</th>
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
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header" style="background-color:#1FA0E0">
    <h5 class="modal-title" id="lb_titulo_datos" style="color:white;"><b>DATOS DE LA MODALIDAD</b></h5>
    </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-2 form-group">
                <label for="" style="font-size:small;">Expediente<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_expediente" readonly>
            </div>
            <div class="col-5 form-group">
                <label for="" style="font-size:small;">Dni y Estudiante<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_estudiante" readonly>
            </div>
            <div class="col-5 form-group">
                <label for="" style="font-size:small;">Facultad y Escuela<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_escuela" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modo obtención<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_modo_ob" readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_modo_estu" value="PRESENCIAL"readonly>                           
            </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Trabajo de Investigación<b style="color:red">(SOLO TESIS)</b>:</label>
                <textarea  class="form-control" id="txt_trabajo_inve"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Turnitin<b style="color:red">(SOLO TESIS)</b>:</label>
                <input type="text" class="form-control" id="txt_turni"readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Porcentaje<b style="color:red">(SOLO TESIS)</b>:</label>
                <input type="text" class="form-control" id="txt_porce" readonly>                           
            </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Centro de Investigación<b style="color:red">(*)</b>:</label>
                <textarea class="form-control" id="txt_centro_inve"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                <textarea class="form-control" id="txt_metadata"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia de Bachiller (Opcional):</label>
                <textarea class="form-control" id="txt_proceden_bachi"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia de Institución Origen (Opcional):</label>
                <textarea class="form-control" id="txt_procedeni_insti_ori"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia Titulo Pedagógico (Opcional):</label>
                <textarea class="form-control" id="txt_proceden_titu_ori"  rows="2" style="resize:none"readonly></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de matricula de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_matri"readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de Inicio de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_inicio"readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha Fin de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_fin"readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modo de sustentación<b style="color:red">(*)</b>:</label>
                <select class="form-control" id="select_modo_sustenta" style="width:100%"readonly>
                    <option value="PRESENCIAL">PRESENCIAL</option>
                    <option value="VIRTUAL">VIRTUAL</option>
                </select>                            
            </div><br>
            
        </div>
       </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-right-from-bracket"></i>Cerrar</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modal_editar" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header" style="background-color:#1FA0E0">
    <h5 class="modal-title" id="lb_titulo_datos" style="color:white;"><b>DATOS DE LA MODALIDAD</b></h5>
    </div>
      <div class="modal-body">
      <div class="alert alert-warning alert-dismissible" style="text-align:justify">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h5><i class="icon fas fa-exclamation-triangle"></i> ¡Aviso Importante!</h5>
            Estos datos son importantes ya que al momento de registrar estos se mostrara en el reporte para enviar a <b>SUNEDU</b> a si que debe llenar con mucho cuidado los campos que son requeridos.
          </div>
        <div class="row">
            <div class="col-2 form-group">
                <label for="" style="font-size:small;">Expediente<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_expediente_editar" readonly>
                <input type="text" class="form-control" id="txt_moda" hidden>
            </div>
            <div class="col-5 form-group">
                <label for="" style="font-size:small;">Dni y Estudiante<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_estudiante_editar" readonly>
            </div>
            <div class="col-5 form-group">
                <label for="" style="font-size:small;">Facultad y Escuela<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_escuela_editar" readonly>
            </div>

            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                <select name="" id="txt_modo_ob_editar" class="form-control">
                  <option value="TESIS">TESIS</option>
                    <option value="TRABAJO DE SUFICIENCIA PROFESIONAL">TRABAJO DE SUFICIENCIA PROFESIONAL</option>
                    <option value="EXAMEN DE TITULACIÓN">EXAMEN DE TITULACIÓN</option>
                </select>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_modo_estu_editar" value="PRESENCIAL">                           
            </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Trabajo de Investigación<b style="color:red">(SOLO TESIS)</b>:</label>
                <textarea  class="form-control" id="txt_trabajo_inve_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Turnitin<b style="color:red">(SOLO TESIS)</b>:</label>
                <input type="text" class="form-control" id="txt_turni_editar">                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Porcentaje<b style="color:red">(SOLO TESIS)</b>:</label>
                <input type="text" class="form-control" id="txt_porce_editar" >                           
            </div>
            <div class="col-6 form-group">
                <label for="" style="font-size:small;">Centro de Investigación<b style="color:red">(*)</b>:</label>
                <textarea class="form-control" id="txt_centro_inve_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                <textarea class="form-control" id="txt_metadata_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia de Bachiller (Opcional):</label>
                <textarea class="form-control" id="txt_proceden_bachi_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia de Institución Origen (Opcional):</label>
                <textarea class="form-control" id="txt_procedeni_insti_ori_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Procedencia Titulo Pedagógico (Opcional):</label>
                <textarea class="form-control" id="txt_proceden_titu_ori_editar"  rows="2" style="resize:none"></textarea>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de matricula de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_matri_editar">                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de Inicio de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_inicio_editar">                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha Fin de modalidad (Opcional):</label>
                <input type="date" class="form-control" id="txt_fecha_fin_editar">                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Modo de sustentación<b style="color:red">(*)</b>:</label>
                <select class="form-control" id="select_modo_sustenta_editar" style="width:100%">
                    <option value="PRESENCIAL">PRESENCIAL</option>
                    <option value="VIRTUAL">VIRTUAL</option>
                </select>                            
            </div><br>
            
        </div>
       </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
        <button onclick="Modificar_Modalidad();" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-save"></i> Registrar</button>
      </div>
    </div>
  </div>
</div>


<script>

$(document).ready(function () {
  listar_modalidad_titulo();

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