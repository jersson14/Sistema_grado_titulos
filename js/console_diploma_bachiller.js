var tbl_general_bachiller;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_bachiller(){
    tbl_general_bachiller = $("#tabla_registro_general").DataTable({
      "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "pagingType": 'full_numbers',
        "scrollCollapse": true,
        "responsive": true,
        "async": false ,
        "processing": true,
      "ajax":{
          "url":"../controller/diplomas/controlador_listar_diploma_bachiller.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
      "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        }
      ],
      "columns":[
        {"data":"Diploma_numero"},
        {"data":"tipo_documento",
          render: function(data,type,row){
              if(data=='DNI'){
                  return '<span class="badge bg-success">DNI</span>';
              }else if(data=='PASAPORTE'){
                  return '<span class="badge bg-primary">PASAPORTE</span>';
              }else{
                  return '<span class="badge bg-warning">CARNET DE EXTRANJERIA</span>';
              }
           } 
          },
        {"data":"Dni"},
        {"data":"Estudiante"},
       {"data":"Facultad",
        render: function(data,type,row){
            if(data=='Ingeniería'){
                return '<span class="badge bg-success">INGENIERIA</span>';
            }else if(data=='Ciencias de la Salud'){
                return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
            }else{
                return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
            }
         } 
        },
        {"data":"Escuela"},
        {"data":"Modo_obtencion"},
        {"data":"estadiplo",
          render: function(data,type,row){
              if(data=='SIN DIPLOMA'){
                  return '<span class="badge bg-danger">SIN DIPLOMA</span>';
              }else if(data=='CON DIPLOMA'){
                  return '<span class="badge bg-success">CON DIPLOMA</span>';
              }
           } 
          },
       
          {"data":"estado_diploma_escaneo",
            render: function(data,type,row){
                if(data=='SI'){
                    return '<span class="badge bg-success">SI</span>';
                }else {
                    return '<span class="badge bg-danger">NO</span>';
                }
             } 
            },
            {"data":"diploma_escaneado",
              render: function(data,type,row){
                      if(data===null||data===''){
                        return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Sin diploma'><i class='fas fa-file-download'></i> Sin diploma escaneado</button></a>  ";                 
                      }
                      {
                        return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Ver diploma escaneado'><i class='fas fa-file-download'></i> Ver diploma escaneado</button></a>  ";                 
                      }
                      
                  }   
              },
              {"data":"estado_diploma_escaneo",
                render: function (data, type, row ) {
                  if(data=='SI'){
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar diploma escaneado'><i class='fa fa-edit'></i> Editar diploma escaneado</button>";             
                  }else {
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-primary btn-sm' style='margin-right: 10px;' title='Subir diploma'><i class='fa fa-upload'></i> Subir diploma escaneado</button>";             
                  }
                }
              },
        ],

    "language":idioma_espanol,
    select: true
});

tbl_general_bachiller.on('draw.td',function(){
  var PageInfo = $("#tabla_registro_general").DataTable().page.info();
  tbl_general_bachiller.column(0, {page: 'current'}).nodes().each(function(cell, i){

  });
});
}



