var tbl_modalidad_titulo;
//LISTADO SOLO SIN FILTRO
function listar_modalidad_titulo() {
  tbl_modalidad_titulo = $("#tabla_modalidad_titulo").DataTable({
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
          "url": "../controller/modalidad_titulo/controlador_listar_modalidad_titulo.php",
          "type": 'POST'
      },
      "dom": 'Bfrtip',
     "buttons": [
      {
        extend: 'excelHtml5',
        text: '<i class="fas fa-file-excel"></i>',
        titleAttr: 'Exportar a Excel',
        filename: function() {
          return "LISTA DE MODALIDAD TITULADO";
        },
        title: function() {
          return "LISTA DE MODALIDAD TITULADO";
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
          return "LISTA DE MODALIDAD TITULADO";
        },
        title: function() {
          return "LISTA DE MODALIDAD TITULADO";
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
          return "LISTA DE MODALIDAD TITULADO";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "fecha_registro1"
        }
      }
    ],
      "columns": [
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
          { "data": "Dni" },
          { "data": "Estudiante" },
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
          { "data": "Escuela" },
          { "data": "Modo_obtencion" },
          { "data": "Modo_estudio" },
          { "data": "fecha_registro1" },
          { "data":"Reglamento_metadado",
            render: function (datae, type, row ) {
              if(datae==''){
                return "<a href="+datae+"  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
              }
              {
                return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
              }
            }
          },
          {
              "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"
          },
        
      ],
      "language": idioma_espanol,
      "select": true
  });

  tbl_modalidad_titulo.on('draw.td', function() {
      var PageInfo = $("#tabla_modalidad_titulo").DataTable().page.info();
      tbl_modalidad_titulo.column(0, { page: 'current' }).nodes().each(function(cell, i) {
          cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_modalidad_titulo = $("#tabla_modalidad_titulo").DataTable({
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
            "url":"../controller/modalidad_titulo/controlador_listar_modalidad_titulo_fecha.php",
            type:'POST',
          data:{
            fechainicio:fechainicio,
            fechafin:fechafin,
          }
      },
      "dom": 'Bfrtip',
      "buttons": [
      {
        extend: 'excelHtml5',
        text: '<i class="fas fa-file-excel"></i>',
        titleAttr: 'Exportar a Excel',
        filename: function() {
          return "LISTA DE MODALIDAD TITULADO";
        },
        title: function() {
          return "LISTA DE MODALIDAD TITULADO";
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
          return "LISTA DE MODALIDAD TITULADO";
        },
        title: function() {
          return "LISTA DE MODALIDAD TITULADO";
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
          return "LISTA DE MODALIDAD TITULADO";
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
        { "data": "Dni" },
        { "data": "Estudiante" },
        {
            "data": "Facultad",
            "render": function(data, type, row) {
              if(data=='Ingeniería'){
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
        { "data": "Reglamento_metadado",
          render: function (data, type, row ) {
            if(data==''){
              return "<a href="+data+"  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
            }
            {
              return "<a href="+data+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
            }
          }
        },

        {"defaultContent":"<button class='mostrar btn btn-success  btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"},
    ],
  
      "language":idioma_espanol,
      select: true
});
tbl_modalidad_titulo.on('draw.td',function(){
  var PageInfo = $("#tabla_modalidad_titulo").DataTable().page.info();
  tbl_modalidad_titulo.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
//TRAENDO DATOS AL MODAL MAS
$('#tabla_modalidad_titulo').on('click','.mostrar',function(){
  var data = tbl_modalidad_titulo.row($(this).parents('tr')).data();

  if(tbl_modalidad_titulo.row(this).child.isShown()){
      var data = tbl_modalidad_titulo.row(this).data();
  }
  $("#modal_mas").modal('show');

  document.getElementById('txt_expediente').value=data.Id_expediente;
  document.getElementById('txt_estudiante').value=data.Dni+' - '+data.Estudiante;
  document.getElementById('txt_escuela').value=data.Facultad+' - '+data.Escuela;
  document.getElementById('txt_modo_ob').value=data.Modo_obtencion;
  document.getElementById('txt_modo_estu').value=data.Modo_estudio;
  document.getElementById('txt_trabajo_inve').value=data.Trabajo_investigacion;
  document.getElementById('txt_turni').value=data.Turnitin;
  document.getElementById('txt_porce').value=data.Porcentaje;
  document.getElementById('txt_centro_inve').value=data.Centro_investigacion;
  document.getElementById('txt_metadata').value=data.Reglamento_metadado;
  document.getElementById('txt_proceden_bachi').value=data.Proce_bachiller;
  document.getElementById('txt_procedeni_insti_ori').value=data.Proce_insti_origen;
  document.getElementById('txt_proceden_titu_ori').value=data.Proce_titulo_peda;
  document.getElementById('txt_fecha_matri').value=data.Fecha_matricula_modalidad;
  document.getElementById('txt_fecha_inicio').value=data.Fecha_inicio_modalidad;
  document.getElementById('txt_fecha_fin').value=data.Fecha_fin_modalidad;
  document.getElementById('select_modo_sustenta').value=data.Modo_sustentacion;
  
})

//TRAENDO DATOS AL MODAL EDITAR
$('#tabla_modalidad_titulo').on('click','.editar',function(){
  var data = tbl_modalidad_titulo.row($(this).parents('tr')).data();

  if(tbl_modalidad_titulo.row(this).child.isShown()){
      var data = tbl_modalidad_titulo.row(this).data();
  }
  $("#modal_editar").modal('show');

  document.getElementById('txt_moda').value=data.Id_modalidad;
  document.getElementById('txt_expediente_actual').value=data.Id_expediente;
  document.getElementById('txt_expediente_editar').value=data.Id_expediente;
  document.getElementById('txt_estudiante_editar').value=data.Estudiante;
  document.getElementById('txt_escuela_editar').value=data.Escuela;
  document.getElementById('txt_modo_ob_editar').value=data.Modo_obtencion;
  document.getElementById('txt_modo_estu_editar').value=data.Modo_estudio;
  document.getElementById('txt_trabajo_inve_editar').value=data.Trabajo_investigacion;
  document.getElementById('txt_turni_editar').value=data.Turnitin;
  document.getElementById('txt_porce_editar').value=data.Porcentaje;
  document.getElementById('txt_centro_inve_editar').value=data.Centro_investigacion;
  document.getElementById('txt_metadata_editar').value=data.Reglamento_metadado;
  document.getElementById('txt_proceden_bachi_editar').value=data.Proce_bachiller;
  document.getElementById('txt_procedeni_insti_ori_editar').value=data.Proce_insti_origen;
  document.getElementById('txt_proceden_titu_ori_editar').value=data.Proce_titulo_peda;
  document.getElementById('txt_fecha_matri_editar').value=data.Fecha_matricula_modalidad;
  document.getElementById('txt_fecha_inicio_editar').value=data.Fecha_inicio_modalidad;
  document.getElementById('txt_fecha_fin_editar').value=data.Fecha_fin_modalidad;
  document.getElementById('select_modo_sustenta_editar').value=data.Modo_sustentacion;
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
          "url":"../controller/expediente_titulado/controlador_listar_expedientes2.php",
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
        {"data":"Titulo_de"},
        {"data":"Modalidad"},
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

function AbrirModalexpediente(){
  $("#modal_expediente").modal({backdrop:'static',keyboard:false})
  $("#modal_expediente").modal('show');
  listar_expediente();

}


