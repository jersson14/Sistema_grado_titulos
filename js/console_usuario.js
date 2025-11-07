function Iniciar_Sesion() {
    recuerdame();
    let usu = document.getElementById("txt_usuario").value;
    let con = document.getElementById("txt_contra").value;
    let csrf_token = document.querySelector('input[name="csrf_token"]').value;

    if (usu.length == 0 || con.length == 0) {
        return Swal.fire({
            icon: "warning",
            title: "Mensaje de Advertencia",
            text: "Llene todo los campos de la sesión",
            heightAuto: false
        });
    }

    $.ajax({
        url: "controller/usuario/controlador_iniciar_sesion.php",
        type: "POST",
        data: {
            u: usu,
            c: con,
            csrf_token: csrf_token
        }
    }).done(function(resp) {
        let data = JSON.parse(resp);
        if (data.length > 0) {
            if (data[0][5] == "INACTIVO") {
                return Swal.fire({
                    icon: "warning",
                    title: "Mensaje de Advertencia",
                    text: "El usuario: " + usu + " se encuentra inactivo",
                    heightAuto: false
                });
            }

            $.ajax({
                url: "controller/usuario/controlador_crear_sesion.php",
                type: "POST",
                data: {
                    csrf_token: csrf_token,
                    idusuario: data[0][0],
                    usuario: data[0][1],
                    idarea: data[0][6],
                    rol: data[0][7],
                    area: data[0][10],
                    solonombres: data[0][12],
                    nombres: data[0][15],
                    foto: data[0][16],
                    foto_empresa: data[0][17],
                    razon: data[0][18],
                    sede: data[0][19]

                }
            }).done(function(resp) {
                let response = JSON.parse(resp);
                if(response.status === 'success') {
                    let timerInterval;
                    Swal.fire({
                        title: "Bienvenido al Sistema",
                        html: "Seras redireccionado en <b></b> milliseconds.",
                        icon: "success",
                        timer: 1200,
                        timerProgressBar: true,
                        heightAuto: false,
                        didOpen: () => {
                            Swal.showLoading();
                            const b = Swal.getHtmlContainer().querySelector("b");
                            timerInterval = setInterval(() => {
                                b.textContent = Swal.getTimerLeft();
                            }, 100);
                        },
                        willClose: () => {
                            clearInterval(timerInterval);
                        }
                    }).then(result => {
                        if (result.dismiss === Swal.DismissReason.timer) {
                            location.reload();
                        }
                    });
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "Error",
                        text: response.message || "Error al iniciar sesión",
                        heightAuto: false
                    });
                }
            });
        } else {
            Swal.fire({
                icon: "error",
                title: "Mensaje de Error",
                text: "Usuario o Contraseña Incorrectos",
                heightAuto: false
            });
        }
    });
}
function recuerdame() {
  if (rmcheck.checked && usuarioInput.value != "" && passInput.value != "") {
    localStorage.usuario = usuarioInput.value;
    localStorage.pass = passInput.value;
    localStorage.checkbox = rmcheck.value;
  } else {
    localStorage.usuario = "";
    localStorage.pass = "";
    localStorage.checkbox = "";
  }
}

