var tbl_general_posgrado;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_posgrado(){
    tbl_general_posgrado = $("#tabla_registro_general_posgrado").DataTable({
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
      buttons:[ 
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              filename: function() {
                  return  "LISTA GENERAL DE POSGRADUADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE POSGRADUADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              orientation: 'landscape',  // Exportar en formato horizontal
              filename: function() {
                  return  "LISTA GENERAL DE POSGRADUADOS";
              },
              title: function() {
                  return  "LISTA GENERAL DE POSGRADUADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              title: function() {
                  return  "LISTA GENERAL DE POSGRADUADOS";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estado"
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
        {"data":"ESTADO",
          render: function(data,type,row){
              if(data=='SIN DIPLOMA'){
                  return '<span class="badge bg-danger">SIN DIPLOMA</span>';
              }else if(data=='CON DIPLOMA'){
                  return '<span class="badge bg-success">CON DIPLOMA</span>';
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
          {"data":"ESTADO",
            render: function (data, type, row ) {
              if(data=='SIN DIPLOMA'){
                return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button  class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
              }else if(data=='CON DIPLOMA'){
                  return "<button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button  class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' hidden class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";             
              }
            }
          },
    ],

    "language":idioma_espanol,
    select: true
});

tbl_general_posgrado.on('draw.td',function(){
  var PageInfo = $("#tabla_registro_general_posgrado").DataTable().page.info();
  tbl_general_posgrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;

  });
});
}

//LISTAR POR FECHAS
function listar_fechas_busqueda(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_general_posgrado = $("#tabla_registro_general_posgrado").DataTable({
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
            "url":"../controller/reportes/controlador_listar_registro_general_posgrado_fecha_sunedu.php",
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
                    return "LISTA_GENERAL_DE_POSGRADUADOS";
                },
                exportOptions: {
                    columns: ':hidden',
                    rows: function ( idx, data, node ) {
                        return idx < 1000; // Limita a 1000 filas, ajusta según necesites
                    }
                }
            },
            
            {
                extend: 'pdfHtml5',
                text: '<i class="fas fa-file-pdf"></i> ',
                titleAttr: 'Exportar a PDF',
                orientation: 'landscape', // Exportar en formato horizontal
                filename: function() {
                    return "LISTA_GENERAL_DE_POSGRADUADOS"; // No uses espacios ni caracteres especiales
                },
                title: function() {
                    return "LISTA GENERAL DE POSGRADUADOS";
                },
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 9] // Especifica las columnas a exportar hasta "estado"
                }
            },
            {
                extend: 'print',
                text: '<i class="fa fa-print"></i> ',
                titleAttr: 'Imprimir',
                title: function() {
                    return "LISTA GENERAL DE POSGRADUADOS";
                },
                exportOptions: {
                    columns: [0, 1, 2, 3, 4, 5, 9] // Especifica las columnas a exportar hasta "estado"
                }
            }
        ],
        "columns":[
            {"data":"Diploma_numero"}, // 0
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
            {"data":"Dni"}, // 1
            {"data":"Estudiante"}, // 2
            {"data":"Grado_academico", // 3
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
            {"data":"posgrado"}, // 4
            {"data":"ESTADO", // 5
                render: function(data,type,row){
                    if(data=='SIN DIPLOMA'){
                        return '<span class="badge bg-danger">SIN DIPLOMA</span>';
                    }else if(data=='CON DIPLOMA'){
                        return '<span class="badge bg-success">CON DIPLOMA</span>';
                    }
                } 
            },
            {"data":"Reglamento_metadado", // 6
                render: function (datae, type, row ) {
                    if(datae==''){
                        return "<a href="+datae+"  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";                 
                    }
                    return "<a href="+datae+" target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>";
                }
            }, 
            {"data":"Archivo", // 7
                render: function(data,type,row){
                    if(data=='controller/registro_general_posgrado/documentos/' || data==''){
                        return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";                 
                    }
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
                }   
            },
            {"defaultContent":"<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button>"}, // 8
            // Añadimos las demás columnas según el orden de la consulta SQL y las ocultamos
            {"data":"emp_cod", "visible": false}, // 9
            {"data":"emp_razon", "visible": false}, // 10
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"posgrado", "visible": false}, // 10
            {"data":"Apellido_paterno", "visible": false}, // 12
            {"data":"Apellido_materno", "visible": false}, // 13
            {"data":"Nombres", "visible": false}, // 11
            {"data":"Sexo", "visible": false}, // 14
            {"data":"tipo_documento","visible": false}, // Columna vacía
            {"data":"Dni", "visible": false}, // 14
            {"data":"Fecha_matricula", "visible": false}, // 15
            {"data":"Fecha_egreso", "visible": false}, // 16
            {"data":"Abreviatura_grado", "visible": false}, // 17
            {"data":"Denominación_grado", "visible": false}, // 18
            {"data":"Grado_academico", "visible": false}, // 18
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Programa_estudio", "visible": false}, // 19
            {"data":"Numero_creditos", "visible": false}, // 20
            {"data":"Modalidad", "visible": false}, // 21
            {"data":"Modo_estudio", "visible": false}, // 22
            {"data":"Reglamento_metadado", "visible": false}, // 23
            {"data":"Trabajo_investigacion", "visible": false}, // 23
            {"data": null, "defaultContent": "SI", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Fecha_inicio_tramite", "visible": false}, // 24
            {"data":"Turnitin", "visible": false, "visible": false}, // 25
            {"data":"Porcentaje", "visible": false, "visible": false}, // 26
            {"data":"Centro_investigacion", "visible": false}, // 27
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Resolucion_numero", "visible": false}, // 28
            {"data":"fecha_registro2", "visible": false}, // 28
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"fecha_registro3", "visible": false}, // 29
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Diploma_numero", "visible": false}, // 31
            {"data":"Diploma_tipo_emitido", "visible": false}, // 31
            {"data":"Registro_libro", "visible": false}, // 31
            {"data":"Registro_folio", "visible": false}, // 31
            {"data":"Registro_numero", "visible": false}, // 32
            {"data":"Cargo_auto1", "visible": false}, // 33
            {"data":"Autoridad_1", "visible": false}, // 34
            {"data":"Cargo_auto2", "visible": false}, // 35
            {"data":"Autoridad_2", "visible": false}, // 36
            {"data":"Cargo_auto3", "visible": false}, // 37
            {"data":"Autoridad_3", "visible": false}, // 38
            {"data":"Proce_pais_ext", "visible": false}, // 39
            {"data":"Proce_univ_ext", "visible": false}, // 40
            {"data":"Proce_grado_ext", "visible": false}, // 41
            {"data":"Nro_oficio", "visible": false}, // 42
            {"data":"Fecha_matricula_modalidad", "visible": false}, // 43
            {"data":"Fecha_inicio_modalidad", "visible": false}, // 44
            {"data":"Fecha_fin_modalidad", "visible": false}, // 45
            {"data":"Modo_sustentacion", "visible": false} // 46
        ],
        "language":idioma_espanol,
        select: true
    });

    tbl_general_posgrado.on('draw.td', function(){
        var PageInfo = $("#tabla_registro_general_posgrado").DataTable().page.info();
        tbl_general_posgrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}


$('#tabla_registro_general_posgrado').on('click','.mostrar',function(){
  var data = tbl_general_posgrado.row($(this).parents('tr')).data();

  if(tbl_general_posgrado.row(this).child.isShown()){
      var data = tbl_general_posgrado.row(this).data();
  }
  $("#modal_mas").modal('show');
  //DATOS DEL TITULADO
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
  document.getElementById('select_programa_mas').value=data.posgrado;
  document.getElementById('txt_denominacion_mas').value=data.Grado_maestro_de;
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
  document.getElementById('txt_proceden_pais_mas').value=data.Proce_pais_ext;
  document.getElementById('txt_procedeni_univer_mas').value=data.Proce_univ_ext;
  document.getElementById('txt_proceden_grado_mas').value=data.Proce_grado_ext;
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

