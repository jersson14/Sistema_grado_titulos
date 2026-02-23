// ============================================
// AUTO-SELECCIÓN DE CICLO DE INVESTIGACIÓN
// Basado en el ID de la escuela seleccionada
// ============================================

/**
 * Función para establecer el ciclo de investigación automáticamente
 * según el ID de la escuela (programa académico)
 * @param {number} idEscuela - ID de la escuela seleccionada
 * @param {string} selectId - ID del elemento select donde se establecerá el ciclo
 */
function establecerCicloInvestigacion(idEscuela, selectId) {
  const ciclosPorEscuela = {
    2: "X",
    4: "X",
    6: "X",
    8: "X",
    10: "XI",
    11: "X",
    14: "IX",
    15: "VIII",
    17: "IX",
    19: "X",
    24: "X",
    25: "X",
  };

  const selectCiclo = document.getElementById(selectId);

  if (!selectCiclo) {
    console.warn(`No se encontró el elemento con ID: ${selectId}`);
    return;
  }

  // Obtener el ciclo correspondiente a la escuela
  const cicloAsignado = ciclosPorEscuela[parseInt(idEscuela)];

  if (cicloAsignado) {
    // Establecer el valor del select
    selectCiclo.value = cicloAsignado;

    // Disparar evento change para que otros listeners se enteren
    const event = new Event("change", { bubbles: true });
    selectCiclo.dispatchEvent(event);

    console.log(
      `Ciclo ${cicloAsignado} asignado automáticamente para escuela ID ${idEscuela}`,
    );
  } else {
    // Si no hay ciclo definido para esta escuela, limpiar el select
    selectCiclo.value = "";
    console.log(`No hay ciclo predefinido para escuela ID ${idEscuela}`);
  }
}

// Exportar la función para uso global
window.establecerCicloInvestigacion = establecerCicloInvestigacion;
