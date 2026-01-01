
<script src="../js/console_reporte_pregrado_sunedu.js?rev=<?php echo time();?>"></script>
<link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>REPORTE GENERAL DE PREGRADO</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">PREGRADO</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Pregrado</b></h3>

              </div>
                <div class="table-responsive" style="text-align:left">
                  <div class="card-body">
                  <div class="row" style="border: 1px solid #ccc; padding: 15px; border-radius: 8px;">
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
                    <button onclick="listar_expedientes_pregrado_fecha()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Documentos</button>
                </div>
                </div>
                </div>
                <div class="table-responsive" style="text-align:left">
                    <div class="card-body" >
                        <div class="row" style="border: 1px solid #ccc; padding: 15px; border-radius: 8px;">
                        <div class="col-12 col-md-3" role="document" >
                            <div class="form-group">
                            <label for="txtfechainicio">Fecha de colación:</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                </div>
                                <select class="js-example-basic-single" id="select_fechacola" style="width:100%"></select>
                                <div class="valid-input invalid-feedback"></div>
                            </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3" role="document">
                            <label for="">&nbsp;</label><br>
                            <button onclick="listar_colacion()" class="btn btn-danger mr-2" style="width:100%"><i class="fas fa-search mr-1"></i>Buscar por colación</button>
                        </div>
                        </div>
                    </div>
                    </div>
                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                  <table id="tabla_registro_general_pregrado" class="table table-striped table-bordered" style="width:100%">
                    <thead style="background-color:#0A5D86;color:#FFFFFF;">
                        <tr>
                            <th style="text-align:center">N°</th>
                            <th style="text-align:center">Tipo Documento</th>
                            <th style="text-align:center">N° Documento</th>                            
                            <th style="text-align:center">Estudiante</th>
                            <th style="text-align:center">Grado</th>
                            <th style="text-align:center">Facultad</th>
                            <th style="text-align:center">Escuela</th>
                            <th style="text-align:center">Estado</th>
                            <th style="text-align:center">Trabajo de Investigación</th>
                            <th style="text-align:center">Expediente</th>
                            <th style="text-align:center">Acción</th>
                     <!-- Columnas ocultas -->
                            <th style="display:none;text-align:center" >COD_UNIV</th>
                            <th style="display:none;text-align:center" >RAZ_SOC</th>
                            <th style="display:none;text-align:center" >FAC_NOM</th>
                            <th style="display:none;text-align:center" >ESC_POS</th>
                            <th style="display:none;text-align:center" >PRIM_APE</th>
                            <th style="display:none;text-align:center" >SEG_APE</th>
                            <th style="display:none;text-align:center" >NOMBRE</th>
                            <th style="display:none;text-align:center" >SEXO</th>
                            <th style="display:none;text-align:center" >DOCU_TIP</th>
                            <th style="display:none;text-align:center" >DOCU_NUM</th>
                            <th style="display:none;text-align:center" >MATRI_FEC</th>
                            <th style="display:none;text-align:center" >EGRES_FEC</th>
                            <th style="display:none;text-align:center" >ABRE_GYT</th>
                            <th style="display:none;text-align:center" >CARR_PROG</th>
                            <th style="display:none;text-align:center" >DEN_GRAD</th>

                            <th style="display:none;text-align:center" >SEG_ESP</th>
                            <th style="display:none;text-align:center" >PROC_BACH</th>
                            <th style="display:none;text-align:center" >PROC_INST_ORIG</th>
                            <th style="display:none;text-align:center" >PROC_TITULO_PED</th>

                            <th style="display:none;text-align:center" >PROG_ESTUs</th>
                            <th style="display:none;text-align:center" >NUM_CRED</th>
                            <th style="display:none;text-align:center" >MOD_OBT</th>
                            <th style="display:none;text-align:center" >MOD_EST</th>
                            <th style="display:none;text-align:center" >REG_METADATO</th>
                            <th style="display:none;text-align:center" >TRAB_INV</th>

                            <th style="display:none;text-align:center" >REQ_IDM</th>
                            <th style="display:none;text-align:center" >PROG_ACREDIT</th>
                            <th style="display:none;text-align:center" >FEC_INICIO_ACREDIT</th>
                            <th style="display:none;text-align:center" >FEC_FIN_ACREDIT</th>


                            <th style="display:none;text-align:center" >FEC_INI_TRA_TIT</th>
                            <th style="display:none;text-align:center" >TRAB_INVEST_ORIGINAL</th>
                            <th style="display:none;text-align:center" >MEC_UTI</th>
                            <th style="display:none;text-align:center" >DEP_VER_ORIG</th>

                            <th style="display:none;text-align:center" >PROC_REV_PAIS</th>
                            <th style="display:none;text-align:center" >PROC_REV_UNIV</th>
                            <th style="display:none;text-align:center" >PROC_REV_GRADO</th>
                            <th style="display:none;text-align:center" >CRIT_REV</th>


                            <th style="display:none;text-align:center" >RESO_NUM</th>
                            <th style="display:none;text-align:center" >RESO_FEC</th>

                            <th style="display:none;text-align:center" >RESO_NUM_DUP_NUE</th>
                            <th style="display:none;text-align:center" >RESO_FEC_DUP_NUE</th>

                            <th style="display:none;text-align:center" >DIPL_FEC_ORG</th>

                            <th style="display:none;text-align:center" >DIPL_FEC_DUP_NUE</th>


                            <th style="display:none;text-align:center" >DIPL_NUM</th>
                            <th style="display:none;text-align:center" >DIPL_TIP_EMI</th>
                            <th style="display:none;text-align:center" >REG_LIBRO</th>
                            <th style="display:none;text-align:center" >REG_FOLIO</th>
                            <th style="display:none;text-align:center" >REG_REGISTRO</th>
                            <th style="display:none;text-align:center" >CARGO1</th>
                            <th style="display:none;text-align:center" >AUTORIDAD1</th>
                            <th style="display:none;text-align:center" >CARGO2</th>
                            <th style="display:none;text-align:center" >AUTORIDAD2</th>
                            <th style="display:none;text-align:center" >CARGO3</th>
                            <th style="display:none;text-align:center" >AUTORIDAD3</th>
                            <th style="display:none;text-align:center" >PROC_PAIS_EXT</th>
                            <th style="display:none;text-align:center" >PROC_UNIV_EXT</th>
                            <th style="display:none;text-align:center" >PROC_GRADO_EXT</th>
                            <th style="display:none;text-align:center" >REG_OFICIO</th>
                            <th style="display:none;text-align:center" >FEC_MAT_MOD</th>
                            <th style="display:none;text-align:center" >FEC_INICIO_MOD</th>
                            <th style="display:none;text-align:center" >FEC_FIN_MOD</th>
                            <th style="display:none;text-align:center" >MOD_SUSTENTACIÓN</th>

                            <th style="display:none;text-align:center" >DET_ETNICA</th>
                            <th style="display:none;text-align:center" >LENGUA_IND</th>
                            <th style="display:none;text-align:center" >DET_LENGUA</th>
                            <th style="display:none;text-align:center" >DET_LENGUA</th>

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






<script>

$(document).ready(function () {
  listar_expedientes_pregrado_fecha();
  $('.js-example-basic-single').select2();

  Cargar_Select_Colacion();



});



var n = new Date();
var y = n.getFullYear();
var m = n.getMonth() + 1;

// Formatear el mes con un cero inicial si es necesario
if (m < 10) {
    m = '0' + m;
}

// Establecer el primer día del mes
var firstDay = y + "-" + m + "-01";

// Calcular el último día del mes actual
var lastDay = new Date(y, n.getMonth() + 1, 0).getDate();

// Formatear el último día del mes con un cero inicial si es necesario
if (lastDay < 10) {
    lastDay = '0' + lastDay;
}

var lastDayFormatted = y + "-" + m + "-" + lastDay;

document.getElementById('txtfechainicio').value = firstDay;
document.getElementById('txtfechafin').value = lastDayFormatted;






</script>


