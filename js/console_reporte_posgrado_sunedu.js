var tbl_general_posgrado;
//LISTADO SOLO SIN FILTRO
function listar_expedientes_posgrado() {
  tbl_general_posgrado = $("#tabla_registro_general_posgrado").DataTable({
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
      url: "../controller/registro_general_posgrado/controlador_listar_registro_general_posgrado.php",
      type: "POST",
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: "Exportar a PDF",
        orientation: "landscape", // Exportar en formato horizontal
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> Imprimir',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5], // Especifica las columnas a exportar hasta "estado"
        },
      },
    ],

    columns: [
      { data: "Diploma_numero" },
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
        data: "Grado_academico",
        render: function (data, type, row) {
          if (data == "MAESTRIA") {
            return '<span class="badge bg-success">MAESTRIA</span>';
          } else if (data == "DOCTORADO") {
            return '<span class="badge bg-primary">DOCTORADO</span>';
          } else {
            return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';
          }
        },
      },
      { data: "posgrado" },
      {
        data: "ESTADO",
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
          if (
            data == "controller/registro_general_posgrado/documentos/" ||
            data == ""
          ) {
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
        data: "ESTADO",
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return "<button hidden class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button  class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><button  class='agregar btn btn-secondary btn-sm' style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";
          } else if (data == "CON DIPLOMA") {
            return "<button  class='diploma btn btn-primary btn-sm' style='margin-right: 10px;' title='Ver diploma'><i class='fa fa-file'></i> Diploma</button><button  class='informe btn btn-dark btn-sm' style='margin-right: 10px;' title='Imprimir informe'><i class='fa fa-file'></i> Informe</button><br><button  class='agregar btn btn-secondary btn-sm' hidden style='margin-right: 10px;' title='Agregar diploma'><i class='fa fa-file'></i> Agregar diploma</button><button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button><button class='editar btn btn-warning btn-sm' style='margin-right: 10px;' title='Editar datos'><i class='fa fa-edit'></i> Editar</button>&nbsp;<button style='margin-right: 10px;' hidden class='delete btn btn-danger btn-sm' title='Eliminar datos'><i class='fa fa-trash'></i> Eliminar</button>";
          }
        },
      },
    ],

    language: idioma_espanol,
    select: true,
  });

  tbl_general_posgrado.on("draw.td", function () {
    var PageInfo = $("#tabla_registro_general_posgrado")
      .DataTable()
      .page.info();
    tbl_general_posgrado
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

  tbl_general_posgrado = $("#tabla_registro_general_posgrado").DataTable({
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
      url: "../controller/reportes/controlador_listar_registro_general_posgrado_fecha_sunedu.php",
      type: "POST",
      data: {
        fechainicio: fechainicio,
        fechafin: fechafin,
      },
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: ":hidden",
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: "Exportar a PDF",
        orientation: "landscape", // Exportar en formato horizontal
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5], // Especifica las columnas a exportar hasta "estado"
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> Imprimir',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5], // Especifica las columnas a exportar hasta "estado"
        },
      },
    ],

    columns: [
      { data: "Diploma_numero" }, // 0
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
      { data: "Dni" }, // 1
      { data: "Estudiante" }, // 2
      {
        data: "Grado_academico", // 3
        render: function (data, type, row) {
          if (data == "MAESTRIA") {
            return '<span class="badge bg-success">MAESTRIA</span>';
          } else if (data == "DOCTORADO") {
            return '<span class="badge bg-primary">DOCTORADO</span>';
          } else {
            return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';
          }
        },
      },
      { data: "posgrado" }, // 4
      {
        data: "ESTADO", // 5
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return '<span class="badge bg-danger">SIN DIPLOMA</span>';
          } else if (data == "CON DIPLOMA") {
            return '<span class="badge bg-success">CON DIPLOMA</span>';
          }
        },
      },
      {
        data: "Reglamento_metadado", // 6
        render: function (datae, type, row) {
          if (datae == "") {
            return (
              "<a href=" +
              datae +
              "  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>"
            );
          }
          return (
            "<a href=" +
            datae +
            " target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>"
          );
        },
      },
      {
        data: "Archivo", // 7
        render: function (data, type, row) {
          if (
            data == "controller/registro_general_posgrado/documentos/" ||
            data == ""
          ) {
            return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
          }
          return (
            "<a href='../" +
            data +
            "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>"
          );
        },
      },
      {
        defaultContent:
          "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button>",
      }, // 8
      // Añadimos las demás columnas según el orden de la consulta SQL y las ocultamos
      // Añadimos las demás columnas según el orden de la consulta SQL y las ocultamos
      { data: "emp_cod", visible: false }, // 10 - COD_UNIV
      { data: "emp_razon", visible: false }, // 11 - RAZ_SOC
      { data: null, defaultContent: "", visible: false }, // 12 - FAC_NOM
      {
        data: function (row) {
          return "MAESTRIA EN " + row.posgrado.toUpperCase();
        },
        visible: false,
      }, // 13 - ESC_POS
      { data: "Apellido_paterno", visible: false }, // 14 - PRIM_APE
      { data: "Apellido_materno", visible: false }, // 15 - SEG_APE
      { data: "Nombres", visible: false }, // 16 - NOMBRE
      { data: "Sexo", visible: false }, // 17 - SEXO
      { data: "tipo_documento", visible: false }, // 18 - DOCU_TIP
      { data: "Dni", visible: false }, // 19 - DOCU_NUM
      { data: "Fecha_matricula", visible: false }, // 20 - MATRI_FEC
      { data: "Fecha_egreso", visible: false }, // 21 - EGRES_FEC
      { data: "Abreviatura_grado", visible: false }, // 22 - ABRE_GYT
      { data: "Denominación_grado", visible: false }, // 23 - CARR_PROG
      { data: null, defaultContent: "MAESTRO", visible: false }, // 24 - DEN_GRAD
      { data: null, defaultContent: "", visible: false }, // 25 - SEG_ESP
      { data: null, defaultContent: "", visible: false }, // 26 - PROC_BACH
      { data: null, defaultContent: "", visible: false }, // 27 - PROC_INST_ORIG
      { data: null, defaultContent: "", visible: false }, // 28 - PROC_TITULO_PED
      { data: "Programa_estudio", visible: false }, // 29 - PROG_ESTUs
      { data: "Numero_creditos", visible: false }, // 30 - NUM_CRED
      { data: "Modalidad", visible: false }, // 31 - MOD_OBT
      { data: "Modo_estudio", visible: false }, // 32 - MOD_EST
      { data: "Reglamento_metadado", visible: false }, // 33 - REG_METADATO
      { data: "Trabajo_investigacion", visible: false }, // 34 - TRAB_INV
      { data: null, defaultContent: "SI", visible: false }, // 35 - REQ_IDM
      { data: null, defaultContent: "", visible: false }, // 36 - PROG_ACREDIT
      { data: null, defaultContent: "", visible: false }, // 37 - FEC_INICIO_ACREDIT
      { data: null, defaultContent: "", visible: false }, // 38 - FEC_FIN_ACREDIT
      { data: "Fecha_inicio_tramite", visible: false }, // 39 - FEC_INI_TRA_TIT
      { data: "Turnitin", visible: false }, // 40 - TRAB_INVEST_ORIGINAL
      { data: "Porcentaje", visible: false }, // 41 - MEC_UTI
      {
        data: function (row) {
          return (
            "SUB DIRECCION DE INVESTIGACIÓN DE " + row.posgrado.toUpperCase()
          );
        },
        visible: false,
      }, // 42 - DEP_VER_ORIG
      { data: null, defaultContent: "", visible: false }, // 43 - PROC_REV_PAIS
      { data: null, defaultContent: "", visible: false }, // 44 - PROC_REV_UNIV
      { data: null, defaultContent: "", visible: false }, // 45 - PROC_REV_GRADO
      { data: null, defaultContent: "", visible: false }, // 46 - CRIT_REV
      {
        data: function (row) {
          let year = new Date().getFullYear();
          let resolucion = row.Resolucion_numero.toString().padStart(3, "0");
          return `${resolucion} - ${year}-UTEA-CU`;
        },
        visible: false,
      }, // 47 - RESO_NUM
      { data: "fecha_registro2", visible: false }, // 48 - RESO_FEC
      { data: null, defaultContent: "", visible: false }, // 49 - RESO_NUM_DUP_NUE
      { data: null, defaultContent: "", visible: false }, // 50 - RESO_FEC_DUP_NUE
      { data: "fecha_registro3", visible: false }, // 51 - DIPL_FEC_ORG
      { data: null, defaultContent: "", visible: false }, // 52 - DIPL_FEC_DUP_NUE
      { data: "Diploma_numero", visible: false }, // 53 - DIPL_NUM
      { data: "Diploma_tipo_emitido", visible: false }, // 54 - DIPL_TIP_EMI
      { data: "Registro_libro", visible: false }, // 55 - REG_LIBRO
      { data: "Registro_folio", visible: false }, // 56 - REG_FOLIO
      { data: "Registro_numero", visible: false }, // 57 - REG_REGISTRO
      {
        data: function (row) {
          return row.genero1 === "MASCULINO" ? "RECTOR" : "RECTOR";
        },
        visible: false,
      }, // 58 - CARGO1
      { data: "Autoridad_1", visible: false }, // 59 - AUTORIDAD1
      {
        data: function (row) {
          return row.genero2 === "MASCULINO"
            ? "SECRETARIO GENERAL"
            : "SECRETARIA GENERAL";
        },
        visible: false,
      }, // 60 - CARGO2
      { data: "Autoridad_2", visible: false }, // 61 - AUTORIDAD2
      {
        data: function (row) {
          return row.genero3 === "MASCULINO" ? "DIRECTOR" : "DIRECTORA";
        },
        visible: false,
      }, // 62 - CARGO3
      { data: "Autoridad_3", visible: false }, // 63 - AUTORIDAD3
      { data: "Proce_pais_ext", visible: false }, // 64 - PROC_PAIS_EXT
      { data: "Proce_univ_ext", visible: false }, // 65 - PROC_UNIV_EXT
      { data: "Proce_grado_ext", visible: false }, // 66 - PROC_GRADO_EXT
      {
        data: function (row) {
          return `Oficio N° ${row.Nro_oficio}`;
        },
        visible: false,
      }, // 67 - REG_OFICIO
      { data: "Fecha_matricula_modalidad", visible: false }, // 68 - FEC_MAT_MOD
      { data: "Fecha_inicio_modalidad", visible: false }, // 69 - FEC_INICIO_MOD
      { data: "Fecha_fin_modalidad", visible: false }, // 70 - FEC_FIN_MOD
      { data: "Modo_sustentacion", visible: false }, // 71 - MOD_SUSTENTACIÓN
      { data: "DET_ETNICA", visible: false }, // 72 - VAR_ETNICA
      { data: "COD_ETNIA", visible: false }, // 73 - DET_ETNICO
      { data: "DET_LENGUA", visible: false }, // 74 - LENGUA_IND
      { data: "COD_LENGUA", visible: false }, // 75 - DET_LENGUA
    ],
    language: idioma_espanol,
    select: true,
  });

  tbl_general_posgrado.on("draw.td", function () {
    var PageInfo = $("#tabla_registro_general_posgrado")
      .DataTable()
      .page.info();
    tbl_general_posgrado
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

$("#tabla_registro_general_posgrado").on("click", ".mostrar", function () {
  var data = tbl_general_posgrado.row($(this).parents("tr")).data();

  if (tbl_general_posgrado.row(this).child.isShown()) {
    var data = tbl_general_posgrado.row(this).data();
  }
  $("#modal_mas").modal("show");
  //DATOS DEL TITULADO
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
  document.getElementById("select_programa_mas").value = data.posgrado;
  document.getElementById("txt_denominacion_mas").value = data.Grado_maestro_de;
  document.getElementById("txt_modalidad_mas").value = data.Modalidad;
  document.getElementById("txt_rector_mas").value = data.Autoridad_1;
  document.getElementById("txt_secretario_mas").value = data.Autoridad_2;
  document.getElementById("txt_decano_mas").value = data.Autoridad_3;
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
  document.getElementById("txt_proceden_pais_mas").value = data.Proce_pais_ext;
  document.getElementById("txt_procedeni_univer_mas").value =
    data.Proce_univ_ext;
  document.getElementById("txt_proceden_grado_mas").value =
    data.Proce_grado_ext;
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

function listar_colacion() {
  let fechacol = document.getElementById("select_fechacola").value;

  tbl_general_posgrado = $("#tabla_registro_general_posgrado").DataTable({
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
      url: "../controller/reportes/controlador_listar_registro_general_posgrado_colacion.php",
      type: "POST",
      data: {
        fechacol: fechacol,
      },
    },
    dom: "Bfrtip",
    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> Excel',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: ":hidden",
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> PDF',
        titleAttr: "Exportar a PDF",
        orientation: "landscape",
        filename: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5],
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> Imprimir',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA GENERAL DE POSGRADUADOS";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5],
        },
      },
    ],
    columns: [
      { data: "Diploma_numero" }, // 0
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
      { data: "Dni" }, // 1
      { data: "Estudiante" }, // 2
      {
        data: "Grado_academico", // 3
        render: function (data, type, row) {
          if (data == "MAESTRIA") {
            return '<span class="badge bg-success">MAESTRIA</span>';
          } else if (data == "DOCTORADO") {
            return '<span class="badge bg-primary">DOCTORADO</span>';
          } else {
            return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';
          }
        },
      },
      { data: "posgrado" }, // 4
      {
        data: "ESTADO", // 5
        render: function (data, type, row) {
          if (data == "SIN DIPLOMA") {
            return '<span class="badge bg-danger">SIN DIPLOMA</span>';
          } else if (data == "CON DIPLOMA") {
            return '<span class="badge bg-success">CON DIPLOMA</span>';
          }
        },
      },
      {
        data: "Reglamento_metadado", // 6
        render: function (datae, type, row) {
          if (datae == "") {
            return (
              "<a href=" +
              datae +
              "  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>"
            );
          }
          return (
            "<a href=" +
            datae +
            " target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>"
          );
        },
      },
      {
        data: "Archivo", // 7
        render: function (data, type, row) {
          if (
            data == "controller/registro_general_posgrado/documentos/" ||
            data == ""
          ) {
            return "<a href=''  target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>";
          }
          return (
            "<a href='../" +
            data +
            "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-primary btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-file-download'></i> Expediente</button></a>"
          );
        },
      },
      {
        defaultContent:
          "<button class='mostrar btn btn-success btn-sm' style='margin-right: 10px;' title='Mostrar más datos'><i class='fa fa-eye'></i> Mostrar</button>",
      }, // 8
      // Columnas ocultas para SUNEDU
      { data: "emp_cod", visible: false }, // 10 - COD_UNIV
      { data: "emp_razon", visible: false }, // 11 - RAZ_SOC
      { data: null, defaultContent: "", visible: false }, // 12 - FAC_NOM
      {
        data: function (row) {
          return "MAESTRIA EN " + row.posgrado.toUpperCase();
        },
        visible: false,
      }, // 13 - ESC_POS
      { data: "Apellido_paterno", visible: false }, // 14 - PRIM_APE
      { data: "Apellido_materno", visible: false }, // 15 - SEG_APE
      { data: "Nombres", visible: false }, // 16 - NOMBRE
      { data: "Sexo", visible: false }, // 17 - SEXO
      { data: "tipo_documento", visible: false }, // 18 - DOCU_TIP
      { data: "Dni", visible: false }, // 19 - DOCU_NUM
      { data: "Fecha_matricula", visible: false }, // 20 - MATRI_FEC
      { data: "Fecha_egreso", visible: false }, // 21 - EGRES_FEC
      { data: "Abreviatura_grado", visible: false }, // 22 - ABRE_GYT
      { data: "Denominación_grado", visible: false }, // 23 - CARR_PROG
      { data: null, defaultContent: "MAESTRO", visible: false }, // 24 - DEN_GRAD
      { data: null, defaultContent: "", visible: false }, // 25 - SEG_ESP
      { data: null, defaultContent: "", visible: false }, // 26 - PROC_BACH
      { data: null, defaultContent: "", visible: false }, // 27 - PROC_INST_ORIG
      { data: null, defaultContent: "", visible: false }, // 28 - PROC_TITULO_PED
      { data: "Programa_estudio", visible: false }, // 29 - PROG_ESTUs
      { data: "Numero_creditos", visible: false }, // 30 - NUM_CRED
      { data: "Modalidad", visible: false }, // 31 - MOD_OBT
      { data: "Modo_estudio", visible: false }, // 32 - MOD_EST
      { data: "Reglamento_metadado", visible: false }, // 33 - REG_METADATO
      { data: "Trabajo_investigacion", visible: false }, // 34 - TRAB_INV
      { data: null, defaultContent: "SI", visible: false }, // 35 - REQ_IDM
      { data: null, defaultContent: "", visible: false }, // 36 - PROG_ACREDIT
      { data: null, defaultContent: "", visible: false }, // 37 - FEC_INICIO_ACREDIT
      { data: null, defaultContent: "", visible: false }, // 38 - FEC_FIN_ACREDIT
      { data: "Fecha_inicio_tramite", visible: false }, // 39 - FEC_INI_TRA_TIT
      { data: "Turnitin", visible: false }, // 40 - TRAB_INVEST_ORIGINAL
      { data: "Porcentaje", visible: false }, // 41 - MEC_UTI
      {
        data: function (row) {
          return (
            "SUB DIRECCION DE INVESTIGACIÓN DE " + row.posgrado.toUpperCase()
          );
        },
        visible: false,
      }, // 42 - DEP_VER_ORIG
      { data: null, defaultContent: "", visible: false }, // 43 - PROC_REV_PAIS
      { data: null, defaultContent: "", visible: false }, // 44 - PROC_REV_UNIV
      { data: null, defaultContent: "", visible: false }, // 45 - PROC_REV_GRADO
      { data: null, defaultContent: "", visible: false }, // 46 - CRIT_REV
      {
        data: function (row) {
          let year = new Date().getFullYear();
          let resolucion = row.Resolucion_numero.toString().padStart(3, "0");
          return `${resolucion} - ${year}-UTEA-CU`;
        },
        visible: false,
      }, // 47 - RESO_NUM
      { data: "fecha_registro2", visible: false }, // 48 - RESO_FEC
      { data: null, defaultContent: "", visible: false }, // 49 - RESO_NUM_DUP_NUE
      { data: null, defaultContent: "", visible: false }, // 50 - RESO_FEC_DUP_NUE
      { data: "fecha_registro3", visible: false }, // 51 - DIPL_FEC_ORG
      { data: null, defaultContent: "", visible: false }, // 52 - DIPL_FEC_DUP_NUE
      { data: "Diploma_numero", visible: false }, // 53 - DIPL_NUM
      { data: "Diploma_tipo_emitido", visible: false }, // 54 - DIPL_TIP_EMI
      { data: "Registro_libro", visible: false }, // 55 - REG_LIBRO
      { data: "Registro_folio", visible: false }, // 56 - REG_FOLIO
      { data: "Registro_numero", visible: false }, // 57 - REG_REGISTRO
      {
        data: function (row) {
          return row.genero1 === "MASCULINO" ? "RECTOR" : "RECTOR";
        },
        visible: false,
      }, // 58 - CARGO1
      { data: "Autoridad_1", visible: false }, // 59 - AUTORIDAD1
      {
        data: function (row) {
          return row.genero2 === "MASCULINO"
            ? "SECRETARIO GENERAL"
            : "SECRETARIA GENERAL";
        },
        visible: false,
      }, // 60 - CARGO2
      { data: "Autoridad_2", visible: false }, // 61 - AUTORIDAD2
      {
        data: function (row) {
          return row.genero3 === "MASCULINO" ? "DIRECTOR" : "DIRECTORA";
        },
        visible: false,
      }, // 62 - CARGO3
      { data: "Autoridad_3", visible: false }, // 63 - AUTORIDAD3
      { data: "Proce_pais_ext", visible: false }, // 64 - PROC_PAIS_EXT
      { data: "Proce_univ_ext", visible: false }, // 65 - PROC_UNIV_EXT
      { data: "Proce_grado_ext", visible: false }, // 66 - PROC_GRADO_EXT
      {
        data: function (row) {
          return `Oficio N° ${row.Nro_oficio}`;
        },
        visible: false,
      }, // 67 - REG_OFICIO
      { data: "Fecha_matricula_modalidad", visible: false }, // 68 - FEC_MAT_MOD
      { data: "Fecha_inicio_modalidad", visible: false }, // 69 - FEC_INICIO_MOD
      { data: "Fecha_fin_modalidad", visible: false }, // 70 - FEC_FIN_MOD
      { data: "Modo_sustentacion", visible: false }, // 71 - MOD_SUSTENTACIÓN
      { data: "DET_ETNICA", visible: false }, // 72 - VAR_ETNICA
      { data: "COD_ETNIA", visible: false }, // 73 - DET_ETNICO
      { data: "DET_LENGUA", visible: false }, // 74 - LENGUA_IND
      { data: "COD_LENGUA", visible: false }, // 75 - DET_LENGUA
    ],
    language: idioma_espanol,
    select: true,
  });

  tbl_general_posgrado.on("draw.td", function () {
    var PageInfo = $("#tabla_registro_general_posgrado")
      .DataTable()
      .page.info();
    tbl_general_posgrado
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + PageInfo.start;
      });
  });
}

function Cargar_Select_Colacion_Repo_Pos() {
  $.ajax({
    url: "../controller/reportes/controlador_cargar_select_colacion_posgrado.php",
    type: "POST",
  })
    .done(function (resp) {
      console.log("Respuesta del servidor (Reporte):", resp);
      let data = JSON.parse(resp);
      let cadena = "<option value=''>Seleccione</option>";
      if (data.length > 0) {
        for (let i = 0; i < data.length; i++) {
          cadena +=
            "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
        }
      } else {
        cadena +=
          "<option value=''>No hay registros en la base de datos</option>";
      }
      document.getElementById("select_fechacola").innerHTML = cadena;
      $("#select_fechacola").trigger("change");
    })
    .fail(function (jqXHR, textStatus, errorThrown) {
      console.error(
        "Error cargando colaciones (Reporte):",
        textStatus,
        errorThrown,
      );
      console.error("Respuesta:", jqXHR.responseText);
    });
}
