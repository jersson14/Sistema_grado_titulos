<script async defer src="https://apis.google.com/js/api.js" onload="gapiLoaded()"></script>
<script async defer src="https://accounts.google.com/gsi/client" onload="gisLoaded()"></script>
<script src="../js/console_registro_general_titulo.js?rev=<?php echo time(); ?>"></script>

<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0"><b>REGISTRO GENERAL DE TÍTULOS</b></h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
                    <li class="breadcrumb-item active">TÍTULOS</li>
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
                        <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Títulos</b></h3>

                        <div class="d-flex justify-content-end">
                            <button class="btn btn-success mr-2" onclick="AbrirModal()"><i class="fas fa-plus"></i> Nuevo Registro</button>
                            <button class="btn btn-primary mr-2" onclick="imprimir_info()"><i class="fas fa-print"></i> Imprimir Informe</button>

                        </div>



                    </div>
                    <div class="table-responsive" style="text-align:left">
                        <div class="card-body">
                            <div class="row" style="border: 1px solid #ccc; padding: 15px; border-radius: 8px;">
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
                                    <button onclick="listar_fechas_busqueda()" class="btn btn-danger mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar expedientes</button>

                                </div>
                                <div class="col-12 col-md-3" role="document">
                                    <label for="">&nbsp;</label><br>
                                    <button onclick="listar_expedientes_titulado()" class="btn btn-success mr-2" style="width:100%" onclick><i class="fas fa-search mr-1"></i>Buscar todos</button>

                                </div>
                            </div>
                        </div>
                        <div class="table-responsive" style="text-align:left">
                            <div class="card-body">
                                <div class="row" style="border: 1px solid #ccc; padding: 15px; border-radius: 8px;">
                                    <div class="col-12 col-md-3">
                                        <div class="form-group">
                                            <label for="txtfechainicio">Fecha de colación:</label>
                                            <div class="input-group mb-2">
                                                <select class="js-example-basic-single" id="select_fechacola" style="width:100%"></select>
                                                <div class="valid-input invalid-feedback"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-3">
                                        <label for="">&nbsp;</label><br>
                                        <button onclick="listar_colacion()" class="btn btn-danger mr-2" style="width:100%">
                                            <i class="fas fa-search mr-1"></i>Buscar por colación
                                        </button>
                                    </div>

                                    <!-- BOTÓN NUEVO DIFERENTE Y A LA DERECHA -->
                                    <div class="col-12 col-md-3 ml-auto text-right">
                                        <label for="">&nbsp;</label><br>
                                        <button onclick="Imprimir_varios()" class="btn btn-outline-primary" style="width:100%; font-weight:bold;">
                                            <i class="fas fa-print mr-1"></i>Imprimir grupo de diplomas
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="text" id="dni" autocomplete="off" name="dni" hidden>
                        <div class="table-responsive" style="text-align:center">
                            <div class="card-body">
                                <table id="tabla_registro_general" class="table table-striped table-bordered" style="width:100%">
                                    <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                                        <tr>
                                            <th style="text-align:center">N° Diploma</th>
                                            <th style="text-align:center">N° Informe</th>
                                            <th style="text-align:center">Tipo Documento</th>
                                            <th style="text-align:center">Documento</th>
                                            <th style="text-align:center">Estudiante</th>
                                            <th style="text-align:center">Facultad</th>
                                            <th style="text-align:center">Programa</th>
                                            <th style="text-align:center">Modalidad</th>
                                            <th style="text-align:center">Fecha de Registro</th>
                                            <th style="text-align:center">Sede</th>
                                            <th style="text-align:center">Validar Sede</th>
                                            <th style="text-align:center">Fecha de validación</th>
                                            <th style="text-align:center">Estado</th>
                                            <th style="text-align:center">Trabajo de Investigación</th>
                                            <th style="text-align:center">Expediente</th>
                                            <th style="text-align:center">Acci&oacute;n</th>
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


