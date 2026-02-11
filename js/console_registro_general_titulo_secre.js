var tbl_general_titulo;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_titulado() {
  tbl_general_titulo = $("#tabla_registro_general").Data;
  let sede = document.getElementById("txtsede").value;
  Table({
    ordering: false,
    bLengthChange: true,
    searching: { regex: false },
    lengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"],
    ],
    pageLength: 10,
    destroy: true,
    pagingType: "full_numbers",
    scrollCollapse: true,
    responsive: true,
    async: false,
    processing: true,
    ajax: {
      url: "../controller/registro_general/controlador_listar_registro_general_secre.php",
      type: "POST",
      data: {
        sede: sede,
      },
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> ',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> ',
        titleAttr: "Exportar a PDF",
        orientation: "landscape", // Exportar en formato horizontal
        filename: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> ',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
    ],
    columns: [
      { data: "Diploma_numero" },
      {
        data: "number_informe",
        render: function (data, type, row) {
          return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
        },
      },
      {
        data: "tipo_documento",
        render: function (data, type, row) {
          if (data == "DNI") {
            return '<span class="badge bg-success">DNI</span>';
          } else if (data == "PASAPORTE") {
            return '<span class="badge bg-primary">PASAPORTE</span>';
          } else {
            return '<span class="badge bg-warning">CARNET DE EXTRANJERIA</span>';
          }
        },
      },
      { data: "Dni" },
      { data: "Estudiante" },
      {
        data: "Facultad",
        render: function (data, type, row) {
          if (data == "Ingeniería") {
            return '<span class="badge bg-success">INGENIERIA</span>';
          } else if (data == "Ciencias de la Salud") {
            return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
          } else {
            return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
          }
        },
      },
      { data: "Escuela" },
      { data: "Modo_obtencion" },
      { data: "fecha_registro1" },

      { data: "cede_nombre" },

      {
        data: "estado",
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return '<span class="badge bg-danger">SIN DIPLOMA</span>';
          } else if (data == "CON DIPLOMA") {
            return '<span class="badge bg-success">CON DIPLOMA</span>';
          }
        },
      },
      {
        data: "Reglamento_metadado",
        render: function (datae, type, row) {
          if (datae == "") {
            return (
              "<a href=" +
              datae +
              "  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>  "
            );
          }
          {
            return (
              "<a href=" +
              datae +
              " target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>  "
            );
          }
        },
      },
      {
        data: "Archivo",
        render: function (data, type, row) {
          if (data == "controller/registro_general/documentos/" || data == "") {
            return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  ";
          }
          {
            return (
              "<a href='../" +
              data +
              "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>  "
            );
          }
        },
      },
      {
        data: "estado",
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>";
          } else if (data == "CON DIPLOMA") {
            return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' hidden style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>";
          }
        },
      },
    ],

    language: idioma_espanol,
    select: true,
  });

  tbl_general_titulo.on("draw.td", function () {
    var PageInfo = $("#tabla_registro_general").DataTable().page.info();
    tbl_general_titulo
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

//LISTAR POR FECHAS
function listar_fechas_busqueda() {
  let fechainicio = document.getElementById("txtfechainicio").value;
  let fechafin = document.getElementById("txtfechafin").value;
  let sede = document.getElementById("txtsede").value;

  tbl_general_titulo = $("#tabla_registro_general").DataTable({
    ordering: false,
    bLengthChange: true,
    searching: { regex: false },
    lengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"],
    ],
    pageLength: 10,
    destroy: true,
    pagingType: "full_numbers",
    scrollCollapse: true,
    responsive: true,
    async: false,
    processing: true,
    ajax: {
      url: "../controller/registro_general/controlador_listar_registro_general_fecha_secre.php",
      type: "POST",
      data: {
        fechainicio: fechainicio,
        fechafin: fechafin,
        sede: sede,
      },
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> ',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> ',
        titleAttr: "Exportar a PDF",
        orientation: "landscape", // Exportar en formato horizontal
        filename: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> ',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA GENERAL DE TITULADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6], // Especifica las columnas a exportar hasta "estado"
        },
      },
    ],
    columns: [
      { data: "Diploma_numero" },
      {
        data: "number_informe",
        render: function (data, type, row) {
          return `<span style="font-weight: bold; font-size: 1.2em;">${data}</span>`;
        },
      },
      {
        data: "tipo_documento",
        render: function (data, type, row) {
          if (data == "DNI") {
            return '<span class="badge bg-success">DNI</span>';
          } else if (data == "PASAPORTE") {
            return '<span class="badge bg-primary">PASAPORTE</span>';
          } else {
            return '<span class="badge bg-warning">CARNET DE EXTRANJERIA</span>';
          }
        },
      },
      { data: "Dni" },
      { data: "Estudiante" },
      {
        data: "Facultad",
        render: function (data, type, row) {
          if (data == "Ingeniería") {
            return '<span class="badge bg-success">INGENIERIA</span>';
          } else if (data == "Ciencias de la Salud") {
            return '<span class="badge bg-primary">CIENCIAS DE LA SALUD</span>';
          } else {
            return '<span class="badge bg-warning">CIENCIAS SOCIALES</span>';
          }
        },
      },
      { data: "Escuela" },
      { data: "Modo_obtencion" },
      { data: "fecha_registro1" },

      { data: "cede_nombre" },

      {
        data: "estado",
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return '<span class="badge bg-danger">SIN DIPLOMA</span>';
          } else if (data == "CON DIPLOMA") {
            return '<span class="badge bg-success">CON DIPLOMA</span>';
          }
        },
      },
      {
        data: "Reglamento_metadado",
        render: function (datae, type, row) {
          if (datae == "") {
            return (
              "<a href=" +
              datae +
              " target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>"
            );
          } else {
            return (
              "<a href=" +
              datae +
              " target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>"
            );
          }
        },
      },
      {
        data: "Archivo",
        render: function (data, type, row) {
          if (data == "controller/registro_general/documentos/" || data == "") {
            return "<a href='' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
          } else {
            return (
              "<a href='../" +
              data +
              "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>"
            );
          }
        },
      },
      {
        data: "estado",
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>";
          } else if (data == "CON DIPLOMA") {
            return "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' hidden style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>";
          }
        },
      },
    ],

    language: idioma_espanol,
    select: true,
  });
  tbl_general_titulo.on("draw.td", function () {
    var PageInfo = $("#tabla_registro_general").DataTable().page.info();
    tbl_general_titulo
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

$("#tabla_registro_general").on("click", ".mostrar", function () {
  var data = tbl_general_titulo.row($(this).parents("tr")).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_mas").modal("show");
  //DATOS DEL TITULADO
  document.getElementById("txt_tipo_documento").value = data.tipo_documento;

  document.getElementById("txt_dni_mas").value = data.Dni;
  document.getElementById("txt_nom_mas").value = data.Nombres;
  document.getElementById("txt_apepa_mas").value = data.Apellido_paterno;
  document.getElementById("txt_apema_mas").value = data.Apellido_materno;
  document.getElementById("txt_codigo_mas").value = data.Codigo;
  document.getElementById("select_sexo_mas").value = data.Sexo;
  document.getElementById("txt_movil_mas").value = data.Celular;
  document.getElementById("txt_dire_mas").value = data.Direccion;
  document.getElementById("txt_email_per_mas").value = data.correo_personal;
  document.getElementById("txt_email_insti_mas").value =
    data.correo_institucional;
  document.getElementById("txt_fecha_matri_mas").value = data.Fecha_matricula;
  document.getElementById("txt_fecha_egres_mas").value = data.Fecha_egreso;
  document.getElementById("txt_oberva_mas").value = data.Observaciones;
  //DATOS DEL EXPEDIENTE
  document.getElementById("txt_cede_mas").value = data.cede_nombre;
  document.getElementById("txt_facultad_mas").value = data.Facultad;
  document.getElementById("txt_escuela_mas").value = data.Escuela;
  document.getElementById("txt_titulo_mas").value = data.Titulo_de;
  document.getElementById("txt_modalidad_mas").value = data.Modalidad;
  document.getElementById("txt_rector_mas").value = data.Autoridad_1;
  document.getElementById("txt_secretario_mas").value = data.Autoridad_2;
  document.getElementById("txt_decano_mas").value = data.Autoridad_3;

  // LENGUAS
  document.getElementById("txt_auto_etnica_mas").value = data.DET_ETNICA;
  document.getElementById("txt_pueblo_indigena_mas").value = data.COD_ETNIA;
  document.getElementById("txt_lengua_indigena_mas").value = data.DET_LENGUA;
  document.getElementById("txt_lengua_detalle_mas").value = data.COD_LENGUA;

  document.getElementById("txt_fecha_reg_mas").value = data.expe;
  document.getElementById("txt_academi_mas").value = data.Acto_academico;
  document.getElementById("txt_acuerdo_mas").value = data.Acuerdo;
  document.getElementById("txt_Resolucion_mas").value =
    data.Resolucion_rectoral_N;
  document.getElementById("txt_expedicion_mas").value = data.Expedicion;
  document.getElementById("txt_libro_mas").value = data.Libro;
  document.getElementById("txt_folio_mas").value = data.Folio;
  document.getElementById("txt_registro_mas").value = data.Registro;
  //DATOS DE LA MODALIDAD Y DIPLOMA
  document.getElementById("txt_modo_estu_mas").value = data.Modo_estudio;
  document.getElementById("txt_trabajo_inve_mas").value =
    data.Trabajo_investigacion;
  document.getElementById("txt_metadata_mas").value = data.Reglamento_metadado;
  document.getElementById("txt_turni_mas").value = data.Turnitin;
  document.getElementById("txt_porce_mas").value = data.Porcentaje;
  document.getElementById("txt_centro_inve_mas").value =
    data.Centro_investigacion;
  document.getElementById("txt_proceden_bachi_mas").value =
    data.Proce_bachiller;
  document.getElementById("txt_procedeni_insti_ori_mas").value =
    data.Proce_insti_origen;
  document.getElementById("txt_proceden_titu_ori_mas").value =
    data.Proce_titulo_peda;
  document.getElementById("txt_fecha_matri_mod_mas").value =
    data.Fecha_matricula_modalidad;
  document.getElementById("txt_fecha_inicio_mod_mas").value =
    data.Fecha_inicio_modalidad;
  document.getElementById("txt_fecha_fin_mas").value = data.Fecha_fin_modalidad;
  document.getElementById("select_modo_sustenta_mas").value =
    data.Modo_sustentacion;

  document.getElementById("txt_fecha_cu_mas").value = data.fecha_consejo_uni;
  document.getElementById("txt_fecha_firma_mas").value = data.fecha_firma;

  document.getElementById("txt_resol_num").value = data.Resolucion_numero;
  document.getElementById("txt_fecha_reso_mas").value = data.fecha_resolucion;
  document.getElementById("txt_diploma_nume_mas").value = data.Diploma_numero;
  document.getElementById("txt_registro_n°_mas").value = data.Registro_numero;
  document.getElementById("txt_registro_libr_mas").value = data.Registro_libro;
  document.getElementById("txt_registro_folio_mas").value = data.Registro_folio;
  document.getElementById("select_tipo_diplo_mas").value =
    data.Diploma_tipo_emitido;
  document.getElementById("txt_fecha_inicio_tra_mas").value =
    data.Fecha_inicio_tramite;
  document.getElementById("txt_nro_credi_mas").value = data.Nro_creditos;
  document.getElementById("txt_nro_oficio_mas").value = data.Nro_oficio;
  document.getElementById("txt_fecha_secre_mas").value =
    data.fecha_secreatria_general;
});

//EDITAR
$("#tabla_registro_general").on("click", ".editar", function () {
  var data = tbl_general_titulo.row($(this).parents("tr")).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_editar").modal("show");
  //DATOS DEL TITULADO

  document.getElementById("txt_tipo_documento_editar").value =
    data.tipo_documento;

  document.getElementById("txt_dni_editar").value = data.Dni;
  document.getElementById("txt_nom_editar").value = data.Nombres;
  document.getElementById("txt_apepa_editar").value = data.Apellido_paterno;
  document.getElementById("txt_apema_editar").value = data.Apellido_materno;
  document.getElementById("txt_codigo_editar").value = data.Codigo;
  document.getElementById("select_sexo_editar").value = data.Sexo;
  document.getElementById("txt_movil_editar").value = data.Celular;
  document.getElementById("txt_dire_editar").value = data.Direccion;
  document.getElementById("txt_email_per_editar").value = data.correo_personal;
  document.getElementById("txt_email_insti_editar").value =
    data.correo_institucional;
  document.getElementById("txt_fecha_matri_editar").value =
    data.Fecha_matricula;
  document.getElementById("txt_fecha_egres_editar").value = data.Fecha_egreso;
  document.getElementById("txt_oberva_editar").value = data.Observaciones;
  //DATOS DEL EXPEDIENTE
  document.getElementById("txt_id_expediente").value = data.Id_expediente;

  $("#txt_cede_editar").select2().val(data.Id_cede).trigger("change.select2");
  $("#txt_escuela_editar")
    .select2()
    .val(data.Id_escuela)
    .trigger("change.select2");

  document.getElementById("txt_titulo_editar").value = data.Titulo_de;
  document.getElementById("txt_modalidad_editar").value = data.Modalidad;
  document.getElementById("id_autoridad_editar").value = data.id_autoridad;

  document.getElementById("txt_rector_editar").value = data.Autoridad_1;
  document.getElementById("txt_secretario_editar").value = data.Autoridad_2;
  document.getElementById("txt_decano_editar").value = data.Autoridad_3;
  // LENGUAS
  document.getElementById("txt_auto_etnica_editar").value = data.DET_ETNICA;
  document.getElementById("txt_pueblo_indigena_editar").value = data.COD_ETNIA;
  document.getElementById("txt_lengua_indigena_editar").value = data.DET_LENGUA;
  document.getElementById("txt_lengua_detalle_editar").value = data.COD_LENGUA;

  document.getElementById("txt_fecha_reg_editar").value = data.expe;
  document.getElementById("txt_academi_editar").value = data.Acto_academico;
  document.getElementById("txt_acuerdo_editar").value = data.Acuerdo;
  document.getElementById("txt_Resolucion_editar").value =
    data.Resolucion_rectoral_N;
  document.getElementById("txt_expedicion_editar").value = data.Expedicion;
  document.getElementById("txt_libro_editar").value = data.Libro;
  document.getElementById("txt_folio_editar").value = data.Folio;
  document.getElementById("txt_registro_editar").value = data.Registro;
  document.getElementById("txt_archivo_actual").value = data.Archivo;

  //DATOS DE LA MODALIDAD Y DIPLOMA
  document.getElementById("txt_id_modalidad").value = data.Id_modalidad;
  document.getElementById("txt_modo_estu_editar").value = data.Modo_estudio;
  document.getElementById("txt_trabajo_inve_editar").value =
    data.Trabajo_investigacion;
  document.getElementById("txt_metadata_editar").value =
    data.Reglamento_metadado;
  document.getElementById("txt_turni_editar").value = data.Turnitin;
  document.getElementById("txt_porce_editar").value = data.Porcentaje;
  document.getElementById("txt_centro_inve_editar").value =
    data.Centro_investigacion;
  document.getElementById("txt_proceden_bachi_editar").value =
    data.Proce_bachiller;
  document.getElementById("txt_procedeni_insti_ori_editar").value =
    data.Proce_insti_origen;
  document.getElementById("txt_proceden_titu_ori_editar").value =
    data.Proce_titulo_peda;
  document.getElementById("txt_fecha_matri_mod_editar").value =
    data.Fecha_matricula_modalidad;
  document.getElementById("txt_fecha_inicio_mod_editar").value =
    data.Fecha_inicio_modalidad;
  document.getElementById("txt_fecha_fin_editar").value =
    data.Fecha_fin_modalidad;
  document.getElementById("select_modo_sustenta_editar").value =
    data.Modo_sustentacion;

  document.getElementById("txt_id_diploma").value = data.Id_Diploma;

  document.getElementById("txt_fecha_cu_editar").value = data.fecha_consejo_uni;
  document.getElementById("txt_fecha_firma_editar").value = data.fecha_firma;
  document.getElementById("txt_resol_editar").value = data.Resolucion_numero;
  document.getElementById("txt_fecha_reso_editar").value =
    data.fecha_resolucion;
  document.getElementById("txt_diploma_nume_editar").value =
    data.Diploma_numero;
  document.getElementById("txt_registro_n°_editar").value =
    data.Registro_numero;
  document.getElementById("txt_registro_libr_editar").value =
    data.Registro_libro;
  document.getElementById("txt_registro_folio_editar").value =
    data.Registro_folio;
  document.getElementById("select_tipo_diplo_editar").value =
    data.Diploma_tipo_emitido;
  document.getElementById("txt_fecha_inicio_tra_editar").value =
    data.Fecha_inicio_tramite;
  document.getElementById("txt_nro_credi_editar").value = data.Nro_creditos;
  document.getElementById("txt_nro_oficio_editar").value = data.Nro_oficio;
  document.getElementById("txt_fecha_secre_editar").value =
    data.fecha_secreatria_general;
});

//AGREGAR DIPLOMA
$("#tabla_registro_general").on("click", ".agregar", function () {
  var data = tbl_general_titulo.row($(this).parents("tr")).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    var data = tbl_general_titulo.row(this).data();
  }
  $("#modal_registrar_diploma").modal("show");
  document.getElementById("lb_titulo_datos2").innerHTML =
    "<b>DNI: </b>" + data.Dni;
  document.getElementById("lb_titulo_datos3").innerHTML =
    "<b>ESTUDIANTE: </b>" + data.Estudiante;
  document.getElementById("lb_titulo_datos4").innerHTML =
    "<b>FACULTAD - ESCUELA PROFESIONAL: </b>" +
    data.Facultad +
    " - " +
    data.Escuela;
  document.getElementById("lb_titulo_datos5").innerHTML =
    "<b>MODALIDAD</b>: </b>" + data.Modo_obtencion;

  document.getElementById("id_expe").value = data.Id_expediente;
  document.getElementById("txt_id_diplo").value = data.Id_Diploma;

  document.getElementById("txt_fecha_cu").value = data.fecha_consejo_uni;
  document.getElementById("txt_fecha_firma").value = data.fecha_firma_consejo;
  document.getElementById("txt_fecha_secre").value = data.fecha_colación;
  document.getElementById("txt_fecha_reso").value = data.fecha_resolucion;
  document.getElementById("txt_nro_oficio").value = data.numero_oficio;
  //ENVIOS CORREO
  document.getElementById("txt_fecha_cola").value = data.fecha_colación;
  document.getElementById("txt_correo").value = data.correo_personal;
  //ENVIOS CORREO DATOS
  document.getElementById("nom").value = data.Nombres;
  document.getElementById("ape").value = data.Apellido_paterno;
  document.getElementById("mate").value = data.Apellido_materno;

  Traernumero();
});

function Cargar_Select_Cede() {
  $.ajax({
    url: "../controller/expediente_bachiller/controlador_cargar_select_cede.php",
    type: "POST",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
      }
    } else {
      cadena += "<option value=''>No hay cedes en la base de datos</option>";
    }

    document.getElementById("txtfilial").innerHTML = cadena;
  });
}

