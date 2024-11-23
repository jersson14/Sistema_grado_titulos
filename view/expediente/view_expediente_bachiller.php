<script src="../js/console_expediente_bachiller.js?rev=<?php echo time();?>"></script>

<!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><b>EXPEDIENTE DE BACHILLERES</b></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
              <li class="breadcrumb-item active">EXPEDIENTES</li>
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
              <h3 class="card-title"><i class="fas fa-file-signature"></i>&nbsp;&nbsp;<b>Listado de Expedientes Bachiller</b></h3>
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
                    <table id="tabla_espediente_bachiller" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF; ">
                            <tr>
                                <th style="text-align:center">Nro.</th>
                                <th style="text-align:center">Tipo Documento</th>
                                <th style="text-align:center">N° Documento</th>                                     
                                <th style="text-align:center">Estudiante</th>
                                <th style="text-align:center">Facultad</th>
                                <th style="text-align:center">Escuela</th>
                                <th style="text-align:center">Grado de Bachiller en</th>
                                <th style="text-align:center">Cede</th>
                                <th style="text-align:center">Estado</th>
                                <th style="text-align:center">Expediente</th>
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
    <div class="modal-header" style="background-color:#1FA0E0">
    <div class="col-12 form-group">
    <h5 class="modal-title" id="lb_titulo_datos" style="color:white;"></h5>
    <h5 class="" id="lb_titulo_datos2" style="color:white;"></h5>
    <h5 class="" id="lb_titulo_datos3" style="color:white;"></h5>
    <h5 class="" id="lb_titulo_datos4" style="color:white;"></h5>
    <h5 class="" id="lb_titulo_datos5" style="color:white;"></h5>
    </div>
    </div>
      <div class="modal-body">
        <div class="row">
        <div class="col-2 form-group">
                <label for="" style="font-size:small;">Cede:</label>
                <input type="text" class="form-control" id="txt_cede1" readonly>
            </div>
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Estudiante:</label>
                <input type="text" class="form-control" id="select_estudiante" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Facultad:</label>
                <input type="text" class="form-control" id="select_facultad" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Escuela Profesional:</label>
                <input type="text" class="form-control" id="select_escuela" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Grado Academico de Bachiller en:</label>
                <input type="text" class="form-control" id="txt_denomi" readonly>                           
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Acuerdo:</label>
                <input type="text" class="form-control" id="txt_acuerdo" onkeypress="return soloNumeros(event)" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Resolución Rectoral N°:</label>
                <input type="number" class="form-control" id="txt_Resolucion" onkeypress="return soloNumeros(event)" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Fecha:</label>
                <input type="date" class="form-control" id="txt_fecha" readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Expedición:</label>
                <input type="text" class="form-control" id="txt_expedicion" onkeypress="return soloNumeros(event)"readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Libro:</label>
                <input type="text" class="form-control" id="txt_libro" onkeypress="return soloNumeros(event)"readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Folio:</label>
                <input type="text" class="form-control" id="txt_folio" onkeypress="return soloNumeros(event)"readonly>
            </div>
            <div class="col-3 form-group">
                <label for="" style="font-size:small;">Registro:</label>
                <input type="text" class="form-control" id="txt_registro" onkeypress="return soloNumeros(event)"readonly>
            </div>
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Rector:</label>
                <input type="text" class="form-control" id="txt_rector" readonly>
            </div>
            
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Secretario General:</label>
                <input type="text" class="form-control" id="txt_secretario" readonly>
            </div>
            <div class="col-4 form-group">
                <label for="" style="font-size:small;">Decano:</label>
                <input type="text" class="form-control" id="txt_decano" readonly>
            </div>
       </div>
       </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-right-from-bracket"></i>Cerrar</button>
      </div>
    </div>
  </div>
</div>


<script>

$(document).ready(function () {
  listar_expedientes_bachiller();

  $('.js-example-basic-single').select2();
    Cargar_Select_Cede_editar();
    Cargar_Select_Carrera_editar();
    Cargar_Select_Estudiante();
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

$("#select_escuela_editar").change(function(){
    var id=$("#select_escuela_editar").val();
    Traergrado2(id);
    });

    

    Validar_Informacion();
function Validar_Informacion(){
    if(document.getElementById('checkboxSuccess1').checked==false){
        $("#btn_registro").addClass("disabled");
    }else{
        $("#btn_registro").removeClass("disabled");
    }
}
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
                $("#txt_archivo").val("");
                return;
                //$("#btn_subir").prop("disabled",true);
            }else{
                //$("#btn_subir").attr("disabled",false);
            }
            $("#txtformato").val(ext);
        }
        else{
            $("#txt_archivo_editar").val("");
            Swal.fire("Mensaje de Error","Extensión no permitida: <b>" + ext + "</b> Seleccione un archivo en formato PDF","error");
        }
        }
    });

</script>