var tbl_usuario;
function listar_usuario() {
  tbl_usuario = $("#tabla_usuario").DataTable({
    pagingType: "full_numbers",
    scrollCollapse: true,
    responsive: true,
    ordering: false,
    bLengthChange: true,
    searching: { regex: false },
    lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
    pageLength: 10,
    destroy: true,
    pagingType: "full_numbers",
    scrollCollapse: true,
    responsive: true,
    async: false,
    processing: true,
    ajax: {
      url: "../controller/usuario/controlador_listar_usuario.php",
      type: "POST"
    },
    dom: "Bfrtip",
  "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE USUARIOS";
          },
          title: function() {
            return "LISTA DE USUARIOS";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE USUARIOS";
          },
          title: function() {
            return "LISTA DE USUARIOS";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE USUARIOS";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        }
      ],
    columns: [
      { defaultContent: "" },
      { data: "usu_usuario" },
      { data: "area_nombre" },
      { data: "usu_rol" },
      { data: "nempleado" },
      { data: "cede_nombre" },

      {
        data: "usu_estatus",
        render: function(data, type, row) {
          if (data == "ACTIVO") {
            return '<span class="badge bg-success">ACTIVO</span>';
          } else {
            return '<span class="badge bg-danger">INACTIVO</span>';
          }
        }
      },
      {
        data: "usu_estatus",
        render: function(data, type, row) {
          if (data == "ACTIVO") {
            return "<button class='editar btn btn-primary btn-sm' title='Editar datos de usuario'><i class='fa fa-edit'></i></button>&nbsp;<button class='contra btn btn-warning btn-sm' title='Cambiar contraseña de usuario'><i class='fas fa-key'></i></button>&nbsp;<button class='btn btn-success btn-sm' disabled title='Activar usuario'><i class='fa fa-check-circle'></i></button>&nbsp;<button class='desactivar btn btn-danger btn-sm' title='Desactivar usuario'><i class='fa fa-times-circle'></i></button>";
          } else {
            return "<button class='editar btn btn-primary btn-sm' title='Editar datos de usuario'><i class='fa fa-edit'></i></button>&nbsp;<button class='contra btn btn-warning btn-sm' title='Cambiar contraseña de usuario'><i class='fas fa-key'></i></button>&nbsp;<button class='activar btn btn-success btn-sm' title='Activar usuario'><i class='fa fa-check-circle'></i></button>&nbsp;<button class='btn btn-danger btn-sm' disabled title='Desactivar usuario'><i class='fa fa-times-circle'></i></button>";
          }
        }
      }
    ],

    "language":idioma_espanol,

    select: true
  });
  tbl_usuario.on("draw.td", function() {
    var PageInfo = $("#tabla_usuario").DataTable().page.info();
    tbl_usuario.column(0, { page: "current" }).nodes().each(function(cell, i) {
      cell.innerHTML = i + 1 + PageInfo.start;
    });
  });
}
function AbrirRegistro() {
  $("#modal_registro").modal({ backdrop: "static", keyboard: false });
  $("#modal_registro").modal("show");
}
$("#tabla_usuario").on("click", ".editar", function() {
  var data = tbl_usuario.row($(this).parents("tr")).data();

  if (tbl_usuario.row(this).child.isShown()) {
    var data = tbl_usuario.row(this).data();
  }
  $("#modal_editar").modal("show");
  document.getElementById("txt_idusuario").value = data.usu_id;
  document.getElementById("txt_usu_editar").value = data.usu_usuario;
  $("#select_empleado_editar")
    .select2()
    .val(data.empleado_id)
    .trigger("change.select2");
  $("#select_area_editar")
    .select2()
    .val(data.area_id)
    .trigger("change.select2");
  $("#select_rol_editar").select2().val(data.usu_rol).trigger("change.select2");
  $("#select_sede_editar").select2().val(data.id_sede).trigger("change.select2");

});

$("#tabla_usuario").on("click", ".contra", function() {
  var data = tbl_usuario.row($(this).parents("tr")).data();

  if (tbl_usuario.row(this).child.isShown()) {
    var data = tbl_usuario.row(this).data();
  }
  $("#modal_contra").modal("show");
  document.getElementById("txt_idusuario_contra").value = data.usu_id;
});
$("#tabla_usuario").on("click", ".desactivar", function() {
  var data = tbl_usuario.row($(this).parents("tr")).data();

  if (tbl_usuario.row(this).child.isShown()) {
    var data = tbl_usuario.row(this).data();
  }
  Swal.fire({
    title: "Desea desactivar al usuario <b>" + data.usu_usuario + "</b>?",
    text: "Una vez desactivado el usuario no tendra acceso al sistema",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, Desactivar"
  }).then(result => {
    if (result.isConfirmed) {
      Modificar_Estatus_Usuario(
        parseInt(data.usu_id),
        "INACTIVO",
        data.usu_usuario
      );
    }
  });
});

