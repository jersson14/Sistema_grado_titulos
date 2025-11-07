var tbl_auditoria_informe;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_bachiller(){
    tbl_auditoria_informe = $("#tabla_auditoria_informe").DataTable({
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
          "url":"../controller/registro_general/controlador_listar_auditoria_informe.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE AUDITORIA INFORME";
          },
          title: function() {
            return "LISTA DE AUDITORIA INFORME";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE AUDITORIA INFORME";
          },
          title: function() {
            return "LISTA DE AUDITORIA INFORME";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE AUDITORIA INFORME";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        }
      ],
      "columns":[
        {"defaultContent":""},
        {
            "data": "number_informe",
            render: function(data, type, row) {
              return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
            }
          },
        {"data":"grado_academico"},
        {"data":"facu",
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
        {"data":"carrera"},
        {"data":"año"},
        {"data":"fecha_formateada1"},
        {"data":"fecha_formateada2"},
     
        {"data":"archivo",
          render: function(data,type,row){
                  if(data==''){
                    return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Sin informe'><i class='fas fa-file-download'></i> Sin informe</button></a>  ";                 
                  }
                  {
                    return "<a href='../view"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-success btn-sm' title='Ver Informe'><i class='fas fa-eye'></i> Ver informe</button></a>  ";                 
                  }
                  
              }   
          },

    ],

    "language":idioma_espanol,
    select: true
});
tbl_auditoria_informe.on('draw.td',function(){
  var PageInfo = $("#tabla_auditoria_informe").DataTable().page.info();
  tbl_auditoria_informe.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_auditoria_informe = $("#tabla_auditoria_informe").DataTable({
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
            "url":"../controller/registro_general/controlador_listar_auditoria_informe_fechas.php",
            type:'POST',
          data:{
            fechainicio:fechainicio,
            fechafin:fechafin,
          }
      },
        dom: 'Bfrtip', 
        buttons: [
          {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            filename: function() {
                return "LISTA DE AUDITORIA INFORME";
            },
            title: function() {
                return "LISTA DE AUDITORIA INFORME";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'pdfHtml5',
            text: '<i class="fas fa-file-pdf"></i> ',
            titleAttr: 'Exportar a PDF',
            filename: function() {
                return "LISTA DE AUDITORIA INFORME";
            },
            title: function() {
                return "LISTA DE AUDITORIA INFORME";
            },
            orientation: 'landscape',  // Exportar en formato horizontal
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
            }
          },
          {
            extend: 'print',
            text: '<i class="fa fa-print"></i> ',
            titleAttr: 'Imprimir',
            title: function() {
                return "LISTA DE AUDITORIA INFORME";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
            }
          }
        ],
        "columns":[
            {"defaultContent":""},
            {
                "data": "number_informe",
                render: function(data, type, row) {
                  return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
                }
              },
            {"data":"grado_academico"},
             {"data":"facu",
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
            {"data":"carrera"},
            {"data":"año"},
            {"data":"fecha_formateada1"},
            {"data":"fecha_formateada2"},
         
            {"data":"archivo",
              render: function(data,type,row){
                      if(data==''){
                        return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Sin informe'><i class='fas fa-file-download'></i> Sin informe</button></a>  ";                 
                      }
                      {
                        return "<a href='../view"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-success btn-sm' title='Ver Informe'><i class='fas fa-eye'></i> Ver informe</button></a>  ";                 
                      }
                      
                  }   
              },
    
        ],
    
  
      "language":idioma_espanol,
      select: true
});
tbl_auditoria_informe.on('draw.td',function(){
  var PageInfo = $("#tabla_auditoria_informe").DataTable().page.info();
  tbl_auditoria_informe.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

