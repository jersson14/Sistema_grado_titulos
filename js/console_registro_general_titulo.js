

var tbl_general_titulo;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_titulado(){

    tbl_general_titulo = $("#tabla_registro_general").DataTable({
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
          "url":"../controller/registro_general/controlador_listar_registro_general.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
      buttons:[ 
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              orientation: 'landscape',  // Exportar en formato horizontal
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          }
      ],
      "columns":[
        {"data":"Diploma_numero"},
         {
          "data": "number_informe",
          render: function(data, type, row) {
            return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
          }
        },
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
          },          {"data":"Dni"},
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
        {"data":"fecha_registro1"},

      
      

      {"data":"cede_nombre"},
      {
        data: "aumento",
        render: function (data, type, row) {
          console.log(row);
          if (data === 0) {
            return "<button class='validar btn btn-primary btn-sm' style='margin-right: 10px;' title='Validar datos'><i class='fa fa-check'></i> Validar</button>";
          
          } else{
            return "<button class='validar btn btn-success btn-sm' disabled style='margin-right: 10px;' title='Ya se validó'><i class='fa fa-check'></i> Ya esta Validado</button>";
          }
        }
      }
      ,
              {"data":"fecha_vali"},

        {"data":"estado",
            render: function(data,type,row){
                if(data=='SIN DIPLOMA'){
                    return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                }else if(data=='CON DIPLOMA'){
                    return '<span class="badge bg-success">CON DIPLOMA</span>';
                }
            } 
        },
        {"data":"Reglamento_metadado",
            render: function (datae, type, row ) {
                if(datae==''){
                    return "<a href="+datae+" target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                } else {
                    return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>";
                }
            }
        },
        {"data":"Archivo",
            render: function(data,type,row){
                if(data=='controller/registro_general/documentos/' || data==''){
                    return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                } else {
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                }
            }   
        },
          {"data":"estado",
          render: function (data, type, row ) {
            console.log(row);
            if(data=='SIN DIPLOMA'){
              return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button hidden class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos' ><i class='fa fa-trash'></i> Eliminar</button>&nbsp;<button style='margin-right: 10px;' class='pasar btn btn-info btn-sm' title='Pasar datos a titulado'><i class='fa fa-arrow-right'></i> Pasar a Bachiller</button>";             
            }else if(data=='CON DIPLOMA'){
              return "<button class='letra btn btn-dark btn-sm' style='margin-right: 10px;' title='Cambiar tamaño de letra a nombre'><i class='fa fa-edit'></i> Cambiar tamaño letra</button><button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
            }
          }
        },
    ],

    "language":idioma_espanol,
    select: true
});

tbl_general_titulo.on('draw.td',function(){
  var PageInfo = $("#tabla_registro_general").DataTable().page.info();
  tbl_general_titulo.column(0, {page: 'current'}).nodes().each(function(cell, i){


  });
});
}

//MOSTRAR SIN DIPLOMAS Y ALFABETICO
function listar_expedientes_alfabetico(){
  tbl_general_titulo = $("#tabla_registro_general").DataTable({
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
        "url":"../controller/registro_general/controlador_listar_registro_alfabeto.php",
        type:'POST'
    },
    dom: 'Bfrtip', 
    buttons:[ 
        {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            filename: function() {
                return  "LISTA GENERAL DE TITULADOS";
            },
            title: function() {
                return  "LISTA GENERAL DE TITULADOS";
            },
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
            }
        },
        {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i> ',
            titleAttr: 'Exportar a PDF',
            orientation: 'landscape',  // Exportar en formato horizontal
            filename: function() {
                return  "LISTA GENERAL DE TITULADOS";
            },
            title: function() {
                return  "LISTA GENERAL DE TITULADOS";
            },
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
            }
        },
        {
            extend: 'print',
            text: '<i class="fa fa-print"></i> ',
            titleAttr: 'Imprimir',
            title: function() {
                return  "LISTA GENERAL DE TITULADOS";
            },
            exportOptions: {
                columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
            }
        }
    ],
    "columns":[
      {"data":"Diploma_numero"},
       {
          "data": "number_informe",
          render: function(data, type, row) {
            return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
          }
        },
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
        },          {"data":"Dni"},
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
            {"data":"fecha_registro1"},



            {"data":"cede_nombre"},
            {
              data: "aumento",
              render: function (data, type, row) {
                console.log(row);
                if (data === 0) {
                  return "<button class='validar btn btn-primary btn-sm' style='margin-right: 10px;' title='Validar datos'><i class='fa fa-check'></i> Validar</button>";
                
                } else{
                  return "<button class='validar btn btn-success btn-sm' disabled style='margin-right: 10px;' title='Ya se validó'><i class='fa fa-check'></i> Ya esta Validado</button>";
                }
              }
            }
            ,
                          {"data":"fecha_vali"},

              {"data":"estado",
                  render: function(data,type,row){
                      if(data=='SIN DIPLOMA'){
                          return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                      }else if(data=='CON DIPLOMA'){
                          return '<span class="badge bg-success">CON DIPLOMA</span>';
                      }
                  } 
              },
              {"data":"Reglamento_metadado",
                  render: function (datae, type, row ) {
                      if(datae==''){
                          return "<a href="+datae+" target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                      } else {
                          return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>";
                      }
                  }
              },
             {"data":"Archivo",
            render: function(data,type,row){
                if(data=='controller/registro_general/documentos/' || data==''){
                    return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                } else {
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                }
            }   
        },
                {"data":"estado",
                render: function (data, type, row ) {
                  console.log(row);
                  if(data=='SIN DIPLOMA'){
                    return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button hidden class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos' ><i class='fa fa-trash'></i> Eliminar</button>&nbsp;<button style='margin-right: 10px;' class='pasar btn btn-info btn-sm' title='Pasar datos a titulado'><i class='fa fa-arrow-right'></i> Pasar a Bachiller</button>";             
                 }else if(data=='CON DIPLOMA'){
                    return "<button class='letra btn btn-dark btn-sm' style='margin-right: 10px;' title='Cambiar tamaño de letra a nombre'><i class='fa fa-edit'></i> Cambiar tamaño letra</button><button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
                  }
                }
              },
  ],

  "language":idioma_espanol,
  select: true
});

tbl_general_titulo.on('draw.td',function(){
var PageInfo = $("#tabla_registro_general").DataTable().page.info();
tbl_general_titulo.column(0, {page: 'current'}).nodes().each(function(cell, i){

});
});
}


//LISTAR POR FECHAS
function listar_fechas_busqueda(){
  let fechainicio = document.getElementById('txtfechainicio').value;
  let fechafin = document.getElementById('txtfechafin').value;

  tbl_general_titulo = $("#tabla_registro_general").DataTable({
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
          "url":"../controller/registro_general/controlador_listar_registro_general_fecha.php",
          type:'POST',
          data:{
              fechainicio:fechainicio,
              fechafin:fechafin,
          }
      },
      dom: 'Bfrtip', 
      buttons:[ 
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              orientation: 'landscape',  // Exportar en formato horizontal
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          }
      ],
      "columns":[
          {"data":"Diploma_numero"},
           {
          "data": "number_informe",
          render: function(data, type, row) {
            return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
          }
        },
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
            },          {"data":"Dni"},
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
            {"data":"fecha_registro1"},

            {"data":"cede_nombre"},
            {
              data: "aumento",
              render: function (data, type, row) {
                console.log(row);
                if (data === 0) {
                  return "<button class='validar btn btn-primary btn-sm' style='margin-right: 10px;' title='Validar datos'><i class='fa fa-check'></i> Validar</button>";
                
                } else{
                  return "<button class='validar btn btn-success btn-sm' disabled style='margin-right: 10px;' title='Ya se validó'><i class='fa fa-check'></i> Ya esta Validado</button>";
                }
              }
            }
            ,
                          {"data":"fecha_vali"},

              {"data":"estado",
                  render: function(data,type,row){
                      if(data=='SIN DIPLOMA'){
                          return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                      }else if(data=='CON DIPLOMA'){
                          return '<span class="badge bg-success">CON DIPLOMA</span>';
                      }
                  } 
              },
              {"data":"Reglamento_metadado",
                  render: function (datae, type, row ) {
                      if(datae==''){
                          return "<a href="+datae+" target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                      } else {
                          return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>";
                      }
                  }
              },
              {"data":"Archivo",
                  render: function(data,type,row){
                      if(data=='controller/registro_general/documentos/' || data==''){
                          return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                      } else {
                          return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                      }
                  }   
              },
                {"data":"estado",
                render: function (data, type, row ) {
                  console.log(row);
                  if(data=='SIN DIPLOMA'){
                    return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button hidden class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos' ><i class='fa fa-trash'></i> Eliminar</button>&nbsp;<button style='margin-right: 10px;' class='pasar btn btn-info btn-sm' title='Pasar datos a titulado'><i class='fa fa-arrow-right'></i> Pasar a Bachiller</button>";             
                 }else if(data=='CON DIPLOMA'){
                    return "<button class='letra btn btn-dark btn-sm' style='margin-right: 10px;' title='Cambiar tamaño de letra a nombre'><i class='fa fa-edit'></i> Cambiar tamaño letra</button><button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
                  }
                }
              },
      ],

      "language": idioma_espanol,
      select: true
  });
  tbl_general_titulo.on('draw.td',function(){
      var PageInfo = $("#tabla_registro_general").DataTable().page.info();
      tbl_general_titulo.column(0, {page: 'current'}).nodes().each(function(cell, i){
      });
  });
}


function listar_colacion(){
  let fechacol = document.getElementById('select_fechacola').value;

  tbl_general_titulo = $("#tabla_registro_general").DataTable({
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
          "url":"../controller/registro_general/controlador_listar_registro_general_colación.php",
          type:'POST',
          data:{
            fechacol:fechacol,
          }
      },
      dom: 'Bfrtip', 
      buttons:[ 
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              orientation: 'landscape',  // Exportar en formato horizontal
              filename: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              title: function() {
                  return  "LISTA GENERAL DE TITULADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6]  // Especifica las columnas a exportar hasta "estado"
              }
          }
      ],
      "columns":[
          {"data":"Diploma_numero"},
           {
          "data": "number_informe",
          render: function(data, type, row) {
            return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
          }
        },
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
            },          {"data":"Dni"},
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
            {"data":"fecha_registro1"},

            {"data":"cede_nombre"},
            {
              data: "aumento",
              render: function (data, type, row) {
                console.log(row);
                if (data === 0) {
                  return "<button class='validar btn btn-primary btn-sm' style='margin-right: 10px;' title='Validar datos'><i class='fa fa-check'></i> Validar</button>";
                
                } else{
                  return "<button class='validar btn btn-success btn-sm' disabled style='margin-right: 10px;' title='Ya se validó'><i class='fa fa-check'></i> Ya esta Validado</button>";
                }
              }
            }
            ,
                          {"data":"fecha_vali"},

              {"data":"estadiplo",
                  render: function(data,type,row){
                      if(data=='SIN DIPLOMA'){
                          return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                      }else if(data=='CON DIPLOMA'){
                          return '<span class="badge bg-success">CON DIPLOMA</span>';
                      }
                  } 
              },
              {"data":"Reglamento_metadado",
                  render: function (datae, type, row ) {
                      if(datae==''){
                          return "<a href="+datae+" target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                      } else {
                          return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>";
                      }
                  }
              },
              {"data":"Archivo",
                  render: function(data,type,row){
                      if(data=='controller/registro_general/documentos/' || data==''){
                          return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                      } else {
                          return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                      }
                  }   
              },
                {"data":"estadiplo",
                render: function (data, type, row ) {
                  console.log(row);
                  if(data=='SIN DIPLOMA'){
                    return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button hidden class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos' ><i class='fa fa-trash'></i> Eliminar</button>&nbsp;<button style='margin-right: 10px;' class='pasar btn btn-info btn-sm' title='Pasar datos a titulado'><i class='fa fa-arrow-right'></i> Pasar a Bachiller</button>";             
                 }else if(data=='CON DIPLOMA'){
                    return "<button class='letra btn btn-dark btn-sm' style='margin-right: 10px;' title='Cambiar tamaño de letra a nombre'><i class='fa fa-edit'></i> Cambiar tamaño letra</button><button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
                  }
                }
              },
      ],

      "language": idioma_espanol,
      select: true
  });
  tbl_general_titulo.on('draw.td',function(){
      var PageInfo = $("#tabla_registro_general").DataTable().page.info();
      tbl_general_titulo.column(0, {page: 'current'}).nodes().each(function(cell, i){
      });
  });
}


