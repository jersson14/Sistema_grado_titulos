var tbl_expediente_posgrado;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_posgrado(){
    tbl_expediente_posgrado = $("#tabla_expediente_posgrado").DataTable({
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
          "url":"../controller/registro_general_posgrado/controlador_listar_registro_general_posgrado.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE EXPEDIENTE POSGRADO";
          },
          title: function() {
            return "LISTA DE EXPEDIENTE POSGRADO";
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
            return "LISTA DE EXPEDIENTE POSGRADO";
          },
          title: function() {
            return "LISTA DE EXPEDIENTE POSGRADO";
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
            return "LISTA DE EXPEDIENTE POSGRADO";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
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
        {"data":"Grado_academico",
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
        {"data":"posgrado"},
        {"data":"Grado_maestro_de"},
        {"data":"cede_nombre"},
        {"data":"estadito",
            render: function(data,type,row){
                if(data=='PENDIENTE'){
                    return '<span class="badge bg-warning">PENDIENTE POR ATENDER</span>';
                }else if(data=='EN PROCESO'){
                    return '<span class="badge bg-primary">EN PROCESO</span>';
                }else if(data=='COLACION'){
                    return '<span class="badge bg-success">LISTO PARA COLACIÓN</span>';
                }
             } 
          },
          { "data":"Reglamento_metadado",
            render: function (datae, type, row ) {
              if(datae==''){
                return "<a href="+datae+"  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
              }
              {
                return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>  ";                 
              }
            }
          }, 
        {"data":"Archivo",
          render: function(data,type,row){
                  if(data=='controller/registro_general_posgrado/documentos/' || data==''){
                    return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  ";                 
                  }
                  {
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  ";                 
                  }
                  
              }   
          },
          {"defaultContent":"<button class='mostrar btn btn-success  btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"},

    ],

    "language":idioma_espanol,
    select: true
});
tbl_expediente_posgrado.on('draw.td',function(){
  var PageInfo = $("#tabla_expediente_posgrado").DataTable().page.info();
  tbl_expediente_posgrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_expediente_posgrado = $("#tabla_expediente_posgrado").DataTable({
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
        dom: 'Bfrtip', 
       
        buttons: [
          {
            extend: 'excelHtml5',
            text: '<i class="fas fa-file-excel"></i> ',
            titleAttr: 'Exportar a Excel',
            filename: function() {
              return "LISTA DE EXPEDIENTE POSGRADO";
            },
            title: function() {
              return "LISTA DE EXPEDIENTE POSGRADO";
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
              return "LISTA DE EXPEDIENTE POSGRADO";
            },
            title: function() {
              return "LISTA DE EXPEDIENTE POSGRADO";
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
              return "LISTA DE EXPEDIENTE POSGRADO";
            },
            exportOptions: {
              columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
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
        {"data":"Grado_academico",
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
        {"data":"posgrado"},
        {"data":"Grado_maestro_de"},
        {"data":"cede_nombre"},
        {"data":"estadito",
            render: function(data,type,row){
                if(data=='PENDIENTE'){
                    return '<span class="badge bg-warning">PENDIENTE POR ATENDER</span>';
                }else if(data=='EN PROCESO'){
                    return '<span class="badge bg-primary">EN PROCESO</span>';
                }else if(data=='COLACION'){
                    return '<span class="badge bg-success">LISTO PARA COLACIÓN</span>';
                }
             } 
          },
          { "data":"Reglamento_metadado",
            render: function (datae, type, row ) {
              if(datae==''){
                return "<a href="+datae+"  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  ";                 
              }
              {
                return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>  ";                 
              }
            }
          }, 
        {"data":"Archivo",
          render: function(data,type,row){
                  if(data=='controller/registro_general_posgrado/documentos/' || data==''){
                    return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  ";                 
                  }
                  {
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  ";                 
                  }
                  
              }   
          },
          {"defaultContent":"<button class='mostrar btn btn-success  btn-sm' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar más</button>"},

    ],
  
      "language":idioma_espanol,
      select: true
});
tbl_expediente_posgrado.on('draw.td',function(){
  var PageInfo = $("#tabla_expediente_posgrado").DataTable().page.info();
  tbl_expediente_posgrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.tbl_expediente_posgrado = i + 1 + PageInfo.start;
  });
});
}

$('#tabla_expediente_posgrado').on('click','.mostrar',function(){
  var data = tbl_expediente_posgrado.row($(this).parents('tr')).data();

  if(tbl_expediente_posgrado.row(this).child.isShown()){
      var data = tbl_expediente_posgrado.row(this).data();
  }
  $("#modal_mas").modal('show');
  document.getElementById('lb_titulo_datos2').innerHTML="<b>CODIGO Nº: </b>"+data.Codigo;
  document.getElementById('lb_titulo_datos3').innerHTML="<b>ESTUDIANTE: </b>"+data.Estudiante;
  document.getElementById('lb_titulo_datos4').innerHTML="<b>GRADO - MAESTRIA: </b>"+data.Grado_academico+" - "+data.Denominación_grado;
  document.getElementById('lb_titulo_datos5').innerHTML="<b>FECHA DE REGISTRO: </b>"+data.fecha_registro1;

  document.getElementById('txt_cede1').value=data.cede_nombre;
  document.getElementById('select_estudiante').value=data.Dni+' - '+data.Estudiante;
  document.getElementById('select_grado').value=data.Grado_academico;
  document.getElementById('select_program').value=data.posgrado;

  document.getElementById('txt_maestria').value=data.Grado_maestro_de;
  document.getElementById('txt_modalidad').value=data.Modalidad;
  document.getElementById('txt_academi').value=data.Acto_academico;

  document.getElementById('txt_acuerdo').value=data.Acuerdo;
  document.getElementById('txt_Resolucion').value=data.Resolucion_rectoral_N;
  document.getElementById('txt_fecha').value=data.expedicion_fecha;
  document.getElementById('txt_expedicion').value=data.Expedicion;
  document.getElementById('txt_libro').value=data.Libro;
  document.getElementById('txt_folio').value=data.Folio;
  document.getElementById('txt_registro').value=data.Registro;
  document.getElementById('txt_rector').value=data.Autoridad_1;
  document.getElementById('txt_secretario').value=data.Autoridad_2;
  document.getElementById('txt_director').value=data.Autoridad_3;
})

$('#tabla_expediente_posgrado').on('click','.editar',function(){
  var data = tbl_expediente_posgrado.row($(this).parents('tr')).data();

  if(tbl_expediente_posgrado.row(this).child.isShown()){
      var data = tbl_expediente_posgrado.row(this).data();
  }
  $("#modal_editar").modal('show');

  document.getElementById('id_expedi').value=data.Id_expediente;
  $("#select_cede_editar").select2().val(data.Id_cede).trigger('change.select2');
  $("#select_estudiante_editar").select2().val(data.Dni).trigger('change.select2');
  $("#select_escuela_editar").select2().val(data.Id_escuela).trigger('change.select2');
  document.getElementById('txt_titulo_editar').value=data.Denominación_grado;
  document.getElementById('txt_modalidad_editar').value=data.Modalidad;
  document.getElementById('txt_academi').value=data.Acto_academico;
  document.getElementById('txt_acuerdo_editar').value=data.Acuerdo;
  document.getElementById('txt_Resolucion_editar').value=data.Resolucion_rectoral_N;
  document.getElementById('txt_fecha_editar').value=data.Fecha;
  document.getElementById('txt_expedicion_editar').value=data.Expedicion;
  document.getElementById('txt_libro_editar').value=data.Libro;
  document.getElementById('txt_folio_editar').value=data.Folio;
  document.getElementById('txt_registro_editar').value=data.Registro;
  document.getElementById('txt_id_editar').value=data.Cod_autoridad;
  document.getElementById('archivoactual').value=data.Archivo;
  document.getElementById('txt_rector_editar').value=data.Autoridad_1;
  document.getElementById('txt_secretario_editar').value=data.Autoridad_2;
  document.getElementById('txt_decano_editar').value=data.Autoridad_3;
})

function Cargar_Select_Cede(){
  $.ajax({
    "url":"../controller/expediente_titulado/controlador_cargar_select_cede.php",
    type:'POST',
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
      }
      document.getElementById('select_cede').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay cedes en la base de datos</option>";
      document.getElementById('select_cede').innerHTML=cadena;

    }
  })
}
function Cargar_Select_Cede_editar(){
  $.ajax({
    "url":"../controller/expediente_titulado/controlador_cargar_select_cede.php",
    type:'POST',
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
      }
      document.getElementById('select_cede_editar').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay cedes en la base de datos</option>";
      document.getElementById('select_cede_editar').innerHTML=cadena;

    }
  })
}
function Cargar_Select_Carrera_editar(){
  $.ajax({
    "url":"../controller/expediente_titulo/controlador_cargar_select_cede.php",
    type:'POST',
   
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>FACULTAD: "+data[i][1]+" - ESCUELA: "+data[i][2]+"</option>";    
      }
        document.getElementById('select_escuela_editar').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay tipos disponibles</option>";
      document.getElementById('select_escuela_editar').innerHTML=cadena;

    }
  })
}