$("#tabla_usuario").on("click", ".activar", function() {
  var data = tbl_usuario.row($(this).parents("tr")).data();

  if (tbl_usuario.row(this).child.isShown()) {
    var data = tbl_usuario.row(this).data();
  }
  Swal.fire({
    title: "Desea activar al usuario " + data.usu_usuario + "?",
    text: "Una vez activado el usuario tendra acceso al sistema",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Si, Desactivar"
  }).then(result => {
    if (result.isConfirmed) {
      Modificar_Estatus_Usuario(
        parseInt(data.usu_id),
        "ACTIVO",
        data.usu_usuario
      );
    }
  });
});

function Modificar_Estatus_Usuario(id, estatus, user) {
  let esta = estatus;
  if (esta === "INACTIVO") {
    esta = "Desactivo";
  }
  $.ajax({
    url: "../controller/usuario/controlador_modificar_usuario_estatus.php",
    type: "POST",
    data: {
      id: id,
      estatus: estatus
    }
  }).done(function(resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de Confirmación",
        "Se <b>" + esta + "</b> con exito el usuario <b>" + user + "</b>",
        "success"
      ).then(value => {
        tbl_usuario.ajax.reload();
      });
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se completo la actualización",
        "error"
      );
    }
  });
}
function Cargar_Select_Cede(){
  $.ajax({
    url: "../controller/expediente_bachiller/controlador_cargar_select_cede.php",
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
    document.getElementById('select_sede').innerHTML = cadena;
    document.getElementById('select_sede_editar').innerHTML = cadena;
  });
}

function Registrar_Usuario() {
  let usu = document.getElementById("txt_usu").value;
  let con = document.getElementById("txt_con").value;
  let ide = document.getElementById("select_empleado").value;
  let ida = document.getElementById("select_area").value;
  let rol = document.getElementById("select_rol").value;
  let sed = document.getElementById("select_sede").value;

  if (
    usu.length == 0 ||
    con.length == 0 ||
    ide.length == 0 ||
    ida.length == 0 ||
    rol.length == 0 ||
    sed.length == 0
  ) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "../controller/usuario/controlador_registro_usuario.php",
    type: "POST",
    data: {
      usu: usu,
      con: con,
      ide: ide,
      ida: ida,
      rol: rol,
      sed:sed
    }
  }).done(function(resp) {
    if (resp > 0) {
      if (resp == 1) {
        Swal.fire(
          "Mensaje de Confirmación",
          "Nueva Usuario Registrado Satisfactoriamente!!!",
          "success"
        ).then(value => {
          tbl_usuario.ajax.reload();
          document.getElementById("txt_usu").value = "";
          document.getElementById("txt_con").value = "";

          $("#modal_registro").modal("hide");
        });
      } else {
        Swal.fire(
          "Mensaje de Advertencia",
          "El Usuario ingresado ya se encuentra en la base de datos",
          "warning"
        );
      }
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se completo el registro",
        "error"
      );
    }
  });
}
function Modificar_Usuario() {
  let id = document.getElementById("txt_idusuario").value;
  let ide = document.getElementById("select_empleado_editar").value;
  let ida = document.getElementById("select_area_editar").value;
  let rol = document.getElementById("select_rol_editar").value;
  let sed = document.getElementById("select_sede_editar").value;

  if (id.length == 0 || ide.length == 0 || ida.length == 0 || rol.length == 0 || sed.length==0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "../controller/usuario/controlador_modificar_usuario.php",
    type: "POST",
    data: {
      id: id,
      ide: ide,
      ida: ida,
      rol: rol,
      sed:sed
    }
  }).done(function(resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de Confirmación",
        "Datos del Usuario Actualizado satisfactoriamente!!!",
        "success"
      ).then(value => {
        tbl_usuario.ajax.reload();
        $("#modal_editar").modal("hide");
      });
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se completo la actualización",
        "error"
      );
    }
  });
}