$('#tabla_registro_general').on('click','.mostrar',function(){
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_mas").modal('show');
  //DATOS DEL TITULADO
  document.getElementById('txt_tipo_documento').value=data.tipo_documento;

  document.getElementById('txt_dni_mas').value=data.Dni;
  document.getElementById('txt_nom_mas').value=data.Nombres;
  document.getElementById('txt_apepa_mas').value=data.Apellido_paterno;
  document.getElementById('txt_apema_mas').value=data.Apellido_materno;
  document.getElementById('txt_codigo_mas').value=data.Codigo;
  document.getElementById('select_sexo_mas').value=data.Sexo;
  document.getElementById('txt_movil_mas').value=data.Celular;
  document.getElementById('txt_dire_mas').value=data.Direccion;
  document.getElementById('txt_email_per_mas').value=data.correo_personal;
  document.getElementById('txt_email_insti_mas').value=data.correo_institucional;
  document.getElementById('txt_fecha_matri_mas').value=data.Fecha_matricula;
  document.getElementById('txt_fecha_egres_mas').value=data.Fecha_egreso;
  document.getElementById('txt_oberva_mas').value=data.Observaciones;
//DATOS DEL EXPEDIENTE
  document.getElementById('txt_cede_mas').value=data.cede_nombre;
  document.getElementById('txt_facultad_mas').value=data.Facultad;
  document.getElementById('txt_escuela_mas').value=data.Escuela;
  document.getElementById('txt_titulo_mas').value=data.Titulo_de;
  document.getElementById('txt_modalidad_mas').value=data.Modalidad;
  document.getElementById('txt_rector_mas').value=data.Autoridad_1;
  document.getElementById('txt_secretario_mas').value=data.Autoridad_2;
  document.getElementById('txt_decano_mas').value=data.Autoridad_3;
  document.getElementById('txt_fecha_reg_mas').value=data.expe;
  document.getElementById('txt_academi_mas').value=data.Acto_academico;
  document.getElementById('txt_acuerdo_mas').value=data.Acuerdo;
  document.getElementById('txt_Resolucion_mas').value=data.Resolucion_rectoral_N;
  document.getElementById('txt_expedicion_mas').value=data.Expedicion;
  document.getElementById('txt_libro_mas').value=data.Libro;
  document.getElementById('txt_folio_mas').value=data.Folio;
  document.getElementById('txt_registro_mas').value=data.Registro;
  //DATOS DE LA MODALIDAD Y DIPLOMA
  document.getElementById('txt_modo_estu_mas').value=data.Modo_estudio;
  document.getElementById('txt_trabajo_inve_mas').value=data.Trabajo_investigacion;
  document.getElementById('txt_metadata_mas').value=data.Reglamento_metadado;
  document.getElementById('txt_turni_mas').value=data.Turnitin;
  document.getElementById('txt_porce_mas').value=data.Porcentaje;
  document.getElementById('txt_centro_inve_mas').value=data.Centro_investigacion;
  document.getElementById('txt_proceden_bachi_mas').value=data.Proce_bachiller;
  document.getElementById('txt_procedeni_insti_ori_mas').value=data.Proce_insti_origen;
  document.getElementById('txt_proceden_titu_ori_mas').value=data.Proce_titulo_peda;
  document.getElementById('txt_fecha_matri_mod_mas').value=data.Fecha_matricula_modalidad;
  document.getElementById('txt_fecha_inicio_mod_mas').value=data.Fecha_inicio_modalidad;
  document.getElementById('txt_fecha_fin_mas').value=data.Fecha_fin_modalidad;
  document.getElementById('select_modo_sustenta_mas').value=data.Modo_sustentacion;
  
  document.getElementById('txt_fecha_cu_mas').value=data.fecha_consejo_uni;
  document.getElementById('txt_fecha_firma_mas').value=data.fecha_firma;


  document.getElementById('txt_resol_num').value=data.Resolucion_numero;
  document.getElementById('txt_fecha_reso_mas').value=data.fecha_resolucion;
  document.getElementById('txt_diploma_nume_mas').value=data.Diploma_numero;
  document.getElementById('txt_registro_n°_mas').value=data.Registro_numero;
  document.getElementById('txt_registro_libr_mas').value=data.Registro_libro;
  document.getElementById('txt_registro_folio_mas').value=data.Registro_folio;
  document.getElementById('select_tipo_diplo_mas').value=data.Diploma_tipo_emitido;
  document.getElementById('txt_fecha_inicio_tra_mas').value=data.Fecha_inicio_tramite;
  document.getElementById('txt_nro_credi_mas').value=data.Nro_creditos;
  document.getElementById('txt_nro_oficio_mas').value=data.Nro_oficio;
  document.getElementById('txt_fecha_secre_mas').value=data.fecha_secreatria_general;

})


//EDITAR
$('#tabla_registro_general').on('click','.editar',function(){
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_editar").modal('show');
  //DATOS DEL TITULADO

  document.getElementById('txt_tipo_documento_editar').value=data.tipo_documento;

  document.getElementById('txt_dni_editar').value=data.Dni;
  document.getElementById('txt_nom_editar').value=data.Nombres;
  document.getElementById('txt_apepa_editar').value=data.Apellido_paterno;
  document.getElementById('txt_apema_editar').value=data.Apellido_materno;
  document.getElementById('txt_codigo_editar').value=data.Codigo;
  document.getElementById('select_sexo_editar').value=data.Sexo;
  document.getElementById('txt_movil_editar').value=data.Celular;
  document.getElementById('txt_dire_editar').value=data.Direccion;
  document.getElementById('txt_email_per_editar').value=data.correo_personal;
  document.getElementById('txt_email_insti_editar').value=data.correo_institucional;
  document.getElementById('txt_fecha_matri_editar').value=data.Fecha_matricula;
  document.getElementById('txt_fecha_egres_editar').value=data.Fecha_egreso;
  document.getElementById('txt_oberva_editar').value=data.Observaciones;
//DATOS DEL EXPEDIENTE
document.getElementById('txt_id_expediente').value=data.Id_expediente;



  $("#txt_cede_editar").select2().val(data.Id_cede).trigger('change.select2');
  $("#txt_escuela_editar").select2().val(data.Id_escuela).trigger('change.select2');

  document.getElementById('txt_titulo_editar').value=data.Titulo_de;
  document.getElementById('txt_modalidad_editar').value=data.Modalidad;
  document.getElementById('id_autoridad_editar').value=data.id_autoridad;

  document.getElementById('txt_rector_editar').value=data.Autoridad_1;
  document.getElementById('txt_secretario_editar').value=data.Autoridad_2;
  document.getElementById('txt_decano_editar').value=data.Autoridad_3;
  document.getElementById('txt_fecha_reg_editar').value=data.expe;
  document.getElementById('txt_academi_editar').value=data.Acto_academico;
  document.getElementById('txt_acuerdo_editar').value=data.Acuerdo;
  document.getElementById('txt_Resolucion_editar').value=data.Resolucion_rectoral_N;
  document.getElementById('txt_expedicion_editar').value=data.Expedicion;
  document.getElementById('txt_libro_editar').value=data.Libro;
  document.getElementById('txt_folio_editar').value=data.Folio;
  document.getElementById('txt_registro_editar').value=data.Registro;
  document.getElementById('txt_archivo_actual').value=data.Archivo;

  //DATOS DE LA MODALIDAD Y DIPLOMA
  document.getElementById('txt_id_modalidad').value=data.Id_modalidad;
  document.getElementById('txt_modo_estu_editar').value=data.Modo_estudio;
  document.getElementById('txt_trabajo_inve_editar').value=data.Trabajo_investigacion;
  document.getElementById('txt_metadata_editar').value=data.Reglamento_metadado;
  document.getElementById('txt_turni_editar').value=data.Turnitin;
  document.getElementById('txt_porce_editar').value=data.Porcentaje;
  document.getElementById('txt_centro_inve_editar').value=data.Centro_investigacion;
  document.getElementById('txt_proceden_bachi_editar').value=data.Proce_bachiller;
  document.getElementById('txt_procedeni_insti_ori_editar').value=data.Proce_insti_origen;
  document.getElementById('txt_proceden_titu_ori_editar').value=data.Proce_titulo_peda;
  document.getElementById('txt_fecha_matri_mod_editar').value=data.Fecha_matricula_modalidad;
  document.getElementById('txt_fecha_inicio_mod_editar').value=data.Fecha_inicio_modalidad;
  document.getElementById('txt_fecha_fin_editar').value=data.Fecha_fin_modalidad;
  document.getElementById('select_modo_sustenta_editar').value=data.Modo_sustentacion;


  document.getElementById('txt_id_diploma').value=data.Id_Diploma;
    
  document.getElementById('txt_fecha_cu_editar').value=data.fecha_consejo_uni;
  document.getElementById('txt_fecha_firma_editar').value=data.fecha_firma;
  document.getElementById('txt_resol_editar').value=data.Resolucion_numero;
  document.getElementById('txt_fecha_reso_editar').value=data.fecha_resolucion;
  document.getElementById('txt_diploma_nume_editar').value=data.Diploma_numero;
  document.getElementById('txt_registro_n°_editar').value=data.Registro_numero;
  document.getElementById('txt_registro_libr_editar').value=data.Registro_libro;
  document.getElementById('txt_registro_folio_editar').value=data.Registro_folio;
  document.getElementById('select_tipo_diplo_editar').value=data.Diploma_tipo_emitido;
  document.getElementById('txt_fecha_inicio_tra_editar').value=data.Fecha_inicio_tramite;
  document.getElementById('txt_nro_credi_editar').value=data.Nro_creditos;
  document.getElementById('txt_nro_oficio_editar').value=data.Nro_oficio;
  document.getElementById('txt_fecha_secre_editar').value=data.fecha_secreatria_general;



})