//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_general_bachiller = $("#tabla_registro_general").DataTable({
        "ordering":false,   
        "bLengthChange":true,
        "searching": { "regex": false },
        "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
        "pageLength": 10,
        "destroy":true,
        "pagingType": 'full_numbers',
        "scrollCollapse": true,
        "responsive": true,
        "async": false ,
        "processing": true,
        "ajax":{
            "url":"../controller/diplomas/controlador_listar_diploma_bachiller_fecha.php",
           "type": "POST",
            "data": {
                fechainicio: fechainicio,
                fechafin: fechafin,
            },
            "dataSrc": "data" // 👈 Importante
        },
        dom: 'Bfrtip', 
      "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE DIPLOMAS BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        }
      ],
       "columns":[
        {"data":"Diploma_numero"},
        {"data":"tipo_documento",
          render: function(data,type,row){
              if(data=='DNI'){
                  return '<span class="badge bg-success">DNI</span>';
              }else if(data=='PASAPORTE'){
                  return '<span class="badge bg-primary">PASAPORTE</span>';
              }else{
                  return '<span class="badge bg-warning">CARNET DE EXTRANJERIA</span>';
              }
           } 
          },
        {"data":"Dni"},
        {"data":"Estudiante"},
       {"data":"Facultad",
        render: function(data,type,row){
            if(data=='Ingeniería'){
                return '<span class="badge bg-success">INGENIERIA</span>';
            }else if(data=='Ciencias de la Salud'){
                return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
            }else{
                return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
            }
         } 
        },
        {"data":"Escuela"},
        {"data":"Modo_obtencion"},
        {"data":"estadiplo",
          render: function(data,type,row){
              if(data=='SIN DIPLOMA'){
                  return '<span class="badge bg-danger">SIN DIPLOMA</span>';
              }else if(data=='CON DIPLOMA'){
                  return '<span class="badge bg-success">CON DIPLOMA</span>';
              }
           } 
          },
       
          {"data":"estado_diploma_escaneo",
            render: function(data,type,row){
                if(data=='SI'){
                    return '<span class="badge bg-success">SI</span>';
                }else {
                    return '<span class="badge bg-danger">NO</span>';
                }
             } 
            },
            {"data":"diploma_escaneado",
              render: function(data,type,row){
                      if(data===null||data===''){
                        return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Sin diploma'><i class='fas fa-file-download'></i> Sin diploma escaneado</button></a>  ";                 
                      }
                      {
                        return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Ver diploma escaneado'><i class='fas fa-file-download'></i> Ver diploma escaneado</button></a>  ";                 
                      }
                      
                  }   
              },
              {"data":"estado_diploma_escaneo",
                render: function (data, type, row ) {
                  if(data=='SI'){
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar diploma escaneado'><i class='fa fa-edit'></i> Editar diploma escaneado</button>";             
                  }else {
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-primary btn-sm' style='margin-right: 10px;' title='Subir diploma'><i class='fa fa-upload'></i> Subir diploma escaneado</button>";             
                  }
                }
              },
        ],
  
      "language":idioma_espanol,
      select: true
});
tbl_general_bachiller.on('draw.td',function(){
  var PageInfo = $("#tabla_registro_general").DataTable().page.info();
  tbl_general_bachiller.column(0, {page: 'current'}).nodes().each(function(cell, i){
  });
});
}