function Modificar_Contra() {
  let id = document.getElementById("txt_idusuario_contra").value;
  let con = document.getElementById("txt_contra_nueva").value;

  if (id.length == 0 || con.length == 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Tiene campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "../controller/usuario/controlador_modificar_usuario_contra.php",
    type: "POST",
    data: {
      id: id,
      con: con
    }
  }).done(function(resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de Confirmación",
        "Contraseña del Usuario Actualizada",
        "success"
      ).then(value => {
        tbl_usuario.ajax.reload();
        $("#modal_contra").modal("hide");
      });
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se completo la actualización",
        "error"
      );
    }
  });
}

function Cargar_Select_Empleado() {
  $.ajax({
    url: "../controller/usuario/controlador_cargar_select_empleado.php",
    type: "POST"
  }).done(function(resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" + data[i][0] + "'>" + data[i][4] + "</option>";
      }
      document.getElementById("select_empleado").innerHTML = cadena;
      document.getElementById("select_empleado_editar").innerHTML = cadena;
    } else {
      cadena += "<option value=''>No hay empleado en la base de datos</option>";
      document.getElementById("select_empleado").innerHTML = cadena;
      document.getElementById("select_empleado_editar").innerHTML = cadena;
    }
  });
}

function Cargar_Select_Area_Solo() {
  $.ajax({
    url: "../controller/usuario/controlador_cargar_select_area_solo.php",
    type: "POST"
  }).done(function(resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      let cadena = "<option value=''>Seleccione</option>"; // Agrega la opción "Seleccione" al inicio
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
      }
      document.getElementById("select_area").innerHTML = cadena;
      document.getElementById("select_area_editar").innerHTML = cadena;
    } else {
      cadena += "<option value=''>No hay empleado en la base de datos</option>";
      document.getElementById("select_area").innerHTML = cadena;
      document.getElementById("select_area_editar").innerHTML = cadena;
    }
  });
}
var tbl_general_titulo;