function Cargar_Select_Carrera_editar(){
  $.ajax({
    "url":"../controller/expediente_titulado/controlador_cargar_select_carrerasolo.php",
    type:'POST',
   
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>FACULTAD: "+data[i][1]+" - ESCUELA: "+data[i][2]+"</option>";    
      }
        document.getElementById('select_escuela_editar').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay tipos disponibles</option>";
      document.getElementById('select_escuela_editar').innerHTML=cadena;

    }
  })
}
//TRAER TODO LOS ESTUDIANTES CON DNI
function Cargar_Select_Estudiante(){
  $.ajax({
    "url":"../controller/expediente_bachiller/controlador_cargar_select_estudiante.php",
    type:'POST',
   
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>DNI: "+data[i][0]+" - NOMBRE Y APELLIDOS: "+data[i][1]+"</option>";    
      }
        document.getElementById('select_estudiante').innerHTML=cadena;
        document.getElementById('select_estudiante_editar').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay tipos disponibles</option>";
      document.getElementById('select_estudiante').innerHTML=cadena;
      document.getElementById('select_estudiante_editar').innerHTML=cadena;

    }
  })
}


 //REGISTRO 
function Cargar_Select_Facultad(){
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
      $('#select_facultad').html(cadena);
      var id =$("#select_facultad").val();
      Cargar_Select_facul_carrera(id);

      
  }
  else{
      cadena+="<option value=''>No se encontraron regitros</option>";
      $('#select_facultad').html(cadena);

  }
  })
}
//TRAER TODO LAS CARRERAS
function Cargar_Select_facul_carrera(id){
  $.ajax({
      "url":"../controller/expediente_titulado/controlador_cargar_select_facu_carrera.php",
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
            $('#select_escuela').html(cadena);

            var id =$("#select_escuela").val();
            
            Traergrado(id);
            
        }
        else{
            cadena+="<option value=''>No se encontraron regitros</option>";
            $('#select_escuela').html(cadena);


        }
    })
  }
  function Traergrado(idgrado){
    $.ajax({
      "url":"../controller/expediente_titulado/controlador_traergrado.php",
      type:'POST',
          data:{
            id:idgrado
          }
        }).done(function(resp){
          
        var data = JSON.parse(resp);
        var cadena="";
        if(data.length>0){
          $("#txt_titulo").val(data[0][1]);

        }
        else{
          cadena+="<option value=''>No se encontraron regitros</option>";
          $('#txt_titulo').html(cadena);
      }
    })
  }