function Cargar_Select_Carrera_editar() {
  $.ajax({
    url: "../controller/expediente_titulado/controlador_cargar_select_carrerasolo.php",
    type: "POST",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" +
          data[i][0] +
          "'>FACULTAD: " +
          data[i][1] +
          " - ESCUELA: " +
          data[i][2] +
          "</option>";
      }
      document.getElementById("txt_escuela_editar").innerHTML = cadena;
      document.getElementById("txt_escuela_editar").innerHTML = cadena;
      document.getElementById("txtes").innerHTML = cadena;

      var id = $("#txt_escuela_editar").val();
      Traergrado(id);
    } else {
      cadena += "<option value=''>No hay tipos disponibles</option>";
      document.getElementById("txt_escuela_editar").innerHTML = cadena;
    }
  });
}

//REGISTRO
function Cargar_Select_Facultad() {
  $.ajax({
    url: "../controller/carreras/controlador_cargar_select_facultad.php",
    type: "POST",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let cadena = "<option value=''>Seleccione</option>";
    if (data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
      }
      $("#select_facultad").html(cadena);
      $("#txtfacu").html(cadena);
      $("#txtfacu_filial").html(cadena);

      // Listener para cambios manuales o automatizados
      $("#select_facultad")
        .off("change")
        .on("change", function (e, idToSelect) {
          Cargar_Select_facul_carrera($(this).val(), idToSelect);
        });

      // Inicialización opcional si ya hay un valor (normalmente vacío al abrir modal)
      var id = $("#select_facultad").val();
      if (id) Cargar_Select_facul_carrera(id);
    } else {
      cadena += "<option value=''>No se encontraron registros</option>";
      $("#select_facultad").html(cadena);
    }
  });
}