function Traer_Datos_Seguimiento() {
  let dni = document.getElementById("txt_dni").value;
  if (dni.length == 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Llene el <b>DNI</b> para buscar el documento",
      "warning"
    );
  }

  $.ajax({
    url: "controller/usuario/controlador_traer_seguimiento.php",
    type: "POST",
    data: { dni: dni }
  }).done(function(resp) {
    let data = JSON.parse(resp);
    console.log(data); // Verificar que los datos se obtienen correctamente

    if (data.length > 0) {
      document.getElementById("div_buscador").style.display = "block";
    

      // Eliminar la tabla de estados si existe
      let existingTable = document.querySelector(
        "#div_buscador .tabla-estados"
      );
      if (existingTable) {
        existingTable.parentNode.removeChild(existingTable);
      }

      // Eliminar la tabla general si existe
      let existingDataTable = document.querySelector("#tabla_registro_general");
      if (existingDataTable) {
        existingDataTable.parentNode.removeChild(existingDataTable);
      }

      // AJAX para los expedientes
      $.ajax({
        url: "controller/usuario/controlador_traer_seguimiento_detalle.php",
        type: "POST",
        data: { codigo: data[0][0] }
      }).done(function(resp) {
        let datadetalle = JSON.parse(resp);
        console.log(datadetalle); // Verificar que los datos de detalle se obtienen correctamente

        if (datadetalle.length > 0) {
          // Ordenar los datos por fecha (más reciente primero)
          datadetalle.sort(
            (a, b) => new Date(b.fecha_larga) - new Date(a.fecha_larga)
          );

          // Obtener el estado del último registro (más reciente)
          let ultimoEstado = datadetalle[0].estadoexpediente;

          // Definir colores por estado y color de texto
          let colorPendiente = "transparent";
          let colorProceso = "transparent";
          let colorColacion = "transparent";
          let colorTextoPendiente = "black";
          let colorTextoProceso = "black";
          let colorTextoColacion = "black";

          if (ultimoEstado == "COLACION") {
            colorPendiente = "#384d6f";
            colorProceso = "#384d6f";
            colorColacion = "#384d6f";
            colorTextoPendiente = "white";
            colorTextoProceso = "white";
            colorTextoColacion = "white";
          } else if (ultimoEstado == "EN PROCESO") {
            colorPendiente = "#384d6f";
            colorProceso = "#384d6f";
            colorTextoPendiente = "white";
            colorTextoProceso = "white";
          } else if (ultimoEstado == "PENDIENTE") {
            colorPendiente = "#384d6f";
            colorTextoPendiente = "white";
          }

          let tablaEstados = `
                  <u><h3 style="font-weight: bold; color: #384d6f;text-align:center">ESTADO DE EXPEDIENTE</h3></u>
           <table class="table table-bordered tabla-estados" style="color:white; margin-top: 20px; border-radius: 20px; overflow: hidden; border-collapse: separate; border-spacing: 0;">
          <thead>
            <tr>
              <th style="text-align:center; width:33%; background-color: ${colorPendiente}; color: ${colorTextoPendiente}; border-radius: 8px 0 0 0;">PENDIENTE</th>
              <th style="text-align:center; width:33%; background-color: ${colorProceso}; color: ${colorTextoProceso};">EN PROCESO</th>
              <th style="text-align:center; width:33%; background-color: ${colorColacion}; color: ${colorTextoColacion}; border-radius: 0 8px 0 0;">COLACIÓN</th>
            </tr>
          </thead>
        </table>
          `;

          // Insertar la tabla de estados en el DOM antes de la tabla general
          let divBuscador = document.getElementById("div_buscador");
          divBuscador.innerHTML = tablaEstados;

          // Agregar la tabla general después de la tabla de estados
          let tablaGeneral = `
            <table id="tabla_registro_general" class="table table-striped table-bordered table-sm" style="width:100%; font-size: 0.85rem;">
                      <thead style="background-color:#0A5D86;color:#FFFFFF;">
                        <tr>
                          <th style="text-align:center; font-size: 0.9rem;">Tipo</th>
                          <th style="text-align:center; font-size: 0.9rem;">Denominación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Dni</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estudiante</th>
                          <th style="text-align:center; font-size: 0.9rem;">Facultad</th>
                          <th style="text-align:center; font-size: 0.9rem;">Escuela</th>
                          <th style="text-align:center; font-size: 0.9rem;">Modalidad</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estado</th>
                          <th style="text-align:center; font-size: 0.9rem;">Fecha Colación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Trabajo de Investigación</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- Tu contenido aquí -->
                      </tbody>
                    </table>
          `;
          divBuscador.innerHTML += tablaGeneral;
          // Inicializar DataTable para la tabla general
          $("#tabla_registro_general").DataTable({
            data: datadetalle, // Utiliza los datos obtenidos para llenar la tabla
            columns: [
              {
                data: "Grado_academico",
                render: function(data, type, row) {
                  if (data == "TITULO") {
                    return '<span class="badge bg-primary">TITULO</span>';
                  } else if (data == "BACHILLER") {
                    return '<span class="badge bg-warning">BACHILLER</span>';
                  } else {
                    return '<span class="badge bg-dark">MAESTRIA</span>';
                  }
                }
              },
              { data: "Denominación_grado" },
              { data: "Dni" },
              { data: "Estudiante" },
                {data:"Facultad",
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
              { data: "Escuela" },
              { data: "Modo_obtencion" },
              {
                data: "estadoexpediente",
                render: function(data, type, row) {
                  if (data == "PENDIENTE") {
                    return '<span class="badge bg-warning">PENDIENTE POR ATENDER</span>';
                  } else if (data == "EN PROCESO") {
                    return '<span class="badge bg-primary">EN PROCESO</span>';
                  } else {
                    return '<span class="badge bg-success">LISTO PARA COLACIÓN</span>';
                  }
                }
              },
              { data: "fecha_larga" },
              {
                data: "Reglamento_metadado",
                render: function(datae, type, row) {
                  if (datae == "") {
                    return "<a href='#' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                  } else {
                    return (
                      "<a href='" +
                      datae +
                      "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>"
                    );
                  }
                }
              }
            ],
            dom: "Bfrtip",
            buttons: [
              {
                extend: "excelHtml5",
                text: '<i class="fas fa-file-excel"></i>',
                titleAttr: "Exportar a Excel",
                filename: function() {
                  return "LISTA GENERAL DE TITULADOS";
                },
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              },
              {
                extend: "pdfHtml5",
                text: '<i class="fas fa-file-pdf"></i>',
                titleAttr: "Exportar a PDF",
                filename: function() {
                  return "LISTA GENERAL DE TITULADOS";
                },
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              },
              {
                extend: "print",
                text: '<i class="fa fa-print"></i>',
                titleAttr: "Imprimir",
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              }
            ],
            ordering: false,
            bLengthChange: false, // Desactiva el cambio de longitud de página
            paging: false, // Desactiva la paginación
            searching: false, // Desactiva la barra de búsqueda
            destroy: true,
            pagingType: "full_numbers",
            scrollX: true, // Permite el desplazamiento horizontal
            scrollCollapse: true,
            responsive: true,
            async: false,
            processing: true,
            select: true, // Habilita la selección
          });

          // Aplica las reglas CSS después de inicializar la tabla
          $("#tabla_registro_general tbody td").css("text-align", "center");
        } else {
          Swal.fire(
            "Mensaje de Advertencia",
            "No se encontraron detalles del documento",
            "warning"
          );
        }
      });
    } else {
      document.getElementById("div_buscador").style.display = "none";
      Swal.fire(
        "Mensaje de Advertencia",
        "No se encontraron datos del documento buscado, pueda que este buscando expendiente de posgrado, si es asi en la parte superior de click en <b> Seguimiento Posgrado</b>",
        "warning"
      );
    }
  });
}

