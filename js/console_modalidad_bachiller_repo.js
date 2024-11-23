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
          {"data":"cede_nombre"},

          { "data": "fecha_registro1" },
          {
            "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
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
function listar_todo() {
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
          "url": "../controller/modalidad_bachiller/controlador_listar_modalidad_bachiller_todos.php",
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
          {"data":"cede_nombre"},

          { "data": "fecha_registro1" },
          {
            "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
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
        {"data":"cede_nombre"},

        {"data":"fecha_registro1"},

        {
          "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
        },
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

  document.getElementById('txt_moda').value=data.Id_modalidad;
  document.getElementById('txt_expediente_editar').value=data.Id_expediente;
  document.getElementById('txt_estudiante_editar').value=data.Dni+' - '+data.Estudiante;
  document.getElementById('txt_escuela_editar').value=data.Facultad+' - '+data.Escuela;
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




function Modificar_Modalidad(){
  let id = document.getElementById('txt_moda').value;
  let modo = document.getElementById('txt_modo_ob_editar').value;
  let mod_estu = document.getElementById('txt_modo_estu_editar').value;
  let trabaj = document.getElementById('txt_trabajo_inve_editar').value;
  let turni = document.getElementById('txt_turni_editar').value;
  let porce = document.getElementById('txt_porce_editar').value;
  let centro = document.getElementById('txt_centro_inve_editar').value;
  let meta = document.getElementById('txt_metadata_editar').value;
  let probach = document.getElementById('txt_proceden_bachi_editar').value;
  let pro_ins = document.getElementById('txt_procedeni_insti_ori_editar').value;
  let pro_titu = document.getElementById('txt_proceden_titu_ori_editar').value;
  let fechamatrimoda = document.getElementById('txt_fecha_matri_editar').value;
  let fechamodaini = document.getElementById('txt_fecha_inicio_editar').value;
  let fechamodafin = document.getElementById('txt_fecha_fin_editar').value;
  let susten = document.getElementById('select_modo_sustenta_editar').value;
  let idusuer = document.getElementById('txtprincipalid').value;

  if(modo.length==0 || mod_estu.length==0||susten.length==0 || idusuer.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
  }
  $.ajax({
    "url":"../controller/modalidad_bachiller/controlador_modificar_modalidada_repo.php",
    type:'POST',
    data:{
      id:id,
      modo:modo,
      mod_estu:mod_estu,
      trabaj:trabaj,
      turni:turni,
      porce:porce,
      centro:centro,
      meta:meta,
      probach:probach,
      pro_ins:pro_ins,
      pro_titu:pro_titu,
      fechamatrimoda:fechamatrimoda,
      fechamodaini:fechamodaini,
      fechamodafin:fechamodafin,
      susten:susten,
      idusuer:idusuer

    }
  }).done(function(resp){
    if(resp>0){
        Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente en la modalidad!!!","success").then((value)=>{
          tbl_modalidad_titulo.ajax.reload();
        $("#modal_editar").modal('hide');
        });
     
    }else{
      return Swal.fire("Mensaje de Error","No se completo la actualización, revise por favor.","error");

    }
  })
}