function listar_colacion(){
  let fechacol = document.getElementById('select_fechacola').value;

  tbl_general_bachiller = $("#tabla_registro_general").DataTable({
      "ordering":false,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 10,
      "destroy":true,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false ,
      "processing": true,
      "ajax":{
        "url":"../controller/registro_general_bachiller/controlador_listar_registro_general_bachiller_colacion.php",
        "type":'POST',
        "data":{
          fechacol:fechacol
         },
            "dataSrc": "data" // 👈 Importante
      },
      dom: 'Bfrtip', 
    "buttons": [
      {
        extend: 'excelHtml5',
        text: '<i class="fas fa-file-excel"></i>',
        titleAttr: 'Exportar a Excel',
        filename: function() {
          return "LISTA DE DIPLOMAS BACHILLER";
        },
        title: function() {
          return "LISTA DE DIPLOMAS BACHILLER";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
        }
      },
      {
        extend: 'pdfHtml5',
        text: '<i class="fas fa-file-pdf"></i>',
        titleAttr: 'Exportar a PDF',
        filename: function() {
          return "LISTA DE DIPLOMAS BACHILLER";
        },
        title: function() {
          return "LISTA DE DIPLOMAS BACHILLER";
        },
        orientation: 'landscape',  // Exportar en formato horizontal
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
        }
      },
      {
        extend: 'print',
        text: '<i class="fa fa-print"></i>',
        titleAttr: 'Imprimir',
        title: function() {
          return "LISTA DE DIPLOMAS BACHILLER";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estadiplo"
        }
      }
    ],
    "columns":[
        {"data":"Diploma_numero"},
        {"data":"tipo_documento",
          render: function(data,type,row){
              if(data=='DNI'){
                  return '<span class="badge bg-success">DNI</span>';
              }else if(data=='PASAPORTE'){
                  return '<span class="badge bg-primary">PASAPORTE</span>';
              }else{
                  return '<span class="badge bg-warning">CARNET DE EXTRANJERIA</span>';
              }
           } 
          },
        {"data":"Dni"},
        {"data":"Estudiante"},
       {"data":"Facultad",
        render: function(data,type,row){
            if(data=='Ingeniería'){
                return '<span class="badge bg-success">INGENIERIA</span>';
            }else if(data=='Ciencias de la Salud'){
                return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
            }else{
                return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
            }
         } 
        },
        {"data":"Escuela"},
        {"data":"Modo_obtencion"},
        {"data":"estadiplo",
          render: function(data,type,row){
              if(data=='SIN DIPLOMA'){
                  return '<span class="badge bg-danger">SIN DIPLOMA</span>';
              }else if(data=='CON DIPLOMA'){
                  return '<span class="badge bg-success">CON DIPLOMA</span>';
              }
           } 
          },
       
          {"data":"estado_diploma_escaneo",
            render: function(data,type,row){
                if(data=='SI'){
                    return '<span class="badge bg-success">SI</span>';
                }else {
                    return '<span class="badge bg-danger">NO</span>';
                }
             } 
            },
            {"data":"diploma_escaneado",
              render: function(data,type,row){
                      if(data===null||data===''){
                        return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Sin diploma'><i class='fas fa-file-download'></i> Sin diploma escaneado</button></a>  ";                 
                      }
                      {
                        return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Ver diploma escaneado'><i class='fas fa-file-download'></i> Ver diploma escaneado</button></a>  ";                 
                      }
                      
                  }   
              },
              {"data":"estado_diploma_escaneo",
                render: function (data, type, row ) {
                  if(data=='SI'){
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar diploma escaneado'><i class='fa fa-edit'></i> Editar diploma escaneado</button>";             
                  }else {
                    return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='subir btn btn-primary btn-sm' style='margin-right: 10px;' title='Subir diploma'><i class='fa fa-upload'></i> Subir diploma escaneado</button>";             
                  }
                }
              },
        ],

    "language":idioma_espanol,
    select: true
});
tbl_general_bachiller.on('draw.td',function(){
var PageInfo = $("#tabla_registro_general").DataTable().page.info();
tbl_general_bachiller.column(0, {page: 'current'}).nodes().each(function(cell, i){
});
});
}
function Cargar_Select_Colacion(){
  $.ajax({
    url: "../controller/registro_general/controlador_cargar_select_colacion.php",
    type: 'POST',
  }).done(function(resp){
    let data = JSON.parse(resp);
    let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio
    if(data.length > 0){
      for (let i = 0; i < data.length; i++) {
        cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";    
      }
    } else {
      cadena += "<option value=''>No hay cedes en la base de datos</option>";
    }
    document.getElementById('select_fechacola').innerHTML = cadena;
  });
}


//AGREGAR DIPLOMA
$('#tabla_registro_general').on('click','.mostrar',function(){
  var data = tbl_general_bachiller.row($(this).parents('tr')).data();

  if(tbl_general_bachiller.row(this).child.isShown()){
      var data = tbl_general_bachiller.row(this).data();
  }
  $("#modal_mas").modal('show');
  document.getElementById('lb_titulo_datos2').innerHTML="<b>DNI: </b>"+data.Dni;
  document.getElementById('lb_titulo_datos3').innerHTML="<b>ESTUDIANTE: </b>"+data.Estudiante;
  document.getElementById('lb_titulo_datos4').innerHTML="<b>FACULTAD - ESCUELA PROFESIONAL: </b>"+data.Facultad+" - "+data.Escuela;
  document.getElementById('lb_titulo_datos5').innerHTML="<b>MODALIDAD</b>: </b>"+data.Modo_obtencion;

  document.getElementById('id_expe').value=data.Id_expediente;
  document.getElementById('txt_id_diplo').value=data.Id_Diploma;

  document.getElementById('txt_fecha_cu').value=data.fecha_consejo_uni;
  document.getElementById('txt_fecha_firma').value=data.fecha_firma;
  document.getElementById('txt_nume_resol').value=data.Resolucion_numero;
  document.getElementById('txt_fecha_reso').value=data.fecha_resolucion;
  document.getElementById('txt_diploma_nume').value=data.Diploma_numero;
  document.getElementById('txt_registro_n°').value=data.Registro_numero;
  document.getElementById('txt_registro_libr').value=data.Registro_libro;
  document.getElementById('txt_registro_folio').value=data.Registro_folio;
  document.getElementById('select_tipo_diplo').value=data.Diploma_tipo_emitido;
  document.getElementById('txt_fecha_inicio_tra').value=data.Fecha_inicio_tramite;
  document.getElementById('txt_nro_credi').value=data.Nro_creditos;
  document.getElementById('txt_nro_oficio').value=data.Nro_oficio;
  document.getElementById('txt_fecha_secre').value=data.fecha_secreatria_general;

})