function Traer_Datos_Seguimiento_posgrado() {
  let dni = document.getElementById("txt_dni").value;
  if (dni.length == 0) {
    return Swal.fire(
      "Mensaje de Advertencia",
      "Llene el <b>DNI</b> para buscar el documento",
      "warning"
    );
  }

  $.ajax({
    url: "controller/usuario/controlador_traer_seguimiento_posgrado.php",
    type: "POST",
    data: { dni: dni }
  }).done(function(resp) {
    let data = JSON.parse(resp);
    console.log(data); // Verificar que los datos se obtienen correctamente

    if (data.length > 0) {
      document.getElementById("div_buscador").style.display = "block";
    

      // Eliminar la tabla de estados si existe
      let existingTable = document.querySelector(
        "#div_buscador .tabla-estados"
      );
      if (existingTable) {
        existingTable.parentNode.removeChild(existingTable);
      }

      // Eliminar la tabla general si existe
      let existingDataTable = document.querySelector("#tabla_registro_general");
      if (existingDataTable) {
        existingDataTable.parentNode.removeChild(existingDataTable);
      }

      // AJAX para los expedientes
      $.ajax({
        url:
          "controller/usuario/controlador_traer_seguimiento_detalle_posgrado.php",
        type: "POST",
        data: { codigo: data[0][0] }
      }).done(function(resp) {
        let datadetalle = JSON.parse(resp);
        console.log(datadetalle); // Verificar que los datos de detalle se obtienen correctamente

        if (datadetalle.length > 0) {
          // Ordenar los datos por fecha (más reciente primero)
          datadetalle.sort(
            (a, b) => new Date(b.fecha_larga) - new Date(a.fecha_larga)
          );

          // Obtener el estado del último registro (más reciente)
          let ultimoEstado = datadetalle[0].esta;

          // Definir colores por estado y color de texto
          let colorPendiente = "transparent";
          let colorProceso = "transparent";
          let colorColacion = "transparent";
          let colorTextoPendiente = "black";
          let colorTextoProceso = "black";
          let colorTextoColacion = "black";

          if (ultimoEstado == "COLACION") {
            colorPendiente = "#384d6f";
            colorProceso = "#384d6f";
            colorColacion = "#384d6f";
            colorTextoPendiente = "white";
            colorTextoProceso = "white";
            colorTextoColacion = "white";
          } else if (ultimoEstado == "EN PROCESO") {
            colorPendiente = "#384d6f";
            colorProceso = "#384d6f";
            colorTextoPendiente = "white";
            colorTextoProceso = "white";
          } else if (ultimoEstado == "PENDIENTE") {
            colorPendiente = "#384d6f";
            colorTextoPendiente = "white";
          }

          let tablaEstados = `
            <u><h3 style="font-weight: bold; color: #384d6f; text-align: center;">ESTADO DE EXPEDIENTE</h3></u>
            <table class="table table-bordered tabla-estados" style="color:white; margin-top: 20px; border-radius: 20px; overflow: hidden; border-collapse: separate; border-spacing: 0;">
              <thead>
                <tr>
                  <th style="text-align:center; width:33%; background-color: ${colorPendiente}; color: ${colorTextoPendiente}; border-radius: 8px 0 0 0;">PENDIENTE</th>
                  <th style="text-align:center; width:33%; background-color: ${colorProceso}; color: ${colorTextoProceso};">EN PROCESO</th>
                  <th style="text-align:center; width:33%; background-color: ${colorColacion}; color: ${colorTextoColacion}; border-radius: 0 8px 0 0;">COLACIÓN</th>
                </tr>
              </thead>
            </table>
          `;

          // Insertar la tabla de estados en el DOM
          let divBuscador = document.getElementById("div_buscador");
          divBuscador.innerHTML = tablaEstados;

          // Agregar la tabla general después de la tabla de estados
          let tablaGeneral = `
             <table id="tabla_registro_general" class="table table-striped table-bordered table-sm" style="width:100%; font-size: 0.85rem;">
                      <thead style="background-color:#0A5D86;color:#FFFFFF;">
                        <tr>
                          <th style="text-align:center; font-size: 0.9rem;">Tipo</th>
                          <th style="text-align:center; font-size: 0.9rem;">Denominación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Dni</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estudiante</th>
                          <th style="text-align:center; font-size: 0.9rem;">Programa</th>
                          <th style="text-align:center; font-size: 0.9rem;">Modalidad</th>
                          <th style="text-align:center; font-size: 0.9rem;">Estado</th>
                          <th style="text-align:center; font-size: 0.9rem;">Fecha Colación</th>
                          <th style="text-align:center; font-size: 0.9rem;">Trabajo de Investigación</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- Tu contenido aquí -->
                      </tbody>
                    </table>
          `;
          divBuscador.innerHTML += tablaGeneral;

          // Inicializar DataTable para la tabla general
          $("#tabla_registro_general").DataTable({
            data: datadetalle, // Utiliza los datos obtenidos para llenar la tabla
            columns: [
              {
                data: "Grado_academico",
                render: function(data, type, row) {
                  if (data == "MAESTRIA") {
                    return '<span class="badge bg-success">MAESTRIA</span>';
                  } else if (data == "DOCTORADO") {
                    return '<span class="badge bg-warning">DOCTORADO</span>';
                  } else {
                    return '<span class="badge bg-dark">SEGUNDA ESPECIALIDAD</span>';
                  }
                }
              },
              { data: "Denominación_grado" },
              { data: "Dni" },
              { data: "Estudiante" },
              { data: "posgrado" },
              { data: "Modo_obtencion" },
              {
                data: "esta",
                render: function(data, type, row) {
                  if (data == "PENDIENTE") {
                    return '<span class="badge bg-warning">PENDIENTE POR ATENDER</span>';
                  } else if (data == "EN PROCESO") {
                    return '<span class="badge bg-primary">EN PROCESO</span>';
                  } else {
                    return '<span class="badge bg-success">LISTO PARA COLACIÓN</span>';
                  }
                }
              },
              { data: "fecha_larga" },
              {
                data: "Reglamento_metadado",
                render: function(datae, type, row) {
                  if (datae == "") {
                    return "<a href='#' target='_blank'><button disabled style='font-size:13px;' type='button' class='control btn btn-danger btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver</button></a>";
                  } else {
                    return (
                      "<a href='" +
                      datae +
                      "' target='_blank'><button style='font-size:13px;' type='button' class='control btn btn-warning btn-sm' title='Ver Trabajo de investigación'><i class='fas fa-eye'></i> Ver tesis</button></a>"
                    );
                  }
                }
              }
            ],
            dom: "Bfrtip",
            buttons: [
              {
                extend: "excelHtml5",
                text: '<i class="fas fa-file-excel"></i>',
                titleAttr: "Exportar a Excel",
                filename: function() {
                  return "LISTA GENERAL DE TITULADOS";
                },
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              },
              {
                extend: "pdfHtml5",
                text: '<i class="fas fa-file-pdf"></i>',
                titleAttr: "Exportar a PDF",
                filename: function() {
                  return "LISTA GENERAL DE TITULADOS";
                },
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              },
              {
                extend: "print",
                text: '<i class="fa fa-print"></i>',
                titleAttr: "Imprimir",
                title: function() {
                  return "LISTA GENERAL DE TITULADOS";
                }
              }
            ],
            ordering: false,
            bLengthChange: false, // Desactiva el cambio de longitud de página
            paging: false, // Desactiva la paginación
            searching: false, // Desactiva la barra de búsqueda
            destroy: true,
            pagingType: "full_numbers",
            scrollX: true, // Permite el desplazamiento horizontal
            scrollCollapse: true,
            responsive: true,
            async: false,
            processing: true,
            select: true, // Habilita la selección
          });

          // Aplica las reglas CSS después de inicializar la tabla
          $("#tabla_registro_general tbody td").css("text-align", "center");
        } else {
          Swal.fire(
            "Mensaje de Advertencia",
            "No se encontraron detalles del documento",
            "warning"
          );
        }
      });
    } else {
      document.getElementById("div_buscador").style.display = "none";
      Swal.fire(
        "Mensaje de Advertencia",
        "No se encontraron datos del documento buscado, pueda que este buscando expendiente de pregrado, si es asi en la parte superior de click en <b> Seguimiento Pregrado</b>",
        "warning"
      );
    }
  });
}