//AGREGAR DIPLOMA
$('#tabla_registro_general').on('click','.agregar',function(){
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_registrar_diploma").modal('show');
  document.getElementById('lb_titulo_datos2').innerHTML="<b>DNI: </b>"+data.Dni;
  document.getElementById('lb_titulo_datos3').innerHTML="<b>ESTUDIANTE: </b>"+data.Estudiante;
  document.getElementById('lb_titulo_datos4').innerHTML="<b>FACULTAD - ESCUELA PROFESIONAL: </b>"+data.Facultad+" - "+data.Escuela;
  document.getElementById('lb_titulo_datos5').innerHTML="<b>MODALIDAD</b>: </b>"+data.Modo_obtencion;

  document.getElementById('id_expe').value=data.Id_expediente;
  document.getElementById('txt_id_diplo').value=data.Id_Diploma;

  document.getElementById('txt_fecha_cu').value=data.fecha_consejo_uni;
  document.getElementById('txt_fecha_firma').value=data.fecha_firma_consejo;
  document.getElementById('txt_fecha_secre').value=data.fecha_colación;
  document.getElementById('txt_fecha_reso').value=data.fecha_resolucion;
    document.getElementById('txt_nro_oficio').value=data.numero_oficio;
//ENVIOS CORREO
    document.getElementById('txt_fecha_cola').value=data.fecha_colación;
    document.getElementById('txt_correo').value=data.correo_personal;
//ENVIOS CORREO DATOS
document.getElementById('nom').value=data.Nombres;
document.getElementById('ape').value=data.Apellido_paterno;
document.getElementById('mate').value=data.Apellido_materno;



  Traernumero();

})

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
    document.getElementById('select_fechacola_varios').innerHTML = cadena;

  });
}
  function Cargar_Select_Cede(){
    $.ajax({
      url: "../controller/expediente_bachiller/controlador_cargar_select_cede.php",
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
      document.getElementById('select_cede').innerHTML = cadena;
      document.getElementById('txt_cede_editar').innerHTML = cadena;
      document.getElementById('txtfilial').innerHTML = cadena;
    });
  }

  function Cargar_Select_Carrera_editar() {
    $.ajax({
      "url": "../controller/expediente_titulado/controlador_cargar_select_carrerasolo.php",
      type: 'POST',
    }).done(function(resp) {
      console.log("Respuesta de la solicitud AJAX:", resp); // Depura la respuesta del servidor
      let data = JSON.parse(resp);
      let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio

      if (data.length > 0) {
        for (let i = 0; i < data.length; i++) {
          cadena += "<option value='" + data[i][0] + "'>FACULTAD: " + data[i][1] + " - ESCUELA: " + data[i][2] + "</option>";
        }
  
        console.log("Cadena generada para el select:", cadena); // Depurar la cadena generada
        document.getElementById('txt_escuela_editar').innerHTML = cadena;
  
        var id = $("#txt_escuela_editar").val();
        console.log("ID seleccionado después de cargar las opciones:", id);
        Traergrado(id);
      } else {
        cadena += "<option value=''>No hay tipos disponibles</option>";
        document.getElementById('txt_escuela_editar').innerHTML = cadena;
        console.log("No hay datos para cargar.");
      }
    }).fail(function(xhr, status, error) {
      console.log("Error en la solicitud AJAX:", status, error);
    });
  }


function Cargar_Select_Facultad(){
  $.ajax({
    "url":"../controller/carreras/controlador_cargar_select_facultad.php",
    type:'POST',
   
  }).done(function(resp){
    let data=JSON.parse(resp);
    let cadena = "<option value=''>Seleccione</option>";
    if(data.length>0){
      for(var i=0; i < data.length; i++){
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
      }
      $('#select_facultad').html(cadena);
      $('#txtfacu').html(cadena);
      $('#txtfacu_filial').html(cadena);

      var id =$("#select_facultad").val();
      Cargar_Select_facul_carrera(id);
      
      var id =$("#txtfacu").val();
      Cargar_Select_facul_carrera(id);

      var id=$("#txtfacu_filial").val();
      Cargar_Select_facul_carrera(id);

    }
    else{
      cadena+="<option value=''>No se encontraron registros</option>";
      $('#select_facultad').html(cadena);
    }
  })
}

function Traerauto(id_auto){
  $.ajax({
    "url":"../controller/expediente_titulado/controlador_traerautoridad.php",
    type:'POST',
    data:{
      id_auto:id_auto
    }
  }).done(function(resp){
    var data = JSON.parse(resp);
    var cadena="";
    if(data.length>0){
      $("#id_autoridad").val(data[0][2]);
      $("#txt_rector").val(data[0][3]);
      $("#txt_secretario").val(data[0][4]);
      $("#txt_decano").val(data[0][5]);

      $("#id_autoridad_editar").val(data[0][2]);
      $("#txt_rector_editar").val(data[0][3]);
      $("#txt_secretario_editar").val(data[0][4]);
      $("#txt_decano_editar").val(data[0][5]);
    }
    else{
      cadena+="<option value=''>No se encontraron registros</option>";
      $("#id_autoridad").val(data[0][2]);
      $("#txt_rector").val(data[0][3]);
      $("#txt_secretario").val(data[0][4]);
      $("#txt_decano").val(data[0][5]);

      $("#id_autoridad_editar").val(data[0][2]);
      $("#txt_rector_editar").val(data[0][3]);
      $("#txt_secretario_editar").val(data[0][4]);
      $("#txt_decano_editar").val(data[0][5]);
    }
  })
}

function Cargar_Select_facul_carrera(id){
  $.ajax({
    "url":"../controller/expediente_titulado/controlador_cargar_select_facu_carrera.php",
    type:'POST',
    data:{
      id:id
    }
  }).done(function(resp){
    var data = JSON.parse(resp);
    var cadena="<option value=''>Seleccione</option>";
    if(data.length > 0){
      for(var i=0; i < data.length; i++){
        cadena += "<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
      }
      $('#select_escuela').html(cadena);
      $('#txtes').html(cadena);
      $('#txtes_filial').html(cadena);

      // Esperar a que el usuario seleccione un valor antes de llamar a Traerauto
      $('#select_escuela').on('change', function() {
        var idSeleccionado = $(this).val();
        if (idSeleccionado) {
          Traergrado(idSeleccionado);
          Traerauto(idSeleccionado);
        }
      });

    } else {
      cadena += "<option value=''>No se encontraron registros</option>";
      $('#select_escuela').html(cadena);
      $('#txtes').html(cadena);
      $('#txtes_filial').html(cadena);
    }
  });
}


function Traergrado(idgrado) {
  console.log("Ejecutando Traergrado con ID:", idgrado);

  $.ajax({
    "url": "../controller/expediente_titulado/controlador_traergrado.php",
    type: 'POST',
    data: { 
      id: idgrado 
    }
  }).done(function(resp) {
    console.log("Respuesta de Traergrado:", resp);
    var data = JSON.parse(resp);

    if (data.length > 0) {
      var genero = $("#select_sexo").val();
      var genero2 = $("#select_sexo_editar").val();
      var carrera = data[0][0];
  
      var titulo = "";
      if (genero === "M" || genero2 === "M") {
        if (carrera == 1) {
          titulo = "Ingeniero de Sistemas e Informática";
        } else if (carrera == 3) {
          titulo = "Ingeniero Civil";
        } else if (carrera == 5) {
          titulo = "Ingeniero Agrónomo";
        } else if (carrera == 7) {
          titulo = "Ingeniero Ambiental";
        } else if (carrera == 9) {
          titulo = "Abogado";
        } else if (carrera == 12) {
          titulo = "Contador Público";
        } else if (carrera == 13) {
          titulo = "Licenciado en Turismo, Hotelería y Gastronomía";
        } else if (carrera == 16) {
          titulo = "Licenciado en Enfermería";
        } else if (carrera == 18) {
          titulo = "Cirujano Dentista";
        } else if (carrera == 20) {
          titulo = "Licenciado en Educación - Nivel Inicial";
        } else if (carrera == 21) {
          titulo = "Licenciado en Educación – Especialidad Lengua Española y Quechua";
        } else if (carrera == 22) {
          titulo = "Licenciado en Educación – Especialidad Matemática e Informática";
        } else if (carrera == 23) {
          titulo = "Licenciado en Educación – Nivel Primaria";
        }
      } else if (genero === "F" || genero2 === "F") {
        if (carrera == 1) {
          titulo = "Ingeniera de Sistemas e Informática";
        } else if (carrera == 3) {
          titulo = "Ingeniera Civil";
        } else if (carrera == 5) {
          titulo = "Ingeniera Agrónoma";
        } else if (carrera == 7) {
          titulo = "Ingeniera Ambiental";
        } else if (carrera == 9) {
          titulo = "Abogada";
        } else if (carrera == 12) {
          titulo = "Contadora Pública";
        } else if (carrera == 13) {
          titulo = "Licenciada en Turismo, Hotelería y Gastronomía";
        } else if (carrera == 16) {
          titulo = "Licenciada en Enfermería";
        } else if (carrera == 18) {
          titulo = "Cirujano Dentista";
        } else if (carrera == 20) {
          titulo = "Licenciada en Educación - Nivel Inicial";
        } else if (carrera == 21) {
          titulo = "Licenciada en Educación – Especialidad Lengua Española y Quechua";
        } else if (carrera == 22) {
          titulo = "Licenciada en Educación – Especialidad Matemática e Informática";
        } else if (carrera == 23) {
          titulo = "Licenciada en Educación – Nivel Primaria";
        }
      }
  
      console.log("Título determinado:", titulo);
      $("#txt_titulo").val(titulo);
      $("#txt_titulo_editar").val(titulo);
    } else {
      console.log("No se encontraron registros.");
      $('#txt_titulo').val("No se encontraron registros");
      $('#txt_titulo_editar').val("No se encontraron registros");
    }
  }).fail(function(xhr, status, error) {
    console.log("Error en la solicitud AJAX de Traergrado:", status, error);
  });
}

  
//EDICION



function AbrirModal(){
  $("#modal_registro").modal({backdrop:'static',keyboard:false})
  $("#modal_registro").modal('show');
  listar_autoridad();
}

  //AGREGAR DIPLOMA