function Traerauto(id_auto) {
  $.ajax({
    url: "../controller/expediente_titulado/controlador_traerautoridad.php",
    type: "POST",
    data: {
      id_auto: id_auto,
    },
  }).done(function (resp) {
    var data = JSON.parse(resp);
    var cadena = "";
    if (data.length > 0) {
      $("#id_autoridad").val(data[0][2]);
      $("#txt_rector").val(data[0][3]);
      $("#txt_secretario").val(data[0][4]);
      $("#txt_decano").val(data[0][5]);

      $("#id_autoridad_editar").val(data[0][2]);
      $("#txt_rector_editar").val(data[0][3]);
      $("#txt_secretario_editar").val(data[0][4]);
      $("#txt_decano_editar").val(data[0][5]);
    } else {
      console.log(
        "No se encontraron registros de autoridades para esta escuela.",
      );
      $("#id_autoridad, #id_autoridad_editar").val("");
      $("#txt_rector, #txt_rector_editar").val("");
      $("#txt_secretario, #txt_secretario_editar").val("");
      $("#txt_decano, #txt_decano_editar").val("");
    }
  });
}
//TRAER TODO LAS CARRERAS
function Cargar_Select_facul_carrera(id, idToSelect) {
  $.ajax({
    url: "../controller/expediente_titulado/controlador_cargar_select_facu_carrera.php",
    type: "POST",
    data: { id: id },
  }).done(function (resp) {
    var data = JSON.parse(resp);
    var cadena = "<option value=''>Seleccione</option>";
    if (data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
      }
      $("#select_escuela").html(cadena);
      $("#txtes").html(cadena);
      $("#txtes_filial").html(cadena);

      // Primero registramos el listener para cambios (cascada)
      $("#select_escuela")
        .off("change")
        .on("change", function () {
          var idSeleccionado = $(this).val();
          if (idSeleccionado) {
            Traergrado(idSeleccionado);
            Traerauto(idSeleccionado);
          }
        });

      // Luego, si se pasó un ID para seleccionar (vía buscarBachiller), lo aplicamos y disparamos el evento change
      if (idToSelect) {
        $("#select_escuela").val(idToSelect).trigger("change");
      }
    } else {
      cadena += "<option value=''>No se encontraron registros</option>";
      $("#select_escuela").html(cadena);
      $("#txtes").html(cadena);
      $("#txtes_filial").html(cadena);
    }
  });
}

function Traergrado(idgrado) {
  console.log("Ejecutando Traergrado con ID:", idgrado); // Log para depurar el ID

  $.ajax({
    url: "../controller/expediente_titulado/controlador_traergrado.php",
    type: "POST",
    data: { id: idgrado },
  })
    .done(function (resp) {
      console.log("Respuesta de Traergrado:", resp); // Depura la respuesta del servidor
      var data = JSON.parse(resp);

      if (data.length > 0) {
        // Obtén el género seleccionado
        var genero = $("#select_sexo").val(); // Asume que tienes un select con id "select_sexo"
        var genero2 = $("#select_sexo_editar").val(); // Asume que tienes un select con id "select_sexo"

        // Obtén el código de la carrera desde el value
        var carrera = data[0][0]; // Asegúrate de que data[0][0] contenga el código esperado

        // Determina el título en función del género y la carrera
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
            titulo =
              "Licenciado en Educación – Especialidad Lengua Española y Quechua";
          } else if (carrera == 22) {
            titulo =
              "Licenciado en Educación – Especialidad Matemática e Informática";
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
            titulo =
              "Licenciada en Educación – Especialidad Lengua Española y Quechua";
          } else if (carrera == 22) {
            titulo =
              "Licenciada en Educación – Especialidad Matemática e Informática";
          } else if (carrera == 23) {
            titulo = "Licenciada en Educación – Nivel Primaria";
          }
        }

        console.log("Título determinado:", titulo);

        $("#txt_titulo").val(titulo);
        $("#txt_titulo_editar").val(titulo);
      } else {
        console.log("No se encontraron registros.");
        $("#txt_titulo").val("No se encontraron registros");
        $("#txt_titulo_editar").val("No se encontraron registros");
      }
    })
    .fail(function (xhr, status, error) {
      console.log("Error en la solicitud AJAX de Traergrado:", status, error);
    });
}

function AbrirModal() {
  $("#modal_registro").modal({ backdrop: "static", keyboard: false });
  $("#modal_registro").modal("show");
  listar_autoridad();
}

//AGREGAR DIPLOMA
function Agregar_diploma() {
  let idexpe = document.getElementById("id_expe").value;
  let id = document.getElementById("txt_id_diplo").value;
  let fechacu = document.getElementById("txt_fecha_cu").value;
  let fechafirma = document.getElementById("txt_fecha_firma").value;
  let numreso = document.getElementById("txt_nume_resol").value;
  let fechareso = document.getElementById("txt_fecha_reso").value;
  let diplonum = document.getElementById("txt_diploma_nume").value;
  let regis = document.getElementById("txt_registro_n°").value;
  let regilibro = document.getElementById("txt_registro_libr").value;
  let regisfolio = document.getElementById("txt_registro_folio").value;
  let tipodiplo = document.getElementById("select_tipo_diplo").value;
  let fechainiciotra = document.getElementById("txt_fecha_inicio_tra").value;
  let nrocred = parseInt(document.getElementById("txt_nro_credi").value);
  let nrooficio = document.getElementById("txt_nro_oficio").value;
  let fechasecre = document.getElementById("txt_fecha_secre").value;
  let fechamatri = document.getElementById("txt_fecha_matricula").value;
  let fechaegre = document.getElementById("txt_fecha_egreso").value;

  let idusuario = document.getElementById("txtprincipalid").value;
  let correo = document.getElementById("txt_correo").value;
  let fechacol = document.getElementById("txt_fecha_cola").value;

  let nom = document.getElementById("nom").value;
  let ape = document.getElementById("ape").value;
  let mate = document.getElementById("mate").value;

  // Validar campos vacíos
  if (
    fechacu.length === 0 ||
    fechafirma.length === 0 ||
    numreso.length === 0 ||
    fechareso.length === 0 ||
    tipodiplo.length === 0 ||
    diplonum.length === 0 ||
    regis.length === 0 ||
    regilibro.length === 0 ||
    regisfolio.length === 0 ||
    fechainiciotra.length === 0 ||
    isNaN(nrocred) ||
    nrooficio.length === 0 ||
    fechasecre.length === 0
  ) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacíos",
      "warning",
    );
  }

  if (fechamatri.length === 0 || fechaegre.length === 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "La fecha de matrícula y fecha de egreso son importantes",
      "warning",
    );
  }

  // Función para validar si una fecha es válida
  function esFechaValida(fechaString) {
    let fecha = new Date(fechaString);
    return (
      fecha instanceof Date &&
      !isNaN(fecha) &&
      fechaString.match(/^\d{4}-\d{2}-\d{2}$/)
    );
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
    { valor: fechacol, nombre: "fecha de colegiatura" },
  ];

  for (let i = 0; i < fechasAValidar.length; i++) {
    if (!esFechaValida(fechasAValidar[i].valor)) {
      return Swal.fire(
        "Mensaje de Advertencia",
        `La ${fechasAValidar[i].nombre} no es válida. Use el formato AAAA-MM-DD`,
        "warning",
      );
    }
  }

  // Validar que nrocred no sea menor a 210
  if (nrocred < 210) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El número de créditos no puede ser menor a 210",
      "warning",
    );
  }

  let fechaMatricula = new Date(fechamatri);
  let fechaEgreso = new Date(fechaegre);
  let fechaInicioTramite = new Date(fechainiciotra);
  let añoActual = new Date().getFullYear();

  // Validar que la fecha de inicio de trámite sea del año actual
  if (fechaInicioTramite.getFullYear() !== añoActual) {
    return Swal.fire(
      "Mensaje de Advertencia",
      `La fecha de inicio de trámite debe ser del año actual (${añoActual})`,
      "warning",
    );
  }

  // Validar que fecha de matrícula no sea mayor a fecha de egreso
  if (fechaMatricula > fechaEgreso) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "La fecha de matrícula no puede ser mayor a la fecha de egreso",
      "warning",
    );
  }

  // Validar que la fecha de egreso no sea menor a la fecha de matrícula
  if (fechaEgreso < fechaMatricula) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "La fecha de egreso no puede ser menor a la fecha de matrícula",
      "warning",
    );
  }

  // Validar que la diferencia entre matrícula y egreso sea >= 5 años (CORREGIDO)
  let diferenciaAnios =
    fechaEgreso.getFullYear() - fechaMatricula.getFullYear();
  let mesesDiferencia = fechaEgreso.getMonth() - fechaMatricula.getMonth();
  let diasDiferencia = fechaEgreso.getDate() - fechaMatricula.getDate();

  // Ajustar si los meses o días hacen que no se complete el año
  if (mesesDiferencia < 0 || (mesesDiferencia === 0 && diasDiferencia < 0)) {
    diferenciaAnios--;
  }

  if (diferenciaAnios < 5) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El período entre la fecha de matrícula y la fecha de egreso debe ser de al menos 5 años completos",
      "warning",
    );
  }

  // Validar que la fecha de inicio de trámite no sea antes de la fecha de egreso
  if (fechaInicioTramite < fechaEgreso) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "La fecha de inicio de trámite no puede ser antes de la fecha de egreso",
      "warning",
    );
  }

  $.ajax({
    url: "../controller/registro_general/controlador_agregar_diploma_titulo.php",
    type: "POST",
    data: {
      idexpe,
      id,
      fechacu,
      fechafirma,
      numreso,
      fechareso,
      diplonum,
      regis,
      regilibro,
      regisfolio,
      tipodiplo,
      fechainiciotra,
      nrocred,
      nrooficio,
      fechasecre,
      fechamatri,
      fechaegre,
      idusuario,
      correo,
      fechacol,
      nom,
      ape,
      mate,
    },
  }).done(function (resp) {
    if (resp.status) {
      contadorFolio++;
      contadorLibro++;

      localStorage.setItem("contadorFolio", contadorFolio);
      localStorage.setItem("contadorLibro", contadorLibro);

      console.log(contadorFolio, contadorLibro);
      Swal.fire("Mensaje de Confirmación", resp.message, "success");
      var url =
        "../view/MPDF/REPORTE/diploma.php?codigo=" +
        id +
        "&tamaño=55&tamaño2=93&tamaño3=83&tamaño4=41#zoom=100%";
      tbl_general_titulo.ajax.reload();
      $("#modal_registrar_diploma").modal("hide");
      var newWindow = window.open(
        url,
        "DIPLOMA TITULO PROFESIONAL",
        "scrollbars=NO",
      );
      if (newWindow) {
        newWindow.moveTo(0, 0);
        newWindow.resizeTo(screen.width, screen.height);
      }
    } else {
      Swal.fire("Mensaje de Error", resp.message, "error");
    }
  });
}

