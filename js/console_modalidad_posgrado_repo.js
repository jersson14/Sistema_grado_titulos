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
        "url":"../controller/modalidad_posgrado/controlador_listar_modalidad_posgrado.php",
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
            "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
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
function listar_todo() {
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
          "url":"../controller/modalidad_posgrado/controlador_listar_modalidad_posgrado_TODO.php",
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
                "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
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
            "url":"../controller/modalidad_posgrado/controlador_listar_posgrado_fecha.php",
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
            "defaultContent": "<button class='mostrar btn btn-success btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button> <button class='editar btn btn-warning btn-sm' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>"
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




$('#tabla_modalidad_posgrado').on('click','.editar',function(){
    var data = tbl_modalidad_posgrado.row($(this).parents('tr')).data();
  
    if(tbl_modalidad_posgrado.row(this).child.isShown()){
        var data = tbl_modalidad_posgrado.row(this).data();
    }
    $("#modal_editar").modal('show');
    document.getElementById('txt_expediente_editar').value=data.Id_expediente;

    document.getElementById('txt_moda').value=data.Id_modalidad;
    document.getElementById('txt_estudiante_editar').value=data.Dni+' - '+data.Estudiante;
    document.getElementById('txt_escuela_editar').value=data.Grado_academico+' - '+data.posgrado;
    document.getElementById('txt_modo_ob_ediitar').value=data.Modo_obtencion;
    document.getElementById('txt_modo_estu_editar').value=data.Modo_estudio;
    document.getElementById('txt_trabajo_inve_editar').value=data.Trabajo_investigacion;
    document.getElementById('txt_turni_editar').value=data.Turnitin;
    document.getElementById('txt_porce_editar').value=data.Porcentaje;
    document.getElementById('txt_centro_inve_editar').value=data.Centro_investigacion;
    document.getElementById('txt_metadata_editar').value=data.Reglamento_metadado;
    document.getElementById('txt_proceden_pais_mas_editar').value=data.Proce_pais_ext;
    document.getElementById('txt_procedeni_univer_mas_editar').value=data.Proce_univ_ext;
    document.getElementById('txt_proceden_grado_mas_editar').value=data.Proce_grado_ext;
    document.getElementById('txt_fecha_matri_editar').value=data.Fecha_matricula_modalidad;
    document.getElementById('txt_fecha_inicio_editar').value=data.Fecha_inicio_modalidad;
    document.getElementById('txt_fecha_fin_editar').value=data.Fecha_fin_modalidad;
    document.getElementById('select_modo_sustenta_editar').value=data.Modo_sustentacion;
  })
  
  function Modificar_Modalidad(){
    let id = document.getElementById('txt_moda').value;
    let modo = document.getElementById('txt_modo_ob_ediitar').value;
    let mod_estu = document.getElementById('txt_modo_estu_editar').value;
    let trabaj = document.getElementById('txt_trabajo_inve_editar').value;
    let turni = document.getElementById('txt_turni_editar').value;
    let porce = document.getElementById('txt_porce_editar').value;
    let centro = document.getElementById('txt_centro_inve_editar').value;
    let meta = document.getElementById('txt_metadata_editar').value;
    let propais = document.getElementById('txt_proceden_pais_mas_editar').value;
    let pro_unive = document.getElementById('txt_procedeni_univer_mas_editar').value;
    let pro_grado = document.getElementById('txt_proceden_grado_mas_editar').value;
    let fechamatrimoda = document.getElementById('txt_fecha_matri_editar').value;
    let fechamodaini = document.getElementById('txt_fecha_inicio_editar').value;
    let fechamodafin = document.getElementById('txt_fecha_fin_editar').value;
    let susten = document.getElementById('select_modo_sustenta_editar').value;
    let idusuer = document.getElementById('txtprincipalid').value;

    if(modo.length==0 || mod_estu.length==0||susten.length==0 || idusuer.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    $.ajax({
      "url":"../controller/modalidad_posgrado/controlador_modificar_posgrado_repo.php",
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
        propais:propais,
        pro_unive:pro_unive,
        pro_grado:pro_grado,
        fechamatrimoda:fechamatrimoda,
        fechamodaini:fechamodaini,
        fechamodafin:fechamodafin,
        susten:susten,
        idusuer:idusuer
  
      }
    }).done(function(resp){
      if(resp>0){
          Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente en la modalidad!!!","success").then((value)=>{
            tbl_modalidad_posgrado.ajax.reload();
          $("#modal_editar").modal('hide');
          });
       
      }else{
        return Swal.fire("Mensaje de Error","No se completo la actualización, revise por favor.","error");
  
      }
    })
  }
  