function Agregar_diploma() {
  let idexpe = document.getElementById('id_expe').value;
  let id = document.getElementById('txt_id_diplo').value;
  let fechacu = document.getElementById('txt_fecha_cu').value;
  let fechafirma = document.getElementById('txt_fecha_firma').value;
  let numreso = document.getElementById('txt_nume_resol').value;
  let fechareso = document.getElementById('txt_fecha_reso').value;
  let diplonum = document.getElementById('txt_diploma_nume').value;
  let regis = document.getElementById('txt_registro_n°').value;
  let regilibro = document.getElementById('txt_registro_libr').value;
  let regisfolio = document.getElementById('txt_registro_folio').value;
  let tipodiplo = document.getElementById('select_tipo_diplo').value;
  let fechainiciotra = document.getElementById('txt_fecha_inicio_tra').value;
  let nrocred = parseInt(document.getElementById('txt_nro_credi').value);
  let nrooficio = document.getElementById('txt_nro_oficio').value;
  let fechasecre = document.getElementById('txt_fecha_secre').value;
  let fechamatri = document.getElementById('txt_fecha_matricula').value;
  let fechaegre = document.getElementById('txt_fecha_egreso').value;

  let idusuario = document.getElementById('txtprincipalid').value;
  let correo = document.getElementById('txt_correo').value;
  let fechacol = document.getElementById('txt_fecha_cola').value;

  let nom = document.getElementById('nom').value;
  let ape = document.getElementById('ape').value;
  let mate = document.getElementById('mate').value;

  // Validar campos vacíos
  if (
    fechacu.length === 0 || fechafirma.length === 0 || numreso.length === 0 || fechareso.length === 0 ||
    tipodiplo.length === 0 || diplonum.length === 0 || regis.length === 0 || regilibro.length === 0 ||
    regisfolio.length === 0 || fechainiciotra.length === 0 || isNaN(nrocred) || nrooficio.length === 0 ||
    fechasecre.length === 0 
  ) {
    return Swal.fire("Mensaje de Advertencia", "Tiene campos vacíos", "warning");
  }
  
  if (fechamatri.length === 0 || fechaegre.length === 0) {
    return Swal.fire("Mensaje de Advertencia", "La fecha de matrícula y fecha de egreso son importantes", "warning");
  }

  // Función para validar si una fecha es válida
  function esFechaValida(fechaString) {
    let fecha = new Date(fechaString);
    return fecha instanceof Date && !isNaN(fecha) && fechaString.match(/^\d{4}-\d{2}-\d{2}$/);
  }

  // Validar que todas las fechas sean válidas
  let fechasAValidar = [
    { valor: fechacu, nombre: "fecha de culminación" },
    { valor: fechafirma, nombre: "fecha de firma" },
    { valor: fechareso, nombre: "fecha de resolución" },
    { valor: fechainiciotra, nombre: "fecha de inicio de trámite" },
    { valor: fechasecre, nombre: "fecha de secretaría" },
    { valor: fechamatri, nombre: "fecha de matrícula" },
    { valor: fechaegre, nombre: "fecha de egreso" },
    { valor: fechacol, nombre: "fecha de colegiatura" }
  ];

  for (let i = 0; i < fechasAValidar.length; i++) {
    if (!esFechaValida(fechasAValidar[i].valor)) {
      return Swal.fire("Mensaje de Advertencia", `La ${fechasAValidar[i].nombre} no es válida. Use el formato AAAA-MM-DD`, "warning");
    }
  }

  // Validar que nrocred no sea menor a 210
  if (nrocred < 210) {
    return Swal.fire("Mensaje de Advertencia", "El número de créditos no puede ser menor a 210", "warning");
  }

  let fechaMatricula = new Date(fechamatri);
  let fechaEgreso = new Date(fechaegre);
  let fechaInicioTramite = new Date(fechainiciotra);
  let añoActual = new Date().getFullYear();

  // Validar que la fecha de inicio de trámite sea del año actual
  if (fechaInicioTramite.getFullYear() !== añoActual) {
    return Swal.fire("Mensaje de Advertencia", `La fecha de inicio de trámite debe ser del año actual (${añoActual})`, "warning");
  }

  // Validar que fecha de matrícula no sea mayor a fecha de egreso
  if (fechaMatricula > fechaEgreso) {
    return Swal.fire("Mensaje de Advertencia", "La fecha de matrícula no puede ser mayor a la fecha de egreso", "warning");
  }

  // Validar que la fecha de egreso no sea menor a la fecha de matrícula
  if (fechaEgreso < fechaMatricula) {
    return Swal.fire("Mensaje de Advertencia", "La fecha de egreso no puede ser menor a la fecha de matrícula", "warning");
  }

  // Validar que la diferencia entre matrícula y egreso sea >= 5 años (CORREGIDO)
  let diferenciaAnios = fechaEgreso.getFullYear() - fechaMatricula.getFullYear();
  let mesesDiferencia = fechaEgreso.getMonth() - fechaMatricula.getMonth();
  let diasDiferencia = fechaEgreso.getDate() - fechaMatricula.getDate();
  
  // Ajustar si los meses o días hacen que no se complete el año
  if (mesesDiferencia < 0 || (mesesDiferencia === 0 && diasDiferencia < 0)) {
    diferenciaAnios--;
  }
  
  if (diferenciaAnios < 5) {
    return Swal.fire("Mensaje de Advertencia", "El período entre la fecha de matrícula y la fecha de egreso debe ser de al menos 5 años completos", "warning");
  }

  // Validar que la fecha de inicio de trámite no sea antes de la fecha de egreso
  if (fechaInicioTramite < fechaEgreso) {
    return Swal.fire("Mensaje de Advertencia", "La fecha de inicio de trámite no puede ser antes de la fecha de egreso", "warning");
  }

  $.ajax({
    url: "../controller/registro_general/controlador_agregar_diploma_titulo.php",
    type: 'POST',
    data: {
      idexpe, id, fechacu, fechafirma, numreso, fechareso, diplonum, regis, regilibro, regisfolio,
      tipodiplo, fechainiciotra, nrocred, nrooficio, fechasecre, fechamatri, fechaegre, idusuario, correo, fechacol, nom, ape, mate
    }
  }).done(function(resp) {
    if (resp.status) {
      contadorFolio++;
      contadorLibro++;

      localStorage.setItem("contadorFolio", contadorFolio);
      localStorage.setItem("contadorLibro", contadorLibro);

      console.log(contadorFolio, contadorLibro);
      Swal.fire("Mensaje de Confirmación", resp.message, "success");
      var url = "../view/MPDF/REPORTE/diploma.php?codigo=" + id + "&tamaño=55&tamaño2=93&tamaño3=83&tamaño4=41#zoom=100%";
      tbl_general_titulo.ajax.reload();
      $("#modal_registrar_diploma").modal('hide');
      var newWindow = window.open(url, "DIPLOMA TITULO PROFESIONAL", "scrollbars=NO");
      if (newWindow) {
        newWindow.moveTo(0, 0);
        newWindow.resizeTo(screen.width, screen.height);
      }
    } else {
      Swal.fire("Mensaje de Error", resp.message, "error");
    }
  });
}


  function Traernumero() {
  $.ajax({
    url: "../controller/registro_general/controlador_traernumero_titulo.php",
    type: 'POST'
  }).done(function(resp) {
    var data = JSON.parse(resp);
    var valor = data.length > 0 ? data[0][0] : "No se encontraron registros";
    var valor2 = data.length > 0 ? data[0][1] : "No se encontraron registros";
    var valor3 = data.length > 0 ? data[0][2] : "No se encontraron registros";
    var valor4 = data.length > 0 ? parseInt(data[0][3]) || 0 : 0; // Convertir a número o establecer 0
    var valor5 = data.length > 0 ? parseInt(data[0][4]) || 0 : 0; // Convertir a número o establecer 0

    // Incrementar el folio si el contador ya alcanzó 2
    if (contadorFolio >= 20) {
      contadorFolio = 0; // Reiniciar el contador
      localStorage.setItem("contadorFolio", contadorFolio); // Actualizar localStorage
      valor5+=2; // Incrementar el folio
    }
    if (contadorLibro >= 100) {
      contadorLibro = 0; // Reiniciar el contador
      localStorage.setItem("contadorLibro", contadorLibro); // Actualizar localStorage
      valor4+=1; // Incrementar el folio
    }
    // Concatenar el valor5 con su incremento
    let concatenatedValue = `${valor5}-${valor5 + 1}`;
    let concatenatedValue2 = `${valor4}`;

    // Asignar valores a los inputs
    document.getElementById('txt_nume_resol').value = valor;
    document.getElementById('txt_diploma_nume').value = valor2;
    document.getElementById('txt_registro_n°').value = valor3;
    document.getElementById('txt_registro_libr').value = concatenatedValue2;

    document.getElementById('txt_registro_folio').value = concatenatedValue;
  }).fail(function(jqXHR, textStatus, errorThrown) {
    console.error("Error en la solicitud: " + textStatus, errorThrown);
    $("#lbl_numero").text("Error al obtener los datos");
    document.getElementById('txt_dni').value = "Error al obtener los datos";
  });
}