//REGISTRAR TITULADO
function Registrar_Titulado() {
  //DATOS DEL ESTUDIANTE
  let tipodoc = document.getElementById("select_tipo_documento").value;
  let dni = document.getElementById("txt_dni").value;
  let txtdni2 = document.getElementById("txtdni2").value;

  let documentoFinal = tipodoc === "DNI" ? dni : txtdni2;

  let nombres = document.getElementById("txt_nom").value;
  let apepa = document.getElementById("txt_apepa").value;
  let apema = document.getElementById("txt_apema").value;
  let codigo = document.getElementById("txt_codigo").value;
  let sexo = document.getElementById("select_sexo").value;
  let celular = document.getElementById("txt_movil").value;
  let direc = document.getElementById("txt_dire").value;
  let emaper = document.getElementById("txt_email_per").value;
  let emainsti = document.getElementById("txt_email_insti").value;
  let fecha_matr = document.getElementById("txt_fecha_matri").value;
  let fecha_egre = document.getElementById("txt_fecha_egres").value;
  let observa = document.getElementById("txt_oberva").value;
  //DATOS DEL EXPEDIENTE

  let ced = document.getElementById("txtsede").value;
  let esc = document.getElementById("select_escuela").value;
  let titu = document.getElementById("txt_titulo").value;
  let moda = document.getElementById("txt_modalidad").value;
  let idauto = document.getElementById("id_autoridad").value;
  let fecha = document.getElementById("txt_fecha_reg").value;
  let acad = document.getElementById("txt_academi").value;
  let acu = document.getElementById("txt_acuerdo").value;
  let res = document.getElementById("txt_Resolucion").value;
  let exped = document.getElementById("txt_expedicion").value;
  let lib = document.getElementById("txt_libro").value;
  let fol = document.getElementById("txt_folio").value;
  let reg = document.getElementById("txt_registro").value;
  let arc = document.getElementById("txt_archivo").value;

  //DATOS DE LA MODALIDAD
  let mod_estu = document.getElementById("txt_modo_estu").value;
  let tra_inv = document.getElementById("txt_trabajo_inve").value;
  let turn = document.getElementById("txt_turni").value;
  let porc = document.getElementById("txt_porce").value;
  let cent = document.getElementById("txt_centro_inve").value;
  let meta = document.getElementById("txt_metadata").value;
  let proce_bach = document.getElementById("txt_proceden_bachi").value;
  let proce_insti = document.getElementById("txt_procedeni_insti_ori").value;
  let proce_titu = document.getElementById("txt_proceden_titu_ori").value;
  let fecha_matri = document.getElementById("txt_fecha_matri_mod").value;
  let fecha_inici = document.getElementById("txt_fecha_inicio_mod").value;
  let fecha_fin = document.getElementById("txt_fecha_fin").value;
  let mod_sustenta = document.getElementById("select_modo_sustenta").value;
  let idusuario = document.getElementById("txtprincipalid").value;

  // LENGUAS
  let auto_etnica = document.getElementById("txt_auto_etnica").value;
  let pueblo_indi = document.getElementById("txt_pueblo_indigena").value;
  let lengua_indi = document.getElementById("txt_lengua_indigena").value;
  let lengua_detalle = document.getElementById("txt_lengua_detalle").value;
  if (ced === "") {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Seleccione una cede en la segunda pestaña",
      "warning",
    );
  }
  if (esc === "") {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Seleccione una facultad y programa profesional",
      "warning",
    );
  }
  if (validar_email(emaper)) {
  } else {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El formato de Email es incorrecto",
      "warning",
    );
  }

  if (documentoFinal.length === 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El número de documento es obligatorio",
      "warning",
    );
  }

  let extension = arc.split(".").pop();
  let nombrearchivo = "";
  let f = new Date();

  // Validación general de campos
  if (
    nombres.length === 0 ||
    apepa.length === 0 ||
    apema.length === 0 ||
    sexo.length === 0 ||
    celular.length === 0 ||
    direc.length === 0 ||
    fecha_matr.length === 0 ||
    fecha_egre.length === 0
  ) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacíos, revise por favor",
      "warning",
    );
  }
  if (arc.length > 0) {
    nombrearchivo =
      "EXPE-" +
      documentoFinal +
      "-" +
      f.getDate() +
      "-" +
      (f.getMonth() + 1) +
      "-" +
      f.getFullYear() +
      "-" +
      f.getHours() +
      "-" +
      f.getMinutes() +
      "-" +
      f.getSeconds() +
      "." +
      extension;
  }

  if (mod_estu.length == 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El modo de estudio es un campo obligatorio",
      "warning",
    );
  }

  let formData = new FormData();
  let achivoobj = $("#txt_archivo")[0].files[0];

  //DATOS DEL ESTUDIANTE
  formData.append("tipodoc", tipodoc);
  formData.append("documentoFinal", documentoFinal);
  formData.append("nombres", nombres);
  formData.append("apepa", apepa);
  formData.append("apema", apema);
  formData.append("codigo", codigo);
  formData.append("sexo", sexo);
  formData.append("celular", celular);
  formData.append("direc", direc);
  formData.append("emaper", emaper);
  formData.append("emainsti", emainsti);
  formData.append("fecha_matr", fecha_matr);
  formData.append("fecha_egre", fecha_egre);
  formData.append("observa", observa);
  //DATOS DEL EXPEDIENTE
  formData.append("ced", ced);
  formData.append("esc", esc);
  formData.append("titu", titu);
  formData.append("moda", moda);
  formData.append("idauto", idauto);
  formData.append("fecha", fecha);
  formData.append("acad", acad);
  formData.append("acu", acu);
  formData.append("res", res);
  formData.append("exped", exped);
  formData.append("lib", lib);
  formData.append("fol", fol);
  formData.append("reg", reg);
  formData.append("nombrearchivo", nombrearchivo);
  formData.append("achivoobj", achivoobj);

  //DATOS DE LA MODALIDAD
  formData.append("mod_estu", mod_estu);
  formData.append("tra_inv", tra_inv);
  formData.append("turn", turn);
  formData.append("porc", porc);
  formData.append("cent", cent);
  formData.append("meta", meta);
  formData.append("proce_bach", proce_bach);
  formData.append("proce_insti", proce_insti);
  formData.append("proce_titu", proce_titu);
  formData.append("fecha_matri", fecha_matri);
  formData.append("fecha_inici", fecha_inici);
  formData.append("fecha_fin", fecha_fin);
  formData.append("mod_sustenta", mod_sustenta);
  formData.append("idusuario", idusuario);
  formData.append("auto_etnica", auto_etnica);
  formData.append("pueblo_indi", pueblo_indi);
  formData.append("lengua_indi", lengua_indi);
  formData.append("lengua_detalle", lengua_detalle);

  $.ajax({
    url: "../controller/registro_general/controlador_registro_titulado_secre.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        if (resp == 1) {
          Swal.fire(
            "Mensaje de Confirmación",
            "Se actualizo de forma correcta al Titulado con el N° Doc: " +
              documentoFinal,
            "success",
          ).then((value) => {
            $("#modal_registro").modal("hide");
            limpiarCampos();
            tbl_general_titulo.ajax.reload();
            document.getElementById("txt_archivo_editar").value = "";
          });
        } else {
          Swal.fire(
            "Mensaje de Advertencia",
            "El registro que intenta insertar, ya existe en la BD, revise por favor",
            "warning",
          );
        }
      } else {
        Swal.fire(
          "Mensaje de Advertencia",
          "No se pudo realizar el registro verifique por favor",
          "warning",
        );
      }
    },
  });
  return false;
}

