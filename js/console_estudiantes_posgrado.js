var tbl_estudiantes;
function listar_estudiantes() {
  tbl_estudiantes = $("#tabla_estudiantes").DataTable({
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
      url: "../controller/estudiantes_posgrado/controlador_listar_estudiantes.php",
      type: "POST",
    },
    dom: "Bfrtip",

    buttons: [
      {
        extend: "excelHtml5",
        text: '<i class="fas fa-file-excel"></i> ',
        titleAttr: "Exportar a Excel",
        filename: function () {
          return "LISTA DE ESTUDIANTES POSGRADO";
        },
        title: function () {
          return "LISTA DE ESTUDIANTES POSGRADO";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8], // Especifica las columnas a exportar hasta "tiempotrancurrido"
        },
      },
      {
        extend: "pdfHtml5",
        text: '<i class="fas fa-file-pdf"></i> ',
        titleAttr: "Exportar a PDF",
        filename: function () {
          return "LISTA DE ESTUDIANTES POSGRADO";
        },
        title: function () {
          return "LISTA DE ESTUDIANTES POSGRADO";
        },
        orientation: "landscape", // Exportar en formato horizontal
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8], // Especifica las columnas a exportar hasta "tiempotrancurrido"
        },
      },
      {
        extend: "print",
        text: '<i class="fa fa-print"></i> ',
        titleAttr: "Imprimir",
        title: function () {
          return "LISTA DE ESTUDIANTES POSGRADO";
        },
        exportOptions: {
          columns: [0, 1, 2, 3, 4, 5, 6, 7, 8], // Especifica las columnas a exportar hasta "tiempotrancurrido"
        },
      },
    ],
    columns: [
      { data: "tipo_documento" },
      { data: "Dni" },
      {
        data: "Codigo",
        render: function (data, type, row) {
          if (data == data) {
            return '<span class="badge bg-warning">' + data + "</span>";
          }
        },
      },
      { data: "Estudiante" },
      {
        data: "Sexo",
        render: function (data, type, row) {
          if (data == "F") {
            return '<span class="badge bg-success">FEMENINO</span>';
          } else {
            return '<span class="badge bg-primary">MASCULINO</span>';
          }
        },
      },
      { data: "Celular" },
      { data: "Direccion" },
      { data: "fecha_matricula_n" },
      { data: "fecha_egreso_n" },
      {
        data: "tiempotrancurrido",
        render: function (data, type, row) {
          if (data == data) {
            return '<span class="badge bg-dark">' + data + "</span>";
          }
        },
      },
      {
        data: "estado_var_etnica",
        render: function (data, type, row) {
          let checked = data == "1" ? "checked" : "";
          return `
            <label class="toggle-switch">
              <input type="checkbox" ${checked} onchange="CambiarEstatusEtnica('${row.Dni}', this.checked ? 1 : 0)">
              <span class="slider">
                <span class="on-text">ON</span>
                <span class="off-text">OFF</span>
              </span>
            </label>
          `;
        },
      },
      {
        defaultContent:
          "<button class='ver btn btn-info btn-sm' title='Ver información'><i class='fa fa-eye'></i> Ver</button> <button class='editar btn btn-primary  btn-sm' title='Editar datos de área'><i class='fa fa-edit'></i> Editar</button>",
      },
    ],

    language: idioma_espanol,
    select: true,
  });
  tbl_estudiantes.on("draw.td", function () {
    var PageInfo = $("#tabla_estudiantes").DataTable().page.info();
  });
}

// ⭐ Modal Ver Estudiante
$("#tabla_estudiantes").on("click", ".ver", function () {
  var data = tbl_estudiantes.row($(this).parents("tr")).data();

  if (tbl_estudiantes.row(this).child.isShown()) {
    var data = tbl_estudiantes.row(this).data();
  }

  // Llenar datos
  $("#txt_dni_ver").val(data.Dni);
  $("#txt_codigo_ver").val(data.Codigo);
  $("#txt_posgrado_ver").val(data.Posgrado);
  $("#txt_nom_ver").val(data.Nombres);
  $("#txt_apepa_ver").val(data.Apellido_paterno);
  $("#txt_apema_ver").val(data.Apellido_materno);
  $("#txt_sexo_ver").val(data.Sexo == "F" ? "FEMENINO" : "MASCULINO");
  $("#txt_movil_ver").val(data.Celular);
  $("#txt_dire_ver").val(data.Direccion);
  $("#txt_fecha_matri_ver").val(data.fecha_matricula_n);
  $("#txt_fecha_egres_ver").val(data.fecha_egreso_n);

  // Cargar foto
  if (
    data.foto_pasaporte &&
    data.foto_pasaporte != "" &&
    data.foto_pasaporte != null
  ) {
    $("#img_ver_foto").attr("src", "../" + data.foto_pasaporte);
  } else {
    $("#img_ver_foto").attr("src", "../imagenes/no_image.jpg");
  }

  $("#modal_ver").modal("show");
});