//REGISTRAR TITULADO
function Registrar_Titulado(){
  //DATOS DEL ESTUDIANTE
  let tipodoc = document.getElementById('select_tipo_documento').value;

  let dni = document.getElementById('txt_dni').value;
  let nombres = document.getElementById('txt_nom').value;
  let apepa = document.getElementById('txt_apepa').value;
  let apema = document.getElementById('txt_apema').value;
  let codigo=document.getElementById('txt_codigo').value;
  let sexo = document.getElementById('select_sexo').value;
  let celular = document.getElementById('txt_movil').value;
  let direc = document.getElementById('txt_dire').value;
  let emaper = document.getElementById('txt_email_per').value;
  let emainsti = document.getElementById('txt_email_insti').value;
  let fecha_matr = document.getElementById('txt_fecha_matri').value;
  let fecha_egre = document.getElementById('txt_fecha_egres').value;
  let observa = document.getElementById('txt_oberva').value;
//DATOS DEL EXPEDIENTE

  let ced = document.getElementById('select_cede').value;
  let esc = document.getElementById('select_escuela').value;
  let titu = document.getElementById('txt_titulo').value;
  let moda = document.getElementById('txt_modalidad').value;
  let idauto = document.getElementById('id_autoridad').value;
  let fecha = document.getElementById('txt_fecha_reg').value;
  let acad = document.getElementById('txt_academi').value;
  let acu = document.getElementById('txt_acuerdo').value;
  let res = document.getElementById('txt_Resolucion').value;
  let exped = document.getElementById('txt_expedicion').value;
  let lib = document.getElementById('txt_libro').value;
  let fol = document.getElementById('txt_folio').value;
  let reg = document.getElementById('txt_registro').value;
  let arc = document.getElementById('txt_archivo').value;

  //DATOS DE LA MODALIDAD
  let mod_estu = document.getElementById('txt_modo_estu').value;
  let tra_inv = document.getElementById('txt_trabajo_inve').value;
  let turn = document.getElementById('txt_turni').value;
  let porc = document.getElementById('txt_porce').value;
  let cent = document.getElementById('txt_centro_inve').value;
  let meta = document.getElementById('txt_metadata').value;
  let proce_bach = document.getElementById('txt_proceden_bachi').value;
  let proce_insti = document.getElementById('txt_procedeni_insti_ori').value;
  let proce_titu = document.getElementById('txt_proceden_titu_ori').value;
  let fecha_matri = document.getElementById('txt_fecha_matri_mod').value;
  let fecha_inici = document.getElementById('txt_fecha_inicio_mod').value;
  let fecha_fin = document.getElementById('txt_fecha_fin').value;
  let mod_sustenta = document.getElementById('select_modo_sustenta').value;
  let idusuario = document.getElementById('txtprincipalid').value;
  if (ced === '') { // Comprueba si no hay un valor seleccionado
    return Swal.fire("Mensaje de Advertencia", "Seleccione una cede en la segunda pestaña", "warning");
  }
    if (moda === '') { // Comprueba si no hay un valor seleccionado
    return Swal.fire("Mensaje de Advertencia", "Seleccione una modalidad en la segunda pestaña", "warning");
  }
      if (esc === '') { // Comprueba si no hay un valor seleccionado
    return Swal.fire("Mensaje de Advertencia", "Seleccione una facultad y programa profesional", "warning");
  }
    if(validar_email(emaper)){

    }else{
      return Swal.fire("Mensaje de Advertencia","El formato de Email es incorrecto","warning");
  
    }

    let extension = arc.split('.').pop();//DOCUMENTO.PPT
    let nombrearchivo="";
    let f = new Date();
    let documentoFinal = '';
    if(tipodoc === 'DNI') {
        if(dni.length === 0) {
            return Swal.fire("Mensaje de Advertencia", "El campo DNI es obligatorio", "warning");
        }
        documentoFinal = dni;
    } else {
        if(doc.length === 0) {
            return Swal.fire("Mensaje de Advertencia", "El campo de documento es obligatorio", "warning");
        }
        documentoFinal = doc;
    }
   // Validación general de campos
if(nombres.length === 0 || apepa.length === 0 || 
  apema.length === 0 || sexo.length === 0 || celular.length === 0 || 
  direc.length === 0 || fecha_matr.length === 0 || fecha_egre.length === 0) {
   return Swal.fire("Mensaje de Advertencia", "Tiene campos vacíos, revise por favor", "warning");
}

    if(arc.length>0){
      nombrearchivo="EXPE-"+dni+"-"+f.getDate()+"-"+(f.getMonth()+1)+"-"+f.getFullYear()+"-"+f.getHours()+"-"+f.getMinutes()+"-"+f.getSeconds()+"."+extension;
    }

    if(mod_estu.length==0){
      return Swal.fire("Mensaje de Advertencia","El modo de estudio es un campo obligatorio","warning");
    }
   



    let formData = new FormData();
    let achivoobj = $("#txt_archivo")[0].files[0];//El objeto del archivo adjuntado

    //DATOS DEL ESTUDIANTE
    formData.append("tipodoc",tipodoc);
    formData.append("documentoFinal",documentoFinal);
    formData.append("nombres",nombres);
    formData.append("apepa",apepa);
    formData.append("apema",apema);
    formData.append("codigo",codigo);
    formData.append("sexo",sexo);
    formData.append("celular",celular);
    formData.append("direc",direc);
    formData.append("emaper",emaper);
    formData.append("emainsti",emainsti);
    formData.append("fecha_matr",fecha_matr);
    formData.append("fecha_egre",fecha_egre);
    formData.append("observa",observa);
    //DATOS DEL EXPEDIENTE
    

    formData.append("ced",ced);
    formData.append("esc",esc);
    formData.append("titu",titu);
    formData.append("moda",moda);
    formData.append("idauto",idauto);
    formData.append("fecha",fecha);
    formData.append("acad",acad);
    formData.append("acu",acu);
    formData.append("res",res);
    formData.append("exped",exped);
    formData.append("lib",lib);
    formData.append("fol",fol);
    formData.append("reg",reg);
    formData.append("nombrearchivo",nombrearchivo);
    formData.append("achivoobj",achivoobj);

    //DATOS DE LA MODALIDAD
    formData.append("mod_estu",mod_estu);
    formData.append("tra_inv",tra_inv);
    formData.append("turn",turn);
    formData.append("porc",porc);
    formData.append("cent",cent);
    formData.append("meta",meta);
    formData.append("proce_bach",proce_bach);
    formData.append("proce_insti",proce_insti);
    formData.append("proce_titu",proce_titu);
    formData.append("fecha_matri",fecha_matri);
    formData.append("fecha_inici",fecha_inici);
    formData.append("fecha_fin",fecha_fin);
    formData.append("mod_sustenta",mod_sustenta);
    formData.append("idusuario",idusuario);

    $.ajax({
      url: "../controller/registro_general/controlador_registro_titulado.php",
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json', // Especificamos que esperamos JSON
      success: function(resp) {
          if (resp.status) {
              Swal.fire("Mensaje de Confirmación", resp.message, "success").then((value) => {
                  
                  tbl_general_titulo.ajax.reload();
                  $("#modal_registro").modal('hide');
                  // Limpieza de campos
                  limpiarCampos();
              });
          } else {
              Swal.fire("Mensaje de Advertencia", resp.message, "warning");
          }
      },
      error: function(xhr, status, error) {
          Swal.fire("Error", "Ocurrió un error en la solicitud: " + error, "error");
      }
  });
  return false;

}
function limpiarCampos() {
  document.getElementById('txt_dni').value = "";
  document.getElementById('txt_nom').value = "";
  document.getElementById('txt_apepa').value = "";
  document.getElementById('txt_apema').value = "";
  document.getElementById('txt_codigo').value = "";
  document.getElementById('txt_movil').value = "";
  document.getElementById('txt_dire').value = "";
  document.getElementById('txt_email_per').value = "";
  document.getElementById('txt_email_insti').value = "";
  document.getElementById('txt_oberva').value = "";
  document.getElementById('txt_academi').value = "";
  document.getElementById('txt_acuerdo').value = "";
  document.getElementById('txt_Resolucion').value = "";
  document.getElementById('txt_expedicion').value = "";
  document.getElementById('txt_libro').value = "";
  document.getElementById('txt_folio').value = "";
  document.getElementById('txt_registro').value = "";
  document.getElementById('txt_trabajo_inve').value = "";
  document.getElementById('txt_turni').value = "";
  document.getElementById('txt_porce').value = "";
  document.getElementById('txt_centro_inve').value = "";
  document.getElementById('txt_metadata').value = "";
  document.getElementById('txt_proceden_bachi').value = "";
  document.getElementById('txt_procedeni_insti_ori').value = "";
  document.getElementById('txt_proceden_titu_ori').value = "";
  document.getElementById('txt_fecha_matri_mod').value = "";
    document.getElementById('txt_rector').value = "";
  document.getElementById('txt_secretario').value = "";
  document.getElementById('txt_decano').value = "";

    document.getElementById('txt_titulo').value = "";

  document.getElementById('txt_fecha_inicio_mod').value = "";
  document.getElementById('txt_fecha_fin').value = "";
  
      document.getElementById('txt_modalidad').value = "";
            document.getElementById('select_cede').value = "";
            document.getElementById('select_sexo').value = "";


  Cargar_Select_Facultad();

}

function validar_email(email) {
  var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email) ? true : false;
}

