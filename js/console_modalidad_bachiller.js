var tbl_modalidad_bachiller;
//LISTADO SOLO SIN FILTRO
function listar_modalidad_bachiller() {
  tbl_modalidad_bachiller = $("#tabla_modalidad_bachiller").DataTable({
      "ordering": false,
      "bLengthChange": true,
      "searching": { "regex": false },
      "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
      "pageLength": 10,
      "destroy": true,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false,
      "processing": true,
      "ajax": {
          "url": "../controller/modalidad_bachiller/controlador_listar_modalidad_bachiller.php",
          "type": 'POST'
      },
      "dom": 'Bfrtip',
      "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        }
      ],
      "columns": [
          { "data": "Dni" },
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
          { "data": "Dni" },
          { "data": "Estudiante" },
          {
              "data": "Facultad",
              "render": function(data, type, row) {
                  if (data == 'Ingeniería') {
                return '<span class="badge bg-success">INGENIERIA</span>';
                  } else if (data == 'Ciencias de la Salud') {
                      return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
                  } else {
                      return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
                  }
              }
          },
          { "data": "Escuela" },
          { "data": "Modo_obtencion" },
          { "data": "Modo_estudio" },
          { "data": "fecha_registro1" },
          {
              "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"
          },
        
      ],
      "language": idioma_espanol,
      "select": true
  });

  tbl_modalidad_bachiller.on('draw.td', function() {
      var PageInfo = $("#tabla_modalidad_bachiller").DataTable().page.info();
      tbl_modalidad_bachiller.column(0, { page: 'current' }).nodes().each(function(cell, i) {
          cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_modalidad_bachiller = $("#tabla_modalidad_bachiller").DataTable({
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
            "url":"../controller/modalidad_bachiller/controlador_listar_modalidad_bachiller_fecha.php",
            type:'POST',
          data:{
            fechainicio:fechainicio,
            fechafin:fechafin,
          }
      },
        dom: 'Bfrtip', 
       
       "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE MODALIDAD BACHILLER";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
          }
        }
      ],
      "columns":[
        {"defaultContent":""},
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
             if (data == 'Ingeniería') {
                return '<span class="badge bg-success">INGENIERIA</span>';
                  } else if (data == 'Ciencias de la Salud') {
                      return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
                  } else {
                      return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
                  }
         } 
        },
        {"data":"Escuela"},
        {"data":"Modo_obtencion"},
        {"data":"Modo_estudio"},
        {"data":"fecha_registro1"},

        {"defaultContent":"<button class='mostrar btn btn-success  btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"},
    ],
  
      "language":idioma_espanol,
      select: true
});
tbl_modalidad_bachiller.on('draw.td',function(){
  var PageInfo = $("#tabla_modalidad_bachiller").DataTable().page.info();
  tbl_modalidad_bachiller.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
$('#tabla_modalidad_bachiller').on('click','.mostrar',function(){
  var data = tbl_modalidad_bachiller.row($(this).parents('tr')).data();

  if(tbl_modalidad_bachiller.row(this).child.isShown()){
      var data = tbl_modalidad_bachiller.row(this).data();
  }
  $("#modal_mas").modal('show');

  document.getElementById('txt_expediente_mas').value=data.Id_expediente;
  document.getElementById('txt_estudiante_mas').value=data.Dni+' - '+data.Estudiante;
  document.getElementById('txt_escuela_mas').value=data.Facultad+' - '+data.Escuela;
  document.getElementById('txt_modo_obtencion_mas').value=data.Modo_obtencion;
  document.getElementById('txt_modo_estudio_mas').value=data.Modo_estudio;
  document.getElementById('txt_pro_bachiller_mas').value=data.Proce_bachiller;
  document.getElementById('txt_pro_institu_mas').value=data.Proce_insti_origen;
  document.getElementById('txt_pro_titulo_mas').value=data.Proce_titulo_peda;
})
function AbrirRegistro(){
  $("#modal_registro").modal({backdrop:'static',keyboard:false})
  $("#modal_registro").modal('show');
}

$('#tabla_modalidad_bachiller').on('click','.editar',function(){
  var data = tbl_modalidad_bachiller.row($(this).parents('tr')).data();

  if(tbl_modalidad_bachiller.row(this).child.isShown()){
      var data = tbl_modalidad_bachiller.row(this).data();
  }
  $("#modal_editar").modal('show');

  document.getElementById('txt_id_moda').value=data.Id_modalidad;
  document.getElementById('txt_id_expe_actual').value=data.Id_expediente;
  document.getElementById('txt_expediente_editar').value=data.Id_expediente;
  document.getElementById('txt_estudiante_editar').value=data.Estudiante;
  document.getElementById('txt_escuela_editar').value=data.Escuela;
  document.getElementById('txt_modo_obtencion_editar').value=data.Modo_obtencion;
  document.getElementById('txt_modo_estudio_editar').value=data.Modo_estudio;
  document.getElementById('txt_pro_bachiller_editar').value=data.Proce_bachiller;
  document.getElementById('txt_pro_institu_editar').value=data.Proce_insti_origen;
  document.getElementById('txt_pro_titulo_editar').value=data.Proce_titulo_peda;;
})

//TRAER TODO LOS EXPEDIENTES1
var tbl_expediente1;
function listar_expediente(){
  tbl_expediente1 = $("#tabla_expe").DataTable({
     "ordering":true,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 5,
      "destroy":true,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false ,
      "processing": true,
      "ajax":{
          "url":"../controller/expediente_bachiller/controlador_listar_expedientes2.php",
          type:'POST'
      },
      "columns":[
        {"defaultContent":""},
        {"data":"Dni"},
        {"data":"Estudiante"},
        {"data":"Facultad",
        render: function(data,type,row){
            if(data=='INGENIERIA'){
                return '<span class="badge bg-success">INGENIERIA</span>';
            }else if(data=='CIENCIAS DE LA SALUD'){
                return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
            }else{
                return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
            }
         } 
        },
        {"data":"Escuela"},
        {"data":"Grado_bachiller_de"},
        {"data":"cede_nombre"},
        {"defaultContent":"<button class='enviar_a btn btn-primary  btn-sm' title='Editar datos de área'><i class='fas fa-share-square ml-1 mr-1'></i> Enviar</button>"}, 
            
    ],

    "language":idioma_espanol,
    select: true
});
tbl_expediente1.on('draw.td',function(){
  var PageInfo = $("#tabla_expe").DataTable().page.info();
  tbl_expediente1.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
function filterGlobal(){
  $('#tabla_expe').DataTable().search(
      $('#global_filter').val(),
  ).draw();
}

//EXPEDIENTES 2
var tbl_expediente2;
function listar_expediente2(){
  tbl_expediente2 = $("#tabla_expe2").DataTable({
     "ordering":true,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 5,
      "destroy":true,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false ,
      "processing": true,
      "ajax":{
          "url":"../controller/expediente_bachiller/controlador_listar_expedientes2.php",
          type:'POST'
      },
      "columns":[
        {"defaultContent":""},
        {"data":"Dni"},
        {"data":"Estudiante"},
        {"data":"Facultad",
        render: function(data,type,row){
            if(data=='INGENIERIA'){
                return '<span class="badge bg-success">INGENIERIA</span>';
            }else if(data=='CIENCIAS DE LA SALUD'){
                return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
            }else{
                return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
            }
         } 
        },
        {"data":"Escuela"},
        {"data":"Grado_bachiller_de"},
        {"data":"cede_nombre"},
        {"defaultContent":"<button class='enviar_a btn btn-primary  btn-sm' title='Editar datos de área'><i class='fas fa-share-square ml-1 mr-1'></i> Enviar</button>"}, 
            
    ],

    "language":idioma_espanol,
    select: true
});
tbl_expediente2.on('draw.td',function(){
  var PageInfo = $("#tabla_expe2").DataTable().page.info();
  tbl_expediente2.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

function filterGlobal(){
  $('#tabla_expe2').DataTable().search(
      $('#global_filter').val(),
  ).draw();
}

function AbrirModalexpediente(){
  $("#modal_expediente").modal({backdrop:'static',keyboard:false})
  $("#modal_expediente").modal('show');
  listar_expediente();
  $('#tabla_expe').DataTable().destroy();

}

function AbrirModalexpediente2(){
  $("#modal_expediente2").modal({backdrop:'static',keyboard:false})
  $("#modal_expediente2").modal('show');
  listar_expediente2();
  $('#tabla_expe2').DataTable().destroy();

}