function limpiarCampos() {
  document.getElementById("txt_dni").value = "";
  document.getElementById("txtdni2").value = "";
  document.getElementById("txt_nom").value = "";
  document.getElementById("txt_apepa").value = "";
  document.getElementById("txt_apema").value = "";
  document.getElementById("txt_codigo").value = "";
  document.getElementById("txt_movil").value = "";
  document.getElementById("txt_dire").value = "";
  document.getElementById("txt_email_per").value = "";
  document.getElementById("txt_email_insti").value = "";
  document.getElementById("txt_oberva").value = "";
  document.getElementById("txt_academi").value = "";
  document.getElementById("txt_acuerdo").value = "";
  document.getElementById("txt_Resolucion").value = "";
  document.getElementById("txt_expedicion").value = "";
  document.getElementById("txt_libro").value = "";
  document.getElementById("txt_folio").value = "";
  document.getElementById("txt_registro").value = "";
  document.getElementById("txt_trabajo_inve").value = "";
  document.getElementById("txt_turni").value = "";
  document.getElementById("txt_porce").value = "";
  document.getElementById("txt_centro_inve").value = "";
  document.getElementById("txt_metadata").value = "";
  document.getElementById("txt_proceden_bachi").value = "";
  document.getElementById("txt_procedeni_insti_ori").value = "";
  document.getElementById("txt_proceden_titu_ori").value = "";
  document.getElementById("txt_fecha_matri_mod").value = "";
  document.getElementById("txt_fecha_inicio_mod").value = "";
  document.getElementById("txt_fecha_fin").value = "";
  document.getElementById("txt_rector").value = "";
  document.getElementById("txt_secretario").value = "";
  document.getElementById("txt_decano").value = "";
  document.getElementById("txt_titulo").value = "";

  // No resetear selects completamente para evitar errores al re-seleccionar
  $("#select_facultad").val("").trigger("change");
}
function validar_email(email) {
  var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email) ? true : false;
}

function Modificar_Titulado() {
  //DATOS DEL ESTUDIANTE

  let dni = document.getElementById("txt_dni_editar").value;
  let nombres = document.getElementById("txt_nom_editar").value;
  let apepa = document.getElementById("txt_apepa_editar").value;
  let apema = document.getElementById("txt_apema_editar").value;
  let codigo = document.getElementById("txt_codigo_editar").value;
  let sexo = document.getElementById("select_sexo_editar").value;
  let celular = document.getElementById("txt_movil_editar").value;
  let direc = document.getElementById("txt_dire_editar").value;
  let emaper = document.getElementById("txt_email_per_editar").value;
  let emainsti = document.getElementById("txt_email_insti_editar").value;
  let fecha_matr = document.getElementById("txt_fecha_matri_editar").value;
  let fecha_egre = document.getElementById("txt_fecha_egres_editar").value;
  let observa = document.getElementById("txt_oberva_editar").value;
  //DATOS DEL EXPEDIENTE

  let idexpe = document.getElementById("txt_id_expediente").value;
  let ced = document.getElementById("txtsede").value;
  let esc = document.getElementById("txt_escuela_editar").value;
  let titu = document.getElementById("txt_titulo_editar").value;
  let moda = document.getElementById("txt_modalidad_editar").value;
  let idauto = document.getElementById("id_autoridad_editar").value;
  let fecha = document.getElementById("txt_fecha_reg_editar").value;
  let acad = document.getElementById("txt_academi_editar").value;
  let acu = document.getElementById("txt_acuerdo_editar").value;
  let res = document.getElementById("txt_Resolucion_editar").value;
  let exped = document.getElementById("txt_expedicion_editar").value;
  let lib = document.getElementById("txt_libro_editar").value;
  let fol = document.getElementById("txt_folio_editar").value;
  let reg = document.getElementById("txt_registro_editar").value;
  let archivoactual = document.getElementById("txt_archivo_actual").value;
  let arc = document.getElementById("txt_archivo_editar").value;

  //DATOS DE LA MODALIDAD

  let idmoda = document.getElementById("txt_id_modalidad").value;
  let mod_estu = document.getElementById("txt_modo_estu_editar").value;
  let tra_inv = document.getElementById("txt_trabajo_inve_editar").value;

  let turn = document.getElementById("txt_turni_editar").value;
  let porc = document.getElementById("txt_porce_editar").value;
  let cent = document.getElementById("txt_centro_inve_editar").value;
  let meta = document.getElementById("txt_metadata_editar").value;

  let proce_bach = document.getElementById("txt_proceden_bachi_editar").value;
  let proce_insti = document.getElementById(
    "txt_procedeni_insti_ori_editar",
  ).value;
  let proce_titu = document.getElementById(
    "txt_proceden_titu_ori_editar",
  ).value;
  let fecha_matri = document.getElementById("txt_fecha_matri_mod_editar").value;
  let fecha_inici = document.getElementById(
    "txt_fecha_inicio_mod_editar",
  ).value;
  let fecha_fin = document.getElementById("txt_fecha_fin_editar").value;
  let mod_sustenta = document.getElementById(
    "select_modo_sustenta_editar",
  ).value;

  //DATOS DEL DIPLOMA
  let iddiploma = document.getElementById("txt_id_diploma").value;
  let fechacu = document.getElementById("txt_fecha_cu_editar").value;
  let fechafirma = document.getElementById("txt_fecha_firma_editar").value;

  let resol = document.getElementById("txt_resol_editar").value;
  let fechareso = document.getElementById("txt_fecha_reso_editar").value;

  let numdiplo = document.getElementById("txt_diploma_nume_editar").value;
  let numregis = document.getElementById("txt_registro_n°_editar").value;
  let libroregi = document.getElementById("txt_registro_libr_editar").value;
  let regisfolio = document.getElementById("txt_registro_folio_editar").value;
  let tipodiplo = document.getElementById("select_tipo_diplo_editar").value;
  let fechaini = document.getElementById("txt_fecha_inicio_tra_editar").value;
  let nrocre = document.getElementById("txt_nro_credi_editar").value;
  let nrooficio = document.getElementById("txt_nro_oficio_editar").value;
  let fechasecre = document.getElementById("txt_fecha_secre_editar").value;
  let idusuario = document.getElementById("txtprincipalid").value;
  // LENGUAS
  let auto_etnica = document.getElementById("txt_auto_etnica_editar").value;
  let pueblo_indi = document.getElementById("txt_pueblo_indigena_editar").value;
  let lengua_indi = document.getElementById("txt_lengua_indigena_editar").value;
  let lengua_detalle = document.getElementById(
    "txt_lengua_detalle_editar",
  ).value;

  // if(arc.length==0){
  //   return Swal.fire("Mensaje de Advertencia","Seleccione algún tipo de documento","warning")
  // }
  if (validar_email(emaper)) {
  } else {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El formato de Email es incorrecto",
      "warning",
    );
  }

  let extension = arc.split(".").pop(); //DOCUMENTO.PPT
  let nombrearchivo = "";
  let f = new Date();
  if (
    dni.length == 0 ||
    nombres.length == 0 ||
    apepa.length == 0 ||
    apema.length == 0 ||
    sexo.length == 0 ||
    celular.length == 0 ||
    direc.length == 0 ||
    fecha_matr.length == 0 ||
    fecha_egre.length == 0
  ) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacios en el registro de estudiantes, revise por favor",
      "warning",
    );
  }

  if (arc.length > 0) {
    nombrearchivo =
      "EXPE-" +
      dni +
      "-" +
      f.getDate() +
      "-" +
      (f.getMonth() + 1) +
      "-" +
      f.getFullYear() +
      "-" +
      f.getHours() +
      "-" +
      f.getMinutes() +
      "-" +
      f.getSeconds() +
      "." +
      extension;
  }

  if (mod_estu.length == 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El modo de estudio es un campo obligatorio",
      "warning",
    );
  }

  let formData = new FormData();
  let achivoobj = $("#txt_archivo_editar")[0].files[0]; //El objeto del archivo adjuntado

  //DATOS DEL ESTUDIANTE
  formData.append("dni", dni);
  formData.append("nombres", nombres);
  formData.append("apepa", apepa);
  formData.append("apema", apema);
  formData.append("codigo", codigo);
  formData.append("sexo", sexo);
  formData.append("celular", celular);
  formData.append("direc", direc);
  formData.append("emaper", emaper);
  formData.append("emainsti", emainsti);
  formData.append("fecha_matr", fecha_matr);
  formData.append("fecha_egre", fecha_egre);
  formData.append("observa", observa);

  //DATOS DEL EXPEDIENTE

  formData.append("idexpe", idexpe);
  formData.append("ced", ced);
  formData.append("esc", esc);
  formData.append("titu", titu);
  formData.append("moda", moda);
  formData.append("idauto", idauto);
  formData.append("fecha", fecha);
  formData.append("acad", acad);
  formData.append("acu", acu);
  formData.append("res", res);
  formData.append("exped", exped);
  formData.append("lib", lib);
  formData.append("fol", fol);
  formData.append("reg", reg);
  formData.append("archivoactual", archivoactual);
  formData.append("nombrearchivo", nombrearchivo);
  formData.append("achivoobj", achivoobj);

  //DATOS DE LA MODALIDAD
  formData.append("idmoda", idmoda);
  formData.append("mod_estu", mod_estu);
  formData.append("tra_inv", tra_inv);
  formData.append("turn", turn);
  formData.append("porc", porc);
  formData.append("cent", cent);
  formData.append("meta", meta);
  formData.append("proce_bach", proce_bach);
  formData.append("proce_insti", proce_insti);
  formData.append("proce_titu", proce_titu);
  formData.append("fecha_matri", fecha_matri);
  formData.append("fecha_inici", fecha_inici);
  formData.append("fecha_fin", fecha_fin);
  formData.append("mod_sustenta", mod_sustenta);

  //DATOS DEL DIPLOMA
  formData.append("iddiploma", iddiploma);

  formData.append("fechacu", fechacu);
  formData.append("fechafirma", fechafirma);

  formData.append("resol", resol);
  formData.append("fechareso", fechareso);
  formData.append("numdiplo", numdiplo);
  formData.append("numregis", numregis);
  formData.append("libroregi", libroregi);
  formData.append("regisfolio", regisfolio);
  formData.append("tipodiplo", tipodiplo);
  formData.append("fechaini", fechaini);
  formData.append("nrocre", nrocre);
  formData.append("nrooficio", nrooficio);
  formData.append("fechasecre", fechasecre);
  formData.append("idusuario", idusuario);

  formData.append("auto_etnica", auto_etnica);
  formData.append("pueblo_indi", pueblo_indi);
  formData.append("lengua_indi", lengua_indi);
  formData.append("lengua_detalle", lengua_detalle);

  $.ajax({
    url: "../controller/registro_general/controlador_modificar_titulado.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        if (resp == 1) {
          Swal.fire(
            "Mensaje de Confirmación",
            "Se actualizo de forma correcta al Titulado con el DNI N°: " + dni,
            "success",
          ).then((value) => {
            tbl_general_titulo.ajax.reload();
            $("#modal_editar").modal("hide");
            document.getElementById("txt_archivo_editar").value = "";
          });
        } else {
          Swal.fire(
            "Mensaje de Advertencia",
            "El registro que intenta actualizar su número de diploma, registro o resolución ya se encuentran registrados en la base de datos,revise por favor",
            "warning",
          );
        }
      } else {
        Swal.fire(
          "Mensaje de Advertencia",
          "No se pudo realizar el registro verifique por favor",
          "warning",
        );
      }
    },
  });
  return false;
}