function Modificar_Titulado(){

  //DATOS DEL ESTUDIANTE

  let dni = document.getElementById('txt_dni_editar').value;
  let nombres = document.getElementById('txt_nom_editar').value;
  let apepa = document.getElementById('txt_apepa_editar').value;
  let apema = document.getElementById('txt_apema_editar').value;
  let codigo=document.getElementById('txt_codigo_editar').value;
  let sexo = document.getElementById('select_sexo_editar').value;
  let celular = document.getElementById('txt_movil_editar').value;
  let direc = document.getElementById('txt_dire_editar').value;
  let emaper = document.getElementById('txt_email_per_editar').value;
  let emainsti = document.getElementById('txt_email_insti_editar').value;
  let fecha_matr = document.getElementById('txt_fecha_matri_editar').value;
  let fecha_egre = document.getElementById('txt_fecha_egres_editar').value;
  let observa = document.getElementById('txt_oberva_editar').value;
//DATOS DEL EXPEDIENTE


  let idexpe = document.getElementById('txt_id_expediente').value;
  let ced = document.getElementById('txt_cede_editar').value;
  let esc = document.getElementById('txt_escuela_editar').value;
  let titu = document.getElementById('txt_titulo_editar').value;
  let moda = document.getElementById('txt_modalidad_editar').value;
  let idauto = document.getElementById('id_autoridad_editar').value;
  let fecha = document.getElementById('txt_fecha_reg_editar').value;
  let acad = document.getElementById('txt_academi_editar').value;
  let acu = document.getElementById('txt_acuerdo_editar').value;
  let res = document.getElementById('txt_Resolucion_editar').value;
  let exped = document.getElementById('txt_expedicion_editar').value;
  let lib = document.getElementById('txt_libro_editar').value;
  let fol = document.getElementById('txt_folio_editar').value;
  let reg = document.getElementById('txt_registro_editar').value;
  let archivoactual = document.getElementById('txt_archivo_actual').value;
  let arc = document.getElementById('txt_archivo_editar').value;

  //DATOS DE LA MODALIDAD

  let idmoda = document.getElementById('txt_id_modalidad').value;
  let mod_estu = document.getElementById('txt_modo_estu_editar').value;
  let tra_inv = document.getElementById('txt_trabajo_inve_editar').value;

  let turn = document.getElementById('txt_turni_editar').value;
  let porc = document.getElementById('txt_porce_editar').value;
  let cent = document.getElementById('txt_centro_inve_editar').value;
  let meta = document.getElementById('txt_metadata_editar').value;

  let proce_bach = document.getElementById('txt_proceden_bachi_editar').value;
  let proce_insti = document.getElementById('txt_procedeni_insti_ori_editar').value;
  let proce_titu = document.getElementById('txt_proceden_titu_ori_editar').value;
  let fecha_matri = document.getElementById('txt_fecha_matri_mod_editar').value;
  let fecha_inici = document.getElementById('txt_fecha_inicio_mod_editar').value;
  let fecha_fin = document.getElementById('txt_fecha_fin_editar').value;
  let mod_sustenta = document.getElementById('select_modo_sustenta_editar').value;

  //DATOS DEL DIPLOMA
  let iddiploma = document.getElementById('txt_id_diploma').value;
  let fechacu  = document.getElementById('txt_fecha_cu_editar').value;
  let fechafirma  = document.getElementById('txt_fecha_firma_editar').value;

  let resol  = document.getElementById('txt_resol_editar').value;
  let fechareso = document.getElementById('txt_fecha_reso_editar').value;

  let numdiplo  = document.getElementById('txt_diploma_nume_editar').value;
  let numregis = document.getElementById('txt_registro_n°_editar').value;
  let libroregi = document.getElementById('txt_registro_libr_editar').value;
  let regisfolio = document.getElementById('txt_registro_folio_editar').value;
  let tipodiplo = document.getElementById('select_tipo_diplo_editar').value;
  let fechaini = document.getElementById('txt_fecha_inicio_tra_editar').value;
  let nrocre = document.getElementById('txt_nro_credi_editar').value;
  let nrooficio = document.getElementById('txt_nro_oficio_editar').value;
  let fechasecre = document.getElementById('txt_fecha_secre_editar').value;
  let idusuario = document.getElementById('txtprincipalid').value;

    // if(arc.length==0){
    //   return Swal.fire("Mensaje de Advertencia","Seleccione algún tipo de documento","warning")
    // }
    if(validar_email(emaper)){

    }else{
      return Swal.fire("Mensaje de Advertencia","El formato de Email es incorrecto","warning");
  
    }

    let extension = arc.split('.').pop();//DOCUMENTO.PPT
    let nombrearchivo="";
    let f = new Date();
    if(dni.length==0|| nombres.length==0  || apepa.length==0 ||apema.length==0 || sexo.length==0 ||celular.length==0 || direc.length==0 || fecha_matr.length==0 ||fecha_egre.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios en el registro de estudiantes, revise por favor","warning");
    }

    if(arc.length>0){
      nombrearchivo="EXPE-"+dni+"-"+f.getDate()+"-"+(f.getMonth()+1)+"-"+f.getFullYear()+"-"+f.getHours()+"-"+f.getMinutes()+"-"+f.getSeconds()+"."+extension;
    }

    if(mod_estu.length==0){
      return Swal.fire("Mensaje de Advertencia","El modo de estudio es un campo obligatorio","warning");
    }
   



    let formData = new FormData();
    let achivoobj = $("#txt_archivo_editar")[0].files[0];//El objeto del archivo adjuntado

    //DATOS DEL ESTUDIANTE
    formData.append("dni",dni);
    formData.append("nombres",nombres);
    formData.append("apepa",apepa);
    formData.append("apema",apema);
    formData.append("codigo",codigo);
    formData.append("sexo",sexo);
    formData.append("celular",celular);
    formData.append("direc",direc);
    formData.append("emaper",emaper);
    formData.append("emainsti",emainsti);
    formData.append("fecha_matr",fecha_matr);
    formData.append("fecha_egre",fecha_egre);
    formData.append("observa",observa);

    //DATOS DEL EXPEDIENTE
    
    formData.append("idexpe",idexpe);
    formData.append("ced",ced);
    formData.append("esc",esc);
    formData.append("titu",titu);
    formData.append("moda",moda);
    formData.append("idauto",idauto);
    formData.append("fecha",fecha);
    formData.append("acad",acad);
    formData.append("acu",acu);
    formData.append("res",res);
    formData.append("exped",exped);
    formData.append("lib",lib);
    formData.append("fol",fol);
    formData.append("reg",reg);
    formData.append("archivoactual",archivoactual);
    formData.append("nombrearchivo",nombrearchivo);
    formData.append("achivoobj",achivoobj);

    //DATOS DE LA MODALIDAD
    formData.append("idmoda",idmoda);
    formData.append("mod_estu",mod_estu);
    formData.append("tra_inv",tra_inv);
    formData.append("turn",turn);
    formData.append("porc",porc);
    formData.append("cent",cent);
    formData.append("meta",meta);
    formData.append("proce_bach",proce_bach);
    formData.append("proce_insti",proce_insti);
    formData.append("proce_titu",proce_titu);
    formData.append("fecha_matri",fecha_matri);
    formData.append("fecha_inici",fecha_inici);
    formData.append("fecha_fin",fecha_fin);
    formData.append("mod_sustenta",mod_sustenta);

    //DATOS DEL DIPLOMA
    formData.append("iddiploma",iddiploma);

    formData.append("fechacu",fechacu);
    formData.append("fechafirma",fechafirma);

    formData.append("resol",resol);
    formData.append("fechareso",fechareso);
    formData.append("numdiplo",numdiplo);
    formData.append("numregis",numregis);
    formData.append("libroregi",libroregi);
    formData.append("regisfolio",regisfolio);
    formData.append("tipodiplo",tipodiplo);
    formData.append("fechaini",fechaini);
    formData.append("nrocre",nrocre);
    formData.append("nrooficio",nrooficio);
    formData.append("fechasecre",fechasecre);
    formData.append("idusuario",idusuario);


    $.ajax({
      url:"../controller/registro_general/controlador_modificar_titulado.php",
      type:'POST',
      data:formData,
      contentType:false,
      processData:false,
      success:function(resp){
        if(resp>0){
          if(resp==1){
            Swal.fire("Mensaje de Confirmación","Se actualizo de forma correcta al Titulado con el DNI N°: "+dni ,"success").then((value)=>{
              tbl_general_titulo.ajax.reload();
              $("#modal_editar").modal('hide');
              document.getElementById('txt_archivo_editar').value="";

            });
          }else{
            Swal.fire("Mensaje de Advertencia","El registro que intenta actualizar su número de diploma, registro o resolución ya se encuentran registrados en la base de datos,revise por favor","warning");
          }
        }else{
          Swal.fire("Mensaje de Advertencia","No se pudo realizar el registro verifique por favor","warning");
    
        }
      }
    });
    return false;
}

//ELIMINANDO ROL
function Eliminar_Expediente(id){
  $.ajax({
    "url":"../controller/registro_general/controlador_eliminar_registro_general.php",
    type:'POST',
    data:{
      id:id
    }
  }).done(function(resp){
    if(resp>0){
        Swal.fire("Mensaje de Confirmación","Se elimino el registro del titulando con exito","success").then((value)=>{
          tbl_general_titulo.ajax.reload();

        });
    }else{
      return Swal.fire("Mensaje de Advetencia","No se puede eliminar este registro por que esta siendo utilizado en otros registros, verifique por favor","warning");

    }
  })
}

//ENVIANDO AL BOTON DELETE
$('#tabla_registro_general').on('click','.delete',function(){
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  Swal.fire({
    title: 'Desea eliminar registro del titulando: '+data.Estudiante+'?',
    text: "Una vez aceptado se eliminara los datos de la modalidad, expediente y estudiante, si esta de acuerdo dale click en Si, Eliminar!!!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Si, Eliminar'
  }).then((result) => {
    if (result.isConfirmed) {
      Eliminar_Expediente(data.Dni);
    }
  })
})
// Función para manejar el click en elementos con clase .informe
// Al cargar la página, inicializar txt_info desde localStorage si existe
// Función para manejar el click en elementos con clase .informe
function imprimir_info() {
  // Configurar y mostrar el modal
  $("#modal_informe").modal({ backdrop: 'static', keyboard: false });
  $("#modal_informe").modal('show');

  // Llamada AJAX al servidor
  $.ajax({
    url: "../controller/registro_general_bachiller/controlador_cargar_numero.php",
    type: 'POST',
  }).done(function (resp) {
    let data = JSON.parse(resp); // Parsear la respuesta JSON
    if (data.length > 0) {
      // Si hay datos, asignar el valor de la posición 1 al input

      document.getElementById('txt_info').value = data[0][1];
    } else {
      // Si no hay datos, mostrar un mensaje en el input
      document.getElementById('txt_info').value = "No hay datos disponibles";
    }
  }).fail(function (error) {
    console.error("Error al obtener los datos:", error);
    // Mostrar mensaje de error en el input si la llamada AJAX falla
    document.getElementById('txt_id_num').value = "Error al cargar datos";
  });
}

function imprimir_info2(){

  $("#modal_informe_filial").modal({backdrop:'static',keyboard:false})

  $("#modal_informe_filial").modal('show');
  // DATOS DEL TITULADO

}
// Función para imprimir informe por escuela
function Imprimir_informe() {
  let numero = document.getElementById('txt_info').value;
  let grado1 = document.getElementById('txt_gr').value;
  let facul = document.getElementById('txtfacu').value;
  let program = document.getElementById('txtes').value;
  let fedes1 = document.getElementById('fechadesde').value;
  let fehas1 = document.getElementById('fechahasta').value;

  var infoValue = parseInt(document.getElementById('txt_info').value, 10) || 0;

  // Validación del campo numero
  if (isNaN(infoValue) || infoValue === 0) {
      return Swal.fire("Mensaje de Advertencia", "Por favor ingrese el número del informe, es obligatorio", "warning");
  }

  // Validación de campos vacíos
  if (numero.length == 0 || grado1.length == 0 || facul.length == 0 || program.length == 0 || fedes1.length == 0 || fehas1.length == 0) {
      return Swal.fire("Mensaje de Advertencia", "Tiene campos vacíos", "warning");
  }

  // Primero generamos el PDF y obtenemos su ruta
  $.ajax({
      url: "../view/MPDF/REPORTE/informe_por_escuela.php",
      type: 'POST',
      data: {
          info: numero,
          grado: grado1,
          escu: program,
          fedes: fedes1,
          fehas: fehas1,
          guardarPDF: true
      },
      success: function(pdfResponse) {
          console.log("Respuesta del servidor (PDF): ", pdfResponse);  // Verifica la respuesta del servidor

          try {
              // Intentamos parsear la respuesta
              const pdfResult = typeof pdfResponse === "string" ? JSON.parse(pdfResponse) : pdfResponse;
              console.log("Respuesta procesada como JSON: ", pdfResult);  // Verifica la respuesta procesada

              if (pdfResult.success) {
                  // Si el PDF se generó correctamente, procedemos a registrar en la base de datos
                  $.ajax({
                      url: "../controller/registro_general_bachiller/registrar_numero_informe.php",
                      type: 'POST',
                      data: {
                          numero: numero,
                          grado1: grado1,
                          program: program,
                          fedes1: fedes1,
                          fehas1: fehas1,
                          ruta_pdf: pdfResult.filepath
                      },
                      success: function(resp) {
                          console.log("Respuesta del servidor (Registro): ", resp); // Verifica la respuesta del servidor

                          if (resp == 1) {
                            tbl_general_titulo.ajax.reload();
                            $("#modal_informe").modal('hide');
                              // El informe se registró correctamente
                              window.open("https://gradosapp.fun/view" + pdfResult.filepath, "Informe por Escuela", 
                                  "scrollbars=NO,width=" + screen.width + 
                                  ",height=" + screen.height + ",top=0,left=0");

                              // Incrementar el valor de txt_info
                              infoValue++;
                              localStorage.setItem('infoValue', infoValue);  // Guardar el nuevo valor en localStorage
                              document.getElementById('txt_info').value = infoValue;

                              Swal.fire("Éxito", "Informe generado y registrado correctamente", "success");
                          } else if (resp == 2) {
                              // El informe ya existe
                              Swal.fire("Mensaje de Advertencia", 
                                  "El informe ya existe en la Base de datos. Por favor, revise el número de informe.", "warning");
                          } else {
                              Swal.fire("Mensaje de Advertencia", 
                                  "No se pudo realizar el registro", "warning");
                          }
                      },
                      error: function(xhr, status, error) {
                          console.error("Error en la solicitud AJAX de registro: ", status, error);
                          Swal.fire("Error", "Hubo un error en el registro", "error");
                      }
                  });
              } else {
                  Swal.fire("Error", "No se pudo generar el PDF: " + pdfResult.message, "error");
              }
          } catch (e) {
              Swal.fire("Error", "Error al procesar la respuesta del servidor al generar el PDF", "error");
              console.error("Error al procesar JSON: ", e);
          }
      },
      error: function(xhr, status, error) {
          console.error("Error en la solicitud AJAX de generación de PDF: ", status, error);
          Swal.fire("Error", "Error en la conexión con el servidor para generar el PDF", "error");
      }
  });
}