<!-- /MODAL EDITAR -->
<div class="modal fade" id="modal_registro" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">Datos del Estudiante</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">Datos del Expediente</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-profile2-tab" data-toggle="pill" href="#custom-tabs-one-profile2" role="tab" aria-controls="custom-tabs-one-profile2" aria-selected="false">Datos de la Modalidad</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="alert alert-warning alert-dismissible" style="text-align:justify">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <h5><i class="icon fas fa-exclamation-triangle"></i> ¡Aviso Importante!</h5>
                                    <b>NOTA:</b> El sistema ahora cuenta con envío de correos asi que el campo <b>Email personal (*):</b> es importante ingresar el correo del estudiante ya que le llegara un correo del estado en el que se encuentra su expediente, sin este dato no se podrá registrar.
                                </div>
                                <div class="tab-content" id="custom-tabs-one-tabContent">
                                    <div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-12 form-group" style="color:red">
                                                        <h6><b>Campos Obligatorios (*)</b></h6>
                                                    </div><br>
                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Tipo de documento<b style="color:red">(*)</b>:</label>
                                                        <select class="form-control" id="select_tipo_documento" style="width:100%">
                                                            <option value="" disabled>Seleccione</option>
                                                            <option value="DNI" selected>DNI</option>
                                                            <option value="CARNET DE EXTRANJERIA">CARNET DE EXTRANJERIA</option>
                                                            <option value="PASAPORTE">PASAPORTE</option>
                                                        </select>
                                                    </div>

                                                    <div id="dni_section" class="col-5 form-group">
                                                        <label for="" style="font-size:small;">N° Documento<b style="color:red">(*)</b>:</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="txt_dni">
                                                            <div class="input-group-append">
                                                                <button onclick="" class="btn btn-success" id="umil"><i class="fa fa-search"></i><b> UMIL</b></button>
                                                                <button onclick="" class="btn btn-primary" id="prueba"><i class="fa fa-search"></i><b> Reniec</b></button>
                                                                <button onclick="buscarBachiller()" class="btn btn-warning" id="bach"><i class="fa fa-search"></i><b> Bach</b></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="otros_documentos_section" class="col-5 form-group" style="display: none;">
                                                        <label for="" style="font-size:small;">N° Documento<b style="color:red">(*)</b>:</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="txt_dni2">
                                                            <div class="input-group-append">
                                                                <button onclick="" class="btn btn-success" id="umil2"><i class="fa fa-search"></i><b> UMIL</b></button>
                                                                <button onclick="buscarBachiller()" class="btn btn-warning" id="bach"><i class="fa fa-search"></i><b> Bach</b></button>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-5 form-group">
                                                        <label for="" style="font-size:small;">Nombres<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_nom">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Paterno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apepa">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Materno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apema">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Código<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_codigo" maxlenght="14" required>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Sexo<b style="color:red">(*)</b>:</label>
                                                        <select class="form-control" id="select_sexo" style="width:100%">
                                                            <option value="" disabled selected>Seleccione</option>
                                                            <option value="F">FEMENINO</option>
                                                            <option value="M">MASCULINO</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Celular<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_movil" onkeypress="return soloNumeros(event)" maxlenght="9" required>
                                                    </div>
                                                    <div class="col-6 form-group">
                                                        <label for="" style="font-size:small;">Dirección<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_dire" required>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Email personal <b style="color:red">(*)</b>:</label>
                                                        <input type="email" class="form-control" id="txt_email_per">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Email institucional (Opcional):</label>
                                                        <input type="email" class="form-control" id="txt_email_insti">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de matricula<b style="color:red">(*)</b>:</label>
                                                        <input type="date" class="form-control" id="txt_fecha_matri">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de egreso<b style="color:red">(*)</b>:</label>
                                                        <input type="date" class="form-control" id="txt_fecha_egres">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Observaciones (Opcional):</label>
                                                        <textarea class="form-control" id="txt_oberva" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                                        <div class="row">
                                            <div class="col-12 form-group" style="color:red">
                                                <h7><b>Campos Obligatorios (*)</b></h7>
                                            </div>
                                            <div class="col-2 form-group">
                                                <label for="" style="font-size:small;">Cede<b style="color:red">(*)</b>:</label>
                                                <select class="form-control" id="select_cede" style="width:100%"></select>
                                            </div>

                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Facultad<b style="color:red">(*)</b>:</label>
                                                <select class="form-control" id="select_facultad" style="width:100%"></select>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Programa<b style="color:red">(*)</b>:</label>
                                                <select class="form-control" id="select_escuela" style="width:100%"></select>
                                            </div>
                                            <div class="col-4 form-group">
                                                <label for="" style="font-size:small;">Titulo de<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_titulo">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                                                <select name="" id="txt_modalidad" class="form-control">
                                                    <option value="" selected>Seleccione</option>
                                                    <option value="TESIS">TESIS</option>
                                                    <option value="TRABAJO DE SUFICIENCIA PROFESIONAL">TRABAJO DE SUFICIENCIA PROFESIONAL</option>
                                                    <option value="EXAMEN DE TITULACIÓN">EXAMEN DE TITULACIÓN</option>
                                                </select>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Rector<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="id_autoridad" hidden>
                                                <input type="text" class="form-control" id="txt_rector">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Secretario General<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_secretario">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Decano<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_decano">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Autoidentificación étnica (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_auto_etnica">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Pueblo indígena u originario (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_pueblo_indigena">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena u originaria (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_indigena">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena (detalle)(Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_detalle">
                                            </div>
                                            <div class="col-12 form-group">
                                                <label for="" style="font-size:small;">Adjuntar Expediente<b style="color:red">(*)</b>:</label>
                                                <input class="form-control" type="file" id="txt_archivo"><br>
                                                <label for="" style="font-size:16px;color:red">*El documento debe estar en formato PDF y con un tamaño máximo de 30 MB.</label>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group clearfix">
                                                    <div class="icheck-success d-inline">
                                                        <input type="checkbox" id="checkboxSuccess3" onclick="Validar_Informacion2()">
                                                        <label for="checkboxSuccess3" style="align:justify">
                                                            Si el expediente que esta registrando es de fecha anterior de click encima para habilitar campos.
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 form-group hiddenantiguo" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                                <label for="" style="color:red">*Estos campos deben ser llenados si el expediente hace referencia a la versión anterior o es de fecha pasada.</label>
                                                <div class="row">
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Fecha de registro:</label>
                                                        <input type="datetime-local" class="form-control" id="txt_fecha_reg">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Acto académico: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_academi">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Acuerdo: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_acuerdo">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Resolución Rectoral N°: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_Resolucion">
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Expedición: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_expedicion">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Libro: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_libro">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Folio: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_folio">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Registro (Opcional):</label>
                                                        <input type="text" class="form-control" id="txt_registro">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-profile2" role="tabpanel" aria-labelledby="custom-tabs-one-profile2-tab">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-12 form-group" style="color:red">
                                                        <h7><b>Campos Obligatorios (*)</b></h7>
                                                    </div>

                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_modo_estu" value="PRESENCIAL">
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Trabajo de Investigación<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <textarea class="form-control" id="txt_trabajo_inve" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <textarea class="form-control" id="txt_metadata" rows="2" style="resize:none"></textarea>
                                                    </div>

                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Turnitin<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_turni" value="SI (TURNITIN)">
                                                    </div>
                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Porcentaje<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_porce">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Centro de Investigación<b style="color:red">(*)</b>:</label>
                                                        <textarea class="form-control" id="txt_centro_inve" rows="2" style="resize:none"></textarea>
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Bachiller (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_bachi" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Insti. Origen (Opcional):</label>
                                                        <textarea class="form-control" id="txt_procedeni_insti_ori" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia Titulo Pedagógico (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_titu_ori" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de matri. de modalidad (Opcional):</label>
                                                        <input type="date" class="form-control" id="txt_fecha_matri_mod">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de Inicio de modalidad (Opcional):</label>
                                                        <input type="date" class="form-control" id="txt_fecha_inicio_mod">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha Fin de modalidad (Opcional):</label>
                                                        <input type="date" class="form-control" id="txt_fecha_fin">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Modo de sustentación<b style="color:red">(*)</b>:</label>
                                                        <select class="form-control" id="select_modo_sustenta" style="width:100%">
                                                            <option value="PRESENCIAL">PRESENCIAL</option>
                                                            <option value="VIRTUAL">VIRTUAL</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group clearfix">
                                                            <div class="icheck-success d-inline">
                                                                <input type="checkbox" id="checkboxSuccess1" onclick="Validar_Informacion()">
                                                                <label for="checkboxSuccess1" style="align:justify">
                                                                    Declaro que datos registrados y los documentos adjuntados son fidedignos y verídicos.
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12" style="text-align:center">
                                                        <label for="checkboxSuccess" style="align:justify;color:red">
                                                            ***Por favor, antes de registrar la información revise nuevamente todo los campos llenados para asegurarse de que no haya errores.***
                                                        </label>
                                                    </div>
                                                    <div class="col-12" style="text-align:center">
                                                        <button class="btn btn-success btn-lg" onclick="Registrar_Titulado()" id="btn_registro"><i class="fas fa-save"></i><b> REGISTRAR TITULADO</b></button>
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
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-right-from-bracket"></i>Cerrar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_editar" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="lb_titulo_datos"><b>Editar Datos del Titulado</b></h5>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary card-tabs">
                            <div class="card-header p-0 pt-1">
                                <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="custom-tabs-one-home-tab5" data-toggle="pill" href="#custom-tabs-one-home5" role="tab" aria-controls="custom-tabs-one-home5" aria-selected="true">Datos del Estudiante</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-profile-tab5" data-toggle="pill" href="#custom-tabs-one-profile5" role="tab" aria-controls="custom-tabs-one-profile5" aria-selected="false">Datos del Expediente</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="custom-tabs-one-profile-tab6" data-toggle="pill" href="#custom-tabs-one-profile6" role="tab" aria-controls="custom-tabs-one-profile6" aria-selected="false">Datos de la Modalidad</a>
                                    </li>

                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="custom-tabs-one-tabContent3">
                                    <div class="tab-pane fade show active" id="custom-tabs-one-home5" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab5">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-12 form-group" style="color:red">
                                                        <h7><b>Campos Obligatorios (*)</b></h7>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Tipo de Documentos<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_tipo_documento_editar" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">N° Documento<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_dni_editar" readonly>
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Nombres<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_nom_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Paterno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apepa_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Materno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apema_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Código<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_codigo_editar" maxlenght="14">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Sexo<b style="color:red">(*)</b>:</label>
                                                        <select class="form-control" id="select_sexo_editar" style="width:100%">
                                                            <option value="F">FEMENINO</option>
                                                            <option value="M">MASCULINO</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Celular<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_movil_editar" maxlenght="9">
                                                    </div>
                                                    <div class="col-6 form-group">
                                                        <label for="" style="font-size:small;">Dirección<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_dire_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Email personal <b style="color:red">(*)</b>:</label>
                                                        <input type="email" class="form-control" id="txt_email_per_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Email institucional (Opcional):</label>
                                                        <input type="email" class="form-control" id="txt_email_insti_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de matricula<b style="color:red">(*)</b>:</label>
                                                        <input type="date" class="form-control" id="txt_fecha_matri_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de egreso<b style="color:red">(*)</b>:</label>
                                                        <input type="date" class="form-control" id="txt_fecha_egres_editar">
                                                    </div>
                                                    <div class="col-6 form-group">
                                                        <label for="" style="font-size:small;">Observaciones (Opcional):</label>
                                                        <textarea class="form-control" id="txt_oberva_editar" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-profile5" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab5">
                                        <div class="row">
                                            <div class="col-12 form-group" style="color:red">
                                                <h7><b>Campos Obligatorios (*)</b></h7>
                                            </div>
                                            <input type="text" id="txt_id_expediente" hidden>
                                            <div class="col-2 form-group">
                                                <label for="" style="font-size:small;">Cede<b style="color:red">(*)</b>:</label>
                                                <select class="form-control" id="txt_cede_editar" style="width:100%"></select>

                                            </div>
                                            <div class="col-6 form-group">
                                                <label for="" style="font-size:small;">Facultad y Programa<b style="color:red">(*)</b>:</label>
                                                <select class="form-control" id="txt_escuela_editar" style="width:100%"></select>

                                            </div>
                                            <div class="col-4 form-group">
                                                <label for="" style="font-size:small;">Titulo de<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_titulo_editar">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                                                <select name="" id="txt_modalidad_editar" class="form-control">
                                                    <option value="TESIS">TESIS</option>
                                                    <option value="TRABAJO DE SUFICIENCIA PROFESIONAL">TRABAJO DE SUFICIENCIA PROFESIONAL</option>
                                                    <option value="EXAMEN DE TITULACIÓN">EXAMEN DE TITULACIÓN</option>
                                                </select>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Rector<b style="color:red">(*)</b>:</label>
                                                <input type="text" id="id_autoridad_editar" hidden>
                                                <input type="text" class="form-control" id="txt_rector_editar" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Secretario General<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_secretario_editar" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Decano<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_decano_editar" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Autoidentificación étnica (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_auto_etnica_editar">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Pueblo indígena u originario (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_pueblo_indigena_editar">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena u originaria (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_indigena_editar">
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena (detalle)(Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_detalle_editar">
                                            </div>
                                            <div class="col-12 form-group">
                                                <label for="" style="font-size:small;">Adjuntar Expediente<b style="color:red">(*)</b>:</label>
                                                <input class="form-control" type="text" id="txt_archivo_actual" hidden>
                                                <input class="form-control" type="file" id="txt_archivo_editar"><br>
                                                <label for="" style="font-size:16px;color:red">*El documento debe estar en formato PDF y con un tamaño máximo de 30 MB.</label>
                                            </div>
                                            <div class="col-12 form-group" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                                <label for="" style="color:red">*Estos campos deben ser llenados si el expediente hace referencia a la versión anterior o es de fecha pasada.</label>
                                                <div class="row">
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Fecha de registro:</label>
                                                        <input type="datetime-local" class="form-control" id="txt_fecha_reg_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Acto académico: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_academi_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Acuerdo: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_acuerdo_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Resolución Rectoral N°: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_Resolucion_editar">
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Expedición: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_expedicion_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Libro: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_libro_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Folio: (Opcional)</label>
                                                        <input type="text" class="form-control" id="txt_folio_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Registro (Opcional):</label>
                                                        <input type="text" class="form-control" id="txt_registro_editar">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="custom-tabs-one-profile6" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab6">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-12 form-group" style="color:red">
                                                        <h7><b>Campos Obligatorios (*)</b></h7>
                                                    </div>
                                                    <input type="text" id="txt_id_modalidad" hidden>
                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Modo de estudio<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_modo_estu_editar">
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Trabajo de Investigación<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <textarea class="form-control" id="txt_trabajo_inve_editar" rows="2" style="resize:none" disabled></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <textarea class="form-control" id="txt_metadata_editar" rows="2" style="resize:none" disabled></textarea>
                                                    </div>

                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Turnitin<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_turni_editar" disabled>
                                                    </div>
                                                    <div class="col-2 form-group">
                                                        <label for="" style="font-size:small;">Porcentaje<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_porce_editar" disabled>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Centro de Investigación<b style="color:red">(*)</b>:</label>
                                                        <textarea class="form-control" id="txt_centro_inve_editar" rows="2" style="resize:none" disabled></textarea>
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Bachiller (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_bachi_editar" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Insti. Origen (Opcional):</label>
                                                        <textarea class="form-control" id="txt_procedeni_insti_ori_editar" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia Titulo Pedagógico (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_titu_ori_editar" rows="2" style="resize:none"></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de matri. de modalidad (Opcional):</label>
                                                        <input type="date" class="form-control" id="txt_fecha_matri_mod_editar">
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Fecha de Inicio de modalidad (Opcional):</label>
                                                        <input type="date" class="form-control" id="txt_fecha_inicio_mod_editar">
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
                                                    </div>
                                                    <div class="col-12 form-group" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                                        <li for="" style="color:white;background-color:black;text-align:center;font-family:Arial"> <b>DATOS DEL DIPLOMA</b>
                                                        </li><br>
                                                        <div class="row">
                                                            <input type="text" id="txt_id_diploma" hidden>
                                                            <div class="col-2 form-group">
                                                                <label for="" style="font-size:small;">Fecha de C.U.:<b style="color:red">(*)</b>:</label>
                                                                <input type="date" class="form-control" id="txt_fecha_cu_editar">
                                                            </div>
                                                            <div class="col-2 form-group">
                                                                <label for="" style="font-size:small;">Fecha de Firma<b style="color:red">(*)</b>:</label>
                                                                <input type="date" class="form-control" id="txt_fecha_firma_editar">
                                                            </div>
                                                            <div class="col-4 form-group">
                                                                <label for="" style="font-size:small;">Resolucíon N°<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_resol_editar">
                                                            </div>
                                                            <div class="col-2 form-group">
                                                                <label for="" style="font-size:small;">Fecha de Resolución<b style="color:red">(*)</b>:</label>
                                                                <input type="date" class="form-control" id="txt_fecha_reso_editar">
                                                            </div>
                                                            <div class="col-2 form-group">
                                                                <label for="" style="font-size:small;">Diploma N°<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_diploma_nume_editar">
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Registro N°<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_registro_n°_editar">
                                                            </div>

                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Registro Libro<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_registro_libr_editar">
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Registro Folio<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_registro_folio_editar">
                                                            </div>

                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Tipo de diploma<b style="color:red">(*)</b>:</label>
                                                                <select class="form-control" id="select_tipo_diplo_editar" style="width:100%">
                                                                    <option value="O">ORIGINAL</option>
                                                                    <option value="D">DUPLICADO</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Fecha inicio trámite<b style="color:red">(*)</b>:</label>
                                                                <input type="date" class="form-control" id="txt_fecha_inicio_tra_editar">
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Número de creditos<b style="color:red">(*)</b>:</label>
                                                                <input type="number" class="form-control" id="txt_nro_credi_editar">
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Nro. Oficio<b style="color:red">(*)</b>:</label>
                                                                <input type="text" class="form-control" id="txt_nro_oficio_editar">
                                                            </div>
                                                            <div class="col-3 form-group">
                                                                <label for="" style="font-size:small;">Fecha Secretaria General<b style="color:red">(*)</b>:</label>
                                                                <input type="date" class="form-control" id="txt_fecha_secre_editar">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group clearfix">
                                                            <div class="icheck-success d-inline">
                                                                <input type="checkbox" id="checkboxSuccess11" onclick="Validar_Informacion3()">
                                                                <label for="checkboxSuccess11" style="align:justify">
                                                                    Declaro que datos registrados y los documentos adjuntados son fidedignos y verídicos.
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12" style="text-align:center">
                                                        <label for="checkboxSuccess" style="align:justify;color:red">
                                                            ***Por favor, antes de modificar la información revise nuevamente todo los campos llenados para asegurarse de que no haya errores.***
                                                        </label>
                                                    </div>
                                                    <div class="col-12" style="text-align:center">
                                                        <button class="btn btn-success btn-lg" onclick="Modificar_Titulado()" id="btn_editar"><i class="fas fa-edit"></i><b> MODIFICAR TITULADO</b></button>
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
<!-- /MODAL AGREGAR DIPLOMA -->

<div class="modal fade" id="modal_registrar_diploma" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#1FA0E0">
                <div class="col-12 form-group" style="color:white; margin-bottom: 0;">
                    <h5 class="modal-title" id="lb_titulo_datos" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos2" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos3" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos4" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos5" style="color:white; margin-bottom: 0;"></h5>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>Campos Obligatorios (*)</b></h7>
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Fecha de C.U.:<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="id_expe" hidden>
                        <input type="text" class="form-control" id="txt_id_diplo" hidden>
                        <input type="date" class="form-control" id="txt_fecha_cu">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Fecha de Firma<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_firma">
                        <input type="date" class="form-control" id="txt_fecha_cola" hidden>

                        <input type="text" class="form-control" id="txt_correo" hidden>
                        <input type="text" class="form-control" id="nom" hidden>
                        <input type="text" class="form-control" id="ape" hidden>
                        <input type="text" class="form-control" id="mate" hidden>

                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Fecha Secretaria General:<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_secre">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Fecha de Resolu.<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_reso">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Resolucíon N°<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_nume_resol">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Diploma N°<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_diploma_nume">
                    </div>
                    <div class="col-2 form-group">
                        <label for="" style="font-size:small;">Registro N°<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_registro_n°">
                    </div>

                    <div class="col-2 form-group">
                        <label for="" style="font-size:small;">Registro Libro<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_registro_libr">
                    </div>
                    <div class="col-2 form-group">
                        <label for="" style="font-size:small;">Registro Folio<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_registro_folio">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Tipo de diploma<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="select_tipo_diplo" style="width:100%">
                            <option value="O">ORIGINAL</option>
                            <option value="D">DUPLICADO</option>
                        </select>
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Fecha inicio trámite<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_inicio_tra">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Número de creditos<b style="color:red">(*)</b>:</label>
                        <input type="number" class="form-control" id="txt_nro_credi">
                    </div>
                    <div class="col-3 form-group">
                        <label for="" style="font-size:small;">Nro. Oficio<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_nro_oficio">
                    </div>
                    <div class="col-6 form-group">
                        <label for="" style="font-size:small;">Fecha de matricula:<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_matricula">
                    </div>
                    <div class="col-6 form-group">
                        <label for="" style="font-size:small;">Fecha de Egreso<b style="color:red">(*)</b>:</label>
                        <input type="date" class="form-control" id="txt_fecha_egreso">
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-right-from-bracket"></i>Cerrar</button>
                <button type="button" class="btn btn-success" onclick="Agregar_diploma()"><i class="fas fa-check"></i> Guardar</button>

            </div>
        </div>
    </div>
</div>

<!-- /MODAL REGISTRO -->


<div class="modal fade" id="modal_mas" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                        <label for="" style="font-size:small;">Tipo Documento<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_tipo_documento" readonly>
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">N° Documento<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_dni_mas" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Nombres<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_nom_mas" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Paterno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apepa_mas" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Apellido Materno<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_apema_mas" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
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
                                                        <input type="text" class="form-control" id="txt_movil_mas" maxlenght="9" readonly>
                                                    </div>
                                                    <div class="col-6 form-group">
                                                        <label for="" style="font-size:small;">Dirección<b style="color:red">(*)</b>:</label>
                                                        <input type="text" class="form-control" id="txt_dire_mas" readonly>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Email personal <b style="color:red">(*)</b>:</label>
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
                                                    <div class="col-6 form-group">
                                                        <label for="" style="font-size:small;">Observaciones (Opcional):</label>
                                                        <textarea class="form-control" id="txt_oberva_mas" rows="2" style="resize:none" readonly></textarea>
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

                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Facultad<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_facultad_mas" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Programa<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_escuela_mas" readonly>
                                            </div>
                                            <div class="col-4 form-group">
                                                <label for="" style="font-size:small;">Titulo de<b style="color:red">(*)</b>:</label>
                                                <input type="text" class="form-control" id="txt_titulo_mas" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                                                <select name="" id="txt_modalidad_mas" class="form-control" readonly>
                                                    <option value="TESIS">TESIS</option>
                                                    <option value="TRABAJO DE SUFICIENCIA PROFESIONAL">TRABAJO DE SUFICIENCIA PROFESIONAL</option>
                                                    <option value="EXAMEN DE TITULACIÓN">EXAMEN DE TITULACIÓN</option>
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
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Autoidentificación étnica (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_auto_etnica_mas" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Pueblo indígena u originario (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_pueblo_indigena_mas" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena u originaria (Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_indigena_mas" readonly>
                                            </div>
                                            <div class="col-3 form-group">
                                                <label for="" style="font-size:small;">Lengua indígena (detalle)(Opcional):</label>
                                                <input type="text" class="form-control" id="txt_lengua_detalle_mas" readonly>
                                            </div>
                                            <div class="col-12 form-group" style="border: 1px solid #ccc; padding: 10px;" id="datos_antiguos">
                                                <label for="" style="color:red">*Estos campos deben ser llenados si el expediente hace referencia a la versión anterior o es de fecha pasada.</label>
                                                <div class="row">
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size: small;">Fecha de registro:</label>
                                                        <input type="datetime-local" class="form-control" id="txt_fecha_reg_mas" readonly>
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
                                                        <textarea class="form-control" id="txt_trabajo_inve_mas" rows="2" style="resize:none" readonly></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Metadato o Link<b style="color:red">(SOLO TESIS)</b>:</label>
                                                        <textarea class="form-control" id="txt_metadata_mas" rows="2" style="resize:none" readonly></textarea>
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
                                                        <textarea class="form-control" id="txt_centro_inve_mas" rows="2" style="resize:none" readonly></textarea>
                                                    </div>

                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Bachiller (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_bachi_mas" rows="2" style="resize:none" readonly></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia de Insti. Origen (Opcional):</label>
                                                        <textarea class="form-control" id="txt_procedeni_insti_ori_mas" rows="2" style="resize:none" readonly></textarea>
                                                    </div>
                                                    <div class="col-3 form-group">
                                                        <label for="" style="font-size:small;">Procedencia Titulo Pedagógico (Opcional):</label>
                                                        <textarea class="form-control" id="txt_proceden_titu_ori_mas" rows="2" style="resize:none" readonly></textarea>
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
                                                        <li for="" style="color:white;background-color:black;text-align:center;font-family:Arial"> <b>DATOS DEL DIPLOMA</b>
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
                                                                    <option value="D">DUPLICADO</option>
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
<div class="modal fade" id="modal_informe" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <h7><b>OJO: Debe seleccionar el programa o escuela y poner la fecha y hora que desea imprimir.</b></h7>
                    </div>
                    <div class="col-2 form-group">
                        <label for="">Info. N°:</label>
                        <input type="text" class="form-control" id="txt_id_num" hidden>
                        <input type="text" class="form-control" id="txt_info">
                    </div>
                    <div class="col-5 form-group">
                        <label for="">Grado académico<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_gr" value="TITULO">
                    </div>
                    <div class="col-5 form-group">
                        <label for="">Facultad<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="txtfacu" style="width:100%">
                        </select>
                    </div>
                    <div class="col-12 form-group">
                        <label for="">Programa<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="txtes" style="width:100%">
                        </select>
                    </div>
                    <div class="col-12 form-group">
                        <label for="">Fecha desde<b style="color:red">(*)</b>:</label>
                        <input type="datetime-local" class="form-control" id="fechadesde">

                    </div>
                    <div class="col-12 form-group">
                        <label for="">Fecha hasta<b style="color:red">(*)</b>:</label>
                        <input type="datetime-local" class="form-control" id="fechahasta">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>

                <button type="button" class="btn btn-success" onclick="Imprimir_informe()"><i class="fas fa-print"></i> Imprimir por Programa</button>

            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="modal_informe_filial" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#1FA0E0;">
                <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>IMPRIMIR INFORME FILIAL</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>OJO: Debe seleccionar la FILIAL a la que corresponde usted y poner el Número de documento en Info. N°.</b></h7>
                    </div>
                    <div class="col-2 form-group">
                        <label for="">Info. N°:</label>
                        <input type="text" class="form-control" id="txt_id_num_filial" hidden>
                        <input type="text" class="form-control" id="txt_info_filial">
                    </div>
                    <div class="col-5 form-group">
                        <label for="">Grado académico<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="txt_gr_filial" value="TITULO">
                    </div>
                    <div class="col-5 form-group">
                        <label for="">Facultad<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="txtfacu_filial" style="width:100%">
                        </select>
                    </div>
                    <div class="col-12 form-group">
                        <label for="">Programa<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="txtes_filial" style="width:100%">
                        </select>
                    </div>
                    <div class="col-5 form-group">
                        <label for="">Filial<b style="color:red">(*)</b>:</label>
                        <select class="form-control" id="txtfilial" style="width:100%">
                        </select>
                    </div>
                    <div class="col-7 form-group">
                        <label for="">Responsable Grados<b style="color:red">(*)</b>:</label>
                        <input type="text" class="form-control" id="responsable" value="Lic. FIDEL LIMACHI CABEZAS">

                    </div>

                    <div class="col-12 form-group">
                        <label for="">Fecha desde<b style="color:red">(*)</b>:</label>
                        <input type="datetime-local" class="form-control" id="fechadesde_filial">

                    </div>
                    <div class="col-12 form-group">
                        <label for="">Fecha hasta<b style="color:red">(*)</b>:</label>
                        <input type="datetime-local" class="form-control" id="fechahasta_filial">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>

                <button type="button" class="btn btn-success" onclick="Imprimir_informe2()"><i class="fas fa-print"></i> Imprimir Informe</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal_editar_letra" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#1FA0E0;">
                <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>EDITAR TAMAÑO DE LETRA EN EL NOMBRE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning alert-dismissible" style="text-align:justify">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5><i class="icon fas fa-exclamation-triangle"></i> ¡Aviso Importante!</h5>
                    <b>NOTA:</b> Aqui puede cambiar el tamaño de la letra y posición del nombre y apellidos del estudiante para el diploma, por defecto el tamaño es 37 puntos y posición 89 si quiere minimizar el tamaño reduce y aumenta la posición y si quiere aumentar lo contrario reduce la posición.
                </div>
                <div class="row">
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>CAMBIO DE TAMAÑO A NOMBRES Y APELLIDOS ESTUDIANTE:</b></h7>
                    </div>
                    <div class="col-12 form-group">
                        <input type="text" id="txt_id_expediente" hidden>
                        <label for="">Tamaño de letra:</label>
                        <input class="form-control" type="number" id="txt_tamaño" value="55">
                    </div>
                    <div class="col-12 form-group">
                        <label for="">Posición:</label>
                        <input class="form-control" type="number" id="txt_posición" value="93">
                    </div>
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>CAMBIO DE TAMAÑO A DENOMINACIÓN TÍTULO:</b></h7>
                    </div>
                    <div class="col-12 form-group">
                        <input type="text" id="txt_id_expediente" hidden>
                        <label for="">Tamaño de letra:</label>
                        <input class="form-control" type="number" id="txt_tamaño_deno" value="42">
                    </div>
                    <div class="col-12 form-group">
                        <label for="">Posición:</label>
                        <input class="form-control" type="number" id="txt_posición_deno" value="83">
                    </div>
                    <div class="col-12 form-group">
                        <label for="">VER VIDEO TUTORIAL:</label>
                        <a href="https://drive.google.com/file/d/1YIznm_UnFm-jAM-UX2xIcQL0pS6A2IqW/view?usp=sharing" target="_blank">Ver Video</a>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
                <button type="button" class="btn btn-success" onclick="imprimir_numero()"><i class="fas fa-file"></i> Imprimir Diploma</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_imprimir_varios" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#1FA0E0;">
                <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>IMPRESIÓN EN CONJUNTO DE DIPLOMAS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-warning alert-dismissible" style="text-align:justify">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5><i class="icon fas fa-exclamation-triangle"></i> ¡Aviso Importante!</h5>
                    <b>NOTA:</b> Este formulario se utiliza para imprimir diplomas en conjunta, recuerda colocar correctamente todo los campos para que salga correctamente todo los diplomas.
                </div>
                <div class="row">
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>Campos Obligatorios (*)</b></h7>
                    </div>
                    <div class="col-12 form-group">
                        <input type="text" id="txt_id_expediente" hidden>
                        <label for="">Colación<b style="color:red">(*)</b>:</label>
                        <div class="input-group mb-2">
                            <select class="js-example-basic-single" id="select_fechacola_varios" style="width:100%"></select>
                            <div class="valid-input invalid-feedback"></div>
                        </div>
                    </div>
                    <div class="col-6 form-group">
                        <label for="">Nro de registro de inicio<b style="color:red">(*)</b>:</label>
                        <input class="form-control" type="number" id="txt_registro_inicio">
                    </div>
                    <div class="col-6 form-group">
                        <label for="">Nro de registro final<b style="color:red">(*)</b>:</label>
                        <input class="form-control" type="number" id="txt_registro_fin">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
                <button type="button" class="btn btn-success" onclick="imprimir_varios_diplomas()"><i class="fas fa-print"></i> Imprimir Diplomas</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_pasar_bachiller" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#1FA0E0">
                <div class="col-12 form-group" style="color:white; margin-bottom: 0;">
                    <h5 class="modal-title" id="lb_titulo_datos" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos22" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos33" style="color:white; margin-bottom: 0;"></h5>
                    <h5 class="" id="lb_titulo_datos44" style="color:white; margin-bottom: 0;"></h5>
                </div>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-12 form-group" style="color:red">
                        <h7><b>Nota:</b> Este formulario es para enviar todo los datos a bachiller una vez modificado este registro lo podra ver en <b>Registro de Bachiller</b></h7>
                    </div>
                    <div class="col-12 form-group">
                        <div class="col-12 form-group">
                            <input type="text" id="txtidexpe" hidden>
                            <input type="text" id="txtidiautoridad" hidden>

                            <label for="" style="font-size:small;">Facultad<b style="color:red">(*)</b>:</label>
                            <select class="form-control" id="select_facultad_pasar" style="width:100%"></select>
                        </div>
                        <div class="col-12 form-group">
                            <label for="" style="font-size:small;">Programa<b style="color:red">(*)</b>:</label>
                            <select class="form-control" id="select_escuela_pasar" style="width:100%"></select>
                        </div>
                        <div class="col-12 form-group">
                            <label for="" style="font-size:small;">Grado Académico de Bachiller en<b style="color:red">(*)</b>:</label>
                            <input type="text" class="form-control" id="txt_bachiller_pasar">
                        </div>
                        <div class="col-12 form-group">
                            <label for="" style="font-size:small;">Modalidad<b style="color:red">(*)</b>:</label>
                            <select name="" id="txt_modalidad_pasar" class="form-control">
                                <option value="BACHILLER AUTOMATICO">BACHILLER AUTOMATICO</option>
                                <option value="CURSO (TRABAJO DE INVESTIGACIÓN)">CURSO "TRABAJO DE INVESTIGACIÓN"</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
                    <button type="button" class="btn btn-success" onclick="Pasar_bachiller()"><i class="fas fa-file"></i> Enviar a Bachiller</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            listar_expedientes_alfabetico();

            $('.js-example-basic-single').select2();
            Cargar_Select_Facultad();
            Cargar_Select_Carrera_editar();
            Cargar_Select_Cede();
            Cargar_Select_facul_carrera();
            Cargar_Select_Facultad2();
            Cargar_Select_Colacion();

            Cargar_Select_facul_carrera2();
            Cargar_Select_Cede_editar();


        });
        //registrar
        $("#select_facultad").change(function() {
            var id_auto = $("#select_facultad").val();
            Traerauto(id_auto);
        });
        $("#select_facultad").change(function() {
            var id = $("#select_facultad").val();
            Cargar_Select_facul_carrera(id);
        });

        $("#select_escuela").change(function() {
            var id = $("#select_escuela").val();
            Traergrado(id);
        });
        $("#txt_escuela_editar").change(function() {
            var id = $("#txt_escuela_editar").val();
            Traergrado(id);
        });


        $("#txtfacu").change(function() {
            var id = $("#txtfacu").val();
            Cargar_Select_facul_carrera(id);
        });

        $("#txtfacu_filial").change(function() {
            var id = $("#txtfacu_filial").val();
            Cargar_Select_facul_carrera(id);
        });
        //pasar datos a bachiller
        $("#select_facultad_pasar").change(function() {
            var id_auto = $("#select_facultad_pasar").val();
            Traerauto2(id_auto);
        });
        $("#select_facultad_pasar").change(function() {
            var id = $("#select_facultad_pasar").val();
            Cargar_Select_facul_carrera2(id);
        });

        $("#select_escuela_pasar").change(function() {
            var id = $("#select_escuela_pasar").val();
            Traergrado2(id);
        });
        var input = document.getElementById('txt_dni');
        input.addEventListener('input', function() {
            if (this.value.length > 8)
                this.value = this.value.slice(0, 8);
        })
        var input = document.getElementById('txt_movil');
        input.addEventListener('input', function() {
            if (this.value.length > 9)
                this.value = this.value.slice(0, 9);
        })
        var input = document.getElementById('txt_dni_editar');
        input.addEventListener('input', function() {
            if (this.value.length > 8)
                this.value = this.value.slice(0, 8);
        })
        var input = document.getElementById('txt_movil_editar');
        input.addEventListener('input', function() {
            if (this.value.length > 9)
                this.value = this.value.slice(0, 9);
        })

        //editar
        $("#txt_escuela_editar").change(function() {
            var id_auto = $("#txt_escuela_editar").val();
            Traerauto(id_auto);
        });
        //este es
        $("#txt_escuela_editar").change(function() {
            var id = $("#txt_escuela_editar").val();
            Traergrado(id);
        });

        function Validar_Informacion2() {
            var checkbox = document.getElementById('checkboxSuccess3');
            var datosAntiguos = document.getElementById('datos_antiguos');
            if (checkbox.checked) {
                datosAntiguos.classList.remove('hiddenantiguo');
            } else {
                datosAntiguos.classList.add('hiddenantiguo');
            }
        }

        Validar_Informacion();

        function Validar_Informacion() {
            if (!document.getElementById('checkboxSuccess1').checked) {
                $("#btn_registro").prop("disabled", true); // Deshabilitar el botón
            } else {
                $("#btn_registro").prop("disabled", false); // Habilitar el botón
            }
        }
        Validar_Informacion3();

        function Validar_Informacion3() {
            if (!document.getElementById('checkboxSuccess11').checked) {
                $("#btn_editar").prop("disabled", true);;
            } else {
                $("#btn_editar").prop("disabled", false);
            }
        }
        $('input[type="file"]').on('change', function() {
            var ext = $(this).val().split('.').pop();
            console.log($(this).val());
            if ($(this).val() != '') {
                if (ext == "PDF" || ext == "pdf") {
                    if ($(this)[0].files[0].size > 31457280) { //----- 30 MB
                        //if($(this)[0].files[0].size> 1048576){ ------- 1 MB
                        //if($(this)[0].files[0].size> 10485760){ ------- 10 MB
                        Swal.fire("El archivo seleccionado es demasiado pesado",
                            "<label style='color:#9B0000;'>Seleccionar un archivo mas liviano</label>", "waning");
                        $("#txt_archivo").val("");
                        return;
                        //$("#btn_subir").prop("disabled",true);
                    } else {
                        //$("#btn_subir").attr("disabled",false);
                    }
                    $("#txtformato").val(ext);
                } else {
                    $("#txt_archivo_editar").val("");
                    Swal.fire("Mensaje de Error", "Extensión no permitida: <b>" + ext + "</b> Seleccione un archivo en formato PDF", "error");
                }
            }
        });



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


        document.getElementById('txtfechainicio').value = y + "-" + m + "-" + d;
        document.getElementById('txtfechafin').value = y + "-" + m + "-" + d;

        document.getElementById('txt_fecha_matri').value = y + "-" + m + "-" + d;
        document.getElementById('txt_fecha_egres').value = y + "-" + m + "-" + d;


        document.getElementById('txt_fecha_cu').value = y + "-" + m + "-" + d;
        document.getElementById('txt_fecha_firma').value = y + "-" + m + "-" + d;
        document.getElementById('txt_fecha_reso').value = y + "-" + m + "-" + d;

        document.getElementById('txt_fecha_secre').value = y + "-" + m + "-" + d;





        var n = new Date();
        var y = n.getFullYear();
        var m = n.getMonth() + 1;
        var d = n.getDate();
        var h = n.getHours();
        var min = n.getMinutes();

        // Add leading zeros if necessary
        if (d < 10) {
            d = '0' + d;
        }
        if (m < 10) {
            m = '0' + m;
        }
        if (h < 10) {
            h = '0' + h;
        }
        if (min < 10) {
            min = '0' + min;
        }

        // Format the date and time in the format required for the input
        var currentDateTime = y + '-' + m + '-' + d + 'T' + h + ':' + min;

        // Set this value to the datetime-local input
        document.getElementById('txt_fecha_reg').value = currentDateTime;


        var n = new Date();
        var y = n.getFullYear();
        var m = n.getMonth() + 1;
        var d = n.getDate();
        var h = n.getHours();
        var min = n.getMinutes();

        // Add leading zeros if necessary
        if (d < 10) {
            d = '0' + d;
        }
        if (m < 10) {
            m = '0' + m;
        }
        if (h < 10) {
            h = '0' + h;
        }
        if (min < 10) {
            min = '0' + min;
        }

        // Format the date and time
        var currentDateTime = y + '-' + m + '-' + d + 'T' + h + ':' + min;

        // Determine the time range and set fechadesde and fechahasta accordingly
        var fechaDesde, fechaHasta;

        if (h >= 8 && h < 13) {
            // If current time is between 8 AM and 1 PM
            fechaDesde = y + '-' + m + '-' + d + 'T07:30';
            fechaHasta = y + '-' + m + '-' + d + 'T13:00';
        } else if (h >= 13 && h < 16) {
            // If current time is between 1 PM and 4 PM
            fechaDesde = y + '-' + m + '-' + d + 'T13:00';
            fechaHasta = y + '-' + m + '-' + d + 'T16:00';
        } else {
            // If current time is outside these ranges, default to current time
            fechaDesde = currentDateTime;
            fechaHasta = currentDateTime;
        }

        // Set the values for the input fields
        document.getElementById('fechadesde').value = fechaDesde;
        document.getElementById('fechahasta').value = fechaHasta;
        document.getElementById('fechadesde_filial').value = fechaDesde;
        document.getElementById('fechahasta_filial').value = fechaHasta;



        var input = document.getElementById("txt_dni");
        input.addEventListener("keyup", function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("prueba").click();
            }
        });
    </script>

    <script>
        document.getElementById('txt_modalidad').addEventListener('change', function() {
            const inputToDisable7 = document.getElementById('txt_trabajo_inve');
            const inputToDisable8 = document.getElementById('txt_metadata');
            const inputToDisable9 = document.getElementById('txt_turni');
            const inputToDisable10 = document.getElementById('txt_porce');
            const inputToDisable11 = document.getElementById('txt_centro_inve');

            if (this.value === 'EXAMEN DE TITULACIÓN') {
                inputToDisable7.disabled = true;
                inputToDisable8.disabled = true;
                inputToDisable9.disabled = true;
                inputToDisable10.disabled = true;
                inputToDisable11.disabled = true;

                inputToDisable7.value = "";
                inputToDisable8.value = "";
                inputToDisable9.value = "";
                inputToDisable10.value = "";
                inputToDisable11.value = "";

            } else {
                inputToDisable7.disabled = false;
                inputToDisable8.disabled = false;
                inputToDisable9.disabled = false;
                inputToDisable10.disabled = false;
                inputToDisable11.disabled = false;

                inputToDisable9.value = "SI (turnitin)";
            }
        });
    </script>
    <script>
        document.getElementById('txt_modalidad_editar').addEventListener('change', function() {
            const inputToDisable = document.getElementById('txt_trabajo_inve_editar');
            const inputToDisable2 = document.getElementById('txt_metadata_editar');
            const inputToDisable3 = document.getElementById('txt_turni_editar');
            const inputToDisable4 = document.getElementById('txt_porce_editar');
            const inputToDisable5 = document.getElementById('txt_centro_inve_editar');

            if (this.value === 'EXAMEN DE TITULACIÓN') {
                inputToDisable.disabled = true;
                inputToDisable2.disabled = true;
                inputToDisable3.disabled = true;
                inputToDisable4.disabled = true;
                inputToDisable5.disabled = true;
                inputToDisable3.value = "";

            } else {
                inputToDisable.disabled = false;
                inputToDisable2.disabled = false;
                inputToDisable3.disabled = false;
                inputToDisable4.disabled = false;
                inputToDisable5.disabled = false;
                inputToDisable3.value = "SI (turnitin)";

            }
        });
    </script>
    <script>
        txt_dni.focus();
        $(document).ready(function() {
            $('#txt_dni').change(function() {
                valor = $(this).val();
                $('#dni').val(valor);
            })
        })

        $("#prueba").click(function() {

            var dni = $("#dni").val();
            $.ajax({
                type: "POST",
                url: "consulta-dni-ajax.php",
                data: 'dni=' + dni,
                dataType: 'json',
                success: function(data) {
                    if (data == 1) {
                        alert('El DNI tiene que tener 8 digitos');
                    } else {
                        console.log(data);

                        document.getElementById("txt_nom").value = data.first_name
                        document.getElementById("txt_apepa").value = data.first_last_name
                        document.getElementById("txt_apema").value = data.second_last_name



                    }
                }
            });
        })
        //ESTOS 2 TRAE DATOS DE GOOGLE API

        document.getElementById('umil').addEventListener('click', function() {
            fetchSheetData(); // Llama a la función que obtiene los datos de la hoja de Google Sheets
        });
        document.getElementById('umil2').addEventListener('click', function() {
            fetchSheetData(); // Llama a la función que obtiene los datos de la hoja de Google Sheets
        });
    </script>
    <style>
        .hiddenantiguo {
            display: none;
        }
    </style>





    <script>
        // Mostrar la sección correcta al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            const selectTipoDocumento = document.getElementById('select_tipo_documento');
            const dniSection = document.getElementById('dni_section');
            const otrosDocumentosSection = document.getElementById('otros_documentos_section');

            if (selectTipoDocumento.value === 'DNI') {
                dniSection.style.display = 'block';
                otrosDocumentosSection.style.display = 'none';
            }
        });

        // Cambiar la visibilidad según la selección del usuario
        document.getElementById('select_tipo_documento').addEventListener('change', function() {
            const selectedValue = this.value;
            const dniSection = document.getElementById('dni_section');
            const otrosDocumentosSection = document.getElementById('otros_documentos_section');

            if (selectedValue === 'DNI') {
                dniSection.style.display = 'block';
                otrosDocumentosSection.style.display = 'none';
            } else if (selectedValue === 'CARNET DE EXTRANJERIA' || selectedValue === 'PASAPORTE') {
                dniSection.style.display = 'none';
                otrosDocumentosSection.style.display = 'block';
            } else {
                dniSection.style.display = 'none';
                otrosDocumentosSection.style.display = 'none';
            }
        });
    </script>