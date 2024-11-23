var tbl_modalidad_posgrado;
//LISTADO SOLO SIN FILTRO
function listar_modalidad_posgrado() {
  tbl_modalidad_posgrado = $("#tabla_modalidad_posgrado").DataTable({
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
        "url":"../controller/registro_general_posgrado/controlador_listar_registro_general_posgrado.php",
        "type": 'POST'
      },
      "dom": 'Bfrtip',
      "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE MODALIDAD POSGRADO";
          },
          title: function() {
            return "LISTA DE MODALIDAD POSGRADO";
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
            return "LISTA DE MODALIDAD POSGRADO";
          },
          title: function() {
            return "LISTA DE MODALIDAD POSGRADO";
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
            return "LISTA DE MODALIDAD POSGRADO";
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
          {
              "data": "Grado_academico",
              render: function(data,type,row){
                if(data=='MAESTRIA'){
                    return '<span class="badge bg-success">MAESTRIA</span>';
                }else if(data=='DOCTORADO'){
                    return '<span class="badge bg-primary">DOCTORADO</span>';
                }else{
                    return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';
    
                }
             } 
          },
          { "data": "posgrado" },
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

  tbl_modalidad_posgrado.on('draw.td', function() {
      var PageInfo = $("#tabla_modalidad_posgrado").DataTable().page.info();
      tbl_modalidad_posgrado.column(0, { page: 'current' }).nodes().each(function(cell, i) {
          cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_modalidad_posgrado = $("#tabla_modalidad_posgrado").DataTable({
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
            "url":"../controller/registro_general_posgrado/controlador_listar_registro_general_posgrado_fecha.php",
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
            return "LISTA DE MODALIDAD POSGRADO";
          },
          title: function() {
            return "LISTA DE MODALIDAD POSGRADO";
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
            return "LISTA DE MODALIDAD POSGRADO";
          },
          title: function() {
            return "LISTA DE MODALIDAD POSGRADO";
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
            return "LISTA DE MODALIDAD POSGRADO";
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
          {
              "data": "Grado_academico",
              render: function(data,type,row){
                if(data=='MAESTRIA'){
                    return '<span class="badge bg-success">MAESTRIA</span>';
                }else if(data=='DOCTORADO'){
                    return '<span class="badge bg-primary">DOCTORADO</span>';
                }else{
                    return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';
    
                }
             } 
          },
          { "data": "posgrado" },
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
  
      "language":idioma_espanol,
      select: true
});
tbl_modalidad_posgrado.on('draw.td',function(){
  var PageInfo = $("#tabla_modalidad_posgrado").DataTable().page.info();
  tbl_modalidad_posgrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
//TRAENDO DATOS AL MODAL MAS
$('#tabla_modalidad_posgrado').on('click','.mostrar',function(){
  var data = tbl_modalidad_posgrado.row($(this).parents('tr')).data();

  if(tbl_modalidad_posgrado.row(this).child.isShown()){
      var data = tbl_modalidad_posgrado.row(this).data();
  }
  $("#modal_mas").modal('show');

  document.getElementById('txt_expediente').value=data.Id_expediente;
  document.getElementById('txt_estudiante').value=data.Dni+' - '+data.Estudiante;
  document.getElementById('txt_escuela').value=data.Grado_academico+' - '+data.posgrado;
  document.getElementById('txt_modo_ob').value=data.Modo_obtencion;
  document.getElementById('txt_modo_estu').value=data.Modo_estudio;
  document.getElementById('txt_trabajo_inve').value=data.Trabajo_investigacion;
  document.getElementById('txt_turni').value=data.Turnitin;
  document.getElementById('txt_porce').value=data.Porcentaje;
  document.getElementById('txt_centro_inve').value=data.Centro_investigacion;
  document.getElementById('txt_metadata').value=data.Reglamento_metadado;


  document.getElementById('txt_proceden_pais_mas').value=data.Proce_pais_ext;
  document.getElementById('txt_procedeni_univer_mas').value=data.Proce_univ_ext;
  document.getElementById('txt_proceden_grado_mas').value=data.Proce_grado_ext;
  
  document.getElementById('txt_fecha_matri').value=data.Fecha_matricula_modalidad;
  document.getElementById('txt_fecha_inicio').value=data.Fecha_inicio_modalidad;
  document.getElementById('txt_fecha_fin').value=data.Fecha_fin_modalidad;
  document.getElementById('select_modo_sustenta').value=data.Modo_sustentacion;
  
})



