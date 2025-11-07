var tbl_general_pregrado;
//LISTADO SOLO SIN FILTRO

//LISTAR POR FECHAS
function listar_expedientes_pregrado_fecha(){
    let fechainicio = document.getElementById('txtfechainicio').value;
    let fechafin = document.getElementById('txtfechafin').value;

    tbl_general_pregrado = $("#tabla_registro_general_pregrado").DataTable({
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
            "url":"../controller/reportes/controlador_listar_registro_general_pregrado.php",
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
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: 'Exportar a Excel',
        filename: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        exportOptions: {
            columns: ':hidden',
            rows: function (idx, data, node) {
                return idx < 1000; // Limita a 1000 filas, ajusta según necesites
            }
        }
    },
    {
        extend: 'pdfHtml5',
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: 'Exportar a PDF',
        orientation: 'landscape', // Exportar en formato horizontal
        filename: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        title: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 9] // Especifica las columnas a exportar hasta "estado"
        }
    },
    {
        extend: 'print',
        text: '<i class="fa fa-print"></i> Imprimir',
        titleAttr: 'Imprimir',
        title: function() {
            return "LISTA GENERAL DE PREGRADO";
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
            {"data":"GRADO", // 3
                render: function(data,type,row){
                    if(data=='BACHILLER'){
                        return '<span class="badge bg-warning">BACHILLER</span>';
                    }else if(data=='TITULO'){
                        return '<span class="badge bg-primary">TITULO</span>';
                    }
                } 
            },
            {"data":"FACULTAD"}, // 4
            {"data":"ESCUELA"}, // 4
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
                    if(data=='controller/registro_general/documentos/' || data=='controller/registro_general_bachiller/documentos/'){
                        return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Sin Expediente</button></a>";                 
                    }
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
                }   
            },
           {"defaultContent":"<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button>"}, // 8
            // Añadimos las demás columnas según el orden de la consulta SQL y las ocultamos
            {"data":"emp_cod", "visible": false}, // 9
            {"data":"emp_razon", "visible": false}, // 10
            {"data":"FACULTAD", "visible": false}, // 10
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Apellido_paterno", "visible": false}, // 12
            {"data":"Apellido_materno", "visible": false}, // 13
            {"data":"Nombres", "visible": false}, // 11
            {"data":"Sexo", "visible": false}, // 14
            {"data":"tipo_documento","visible": false}, // Columna vacía
            {"data":"Dni", "visible": false}, // 14
            {"data":"Fecha_matricula", "visible": false}, // 15
            {"data":"Fecha_egreso", "visible": false}, // 16
            {"data":"Abreviatura_grado", "visible": false}, // 17
            {"data":"ESCUELA", "visible": false}, // 18

                {
                    "data": function (row) {
                        return row.Abreviatura_grado === 'B' ? 'Bachiller en '+row.Grado_bachiller_de : 'Titulo Profesional de '+row.Titulo_de;
                    },
                    "visible": false
                },            
        {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía

            {"data":"Programa_estudio", "visible": false}, // 19
            {"data":"Nro_creditos", "visible": false}, // 20
            {"data":"Modalidad", "visible": false}, // 21
            {"data":"Abreviatura_modo_estudio", "visible": false}, // 22
            {"data":"Reglamento_metadado", "visible": false}, // 23
            {"data":"Trabajo_investigacion", "visible": false}, // 23
            {"data": null, "defaultContent": "SI", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Fecha_inicio_tramite", "visible": false}, // 24
            {"data":"Turnitin", "visible": false, "visible": false}, // 25
            {"data":"Porcentaje", "visible": false, "visible": false}, // 26
            {
                "data": function (row) {
        return row.Abreviatura_grado === 'B' ? '' : 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ' + row.ESCUELA.toUpperCase();
                },
                "visible": false
            },

            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
         {
            "data": function (row) {
                let year = new Date().getFullYear(); // Obtener el año actual
                let resolucion = row.Resolucion_numero.toString().padStart(3, '0'); // Asegurar 3 dígitos
                return `${resolucion} - ${year}-UTEA-CU`;
            },
            "visible": false
        },            {"data":"fecha_registro2", "visible": false}, // 28
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"fecha_registro3", "visible": false}, // 29
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Diploma_numero", "visible": false}, // 31
            {"data":"Diploma_tipo_emitido", "visible": false}, // 31
            {"data":"Registro_libro", "visible": false}, // 31
            {"data":"Registro_folio", "visible": false}, // 31
            {"data":"Registro_numero", "visible": false}, // 32
             {
                "data": function (row) {
        return row.genero1 === 'MASCULINO' ? 'RECTOR' : 'RECTORA';
                },
                "visible": false
            },
            {"data":"Autoridad_1", "visible": false}, // 34
               {
                "data": function (row) {
        return row.genero2 === 'MASCULINO' ? 'SECRETARIO GENERAL' : 'SECREATARIA GENERAL';
                },
                "visible": false
            },
            {"data":"Autoridad_2", "visible": false}, // 36
               {
                "data": function (row) {
        return row.genero3 === 'MASCULINO' ? 'DECANO' : 'DECANA';
                },
                "visible": false
            },
            {"data":"Autoridad_3", "visible": false}, // 38
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
 {
                        "data": function (row) {
                            return `Oficio N° ${row.Nro_oficio}`;
                        },
                        "visible": false
                    },               {"data":"Fecha_matricula_modalidad", "visible": false}, // 43
            {"data":"Fecha_inicio_modalidad", "visible": false}, // 44
            {"data":"Fecha_fin_modalidad", "visible": false}, // 45
            
             {
                "data": function (row) {
                    return row.Abreviatura_grado === 'B' ? '' : 'PRESENCIAL';
                },
                "visible": false
            }
    
        ],
        "language":idioma_espanol,
        select: true
    });

    tbl_general_pregrado.on('draw.td', function(){
        var PageInfo = $("#tabla_registro_general_pregrado").DataTable().page.info();
        tbl_general_pregrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}
function listar_colacion(){
    let fechacol = document.getElementById('select_fechacola').value;

    tbl_general_pregrado = $("#tabla_registro_general_pregrado").DataTable({
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
            "url":"../controller/reportes/controlador_listar_registro_general_pregrado_colacion.php",
            type:'POST',
            data:{
                fechacol:fechacol
                 }
        },
        dom: 'Bfrtip', 
             buttons: [
    {
        extend: 'excelHtml5',
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: 'Exportar a Excel',
        filename: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        exportOptions: {
            columns: ':hidden',
            rows: function (idx, data, node) {
                return idx < 1000; // Limita a 1000 filas, ajusta según necesites
            }
        }
    },
    {
        extend: 'pdfHtml5',
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: 'Exportar a PDF',
        orientation: 'landscape', // Exportar en formato horizontal
        filename: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        title: function() {
            return "LISTA GENERAL DE PREGRADO";
        },
        exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 9] // Especifica las columnas a exportar hasta "estado"
        }
    },
    {
        extend: 'print',
        text: '<i class="fa fa-print"></i> Imprimir',
        titleAttr: 'Imprimir',
        title: function() {
            return "LISTA GENERAL DE PREGRADO";
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
            {"data":"GRADO", // 3
                render: function(data,type,row){
                    if(data=='BACHILLER'){
                        return '<span class="badge bg-warning">BACHILLER</span>';
                    }else if(data=='TITULO'){
                        return '<span class="badge bg-primary">TITULO</span>';
                    }
                } 
            },
            {"data":"FACULTAD"}, // 4
            {"data":"ESCUELA"}, // 4
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
                    if(data=='controller/registro_general/documentos/' || data=='controller/registro_general_bachiller/documentos/'){
                        return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Sin Expediente</button></a>";                 
                    }
                    return "<a href='../"+data+"' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
                }   
            },
            {"defaultContent":"<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button>"}, // 8
            // Añadimos las demás columnas según el orden de la consulta SQL y las ocultamos
            {"data":"emp_cod", "visible": false}, // 9
            {"data":"emp_razon", "visible": false}, // 10
            {"data":"FACULTAD", "visible": false}, // 10
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Apellido_paterno", "visible": false}, // 12
            {"data":"Apellido_materno", "visible": false}, // 13
            {"data":"Nombres", "visible": false}, // 11
            {"data":"Sexo", "visible": false}, // 14
            {"data":"tipo_documento","visible": false}, // Columna vacía
            {"data":"Dni", "visible": false}, // 14
            {"data":"Fecha_matricula", "visible": false}, // 15
            {"data":"Fecha_egreso", "visible": false}, // 16
            {"data":"Abreviatura_grado", "visible": false}, // 17
            {"data":"ESCUELA", "visible": false}, // 18
            
            {
                    "data": function (row) {
                        return row.Abreviatura_grado === 'B' ? 'Bachiller en '+row.Grado_bachiller_de : 'Titulo Profesional de '+row.Titulo_de;
                    },
                    "visible": false
                },        
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía

            {"data":"Programa_estudio", "visible": false}, // 19
            {"data":"Nro_creditos", "visible": false}, // 20
            {"data":"Modalidad", "visible": false}, // 21
            {"data":"Abreviatura_modo_estudio", "visible": false}, // 22
            {"data":"Reglamento_metadado", "visible": false}, // 23
            {"data":"Trabajo_investigacion", "visible": false}, // 23
            {"data": null, "defaultContent": "SI", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data":"Fecha_inicio_tramite", "visible": false}, // 24
            {"data":"Turnitin", "visible": false, "visible": false}, // 25
            {"data":"Porcentaje", "visible": false, "visible": false}, // 26
            {
                "data": function (row) {
        return row.Abreviatura_grado === 'B' ? '' : 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ' + row.ESCUELA.toUpperCase();
                },
                "visible": false
            },
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {
            "data": function (row) {
                let year = new Date().getFullYear(); // Obtener el año actual
                let resolucion = row.Resolucion_numero.toString().padStart(3, '0'); // Asegurar 3 dígitos
                return `${resolucion} - ${year}-UTEA-CU`;
            },
            "visible": false
        },
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
             {
                "data": function (row) {
        return row.genero1 === 'MASCULINO' ? 'RECTOR' : 'RECTORA';
                },
                "visible": false
            },
            {"data":"Autoridad_1", "visible": false}, // 34
               {
                "data": function (row) {
        return row.genero2 === 'MASCULINO' ? 'SECRETARIO GENERAL' : 'SECREATARIA GENERAL';
                },
                "visible": false
            },
            {"data":"Autoridad_2", "visible": false}, // 36
               {
                "data": function (row) {
        return row.genero3 === 'MASCULINO' ? 'DECANO' : 'DECANA';
                },
                "visible": false
            },
            {"data":"Autoridad_3", "visible": false}, // 38
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
            {"data": null, "defaultContent": "", "visible": false}, // Columna vacía
             {
                        "data": function (row) {
                            return `Oficio N° ${row.Nro_oficio}`;
                        },
                        "visible": false
                    },            
                    {"data":"Fecha_matricula_modalidad", "visible": false}, // 43
            {"data":"Fecha_inicio_modalidad", "visible": false}, // 44
            {"data":"Fecha_fin_modalidad", "visible": false}, // 45
     {
                "data": function (row) {
                    return row.Abreviatura_grado === 'B' ? '' : 'PRESENCIAL';
                },
                "visible": false
            }        ],
        "language":idioma_espanol,
        select: true
    });

    tbl_general_pregrado.on('draw.td', function(){
        var PageInfo = $("#tabla_registro_general_pregrado").DataTable().page.info();
        tbl_general_pregrado.column(0, {page: 'current'}).nodes().each(function(cell, i){
            cell.innerHTML = i + 1 + PageInfo.start;
        });
    });
}
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
    });
  }
  

$('#tabla_registro_general_pregrado').on('click','.mostrar',function(){
  var data = tbl_general_pregrado.row($(this).parents('tr')).data();

  if(tbl_general_pregrado.row(this).child.isShown()){
      var data = tbl_general_pregrado.row(this).data();
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