// Función para imprimir informe por facultad
function Imprimir_informe_facultad() {
  var infoValue = parseInt(document.getElementById('txt_info').value, 10) || 0; // Obtener el valor actual de txt_info
  var info = infoValue.toString();
  var grado = document.getElementById('txt_gr').value.toString();
  var fac = document.getElementById('txtfacu').value.toString();
  var fedes = document.getElementById('fechadesde').value.toString();
  var fehas = document.getElementById('fechahasta').value.toString();
  
  if(infoValue.length>0){
    return Swal.fire("Mensaje de Advertencia","El numero de documento es obligatorio.","warning");
  }
  else{
      var url = "../view/MPDF/REPORTE/informe_por_facultad.php?"
  + "info=" + encodeURIComponent(info)
  + "&grado=" + encodeURIComponent(grado)
  + "&fac=" + encodeURIComponent(fac)
  + "&fedes=" + encodeURIComponent(fedes)
  + "&fehas=" + encodeURIComponent(fehas)
  + "#zoom=100%";
  
  var width = screen.width;
  var height = screen.height;
  
  window.open(url, "Informe por Facultad", "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0");

  // Incrementar el valor de txt_info solo después de generar el informe
  infoValue++;
  localStorage.setItem('infoValue', infoValue); // Guardar el nuevo valor en localStorage

  // Actualizar el valor en el campo de entrada #txt_info
  document.getElementById('txt_info').value = infoValue;
  }
  
}


//IMPRIMIR DIPLOMA
$('#tabla_registro_general').on('click', '.diploma', function () {
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  var tamaño = 55;
  var tamaño2 = 93;
  var tamaño3 = 83;
  var tamaño4 = 42;

  if (tbl_general_titulo.row(this).child.isShown()) {
    data = tbl_general_titulo.row(this).data();
  }

  // Construir la URL con todos los parámetros en orden
  var url = "../view/MPDF/REPORTE/diploma.php?" +
    "codigo=" + encodeURIComponent(data.Id_Diploma) +
    "&tamaño=" + encodeURIComponent(tamaño) +
    "&tamaño2=" + encodeURIComponent(tamaño2) +
    "&tamaño3=" + encodeURIComponent(tamaño3) +
    "&tamaño4=" + encodeURIComponent(tamaño4) +
    "#zoom=100%";

  // Abrir una nueva ventana con la URL construida
  var newWindow = window.open(url, "DIPLOMA TITULO PROFESIONAL", "scrollbars=NO");

  // Asegurarse de que la ventana se abre en tamaño máximo
  if (newWindow) {
    newWindow.moveTo(0, 0);
    newWindow.resizeTo(screen.width, screen.height);
  }
});



$('#tabla_registro_general').on('click','.letra',function(){

  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_editar_letra").modal('show');
  document.getElementById('txt_id_expediente').value=data.Id_Diploma;

  
});

function imprimir_numero(){
  var codigo = document.getElementById('txt_id_expediente').value.toString();

  var tamaño = document.getElementById('txt_tamaño').value.toString();
  var tamaño2 = document.getElementById('txt_posición').value.toString();
  var tamaño3 = document.getElementById('txt_posición_deno').value.toString();
  var tamaño4 = document.getElementById('txt_tamaño_deno').value.toString();


if(codigo.length==0||tamaño.length==0){
  return Swal.fire("Mensaje de Advertencia","El numero de documento es obligatorio.","warning");
}
else{
    var url = "../view/MPDF/REPORTE/diploma.php?"
+ "codigo=" + encodeURIComponent(codigo)
+ "&tamaño=" + encodeURIComponent(tamaño)
+ "&tamaño2=" + encodeURIComponent(tamaño2) 
+ "&tamaño3=" + encodeURIComponent(tamaño3) 
+ "&tamaño4=" + encodeURIComponent(tamaño4) 
+ "#zoom=100%";

var width = screen.width;
var height = screen.height;

window.open(url, "DIPLOMA TITULO PROFESIONAL", "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0");

}
} 


function Imprimir_informe2() {
  var infoValue = parseInt(document.getElementById('txt_info_filial').value, 10) || 0; // Obtener el valor actual de txt_info
  let ced = document.getElementById('txtfilial').value; // Obtener el valor de select_cede

  // Validar que el campo select no esté vacío
  if (ced === '') { // Comprueba si no hay un valor seleccionado
    return Swal.fire("Mensaje de Advertencia", "Seleccione una cede o filial", "warning");
  }
    
  if (isNaN(infoValue) || infoValue === 0) {
    return Swal.fire("Mensaje de Advertencia", "Por favor ingrese el número del informe. Es obligatorio.", "warning");
  }

  var info = infoValue.toString();
  var grado = document.getElementById('txt_gr_filial').value.toString();
  var escu = document.getElementById('txtes_filial').value.toString();
  var fil = document.getElementById('txtfilial').value.toString();
  var resp = document.getElementById('responsable').value.toString();
  var fedes = document.getElementById('fechadesde_filial').value.toString();
  var fehas = document.getElementById('fechahasta_filial').value.toString();

  if (info.length === 0) {
    return Swal.fire("Mensaje de Advertencia", "El número de documento es obligatorio.", "warning");
  } else {
    var url = "../view/MPDF/REPORTE/informe_por_filial.php?"
      + "info=" + encodeURIComponent(info)
      + "&grado=" + encodeURIComponent(grado)
      + "&escu=" + encodeURIComponent(escu)
      + "&fil=" + encodeURIComponent(fil)
      + "&resp=" + encodeURIComponent(resp)
      + "&fedes=" + encodeURIComponent(fedes)
      + "&fehas=" + encodeURIComponent(fehas)
      + "#zoom=100%";
  
    var width = screen.width;
    var height = screen.height;
  
    window.open(url, "Informe por filial", "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0");

    // Incrementar el valor de txt_info solo después de generar el informe
    infoValue++;
    localStorage.setItem('infoValue', infoValue); // Guardar el nuevo valor en localStorage

    // Actualizar el valor en el campo de entrada #txt_info
    document.getElementById('txt_info').value = infoValue;
  }
}

//IMPLEMENTACIÓN API GOOGLE SHEETS
function authenticate(callback) {
  gapi.auth2.getAuthInstance().signIn().then(callback);
}

function loadClient() {
  gapi.client.init({
      apiKey: 'AIzaSyC_vDVZz83KcQpVX93XztX833Lk4rsYlvg', // Sustituye con tu API Key
      clientId: '695497491441-k3jdp35u6k2dq6ntfs7isphfdm8d1tuf.apps.googleusercontent.com', // Sustituye con tu Client ID
      scope: 'https://www.googleapis.com/auth/spreadsheets.readonly',
      discoveryDocs: ['https://sheets.googleapis.com/$discovery/rest?version=v4']
  }).then(function () {
      authenticate(fetchSheetData); // Llama a la función fetchSheetData después de la autenticación
  });
}

gapi.load('client:auth2', loadClient);


function fetchSheetData() {
  var spreadsheetId = '1Q3H2bhhS3brQMsrzgJIcHWvGcHRD8YdtbiU2C1uEmyg'; // ID de tu hoja de cálculo de Google Sheets
  var range = 'Respuestas de formulario 1!A2:BP';  // Rango donde están los datos (sin incluir el encabezado)

  var dniIngresado = document.getElementById('txt_dni').value;  // Obtienes el DNI ingresado
  var dniIngresado2 = document.getElementById('txt_dni2').value;  // Obtienes el DNI ingresado

  gapi.client.sheets.spreadsheets.values.get({
      spreadsheetId: spreadsheetId,
      range: range
  }).then(function(response) {
      var data = response.result.values;  // Obtienes los datos de la hoja

      if (data.length > 0) {
          console.log('Datos obtenidos:', data);

          // Buscar la fila que tiene el DNI ingresado
          var filaEncontrada = null;
          for (var i = 0; i < data.length; i++) {
              var fila = data[i];
              if (fila[2] === dniIngresado || fila[2] === dniIngresado2) {  // Suponiendo que el DNI está en la columna 2 (índice 1)
                  filaEncontrada = fila;
                  break;
              }
          }

          if (filaEncontrada) {
              console.log('Fila encontrada:', filaEncontrada);
              fillFormWithData(filaEncontrada);  // Llamamos a la función para llenar el formulario
          } else {
              // Ventana de advertencia si no se encuentra el DNI
              Swal.fire("Mensaje de Advertencia", "No se encontró un estudiante con ese DNI.", "warning");
              return;  // Detenemos ejecución adicional en este bloque
          }
      } else {
          // Ventana de advertencia si no hay datos
          Swal.fire("Mensaje de Advertencia", "No se encontraron datos.", "warning");
          return;  // Detenemos ejecución adicional en este bloque
      }
  }).catch(function(error) {
      console.error('Error al obtener los datos:', error);
  });
}


function fillFormWithData(fila) {
  // Llenamos los campos con los datos obtenidos de la fila
  var dni = fila[2];
  var nombre = fila[3];  // Suponiendo que el nombre está en la columna 4 (índice 3)
  var apellidoPaterno = fila[4];  // Suponiendo que el apellido paterno está en la columna 5 (índice 4)
  var apellidoMaterno = fila[5];  // Suponiendo que el apellido materno está en la columna 6 (índice 5)
  //var codigo = fila[2];  // Suponiendo que el código está en la columna 3 (índice 2)
  var sexo = fila[6];  // Suponiendo que el sexo está en la columna 7 (índice 6)
  var celular = fila[7];  // Suponiendo que el celular está en la columna 8 (índice 7)
  var direccion = fila[10];  // Suponiendo que la dirección está en la columna 9 (índice 8)
  var email = fila[1];  // Suponiendo que el email está en la columna 10 (índice 9)
  var emailinsti = fila[9];  // Suponiendo que el email institucional está en la columna 11 (índice 10)
  var sede = fila[24];  // Suponiendo que el email institucional está en la columna 11 (índice 10)

  // Llenamos el formulario con los valores encontrados
    document.getElementById('txt_dni').value = dni;
 
  document.getElementById('txt_nom').value = nombre;
  document.getElementById('txt_apepa').value = apellidoPaterno;
  document.getElementById('txt_apema').value = apellidoMaterno;
  //document.getElementById('txt_codigo').value = codigo;

  // Establecemos el valor de 'sexo'
  if (sexo === 'Masculino') {
    document.getElementById('select_sexo').value = 'M';
  } else if (sexo === 'Femenino') {
    document.getElementById('select_sexo').value = 'F';
  }

  document.getElementById('txt_movil').value = celular;
  document.getElementById('txt_dire').value = direccion;
  document.getElementById('txt_email_per').value = email;
  document.getElementById('txt_email_insti').value = emailinsti;
  
   // Establecemos el valor de 'sexo'
  if (sede === 'Abancay') {
    document.getElementById('select_cede').value = '1';
  } else if (sede === 'Andahuaylas') {
    document.getElementById('select_cede').value = '2';
  }else{
      document.getElementById('select_cede').value = '3';

  }

  // Puedes agregar más campos si es necesario
}


