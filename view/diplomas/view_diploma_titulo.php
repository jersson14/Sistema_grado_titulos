
<script src="../js/console_diploma_titulo.js?rev=<?php echo time();?>"></script>
<link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>LISTADO DE DIPLOMAS DE TITULO</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">TITULADOS</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Diplomas de Titulados</b></h3>

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
                <input type="text" id="dni" autocomplete="off" name="dni" hidden>
                <div class="table-responsive" style="text-align:center">
                  <div class="card-body">
                    <table id="tabla_registro_general" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                            <tr>
                                <th style="text-align:center">N° Diploma</th>
                                <th style="text-align:center">Tipo Documento</th>
                                <th style="text-align:center">N° Documento</th>                                  
                                <th style="text-align:center">Estudiante</th>
                                <th style="text-align:center">Facultad</th>
                                <th style="text-align:center">Escuela</th>
                                <th style="text-align:center">Modalidad</th>
                                <th style="text-align:center">Estado</th>
                                <th style="text-align:center">Diploma</th>
                                <th style="text-align:center">Tiene Diploma Escaneado</th>
                                <th style="text-align:center">Ver diploma escaneado</th>
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




    <!-- /MODAL AGREGAR DIPLOMA -->

<div class="modal fade" id="modal_mas" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <input type="date" class="form-control" id="txt_fecha_cu" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de Firma<b style="color:red">(*)</b>:</label>
                <input type="date" class="form-control" id="txt_fecha_firma" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha Secretaria General:<b style="color:red">(*)</b>:</label>
                <input type="date" class="form-control" id="txt_fecha_secre" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha de Resolu.<b style="color:red">(*)</b>:</label>
                <input type="date" class="form-control" id="txt_fecha_reso" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Resolucíon N°<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_nume_resol" disabled> 
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Diploma N°<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_diploma_nume" disabled>                           
            </div>
            <div class="col-2 form-group">
                <label for="" style="font-size:small;">Registro N°<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_registro_n°" disabled>                           
            </div>
            
            <div class="col-2 form-group">
                <label for="" style="font-size:small;">Registro Libro<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_registro_libr" disabled>                           
            </div>
            <div class="col-2 form-group">
                <label for="" style="font-size:small;">Registro Folio<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_registro_folio" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Tipo de diploma<b style="color:red">(*)</b>:</label>
                <select class="form-control" id="select_tipo_diplo" style="width:100%" disabled>
                    <option value="O">ORIGINAL</option>
                    <option value="C">COPIA</option>
                </select>                            
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha inicio trámite<b style="color:red">(*)</b>:</label>
                <input type="date" class="form-control" id="txt_fecha_inicio_tra" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Número de creditos<b style="color:red" >(*)</b>:</label>
                <input type="number" class="form-control" id="txt_nro_credi" disabled>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Nro. Oficio<b style="color:red">(*)</b>:</label>
                <input type="text" class="form-control" id="txt_nro_oficio" disabled>                           
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

    <!-- /MODAL MAS AGREGAR DIPLOMA ESCANEADO -->

<div class="modal fade" id="modal_subir_diploma" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#1FA0E0;">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white; text-align:center"><b>SUBIR DIPLOMA ESCANEADO DEL/LA ESTUDIANTE: </b><label for="" id="lb_empresa"></label></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-12">
            <input type="text" id="archivoactual" hidden>
            <input type="text" id="txt_id_diploma" hidden>
            <label for="">Subir diploma escaneado<b style="color:red">(*)</b>:</label>
            <input class="form-control" type="file" id="txt_diploma">
            <br><label for="" style="font-size:16px;color:red">*El documento debe estar en formato PDF y con un tamaño máximo de 30 MB.</label>

          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times ml-1"></i> Cerrar</button>
        <button type="button" class="btn btn-success" onclick="Subir_diploma()"><i class="fas fa-check"></i> Modificar</button>
      </div>
    </div>
  </div>
</div>




<script>

$(document).ready(function () {
    listar_expedientes_titulado();
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



$('input[type="file"]').on('change', function(){
        var ext = $( this ).val().split('.').pop();
        console.log($( this ).val());
        if($(this).val() !=''){
        if(ext == "PDF" || ext =="pdf"){
            if($(this)[0].files[0].size > 31457280){//----- 30 MB
            //if($(this)[0].files[0].size> 1048576){ ------- 1 MB
            //if($(this)[0].files[0].size> 10485760){ ------- 10 MB
                Swal.fire("El archivo seleccionado es demasiado pesado",
                "<label style='color:#9B0000;'>Seleccionar un archivo mas liviano</label>","waning");
                $("#txt_diploma").val("");
                return;
                //$("#btn_subir").prop("disabled",true);
            }else{
                //$("#btn_subir").attr("disabled",false);
            }
            $("#txtformato").val(ext);
        }
        else{
            $("#txt_diploma").val("");
            Swal.fire("Mensaje de Error","Extensión no permitida: <b>" + ext + "</b> Seleccione un archivo en formato PDF","error");
        }
        }
    });

</script>