//EDICION

  function Traergrado2(idgrado){
    $.ajax({
      "url":"../controller/expediente_titulado/controlador_traergrado.php",
      type:'POST',
          data:{
            id:idgrado
          }
        }).done(function(resp){
          
        var data = JSON.parse(resp);
        var cadena="";
        if(data.length>0){
          $("#txt_titulo_editar").val(data[0][1]);

        }
        else{
          cadena+="<option value=''>No se encontraron regitros</option>";
          $('#txt_titulo_editar').html(cadena);
      }
    })
  }





var tbl_autoridad1;
function listar_autoridad(){
  tbl_autoridad1 = $("#tabla_auto").DataTable({
     "ordering":true,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 10,
      "destroy":false,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false ,
      "processing": true,
      "ajax":{
          "url":"../controller/autoridades/controlador_listar_autoridades.php",
          type:'POST'
      },
      "columns":[
        {"data":"Cod_autoridad"},
        {"data":"Autoridad_1"},
        {"data":"Cargo_auto1",
        render: function(data,type,row){
            if(data=='RECTOR'){
            return '<span class="badge bg-primary">RECTOR</span>';
            }
         } 
        },
        {"data":"Autoridad_2"},
        {"data":"Cargo_auto2",
        render: function(data,type,row){
            if(data=='SECRETARIA GENERAL'){
            return '<span class="badge bg-success">SECRETARIA GENERAL</span>';
          }
         } 
        },
        {"data":"Autoridad_3"},
        {"data":"Cargo_auto3",
        render: function(data,type,row){
            if(data=='DECANO'){
            return '<span class="badge bg-warning">DECANO</span>';
            }else if(data=='DIRECTOR'){
            return '<span class="badge bg-dark">DIRECTOR POSGRADO</span>';
            }
         } 
        },
        {"defaultContent":"<button class='enviar_a btn btn-primary  btn-sm' title='Editar datos de área'><i class='fas fa-share-square ml-1 mr-1'></i> Enviar</button>"}, 
            
    ],

    "language":idioma_espanol,
    select: true
});
}
function filterGlobal(){
  $('#tabla_auto').DataTable().search(
      $('#global_filter').val(),
  ).draw();
}
function AbrirModalAutoridad(){
  $("#modal_autoridad").modal({backdrop:'static',keyboard:false})
  $("#modal_autoridad").modal('show');
  listar_autoridad();
}


