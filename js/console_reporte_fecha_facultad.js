var tbl_expediente_titulado;
//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;
    let facu = document.getElementById('select_facultad').value;

    tbl_expediente_titulado = $("#tabla_expediente_titulado").DataTable({
        "ordering":false,   
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
            "url":"../controller/reportes/controlador_listar_expediente_titulo_fecha_facultas.php",
            type:'POST',
          data:{
            fechainicio:fechainicio,
            fechafin:fechafin,
            facu:facu
          }
      },
        dom: 'Bfrtip', 
       
        buttons: [
          {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            filename: function() {
                return "LISTA DE TITULADOS POR FACULTAD";
            },
            title: function() {
                return "LISTA DE TITULADOS POR FACULTAD";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i> ',
            titleAttr: 'Exportar a PDF',
            filename: function() {
                return "LISTA DE TITULADOS POR FACULTAD";
            },
            title: function() {
                return "LISTA DE TITULADOS POR FACULTAD";
            },
            orientation: 'landscape',  // Exportar en formato horizontal
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'print',
            text: '<i class="fa fa-print"></i> ',
            titleAttr: 'Imprimir',
            title: function() {
              return "LISTA DE TITULADOS POR FACULTAD";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          }
        ],
      "columns":[
        {"data":"Dni"},
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
        {"data":"Titulo_de"},
        {"data":"Modalidad"},
        {"data":"cede_nombre"},
        {"data":"ESTADO",
            render: function(data,type,row){
                if(data=='SIN DIPLOMA'){
                    return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                }else if(data=='CON DIPLOMA'){
                    return '<span class="badge bg-success">CON DIPLOMA</span>';
                }
             } 
            },
       
    ],

  
      "language":idioma_espanol,
      select: true
});
tbl_expediente_titulado.on('draw.td',function(){
  var PageInfo = $("#tabla_expediente_titulado").DataTable().page.info();
  tbl_expediente_titulado.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.tbl_expediente_titulado = i + 1 + PageInfo.start;
  });
});
}


var tbl_expediente_bachiller;

function listar_fechas_busqueda_bach(){
    let fechainicio = document.getElementById('txtfechainicio_bach').value;
    let fechafin = document.getElementById('txtfechafin_bach').value;
    let facu = document.getElementById('select_facultad_bach').value;

    tbl_expediente_bachiller = $("#tabla_expediente_bachiller").DataTable({
        "ordering":false,   
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
            "url":"../controller/reportes/controlador_listar_expediente_bachiller_fecha_facultad.php",
            type:'POST',
          data:{
            fechainicio:fechainicio,
            fechafin:fechafin,
            facu:facu
          }
      },
        dom: 'Bfrtip', 
       
        buttons: [
          {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            filename: function() {
                return "LISTA DE BACHILLERES POR FACULTAD";
            },
            title: function() {
              return "LISTA DE BACHILLERES POR FACULTAD";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i> ',
            titleAttr: 'Exportar a PDF',
            filename: function() {
                return "LISTA DE BACHILLERES POR FACULTAD";
            },
            title: function() {
                return "LISTA DE BACHILLERES POR FACULTAD";
            },
            orientation: 'landscape',  // Exportar en formato horizontal
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'print',
            text: '<i class="fa fa-print"></i> ',
            titleAttr: 'Imprimir',
            title: function() {
                return "LISTA DE BACHILLERES POR FACULTAD";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "Estado"
            }
          }
        ],
      "columns":[
        {"data":"Dni"},
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
        {"data":"Modalidad"},
        {"data":"cede_nombre"},
        {"data":"ESTADO",
            render: function(data,type,row){
                if(data=='SIN DIPLOMA'){
                    return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                }else if(data=='CON DIPLOMA'){
                    return '<span class="badge bg-success">CON DIPLOMA</span>';
                }
             } 
            },
       
    ],

  
      "language":idioma_espanol,
      select: true
});
tbl_expediente_bachiller.on('draw.td',function(){
  var PageInfo = $("#tabla_expediente_bachiller").DataTable().page.info();
  tbl_expediente_bachiller.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.tbl_expediente_bachiller = i + 1 + PageInfo.start;
  });
});
}



function Cargar_Select_Facultad(){
  $.ajax({
    "url":"../controller/carreras/controlador_cargar_select_facultad.php",
    type:'POST',
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
      }
      document.getElementById('select_facultad').innerHTML=cadena;
      document.getElementById('select_facultad_bach').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay cedes en la base de datos</option>";
      document.getElementById('select_facultad').innerHTML=cadena;
      document.getElementById('select_facultad_bach').innerHTML=cadena;

    }
  })
}