//ELIMINANDO ROL
function Eliminar_Expediente(id) {
  $.ajax({
    url: "../controller/registro_general/controlador_eliminar_registro_general.php",
    type: "POST",
    data: {
      id: id,
    },
  }).done(function (resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de Confirmación",
        "Se elimino el registro del titulando con exito",
        "success",
      ).then((value) => {
        tbl_general_titulo.ajax.reload();
      });
    } else {
      return Swal.fire(
        "Mensaje de Advetencia",
        "No se puede eliminar este registro por que esta siendo utilizado en otros registros, verifique por favor",
        "warning",
      );
    }
  });
}

//ENVIANDO AL BOTON DELETE
$("#tabla_registro_general").on("click", ".delete", function () {
  var data = tbl_general_titulo.row($(this).parents("tr")).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    var data = tbl_general_titulo.row(this).data();
  }
  Swal.fire({
    title: "Desea eliminar registro del titulando: " + data.Estudiante + "?",
    text: "Una vez aceptado se eliminara los datos de la modalidad, expediente y estudiante, si esta de acuerdo dale click en Si, Eliminar!!!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, Eliminar",
  }).then((result) => {
    if (result.isConfirmed) {
      Eliminar_Expediente(data.Dni);
    }
  });
});
// Función para manejar el click en elementos con clase .informe
// Al cargar la página, inicializar txt_info desde localStorage si existe
// Función para manejar el click en elementos con clase .informe
function imprimir_info() {
  $("#modal_informe").modal({ backdrop: "static", keyboard: false });

  $("#modal_informe").modal("show");
  // DATOS DEL TITULADO
}

function imprimir_info2() {
  $("#modal_informe_filial").modal({ backdrop: "static", keyboard: false });

  $("#modal_informe_filial").modal("show");
  // DATOS DEL TITULADO
}
// Función para imprimir informe por escuela
function Imprimir_informe() {
  var infoValue = parseInt(document.getElementById("txt_info").value, 10) || 0; // Obtener el valor actual de txt_info
  // Validar que el campo no esté vacío o sea 0
  if (isNaN(infoValue) || infoValue === 0) {
    return Swal.fire(
      "Mensaje de Advetencia",
      "Por favor ingrese el número del informe es obligatorio",
      "warning",
    );
  }

  var info = infoValue.toString();
  var grado = document.getElementById("txt_gr").value.toString();
  var escu = document.getElementById("txtes").value.toString();
  var fedes = document.getElementById("fechadesde").value.toString();
  var fehas = document.getElementById("fechahasta").value.toString();
  if (infoValue.length > 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El numero de documento es obligatorio.",
      "warning",
    );
  } else {
    var url =
      "../view/MPDF/REPORTE/informe_por_escuela.php?" +
      "info=" +
      encodeURIComponent(info) +
      "&grado=" +
      encodeURIComponent(grado) +
      "&escu=" +
      encodeURIComponent(escu) +
      "&fedes=" +
      encodeURIComponent(fedes) +
      "&fehas=" +
      encodeURIComponent(fehas) +
      "#zoom=100%";

    var width = screen.width;
    var height = screen.height;

    window.open(
      url,
      "Informe por Escuela",
      "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0",
    );

    // Incrementar el valor de txt_info solo después de generar el informe
    infoValue++;
    localStorage.setItem("infoValue", infoValue); // Guardar el nuevo valor en localStorage

    // Actualizar el valor en el campo de entrada #txt_info
    document.getElementById("txt_info").value = infoValue;
  }
}
// Función para imprimir informe por facultad
function Imprimir_informe_facultad() {
  var infoValue = parseInt(document.getElementById("txt_info").value, 10) || 0; // Obtener el valor actual de txt_info
  var info = infoValue.toString();
  var grado = document.getElementById("txt_gr").value.toString();
  var fac = document.getElementById("txtfacu").value.toString();
  var fedes = document.getElementById("fechadesde").value.toString();
  var fehas = document.getElementById("fechahasta").value.toString();

  if (infoValue.length > 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El numero de documento es obligatorio.",
      "warning",
    );
  } else {
    var url =
      "../view/MPDF/REPORTE/informe_por_facultad.php?" +
      "info=" +
      encodeURIComponent(info) +
      "&grado=" +
      encodeURIComponent(grado) +
      "&fac=" +
      encodeURIComponent(fac) +
      "&fedes=" +
      encodeURIComponent(fedes) +
      "&fehas=" +
      encodeURIComponent(fehas) +
      "#zoom=100%";

    var width = screen.width;
    var height = screen.height;

    window.open(
      url,
      "Informe por Facultad",
      "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0",
    );

    // Incrementar el valor de txt_info solo después de generar el informe
    infoValue++;
    localStorage.setItem("infoValue", infoValue); // Guardar el nuevo valor en localStorage

    // Actualizar el valor en el campo de entrada #txt_info
    document.getElementById("txt_info").value = infoValue;
  }
}

$("#tabla_registro_general").on("click", ".diploma", function () {
  var data = tbl_general_titulo.row($(this).parents("tr")).data();

  if (tbl_general_titulo.row(this).child.isShown()) {
    var data = tbl_general_titulo.row(this).data();
  }
  var url =
    "../view/MPDF/REPORTE/diploma.php?codigo=" +
    encodeURIComponent(data.Id_Diploma) +
    "#zoom=100%";

  // Abrir una nueva ventana con la URL construida
  var newWindow = window.open(
    url,
    "DIPLOMA TITULO PROFESIONAL",
    "scrollbars=NO",
  );

  // Asegurarse de que la ventana se abre en tamaño máximo
  if (newWindow) {
    newWindow.moveTo(0, 0);
    newWindow.resizeTo(screen.width, screen.height);
  }
});

function Traernumero() {
  $.ajax({
    url: "../controller/registro_general/controlador_traernumero.php",
    type: "POST",
  })
    .done(function (resp) {
      var data = JSON.parse(resp);
      var mensaje = "El siguiente número debe ser: ";
      var valor = data.length > 0 ? data[0][0] : "No se encontraron registros";
      var valor2 = data.length > 0 ? data[0][1] : "No se encontraron registros";
      var valor3 = data.length > 0 ? data[0][2] : "No se encontraron registros";
      var valor4 = data.length > 0 ? data[0][3] : "No se encontraron registros";
      var valor5 = data.length > 0 ? data[0][4] : "No se encontraron registros";

      // Actualizar el label

      // Actualizar el input de texto
      document.getElementById("txt_nume_resol").value = valor;
      document.getElementById("txt_diploma_nume").value = valor2;
      document.getElementById("txt_registro_n°").value = valor3;
      document.getElementById("txt_registro_libr").value = valor4;
      document.getElementById("txt_registro_folio").value = valor5;
    })
    .fail(function (jqXHR, textStatus, errorThrown) {
      console.error("Error en la solicitud: " + textStatus, errorThrown);
      $("#lbl_numero").text("Error al obtener los datos");
      document.getElementById("txt_dni").value = "Error al obtener los datos";
    });
}

