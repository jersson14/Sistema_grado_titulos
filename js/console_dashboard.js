var formato_numero = new Intl.NumberFormat("es-PE");

function numero(n) {
  return formato_numero.format(n);
}

// Trunca para que un avance incompleto nunca se muestre como 100 %
function porcentaje(con, total) {
  if (!total) {
    return "—";
  }
  return (Math.floor((con / total) * 1000) / 10).toFixed(1) + " %";
}

function llenar_fila(id, expedientes, con_diploma) {
  var fila = $("#" + id);
  var sin_diploma = expedientes - con_diploma;
  fila.find(".celda-exp").text(numero(expedientes));
  fila.find(".celda-con").text(numero(con_diploma));
  fila
    .find(".celda-sin")
    .text(numero(sin_diploma))
    .toggleClass("hay", sin_diploma > 0);
  fila.find(".celda-por").text(porcentaje(con_diploma, expedientes));
  fila
    .find(".barra span")
    .css("width", expedientes ? (con_diploma / expedientes) * 100 + "%" : "0");
}

function crear_fila_panel(nombre, expedientes, con_diploma) {
  var sin_diploma = expedientes - con_diploma;
  return $("<tr>").append(
    $("<th scope='row'>").text(nombre),
    $("<td class='num'>").text(numero(expedientes)),
    $("<td class='num'>").text(numero(con_diploma)),
    $("<td class='num celda-sin'>")
      .toggleClass("hay", sin_diploma > 0)
      .text(numero(sin_diploma)),
  );
}

function llenar_tabla(cuerpo, pie, filas) {
  var total_exp = 0;
  var total_con = 0;
  var tbody = $("#" + cuerpo).empty();

  filas.forEach(function (fila) {
    var expedientes = Number(fila.expedientes);
    var con_diploma = Number(fila.con_diploma);
    total_exp += expedientes;
    total_con += con_diploma;
    tbody.append(crear_fila_panel(fila.nombre, expedientes, con_diploma));
  });

  $("#" + pie)
    .empty()
    .append(crear_fila_panel("Total", total_exp, total_con));
}

function titulo_avance(total_exp, total_sin) {
  var titulo = $("#titulo_avance").empty();
  if (!total_exp) {
    titulo.text("Aún no hay expedientes registrados");
  } else if (!total_sin) {
    titulo.text("Los " + numero(total_exp) + " expedientes tienen diploma");
  } else {
    titulo.append(
      $("<strong>").text(
        numero(total_sin) +
          (total_sin == 1 ? " expediente sin diploma" : " expedientes sin diploma"),
      ),
      document.createTextNode(" de " + numero(total_exp) + " registrados"),
    );
  }
}

function cargar_panel() {
  var panel = $("#panel_resumen");
  if (!panel.length) {
    return;
  }
  panel.find(".btn-actualizar").prop("disabled", true);

  $.ajax({
    url: "../controller/dashboard/controlador_dashboard.php",
    type: "POST",
    dataType: "json",
  })
    .done(function (data) {
      var total_exp = 0;
      var total_con = 0;
      var niveles = {};

      data.niveles.forEach(function (fila) {
        niveles[fila.nivel] = fila;
      });
      niveles.POSGRADO = data.posgrado;

      ["BACHILLER", "TITULO", "POSGRADO"].forEach(function (nivel) {
        var fila = niveles[nivel] || { expedientes: 0, con_diploma: 0 };
        total_exp += Number(fila.expedientes);
        total_con += Number(fila.con_diploma);
        llenar_fila("nivel_" + nivel, Number(fila.expedientes), Number(fila.con_diploma));
      });
      llenar_fila("nivel_TOTAL", total_exp, total_con);
      titulo_avance(total_exp, total_exp - total_con);

      $("#personas_pregrado").text(numero(data.personas_pregrado));
      $("#personas_posgrado").text(numero(data.personas_posgrado));

      llenar_tabla("tabla_sedes", "total_sedes", data.sedes);
      llenar_tabla("tabla_facultades", "total_facultades", data.facultades);

      var catalogos = data.catalogos;
      var bachiller = Number(catalogos.programas_bachiller);
      var titulo = Number(catalogos.programas_titulo);
      $("#total_facultades_activas").text(numero(catalogos.facultades));
      $("#total_programas_pre").text(numero(bachiller + titulo));
      $("#detalle_programas_pre").text(
        numero(bachiller) + " de bachiller, " + numero(titulo) + " de título",
      );
      $("#total_programas_pos").text(numero(catalogos.programas_posgrado));
      $("#total_autoridades").text(numero(catalogos.autoridades));

      $("#panel_error").prop("hidden", true);
      $("#panel_hora").text(
        "Actualizado a las " +
          new Date().toLocaleTimeString("es-PE", { hour: "2-digit", minute: "2-digit" }),
      );
    })
    .fail(function (xhr, status) {
      // Un "abort" lo pide el propio código, no es un error
      if (status !== "abort") {
        $("#panel_error").prop("hidden", false);
      }
    })
    .always(function () {
      panel.attr("aria-busy", "false");
      panel.find(".btn-actualizar").prop("disabled", false);
    });
}