function Cargar_Select_Expedientes() {
  let id = document.getElementById("txtprincipalid").value;

  $.ajax({
    url: "../controller/tramite_area/controlador_expedientes.php",
    type: "POST",
    data: {
      id: id
    }
  }).done(function(resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      let cadena = "<option value=''>Seleccionar Expediente</option>";
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" +
          data[i][0] +
          "'> Expediente N°: " +
          data[i][9] +
          " - DNI: " +
          data[i][1] +
          " - Remitente: " +
          data[i][2] +
          "</option>";
      }
      document.getElementById("txt_expediente").innerHTML = cadena;
    } else {
      cadena += "<option value=''>No hay tipos disponibles</option>";
      document.getElementById("txt_expediente").innerHTML = cadena;
    }
  });
}
function Cargar_Select_Expedientes_Admin() {
  $.ajax({
    url: "../controller/tramite_area/controlador_expedientes_admin.php",
    type: "POST"
  }).done(function(resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      let cadena = "<option value=''>Seleccionar Expediente</option>";
      for (let i = 0; i < data.length; i++) {
        cadena +=
          "<option value='" +
          data[i][0] +
          "'> Expediente N°: " +
          data[i][9] +
          " - DNI: " +
          data[i][1] +
          " - Remitente: " +
          data[i][2] +
          "</option>";
      }
      document.getElementById("txt_expediente").innerHTML = cadena;
    } else {
      cadena += "<option value=''>No hay tipos disponibles</option>";
      document.getElementById("txt_expediente").innerHTML = cadena;
    }
  });
}
function Traerrdatosexpediente(idrequisito) {
  $.ajax({
    url: "../controller/tramite_area/controlador_traerdatos_expediente.php",
    type: "POST",
    data: {
      id: idrequisito
    }
  }).done(function(resp) {
    var data = JSON.parse(resp);
    var cadena = "";
    if (data.length > 0) {
      $("#txt_numero").val(data[0][0]);
      $("#txt_dni").val(data[0][1]);
    } else {
      return Swal.fire(
        "Mensaje de Error",
        "No se pudo traer el requisito",
        "error"
      );
    }
  });
}
