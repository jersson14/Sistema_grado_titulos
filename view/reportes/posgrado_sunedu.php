
<script src="../js/console_reporte_posgrado_sunedu.js?rev=<?php echo time();?>"></script>
<link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>REPORTE GENERAL DE POSGRADOS</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">POSGRADOS</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Posgrados</b></h3>

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
                    <button onclick="listar_fechas_busqueda()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar Documentos</button>
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
                  <table id="tabla_registro_general_posgrado" class="table table-striped table-bordered" style="width:100%">
                    <thead style="background-color:#0A5D86;color:#FFFFFF;">
                        <tr>
                            <th style="text-align:center">N°</th>
                            <th style="text-align:center">Tipo Documento</th>
                            <th style="text-align:center">N° Documento</th>                            
                            <th style="text-align:center">Estudiante</th>
                            <th style="text-align:center">Grado</th>
                            <th style="text-align:center">Programa</th>
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
                            
                            <th style="display:none;text-align:center" >VAR_ETNICA</th>
                            <th style="display:none;text-align:center" >DET_ETNICO</th>
                            <th style="display:none;text-align:center" >LENGUA_IND</th>
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




<div class="modal fade" id="modal_mas" role="dialog" aria-labelledby="exampleModalLabel" aria-="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h5 class="modal-title" id="lb_titulo_datos"><b>Datos del Titulado</b></h5>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-12">
          <div class="card card-primary card-tabs">
            <div class="card-header p-0 pt-1">
              <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="custom-tabs-one-home-tab3" data-toggle="pill" href="#custom-tabs-one-home3" role="tab" aria-controls="custom-tabs-one-home3" aria-selected="true">Datos del Estudiante</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="custom-tabs-one-profile-tab3" data-toggle="pill" href="#custom-tabs-one-profile3" role="tab" aria-controls="custom-tabs-one-profile3" aria-selected="false">Datos del Expediente</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" id="custom-tabs-one-profile-tab4" data-toggle="pill" href="#custom-tabs-one-profile4" role="tab" aria-controls="custom-tabs-one-profile4" aria-selected="false">Datos de la Modalidad</a>
                </li>
                
              </ul>
              </div>
            <div class="card-body">
              <div class="tab-content" id="custom-tabs-one-tabContent3">
                <div class="tab-pane fade show active" id="custom-tabs-one-home3" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab3">
                  <div class="row">
                    <div class="col-12">
                        <div class="row">
                       
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">DNI<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_dni_mas" readonly>
                        </div>

                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Nombres<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_nom_mas" readonly>
                        </div>
                        <div class="col-2 form-group">
                            <label for="" style="font-size:small;">Apellido Paterno<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_apepa_mas" readonly>
                        </div>
                        <div class="col-2 form-group">
                            <label for="" style="font-size:small;">Apellido Materno<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_apema_mas" readonly>
                        </div>
                        <div class="col-2 form-group">
                            <label for="" style="font-size:small;">Código<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_codigo_mas" maxlenght="14" readonly>
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Sexo<b style="color:red">(*)</b>:</label>
                            <select class="form-control" id="select_sexo_mas" style="width:100%" readonly>
                                <option value="F">FEMENINO</option>
                                <option value="M">MASCULINO</option>
                            </select>          
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Celular<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_movil_mas"  maxlenght="9" readonly>
                        </div>
                        <div class="col-6 form-group">
                            <label for="" style="font-size:small;">Dirección<b style="color:red">(*)</b>:</label >
                            <input type="text" class="form-control" id="txt_dire_mas" readonly>
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Email personal (Opcional):</label>
                            <input type="email" class="form-control" id="txt_email_per_mas" readonly>
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Email institucional (Opcional):</label>
                            <input type="email" class="form-control" id="txt_email_insti_mas" readonly>
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Fecha de matricula<b style="color:red">(*)</b>:</label>
                            <input type="date" class="form-control" id="txt_fecha_matri_mas" readonly>
                        </div>
                        <div class="col-3 form-group">
                            <label for="" style="font-size:small;">Fecha de egreso<b style="color:red">(*)</b>:</label>
                            <input type="date" class="form-control" id="txt_fecha_egres_mas" readonly>
                        </div>
                        <div class="col-12 form-group">
                            <label for="" style="font-size:small;">Observaciones (Opcional):</label>
                            <textarea class="form-control" id="txt_oberva_mas"  rows="2" style="resize:none" readonly></textarea>
                        </div>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="custom-tabs-one-profile3" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab3">
                    <div class="row">
                    
                            <div class="col-2 form-group">
                                <label for="" style="font-size:small;">Cede<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_cede_mas" readonly>
                            </div>
                          
                            <div class="col-5 form-group">
                                <label for="" style="font-size:small;">Programa<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="select_programa_mas" readonly>
                            </div>
                            <div class="col-5 form-group">
                                <label for="" style="font-size:small;">Denominación<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_denominacion_mas" readonly>

                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                                <select name="" id="txt_modalidad_mas" class="form-control" readonly>
                                    <option value="TESIS">TESIS</option>
                                    <option value="SUFICIENCIA PROFESIONAL">SUFICIENCIA PROFESIONAL</option>
                                    <option value="ACTUALIZACIÓN PROFESIONAL">ACTUALIZACIÓN PROFESIONAL</option>
                                </select>                           
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Rector<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_rector_mas" readonly>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Secretario General<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_secretario_mas" readonly>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Decano<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_decano_mas" readonly>
                            </div>
                                                       
                            <div class="col-12 form-group" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                <label for="" style="color:red">*Estos campos deben ser llenados si el expediente hace referencia a la versión anterior o es de fecha pasada.</label>
                                <div class="row">
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Fecha de registro:</label>
                                        <input type="date" class="form-control" id="txt_fecha_reg_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Acto académico: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_academi_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Acuerdo: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_acuerdo_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Resolución Rectoral N°: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_Resolucion_mas" readonly>
                                    </div>
                                    
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Expedición: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_expedicion_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Libro: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_libro_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Folio: (Opcional)</label>
                                        <input type="text" class="form-control" id="txt_folio_mas" readonly>
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size: small;">Registro (Opcional):</label>
                                        <input type="text" class="form-control" id="txt_registro_mas" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="tab-pane fade" id="custom-tabs-one-profile4" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab4">
                  <div class="row">
                    <div class="col-12">
                        <div class="row">
                                                  
                            <div class="col-2 form-group">
                                <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                                <input type="text" class="form-control" id="txt_modo_estu_mas" readonly>                           
                            </div>
                            
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Trabajo de Investigación<b style="color:red">(SOLO TESIS)</b>:</label>
                                <textarea  class="form-control" id="txt_trabajo_inve_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                                <textarea class="form-control" id="txt_metadata_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                           
                            <div class="col-2 form-group">
                                <label for="" style="font-size:small;">Turnitin<b style="color:red">(SOLO TESIS)</b>:</label>
                                <input type="text" class="form-control" id="txt_turni_mas" readonly>                           
                            </div>
                            <div class="col-2 form-group">
                                <label for="" style="font-size:small;">Porcentaje<b style="color:red">(SOLO TESIS)</b>:</label>
                                <input type="text" class="form-control" id="txt_porce_mas" readonly>                           
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Centro de Investigación<b style="color:red">(*)</b>:</label>
                                <textarea class="form-control" id="txt_centro_inve_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                           
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Procedencia de País Extran. (Opcional):</label>
                                <textarea class="form-control" id="txt_proceden_pais_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Procedencia de Unive. Extran. (Opcional):</label>
                                <textarea class="form-control" id="txt_procedeni_univer_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Procedencia de Grado Extran. (Opcional):</label>
                                <textarea class="form-control" id="txt_proceden_grado_mas"  rows="2" style="resize:none" readonly></textarea>
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Fecha de matri. de modalidad (Opcional):</label>
                                <input type="date" class="form-control" id="txt_fecha_matri_mod_mas" readonly>                           
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Fecha de Inicio de modalidad (Opcional):</label>
                                <input type="date" class="form-control" id="txt_fecha_inicio_mod_mas" readonly>                           
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Fecha Fin de modalidad (Opcional):</label>
                                <input type="date" class="form-control" id="txt_fecha_fin_mas" readonly>                           
                            </div>
                            <div class="col-3 form-group">
                                <label for="" style="font-size:small;">Modo de sustentación<b style="color:red">(*)</b>:</label>
                                <select class="form-control" id="select_modo_sustenta_mas" style="width:100%" readonly>
                                    <option value="PRESENCIAL">PRESENCIAL</option>
                                    <option value="VIRTUAL">VIRTUAL</option>
                                </select>                            
                            </div>
                            <div class="col-12 form-group" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                <li for="" style="color:white;background-color:black;text-align:center;font-family:Arial">    <b>DATOS DEL DIPLOMA</b>
                                </li><br>
                                <div class="row">
                                    <div class="col-2 form-group">
                                        <label for="" style="font-size:small;">Fecha de C.U.:<b style="color:red">(*)</b>:</label>
                                        <input type="date" class="form-control" id="txt_fecha_cu_mas" readonly>                                                      
                                    </div>
                                    <div class="col-2 form-group">
                                        <label for="" style="font-size:small;">Fecha de Firma<b style="color:red">(*)</b>:</label>
                                        <input type="date" class="form-control" id="txt_fecha_firma_mas" readonly>                           
                                    </div>                
                                    <div class="col-4 form-group">
                                        <label for="" style="font-size:small;">Resolucíon N°<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_resol_num" readonly>                                                     
                                    </div>
                                    <div class="col-2 form-group">
                                        <label for="" style="font-size:small;">Fecha de Resolución<b style="color:red">(*)</b>:</label>
                                        <input type="date" class="form-control" id="txt_fecha_reso_mas" readonly>                           
                                    </div>
                                    <div class="col-2 form-group">
                                        <label for="" style="font-size:small;">Diploma N°<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_diploma_nume_mas" readonly>                           
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Registro N°<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_registro_n°_mas" readonly>                           
                                    </div>
                                    
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Registro Libro<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_registro_libr_mas" readonly>                           
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Registro Folio<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_registro_folio_mas" readonly>                           
                                    </div>

                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Tipo de diploma<b style="color:red">(*)</b>:</label>
                                        <select class="form-control" id="select_tipo_diplo_mas" style="width:100%" readonly>
                                            <option value="O">ORIGINAL</option>
                                            <option value="C">COPIA</option>
                                        </select>                            
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Fecha inicio trámite<b style="color:red">(*)</b>:</label>
                                        <input type="date" class="form-control" id="txt_fecha_inicio_tra_mas" readonly>                           
                                    </div>
                                    <div class="col-3 form-group">
                                    <label for="" style="font-size:small;">Número de creditos<b style="color:red">(*)</b>:</label>
                                    <input type="number" class="form-control" id="txt_nro_credi_mas" readonly>                           
                                    </div>
                                    <div class="col-3 form-group">
                                    <label for="" style="font-size:small;">Nro. Oficio<b style="color:red">(*)</b>:</label>
                                        <input type="text" class="form-control" id="txt_nro_oficio_mas" readonly>                           
                                    </div>
                                    <div class="col-3 form-group">
                                        <label for="" style="font-size:small;">Fecha de Secretaria General<b style="color:red">(*)</b>:</label>
                                        <input type="date" class="form-control" id="txt_fecha_secre_mas" readonly>                           
                                    </div>
                            </div>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>

      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modal_informe" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>IMPRIMIR INFORME</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-12 form-group" style="color:red">
                <h7><b>OJO: Estos datos son importantes a la hora de imprimir el informe.</b></h7>
            </div>
         <div class="col-6 form-group">
            <label for="">Info. N°:</label>
            <input type="text" class="form-control" id="txt_id_num" >
            <input type="text" class="form-control" id="txt_info">
          </div>
          <div class="col-6 form-group">
            <label for="">Grado académico<b style="color:red">(*)</b>:</label>
            <input type="text" class="form-control" id="txt_gr">
          </div>
          
          
          <div class="col-12 form-group">
            <label for="">Fecha desde<b style="color:red">(*)</b>:</label>
            <input type="date" class="form-control" id="fechadesde">
       
          </div>
          <div class="col-12 form-group">
          <label for="">Fecha hasta<b style="color:red">(*)</b>:</label>
          <input type="date" class="form-control" id="fechahasta">
      
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-primary" onclick="Imprimir_informe()"><i class="fas fa-print"></i> Imprimir informe</button>


      </div>
    </div>
  </div>
</div>

<script>

$(document).ready(function () {
    listar_fechas_busqueda();
    $('.js-example-basic-single').select2();
    Cargar_Select_Colacion_Repo_Pos();
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