$("#tabla_estudiantes").on("click", ".editar", function () {
  var data = tbl_estudiantes.row($(this).parents("tr")).data();

  if (tbl_estudiantes.row(this).child.isShown()) {
    var data = tbl_estudiantes.row(this).data();
  }

  document.getElementById("txt_dni_editar").value = data.Dni;
  document.getElementById("txt_codigo_editar").value = data.Codigo;
  document.getElementById("txt_nom_editar").value = data.Nombres;
  document.getElementById("txt_apepa_editar").value = data.Apellido_paterno;
  document.getElementById("txt_apema_editar").value = data.Apellido_materno;
  document.getElementById("select_sexo_editar").value = data.Sexo;
  document.getElementById("txt_movil_editar").value = data.Celular;
  document.getElementById("txt_dire_editar").value = data.Direccion;
  document.getElementById("txt_fecha_matri_editar").value =
    data.Fecha_matricula;
  document.getElementById("txt_fecha_egres_editar").value = data.Fecha_egreso;

  // Cargar foto actual
  if (
    data.foto_pasaporte &&
    data.foto_pasaporte != "" &&
    data.foto_pasaporte != null
  ) {
    $("#img_foto_actual").attr("src", "../" + data.foto_pasaporte);
  } else {
    $("#img_foto_actual").attr("src", "../imagenes/no_image.jpg");
  }

  // Limpiar input y preview
  $("#txt_foto_editar").val("");
  $("#preview_nueva_foto").hide();

  $("#modal_editar").modal("show");
});

// Preview de foto
$("#txt_foto_editar").change(function (e) {
  var file = e.target.files[0];
  if (file) {
    if (file.size > 2097152) {
      Swal.fire({
        icon: "error",
        title: "Archivo muy grande",
        text: "La imagen no debe superar los 2MB",
      });
      $(this).val("");
      $("#preview_nueva_foto").hide();
      return;
    }
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#img_preview").attr("src", e.target.result);
      $("#preview_nueva_foto").show();
    };
    reader.readAsDataURL(file);
  } else {
    $("#preview_nueva_foto").hide();
  }
});

function Modificarr_Estudiante() {
  let dni = document.getElementById("txt_dni_editar").value;
  let codigo = document.getElementById("txt_codigo_editar").value;
  let nombres = document.getElementById("txt_nom_editar").value;
  let apepa = document.getElementById("txt_apepa_editar").value;
  let apema = document.getElementById("txt_apema_editar").value;
  let sexo = document.getElementById("select_sexo_editar").value;
  let celular = document.getElementById("txt_movil_editar").value;
  let direc = document.getElementById("txt_dire_editar").value;
  let fecha_matr = document.getElementById("txt_fecha_matri_editar").value;
  let fecha_egre = document.getElementById("txt_fecha_egres_editar").value;
  let id_usuario = document.getElementById("txtprincipalid").value;

  if (
    dni.length == 0 ||
    nombres.length == 0 ||
    apepa.length == 0 ||
    apema.length == 0 ||
    sexo.length == 0 ||
    celular.length == 0
  ) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacios",
      "warning",
    );
  }

  var formData = new FormData();
  formData.append("dni", dni);
  formData.append("codigo", codigo);
  formData.append("nombres", nombres);
  formData.append("apepa", apepa);
  formData.append("apema", apema);
  formData.append("sexo", sexo);
  formData.append("celular", celular);
  formData.append("direc", direc);
  formData.append("fecha_matr", fecha_matr);
  formData.append("fecha_egre", fecha_egre);
  formData.append("id_usuario", id_usuario);

  var foto = $("#txt_foto_editar")[0].files[0];
  if (foto) {
    formData.append("foto", foto);
  }

  $.ajax({
    url: "../controller/estudiantes_posgrado/controlador_modificar_estudiantes.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
  }).done(function (resp) {
    if (resp > 0) {
      if (resp == 1) {
        Swal.fire(
          "Mensaje de Confirmación",
          "Datos actualizados correctamente",
          "success",
        ).then((value) => {
          tbl_estudiantes.ajax.reload();
          $("#modal_editar").modal("hide");
        });
      } else {
        Swal.fire(
          "Mensaje de Advertencia",
          "El DNI del estudiante que intentas ingresar ya se encuentra en la base de datos, revise por favor",
          "warning",
        );
      }
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se completo la actualización",
        "error",
      );
    }
  });
}

function CambiarEstatusEtnica(dni, estatus) {
  $.ajax({
    url: "../controller/estudiantes_posgrado/controlador_modificar_estatus_etnica.php",
    type: "POST",
    data: { dni: dni, estatus: estatus },
  }).done(function (resp) {
    if (resp > 0) {
      Swal.fire({
        icon: "success",
        title: "Estatus actualizado",
        text: "El estado de la declaración ha sido cambiado",
        timer: 1500,
        showConfirmButton: false,
      });
      tbl_estudiantes.ajax.reload();
    } else {
      Swal.fire(
        "Mensaje de Error",
        "No se pudo actualizar el estatus",
        "error",
      );
    }
  });
}