function Imprimir_informe2() {
  var infoValue =
    parseInt(document.getElementById("txt_info_filial").value, 10) || 0; // Obtener el valor actual de txt_info
  let ced = document.getElementById("txtfilial").value; // Obtener el valor de select_cede

  // Validar que el campo select no esté vacío
  if (ced === "") {
    // Comprueba si no hay un valor seleccionado
    return Swal.fire(
      "Mensaje de Advertencia",
      "Seleccione una cede o filial",
      "warning",
    );
  }

  if (isNaN(infoValue) || infoValue === 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Por favor ingrese el número del informe. Es obligatorio.",
      "warning",
    );
  }

  var info = infoValue.toString();
  var grado = document.getElementById("txt_gr_filial").value.toString();
  var escu = document.getElementById("txtes_filial").value.toString();
  var fil = document.getElementById("txtfilial").value.toString();
  var resp = document.getElementById("responsable").value.toString();
  var fedes = document.getElementById("fechadesde_filial").value.toString();
  var fehas = document.getElementById("fechahasta_filial").value.toString();

  if (info.length === 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "El número de documento es obligatorio.",
      "warning",
    );
  } else {
    var url =
      "../view/MPDF/REPORTE/informe_por_filial.php?" +
      "info=" +
      encodeURIComponent(info) +
      "&grado=" +
      encodeURIComponent(grado) +
      "&escu=" +
      encodeURIComponent(escu) +
      "&fil=" +
      encodeURIComponent(fil) +
      "&resp=" +
      encodeURIComponent(resp) +
      "&fedes=" +
      encodeURIComponent(fedes) +
      "&fehas=" +
      encodeURIComponent(fehas) +
      "#zoom=100%";

    var width = screen.width;
    var height = screen.height;

    window.open(
      url,
      "Informe por filial",
      "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0",
    );

    // Incrementar el valor de txt_info solo después de generar el informe
    infoValue++;
    localStorage.setItem("infoValue", infoValue); // Guardar el nuevo valor en localStorage

    // Actualizar el valor en el campo de entrada #txt_info
    document.getElementById("txt_info").value = infoValue;
  }
}

//IMPLEMENTACIÓN API GOOGLE SHEETS
function authenticate(callback) {
  gapi.auth2.getAuthInstance().signIn().then(callback);
}

function loadClient() {
  gapi.client
    .init({
      apiKey: "AIzaSyC_vDVZz83KcQpVX93XztX833Lk4rsYlvg", // Sustituye con tu API Key
      clientId:
        "695497491441-k3jdp35u6k2dq6ntfs7isphfdm8d1tuf.apps.googleusercontent.com", // Sustituye con tu Client ID
      scope: "https://www.googleapis.com/auth/spreadsheets.readonly",
      discoveryDocs: [
        "https://sheets.googleapis.com/$discovery/rest?version=v4",
      ],
    })
    .then(function () {
      authenticate(fetchSheetData); // Llama a la función fetchSheetData después de la autenticación
    });
}

gapi.load("client:auth2", loadClient);

function fetchSheetData() {
  var spreadsheetId = "1Q3H2bhhS3brQMsrzgJIcHWvGcHRD8YdtbiU2C1uEmyg"; // ID de tu hoja de cálculo de Google Sheets
  var range = "Respuestas de formulario 1!A2:BP"; // Rango donde están los datos (sin incluir el encabezado)

  var dniIngresado = document.getElementById("txt_dni").value; // Obtienes el DNI ingresado
  var dniIngresado2Element = document.getElementById("txt_dni2");
  var dniIngresado2 = dniIngresado2Element ? dniIngresado2Element.value : ""; // Verificar si existe antes de leer

  gapi.client.sheets.spreadsheets.values
    .get({
      spreadsheetId: spreadsheetId,
      range: range,
    })
    .then(function (response) {
      var data = response.result.values; // Obtienes los datos de la hoja

      if (data.length > 0) {
        console.log("Datos obtenidos:", data);

        // Buscar la fila que tiene el DNI ingresado
        var filaEncontrada = null;
        for (var i = 0; i < data.length; i++) {
          var fila = data[i];
          if (fila[2] === dniIngresado || fila[2] === dniIngresado2) {
            // Suponiendo que el DNI está en la columna 2 (índice 1)
            filaEncontrada = fila;
            break;
          }
        }

        if (filaEncontrada) {
          console.log("Fila encontrada:", filaEncontrada);
          fillFormWithData(filaEncontrada); // Llamamos a la función para llenar el formulario
        } else {
          // Ventana de advertencia si no se encuentra el DNI
          Swal.fire(
            "Mensaje de Advertencia",
            "No se encontró un estudiante con ese DNI.",
            "warning",
          );
          return; // Detenemos ejecución adicional en este bloque
        }
      } else {
        // Ventana de advertencia si no hay datos
        Swal.fire(
          "Mensaje de Advertencia",
          "No se encontraron datos.",
          "warning",
        );
        return; // Detenemos ejecución adicional en este bloque
      }
    })
    .catch(function (error) {
      console.error("Error al obtener los datos:", error);
    });
}

function fillFormWithData(fila) {
  // Llenamos los campos con los datos obtenidos de la fila
  var dni = fila[2];
  var nombre = fila[3]; // Suponiendo que el nombre está en la columna 4 (índice 3)
  var apellidoPaterno = fila[4]; // Suponiendo que el apellido paterno está en la columna 5 (índice 4)
  var apellidoMaterno = fila[5]; // Suponiendo que el apellido materno está en la columna 6 (índice 5)
  //var codigo = fila[2];  // Suponiendo que el código está en la columna 3 (índice 2)
  var sexo = fila[6]; // Suponiendo que el sexo está en la columna 7 (índice 6)
  var celular = fila[7]; // Suponiendo que el celular está en la columna 8 (índice 7)
  var direccion = fila[10]; // Suponiendo que la dirección está en la columna 9 (índice 8)
  var email = fila[1]; // Suponiendo que el email está en la columna 10 (índice 9)
  var emailinsti = fila[9]; // Suponiendo que el email institucional está en la columna 11 (índice 10)
  var sede = fila[24]; // Suponiendo que el email institucional está en la columna 11 (índice 10)

  // Llenamos el formulario con los valores encontrados (con verificación de existencia)
  var txtDni = document.getElementById("txt_dni");
  if (txtDni) txtDni.value = dni;

  var txtNom = document.getElementById("txt_nom");
  if (txtNom) txtNom.value = nombre;

  var txtApepa = document.getElementById("txt_apepa");
  if (txtApepa) txtApepa.value = apellidoPaterno;

  var txtApema = document.getElementById("txt_apema");
  if (txtApema) txtApema.value = apellidoMaterno;

  // Establecemos el valor de 'sexo'
  var selectSexo = document.getElementById("select_sexo");
  if (selectSexo) {
    if (sexo === "Masculino") {
      selectSexo.value = "M";
    } else if (sexo === "Femenino") {
      selectSexo.value = "F";
    }
  }

  var txtMovil = document.getElementById("txt_movil");
  if (txtMovil) txtMovil.value = celular;

  var txtDire = document.getElementById("txt_dire");
  if (txtDire) txtDire.value = direccion;

  var txtEmailPer = document.getElementById("txt_email_per");
  if (txtEmailPer) txtEmailPer.value = email;

  var txtEmailInsti = document.getElementById("txt_email_insti");
  if (txtEmailInsti) txtEmailInsti.value = emailinsti;

  // Establecemos el valor de 'sede'
  var selectCede = document.getElementById("select_cede");
  if (selectCede) {
    if (sede === "Abancay") {
      selectCede.value = "1";
    } else if (sede === "Andahuaylas") {
      selectCede.value = "2";
    } else {
      selectCede.value = "3";
    }
  }

  // ⭐ NUEVO: Consultar variables étnicas de BD local
  consultarVariablesEtnicas(dni, function (variablesEtnicas) {
    if (variablesEtnicas) {
      // Llenar los 4 campos de texto con CÓDIGOS (no nombres)
      // 1. Autoidentificación étnica (A o B)
      if (variablesEtnicas.det_etnica) {
        $("#txt_auto_etnica").val(variablesEtnicas.det_etnica);
      }

      // 2. Pueblo indígena u originario (CÓDIGO, ej: 40)
      if (variablesEtnicas.cod_etnia != null) {
        $("#txt_pueblo_indigena").val(variablesEtnicas.cod_etnia);
      }

      // 3. Lengua indígena u originaria (A o B)
      if (variablesEtnicas.det_lengua) {
        $("#txt_lengua_indigena").val(variablesEtnicas.det_lengua);
      }

      // 4. Lengua indígena (detalle) - CÓDIGO (ej: 0)
      if (variablesEtnicas.cod_lengua != null) {
        $("#txt_lengua_detalle").val(variablesEtnicas.cod_lengua);
      }

      // ⭐ NUEVO: Llenar código del estudiante si existe el campo
      if (variablesEtnicas.codigo_estudiante && $("#txt_codigo").length) {
        $("#txt_codigo").val(variablesEtnicas.codigo_estudiante);
      }

      // Llenar campos de variables étnicas (selects) si existen
      if ($("#select_det_etnica").length) {
        $("#select_det_etnica")
          .val(variablesEtnicas.det_etnica)
          .trigger("change");
      }
      if ($("#select_det_lengua").length) {
        $("#select_det_lengua")
          .val(variablesEtnicas.det_lengua)
          .trigger("change");
      }

      // Si seleccionó opción A, llenar los selects de códigos (si existen)
      if (
        variablesEtnicas.det_etnica === "A" &&
        variablesEtnicas.cod_etnia != null &&
        $("#select_cod_etnia").length
      ) {
        setTimeout(function () {
          $("#select_cod_etnia")
            .val(variablesEtnicas.cod_etnia)
            .trigger("change");
        }, 300);
      }

      if (
        variablesEtnicas.det_lengua === "A" &&
        variablesEtnicas.cod_lengua != null &&
        $("#select_cod_lengua").length
      ) {
        setTimeout(function () {
          $("#select_cod_lengua")
            .val(variablesEtnicas.cod_lengua)
            .trigger("change");
        }, 300);
      }

      // Mostrar mensaje informativo
      Swal.fire({
        icon: "info",
        title: "Datos Cargados",
        html:
          "Se cargaron los datos de UMIL y tus variables étnicas previamente declaradas:<br>" +
          "<strong>Etnia:</strong> " +
          (variablesEtnicas.nombre_etnia || "No especificada") +
          "<br>" +
          "<strong>Lengua:</strong> " +
          (variablesEtnicas.nombre_lengua || "No especificada"),
        timer: 4000,
        timerProgressBar: true,
      });
    }
  });

  // Puedes agregar más campos si es necesario
}