$('#tabla_registro_general').on('click','.diploma',function(){
  var data = tbl_general_bachiller.row($(this).parents('tr')).data();

  var tamaño = 37;
  var tamaño2 = 89;


  if(tbl_general_bachiller.row(this).child.isShown()){
      var data = tbl_general_bachiller.row(this).data();
  }
  var url = "../view/MPDF/REPORTE/diploma_bachiller.php?codigo=" + encodeURIComponent(data.Id_Diploma) + "&tamaño=" + encodeURIComponent(tamaño)+  "&tamaño2=" + encodeURIComponent(tamaño2)+"#zoom=100%";

// Abrir una nueva ventana con la URL construida
var newWindow = window.open(url, "DIPLOMA BACHILLER", "scrollbars=NO");

// Asegurarse de que la ventana se abre en tamaño máximo
if (newWindow) {
    newWindow.moveTo(0, 0);
    newWindow.resizeTo(screen.width, screen.height);
}
});

$('#tabla_registro_general').on('click','.subir',function(){
  var data = tbl_general_bachiller.row($(this).parents('tr')).data();

  if(tbl_general_bachiller.row(this).child.isShown()){
      var data = tbl_general_bachiller.row(this).data();
  }
  $("#modal_subir_diploma").modal('show');
  document.getElementById('lb_empresa').innerHTML=data.Estudiante;
  document.getElementById('txt_id_diploma').value=data.Id_Diploma;
  document.getElementById('archivoactual').value=data.diploma_escaneado;


})

function Subir_diploma(){

  //DATOS DEL DIPLOMA
  let iddiploma = document.getElementById('txt_id_diploma').value;
  let archivoactual = document.getElementById('archivoactual').value;
  let arc = document.getElementById('txt_diploma').value;


    let extension = arc.split('.').pop();//DOCUMENTO.PPT
    let nombrearchivo="";
    let f = new Date();
    if(iddiploma.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios, revise por favor","warning");
    }

    if(arc.length>0){
      nombrearchivo="EXPE-"+dni+"-"+f.getDate()+"-"+(f.getMonth()+1)+"-"+f.getFullYear()+"-"+f.getHours()+"-"+f.getMinutes()+"-"+f.getSeconds()+"."+extension;
    }





    let formData = new FormData();
    let achivoobj = $("#txt_diploma")[0].files[0];//El objeto del archivo adjuntado


    formData.append("iddiploma",iddiploma);
    formData.append("archivoactual",archivoactual);
    formData.append("nombrearchivo",nombrearchivo);
    formData.append("achivoobj",achivoobj);



    $.ajax({
      url:"../controller/diplomas/controlador_subir_diploma_titulo.php",
      type:'POST',
      data:formData,
      contentType:false,
      processData:false,
      success:function(resp){
        if(resp>0){
            Swal.fire("Mensaje de Confirmación","Se subir el diploma escaneado de forma correcta!!!","success").then((value)=>{
              tbl_general_bachiller.ajax.reload();
              $("#modal_subir_diploma").modal('hide');
              document.getElementById('txt_diploma').value="";

            });
        }else{
          Swal.fire("Mensaje de Advertencia","No se pudo realizar el registro verifique por favor","warning");
    
        }
      }
    });
    return false;
}