$('#tabla_registro_general').on('click','.pasar',function(){
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if(tbl_general_titulo.row(this).child.isShown()){
      var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_pasar_bachiller").modal('show');
  document.getElementById('lb_titulo_datos22').innerHTML="<b>DNI: </b>"+data.Dni;
  document.getElementById('lb_titulo_datos33').innerHTML="<b>ESTUDIANTE: </b>"+data.Estudiante;
  document.getElementById('lb_titulo_datos44').innerHTML="<b>FACULTAD - ESCUELA PROFESIONAL: </b>"+data.Facultad+" - "+data.Escuela;
  document.getElementById('txtidexpe').value=data.Id_expediente;

})

  //CAMBIAR A BACHILLER
  function Cargar_Select_Facultad2(){
    $.ajax({
      "url":"../controller/carreras/controlador_cargar_select_facultad.php",
      type:'POST',
     
    }).done(function(resp){
      let data=JSON.parse(resp);
      var cadena="";
      if(data.length>0){
        for(var i=0; i < data.length; i++){
          cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
        }
        $('#select_facultad_pasar').html(cadena);
  
        var id =$("#select_facultad_pasar").val();
        Cargar_Select_facul_carrera2(id);
    }
    else{
        cadena+="<option value=''>No se encontraron regitros</option>";
        $('#select_facultad_pasar').html(cadena);
    }
    })
  }
  

  function Cargar_Select_facul_carrera2(id){
    $.ajax({
      "url":"../controller/expediente_bachiller/controlador_cargar_select_facu_carrera.php",
      type:'POST',
        data:{
          id:id
        }
      }).done(function(resp){
          var data = JSON.parse(resp);
          var cadena="";
          if(data.length>0){
              for(var i=0; i < data.length; i++){
                cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
              }
              $('#select_escuela_pasar').html(cadena);

  
              var id =$("#select_escuela_pasar").val();
              Traergrado2(id);
              var id_auto =$("#select_escuela_pasar").val();
              Traerauto2(id_auto);
  
          }
          else{
              cadena+="<option value=''>No se encontraron regitros</option>";
              $('#select_escuela_pasar').html(cadena);
  
  
          }
      })
    }


    function Traergrado2(idgrado){
      $.ajax({
          "url":"../controller/expediente_bachiller/controlador_traergrado.php",
          type:'POST',
            data:{
              id:idgrado
            }
          }).done(function(resp){
            
          var data = JSON.parse(resp);
          var cadena="";
          if(data.length>0){
            $("#txt_bachiller_pasar").val(data[0][1]);
  
          }
          else{
            cadena+="<option value=''>No se encontraron regitros</option>";
            $('#txt_bachiller_pasar').html(cadena);
  
  
        }
      })
    }


    function Traerauto2(id_auto){
      $.ajax({
        "url":"../controller/expediente_titulado/controlador_traerautoridad.php",
        type:'POST',
            data:{
              id_auto:id_auto
            }
          }).done(function(resp){
            
          var data = JSON.parse(resp);
          var cadena="";
          if(data.length>0){
            $("#txtidiautoridad").val(data[0][2]);

    

          }
          else{
            cadena+="<option value=''>No se encontraron regitros</option>";
            $("#txtidiautoridad").val(data[0][2]);


        }
      })
    }


// FUNCIÓN PARA PASAR ESTUDIANTE A BACHILLER
function Pasar_bachiller() {
  let idexpe = document.getElementById('txtidexpe').value;
  let idautori = document.getElementById('txtidiautoridad').value;
  let escue = document.getElementById('select_escuela_pasar').value;
  let grado = document.getElementById('txt_bachiller_pasar').value;
  let moda = document.getElementById('txt_modalidad_pasar').value;

  if (idexpe.length === 0 || idautori.length === 0 || escue.length === 0 || grado.length === 0 || moda.length === 0) {
    return Swal.fire("Mensaje de Advertencia", "Tiene campos vacíos", "warning");
  }

  // Obtener el nombre del estudiante desde un label
  let nombreEstudiante = document.getElementById('lb_titulo_datos33').textContent || "el estudiante";

  $.ajax({
    url: "../controller/registro_general/controlador_pasar_bachiller.php",
    type: 'POST',
    data: {
      idexpe: idexpe,
      idautori: idautori,
      escue: escue,
      grado: grado,
      moda: moda
    }
  }).done(function (resp) {
    if (resp > 0) {
      Swal.fire({
        title: `¿Está seguro de enviar los datos del estudiante ${nombreEstudiante} a los bachilleres?`,
        text: "Una vez aceptado, se enviará este registro a bachilleres y ya no estará visible en esta sección.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, Enviar'
      }).then((result) => {
        if (result.isConfirmed) {
          tbl_general_titulo.ajax.reload();
          $("#modal_pasar_bachiller").modal('hide');

          // Mensaje de satisfacción
          Swal.fire({
            title: "Operación Exitosa",
            text: `El estudiante ${nombreEstudiante} ha sido registrado como bachiller exitosamente.`,
            icon: "success",
            confirmButtonText: "Aceptar"
          });
        }
      });
    } else {
      return Swal.fire("Mensaje de Error", "No se completó la actualización", "error");
    }
  });
}
//VALIDAR EXPEDIENTE
function Validar_Expediente(id, nombre, correo) {
  $.ajax({
    url: "../controller/registro_general/controlador_validar_registro_general.php",
    type: 'POST',
    data: {
      id: id,
      nombre: nombre,
      correo: correo
    },
    dataType: 'json',
  }).done(function(resp) {
    if (resp.status) {
      Swal.fire("Mensaje de Confirmación", resp.message, "success").then(() => {
        tbl_general_titulo.ajax.reload();
      });
    } else {
      Swal.fire("Mensaje de Advertencia", resp.message, "warning");
    }
  }).fail(function(xhr, status, error) {
    Swal.fire("Mensaje de Error", "Ocurrió un error en la solicitud: " + error, "error");
  });
}

//ENVIANDO AL BOTON DELETE
$('#tabla_registro_general').on('click', '.validar', function() {
  var data = tbl_general_titulo.row($(this).parents('tr')).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    data = tbl_general_titulo.row(this).data();
  }

  Swal.fire({
    title: '¿Desea validar el expediente del titulando: ' + data.Estudiante + '?',
    html: '<hr> <p style="color:blue">FILIAL: ' + data.cede_nombre + '</p>',
    text: "Una vez validado se actualizará a la fecha actual y podrá imprimir el informe para Decanatura.",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Sí, Validar'
  }).then((result) => {
    if (result.isConfirmed) {
      // Pasa el nombre y el correo al controlador
      Validar_Expediente(data.Id_expediente, data.Estudiante, data.correo_personal);
    }
  });
});

function Imprimir_varios(){
  $("#modal_imprimir_varios").modal({backdrop:'static',keyboard:false})
  $("#modal_imprimir_varios").modal('show');
  listar_autoridad();
}

function imprimir_varios_diplomas(){
  var id_colacion = document.getElementById('select_fechacola_varios').value.toString();

  var registro_inicio = document.getElementById('txt_registro_inicio').value.toString();
  var registro_fin = document.getElementById('txt_registro_fin').value.toString();



if(id_colacion.length==0||registro_inicio.length==0||registro_fin.length==0){
  return Swal.fire("Mensaje de Advertencia","todos los campos son obligatorios.","warning");
}
else{
    var url = "../view/MPDF/REPORTE/varios_diplomas.php?"
+ "id_colacion=" + encodeURIComponent(id_colacion)
+ "&registro_inicio=" + encodeURIComponent(registro_inicio)
+ "&registro_fin=" + encodeURIComponent(registro_fin) 
+ "#zoom=100%";

var width = screen.width;
var height = screen.height;

window.open(url, "DIPLOMAS TITULO PROFESIONAL", "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0");

}
} 



async function buscarBachiller() {
  const tipo = document.getElementById("select_tipo_documento").value;
  const dni = document.getElementById("txt_dni").value.trim();
  const otroDoc = document.getElementById("txt_dni2").value.trim();

  let numero_documento = "";

  if (tipo === "DNI" && dni !== "") {
    numero_documento = dni;
  } else if (tipo !== "DNI" && otroDoc !== "") {
    numero_documento = otroDoc;
  } else {
    Swal.fire("Advertencia", "Debe ingresar un número de documento válido.", "warning");
    return;
  }

  try {
    const resp = await $.ajax({
      url: "../controller/registro_general/controlador_buscar_persona_por_documento.php",
      type: "POST",
      data: { numero_documento },
      dataType: "json"
    });

    if (resp.data && resp.data.length > 0) {
      const d = resp.data[0];

      // Rellenar campos
      $("#txt_nom").val(d.Nombres);
      $("#txt_apepa").val(d.Apellido_paterno);
      $("#txt_apema").val(d.Apellido_materno);
      $("#txt_codigo").val(d.Codigo);
      $("#select_sexo").val(d.Sexo);
      $("#txt_movil").val(d.Celular);
      $("#txt_dire").val(d.Direccion);
      $("#txt_email_per").val(d.correo_personal);
      $("#txt_email_insti").val(d.correo_institucional);
      $("#txt_fecha_matri").val(d.Fecha_matricula);
      $("#txt_fecha_egres").val(d.Fecha_egreso);
      $("#txt_oberva").val(d.Observaciones);
      $("#select_cede").val(d.Id_cede);

      // // Carga secuencial de ubicaciones
      // await cargarRegionesYSeleccionar(d.id_region);
      // await cargarProvinciasYSeleccionar(d.id_region, d.id_provincia);
      // await cargarDistritosYSeleccionar(d.id_provincia, d.id_distrito);

      // Alerta informativa después de cargar los datos
      await Swal.fire({
        icon: 'info',
        title: 'Datos Cargados Exitosamente',
        html: `
          <div style="text-align: left; padding: 10px;">
            <p><strong>📚 Información Importante:</strong></p>
            <p>• Se requiere <strong>seleccionar nuevamente la carrera</strong> para este graduado, ya que el termino en titulo es distinto.</p>
            <p>• También debe <strong>confirmar la modalidad de estudio</strong></p>
            <p>• Estos campos son <strong>obligatorios</strong> para completar el registro</p>
          </div>
        `,
        confirmButtonText: 'Entendido',
        confirmButtonColor: '#3085d6',
        allowOutsideClick: false,
        allowEscapeKey: false
      });

      // Opcional: Enfocar automáticamente en el campo de carrera después de cerrar la alerta
      // $("#select_carrera").focus();

    } else {
      Swal.fire("No encontrado", "No se encontró ningún bachiller con ese Nro. de Documento", "warning");
    }
  } catch (error) {
    console.error("❌ Error en AJAX:", error);
    Swal.fire("Error", "No se pudo hacer la búsqueda.", "error");
  }
}