// ⭐ FUNCIÓN NUEVA: Consultar variables étnicas desde BD local
function consultarVariablesEtnicas(dni, callback) {
  $.ajax({
    type: "POST",
    url: "../controller/estudiante_publico/controlador_obtener_variables_etnicas.php",
    data: { dni: dni },
    dataType: "json",
    success: function (response) {
      if (response.existe) {
        console.log("Variables étnicas encontradas:", response);
        callback(response);
      } else {
        console.log(
          "No se encontraron variables étnicas previas para DNI:",
          dni,
        );
        callback(null);
      }
    },
    error: function (xhr, status, error) {
      console.error("Error al consultar variables étnicas:", error);
      callback(null);
    },
  });
}

function ejecutarBusqueda(origin) {
  // Si no se pasa el origen, intentar leerlo o usar reniec por defecto
  if (!origin) {
    const radioChecked = document.querySelector(
      'input[name="search_origin"]:checked',
    );
    origin = radioChecked ? radioChecked.value : "reniec";
  }

  const tipoDoc = document.getElementById("select_tipo_documento").value;

  // Validación: Reniec solo funciona con DNI
  if (origin === "reniec" && tipoDoc !== "DNI") {
    Swal.fire(
      "Acción no permitida",
      "La búsqueda en Reniec solo es válida para documentos tipo DNI.",
      "warning",
    );
    return;
  }

  const dni = ($("#txt_dni").val() || $("#txtdni2").val() || "").trim();

  if (dni === "") {
    Swal.fire(
      "Advertencia",
      "Por favor ingrese un número de documento.",
      "warning",
    );
    return;
  }

  // Sincronizar con el campo oculto #dni que usan algunos scripts antiguos
  $("#dni").val(dni);

  switch (origin) {
    case "reniec":
      console.log("Buscando en Reniec...");
      buscarEnReniecLocal(dni);
      break;
    case "bachiller":
      console.log("Buscando en Bachiller...");
      buscarBachiller();
      break;
    case "umil":
      console.log("Buscando en UMIL...");
      if (typeof fetchSheetData === "function") {
        fetchSheetData();
      } else {
        Swal.fire(
          "Error",
          "La función de búsqueda en UMIL no está cargada.",
          "error",
        );
      }
      break;
  }
}

function buscarEnReniecLocal(dni) {
  $.ajax({
    type: "POST",
    url: "consulta-dni-ajax.php",
    data: "dni=" + dni,
    dataType: "json",
    success: function (data) {
      if (data == 1) {
        Swal.fire("Atención", "El DNI tiene que tener 8 dígitos", "warning");
      } else if (data && data.first_name) {
        document.getElementById("txt_nom").value = data.first_name;
        document.getElementById("txt_apepa").value = data.first_last_name;
        document.getElementById("txt_apema").value = data.second_last_name;

        Swal.fire({
          icon: "success",
          title: "DNI Encontrado",
          text: `Se cargaron los datos de ${data.first_name} desde Reniec.`,
          timer: 1500,
          showConfirmButton: false,
        });
      } else {
        Swal.fire(
          "No encontrado",
          "No se encontraron datos para ese DNI en Reniec.",
          "info",
        );
      }
    },
    error: function () {
      Swal.fire("Error", "Ocurrió un error al consultar con Reniec.", "error");
    },
  });
}

async function buscarBachiller() {
  const dni = ($("#txt_dni").val() || $("#txtdni2").val() || "").trim();

  let numero_documento = dni;

  if (numero_documento === "") {
    Swal.fire(
      "Advertencia",
      "Debe ingresar un número de documento válido.",
      "warning",
    );
    return;
  }

  try {
    const resp = await $.ajax({
      url: "../controller/registro_general/controlador_buscar_persona_por_documento.php",
      type: "POST",
      data: { numero_documento },
      dataType: "json",
    });

    if (resp.data && resp.data.length > 0) {
      const d = resp.data[0];

      // Rellenar campos de estudiante
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

      // Rellenar campos de etnia e idioma
      $("#txt_auto_etnica").val(d.DET_ETNICA);
      $("#txt_pueblo_indigena").val(d.COD_ETNIA);
      $("#txt_lengua_indigena").val(d.DET_LENGUA);
      $("#txt_lengua_detalle").val(d.COD_LENGUA);

      // Lógica de Mapeo de Escuela (Bachiller -> Título)
      const mappingEscuela = {
        2: "1", // EPISI
        4: "3", // EPIC
        6: "5", // EPA
        8: "7", // EPIARN
        10: "9", // EPD
        11: "12", // EPC
        14: "13", // EPTHG
        15: "16", // EPE
        17: "18", // EPES
        19: "20", // EPED Inicial
      };

      const idBachillerEscuela = d.Id_escuela;
      const idTituloEscuela = mappingEscuela[idBachillerEscuela] || "";

      // Seleccionar sede, facultad y cargar programa profesional
      console.log("Datos recibidos para autocompletado:", d);
      // En secretaria, el campo sede es txtsede (input hidden o visible)
      $("#select_cede").val(d.Id_cede);

      // Pasar idTituloEscuela como parámetro extra en el trigger para evitar doble llamada
      if (d.Cod_facultad) {
        $("#select_facultad")
          .val(d.Cod_facultad)
          .trigger("change", [idTituloEscuela]);
      } else if (d.Id_facultad) {
        $("#select_facultad")
          .val(d.Id_facultad)
          .trigger("change", [idTituloEscuela]);
      }

      // Alerta informativa después de cargar los datos
      await Swal.fire({
        icon: "success",
        title: "Datos de Bachiller Encontrados",
        html: `
          <div style="text-align: left; padding: 10px;">
            <p>• Los datos personales, étnicos y de idioma se han cargado.</p>
            <p>• La <strong>Carrera y Autoridades</strong> se han mapeado y cargado automáticamente.</p>
            <p>• Por favor, <strong>confirme la modalidad de estudio</strong> para completar el registro.</p>
          </div>
        `,
        confirmButtonText: "Entendido",
        confirmButtonColor: "#3085d6",
        allowOutsideClick: false,
        allowEscapeKey: false,
      });
    } else {
      Swal.fire(
        "No encontrado",
        "No se encontró ningún bachiller con ese Nro. de Documento",
        "warning",
      );
    }
  } catch (error) {
    console.error("❌ Error en AJAX:", error);
    Swal.fire("Error", "No se pudo hacer la búsqueda.", "error");
  }
}

// ========================================
// FUNCIÓN PARA BUSCAR TESIS EN REPOSITORIO DSPACE
// ========================================
function buscarTesisEnRepositorio() {
  const dni = $("#txt_dni").val();

  if (!dni) {
    Swal.fire("Error", "Debe ingresar un DNI primero", "error");
    return;
  }

  // Mostrar loading
  Swal.fire({
    title: "Buscando en repositorio...",
    text: "Por favor espere",
    allowOutsideClick: false,
    didOpen: () => {
      Swal.showLoading();
    },
  });

  $.ajax({
    url: "../controller/repositorio/controlador_buscar_tesis_dni.php",
    type: "POST",
    data: { dni: dni },
  })
    .done(function (resp) {
      const data = JSON.parse(resp);

      if (data.success) {
        // Llenar los campos con los datos obtenidos
        $("#txt_trabajo_inve").val(data.data.titulo);
        $("#txt_metadata").val(data.data.enlace);

        Swal.fire({
          icon: "success",
          title: "¡Tesis encontrada en el repositorio!",
          html: `
          <div style="text-align: left;">
            <strong>Título:</strong><br>
            <p style="margin: 5px 0 15px 0;">${data.data.titulo}</p>
            <strong>Enlace:</strong><br>
            <a href="${data.data.enlace}" target="_blank" style="color: #3085d6;">${data.data.enlace}</a>
          </div>
        `,
          confirmButtonText: "Aceptar",
        });
      } else {
        Swal.fire({
          icon: "info",
          title: "No se encontró tesis",
          text: data.message,
          confirmButtonText: "Aceptar",
        });
      }
    })
    .fail(function () {
      Swal.fire({
        icon: "error",
        title: "Error de conexión",
        text: "No se pudo conectar con el repositorio. Intente nuevamente.",
        confirmButtonText: "Aceptar",
      });
    });
}
