<div class="content" id="panel_resumen" aria-busy="true">
  <div class="container-fluid">

    <div class="alerta-panel" id="panel_error" role="alert" hidden>
      <span>No se pudieron cargar las cifras. Revisa tu conexión e inténtalo de nuevo.</span>
      <button type="button" class="btn btn-sm btn-outline-danger" onclick="cargar_panel()">Reintentar</button>
    </div>

    <div class="row">
      <div class="col-lg-8">
        <section class="panel-datos">
          <div class="panel-cabecera">
            <h2 id="titulo_avance">Avance de diplomas</h2>
            <div class="panel-actualizado">
              <span id="panel_hora"></span>
              <button type="button" class="btn-actualizar" onclick="cargar_panel()"><i class="fas fa-sync-alt" aria-hidden="true"></i> Actualizar</button>
            </div>
          </div>
          <div class="tabla-panel">
            <table>
              <thead>
                <tr>
                  <th scope="col">Nivel</th>
                  <th scope="col" class="num">Expedientes</th>
                  <th scope="col" class="num">Con diploma</th>
                  <th scope="col" class="num">Sin diploma</th>
                  <th scope="col" class="num col-avance">Avance</th>
                </tr>
              </thead>
              <tbody>
                <tr id="nivel_BACHILLER">
                  <th scope="row">
                    <div class="fila-nombre">
                      <span>Bachiller</span>
                      <span class="fila-enlaces">
                        <a href="#" onclick="cargar_contenido('contenido_principal','expediente/view_expediente_bachiller.php')">Expedientes</a>
                        <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_bachiller.php')">Diplomas</a>
                      </span>
                    </div>
                    <div class="barra"><span></span></div>
                  </th>
                  <td class="num celda-exp">—</td>
                  <td class="num celda-con">—</td>
                  <td class="num celda-sin">—</td>
                  <td class="num celda-por col-avance">—</td>
                </tr>
                <tr id="nivel_TITULO">
                  <th scope="row">
                    <div class="fila-nombre">
                      <span>Título</span>
                      <span class="fila-enlaces">
                        <a href="#" onclick="cargar_contenido('contenido_principal','expediente_titulo/view_expediente_titulo.php')">Expedientes</a>
                        <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_titulo.php')">Diplomas</a>
                      </span>
                    </div>
                    <div class="barra"><span></span></div>
                  </th>
                  <td class="num celda-exp">—</td>
                  <td class="num celda-con">—</td>
                  <td class="num celda-sin">—</td>
                  <td class="num celda-por col-avance">—</td>
                </tr>
                <tr id="nivel_POSGRADO">
                  <th scope="row">
                    <div class="fila-nombre">
                      <span>Posgrado</span>
                      <span class="fila-enlaces">
                        <a href="#" onclick="cargar_contenido('contenido_principal','expediente_posgrado/view_expediente_posgrado.php')">Expedientes</a>
                        <a href="#" onclick="cargar_contenido('contenido_principal','diplomas/view_diploma_posgrado.php')">Diplomas</a>
                      </span>
                    </div>
                    <div class="barra"><span></span></div>
                  </th>
                  <td class="num celda-exp">—</td>
                  <td class="num celda-con">—</td>
                  <td class="num celda-sin">—</td>
                  <td class="num celda-por col-avance">—</td>
                </tr>
              </tbody>
              <tfoot>
                <tr id="nivel_TOTAL">
                  <th scope="row">Total</th>
                  <td class="num celda-exp">—</td>
                  <td class="num celda-con">—</td>
                  <td class="num celda-sin">—</td>
                  <td class="num celda-por col-avance">—</td>
                </tr>
              </tfoot>
            </table>
          </div>
        </section>
      </div>

      <div class="col-lg-4">
        <section class="panel-datos">
          <div class="panel-cabecera">
            <h2>Graduados con diploma</h2>
          </div>
          <dl class="lista-graduados">
            <div>
              <dt>Pregrado <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes/view_estudiantes.php')">Ver estudiantes</a></dt>
              <dd id="personas_pregrado">—</dd>
            </div>
            <div>
              <dt>Posgrado <a href="#" onclick="cargar_contenido('contenido_principal','estudiantes_posgrado/view_estudiantes.php')">Ver estudiantes</a></dt>
              <dd id="personas_posgrado">—</dd>
            </div>
          </dl>
          <p class="panel-nota">Cada DNI cuenta una vez, aunque tenga bachiller y título.</p>
        </section>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-6">
        <section class="panel-datos">
          <div class="panel-cabecera"><h2>Por sede</h2></div>
          <div class="tabla-panel">
            <table>
              <thead>
                <tr>
                  <th scope="col">Sede</th>
                  <th scope="col" class="num">Expedientes</th>
                  <th scope="col" class="num">Con diploma</th>
                  <th scope="col" class="num">Sin diploma</th>
                </tr>
              </thead>
              <tbody id="tabla_sedes"></tbody>
              <tfoot id="total_sedes"></tfoot>
            </table>
          </div>
        </section>
      </div>
      <div class="col-lg-6">
        <section class="panel-datos">
          <div class="panel-cabecera"><h2>Por facultad <small>solo pregrado</small></h2></div>
          <div class="tabla-panel">
            <table>
              <thead>
                <tr>
                  <th scope="col">Facultad</th>
                  <th scope="col" class="num">Expedientes</th>
                  <th scope="col" class="num">Con diploma</th>
                  <th scope="col" class="num">Sin diploma</th>
                </tr>
              </thead>
              <tbody id="tabla_facultades"></tbody>
              <tfoot id="total_facultades"></tfoot>
            </table>
          </div>
        </section>
      </div>
    </div>

    <nav class="panel-catalogos" aria-label="Catálogos">
      <a href="#" onclick="cargar_contenido('contenido_principal','facultad/view_facultad.php')">
        <b id="total_facultades_activas">—</b><span>Facultades activas</span>
      </a>
      <a href="#" onclick="cargar_contenido('contenido_principal','carrera/view_carrera.php')">
        <b id="total_programas_pre">—</b><span>Programas de pregrado<small id="detalle_programas_pre"></small></span>
      </a>
      <a href="#" onclick="cargar_contenido('contenido_principal','programa/view_programa.php')">
        <b id="total_programas_pos">—</b><span>Programas de posgrado</span>
      </a>
      <a href="#" onclick="cargar_contenido('contenido_principal','autoridades/view_autoridades.php')">
        <b id="total_autoridades">—</b><span>Autoridades activas</span>
      </a>
    </nav>

  </div>
</div>

<style>
  #panel_resumen {
    --tinta: #1f2a37;
    --apagado: #566171;
    --linea: #e3e7ec;
    --marca: #023D77;
    --pendiente: #e39a25;
    --pendiente-texto: #9a5b00;
    color: var(--tinta);
  }

  #panel_resumen .panel-datos {
    background: #fff;
    border: 1px solid var(--linea);
    border-radius: 8px;
    height: calc(100% - 16px);
    margin-bottom: 16px;
  }

  #panel_resumen .panel-cabecera {
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    gap: 8px 16px;
    justify-content: space-between;
    padding: 16px 20px 12px;
  }

  #panel_resumen h2 {
    font-size: 1.125rem;
    font-weight: 700;
    margin: 0;
    text-wrap: balance;
  }

  #panel_resumen h2 small {
    color: var(--apagado);
    font-size: .8125rem;
    font-weight: 400;
    margin-left: 4px;
  }

  #panel_resumen #titulo_avance {
    font-size: 1.375rem;
  }

  #panel_resumen #titulo_avance strong {
    color: var(--pendiente-texto);
  }

  #panel_resumen .panel-actualizado {
    align-items: center;
    color: var(--apagado);
    display: flex;
    font-size: .8125rem;
    gap: 10px;
  }

  #panel_resumen .btn-actualizar {
    background: none;
    border: 1px solid var(--linea);
    border-radius: 4px;
    color: var(--marca);
    cursor: pointer;
    font-size: .8125rem;
    padding: 3px 9px;
    transition: background-color .15s ease-out;
  }

  #panel_resumen .btn-actualizar:hover {
    background: #eef3f8;
  }

  #panel_resumen .btn-actualizar:disabled {
    color: var(--apagado);
    cursor: progress;
  }

  #panel_resumen .tabla-panel {
    overflow-x: auto;
  }

  #panel_resumen table {
    border-collapse: collapse;
    font-size: .9375rem;
    width: 100%;
  }

  #panel_resumen thead th {
    border-bottom: 1px solid var(--linea);
    color: var(--apagado);
    font-size: .8125rem;
    font-weight: 600;
    padding: 6px 12px;
    white-space: nowrap;
  }

  #panel_resumen tbody th,
  #panel_resumen tbody td,
  #panel_resumen tfoot th,
  #panel_resumen tfoot td {
    border-bottom: 1px solid var(--linea);
    padding: 11px 12px;
  }

  #panel_resumen tbody th {
    font-weight: 400;
    min-width: 170px;
  }

  #panel_resumen tfoot th,
  #panel_resumen tfoot td {
    border-bottom: 0;
    font-weight: 700;
  }

  #panel_resumen th:first-child,
  #panel_resumen td:first-child {
    padding-left: 20px;
  }

  #panel_resumen th:last-child,
  #panel_resumen td:last-child {
    padding-right: 20px;
  }

  #panel_resumen .num {
    font-variant-numeric: tabular-nums;
    text-align: right;
    white-space: nowrap;
  }

  #panel_resumen .celda-sin.hay {
    color: var(--pendiente-texto);
    font-weight: 700;
  }

  #panel_resumen .fila-nombre {
    align-items: baseline;
    display: flex;
    flex-wrap: wrap;
    font-weight: 600;
    gap: 2px 12px;
    justify-content: space-between;
    margin-bottom: 6px;
  }

  #panel_resumen .fila-enlaces {
    display: inline-flex;
    font-size: .8125rem;
    font-weight: 400;
    gap: 10px;
  }

  #panel_resumen a {
    color: var(--marca);
    text-underline-offset: 2px;
  }

  #panel_resumen a:focus-visible,
  #panel_resumen button:focus-visible {
    border-radius: 3px;
    outline: 2px solid var(--marca);
    outline-offset: 2px;
  }

  #panel_resumen .barra {
    background: var(--pendiente);
    border-radius: 3px;
    height: 6px;
    overflow: hidden;
  }

  #panel_resumen .barra span {
    background: var(--marca);
    display: block;
    height: 100%;
    transition: width .25s ease-out;
    width: 0;
  }

  #panel_resumen[aria-busy="true"] .barra {
    background: var(--linea);
  }

  #panel_resumen .lista-graduados {
    margin: 0;
    padding: 0 20px;
  }

  #panel_resumen .lista-graduados > div {
    align-items: center;
    border-top: 1px solid var(--linea);
    display: flex;
    justify-content: space-between;
    padding: 14px 0;
  }

  #panel_resumen .lista-graduados dt {
    font-weight: 600;
  }

  #panel_resumen .lista-graduados dt a {
    display: block;
    font-size: .8125rem;
    font-weight: 400;
  }

  #panel_resumen .lista-graduados dd {
    font-size: 1.75rem;
    font-variant-numeric: tabular-nums;
    font-weight: 700;
    margin: 0;
  }

  #panel_resumen .panel-nota {
    color: var(--apagado);
    font-size: .8125rem;
    margin: 0;
    padding: 4px 20px 16px;
  }

  #panel_resumen .panel-catalogos {
    background: #fff;
    border: 1px solid var(--linea);
    border-radius: 8px;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    margin-bottom: 16px;
  }

  #panel_resumen .panel-catalogos a {
    align-items: center;
    color: var(--tinta);
    display: flex;
    gap: 12px;
    padding: 14px 20px;
    text-decoration: none;
    transition: background-color .15s ease-out;
  }

  #panel_resumen .panel-catalogos a + a {
    border-left: 1px solid var(--linea);
  }

  #panel_resumen .panel-catalogos a:hover {
    background: #f4f7fa;
  }

  #panel_resumen .panel-catalogos b {
    color: var(--marca);
    font-size: 1.375rem;
    font-variant-numeric: tabular-nums;
  }

  #panel_resumen .panel-catalogos span {
    font-size: .875rem;
    line-height: 1.25;
  }

  #panel_resumen .panel-catalogos small {
    color: var(--apagado);
    display: block;
    font-size: .75rem;
  }

  #panel_resumen .alerta-panel {
    align-items: center;
    background: #fdf1f1;
    border: 1px solid #f0c9c9;
    border-radius: 8px;
    color: #8f1f1f;
    display: flex;
    flex-wrap: wrap;
    gap: 8px 16px;
    justify-content: space-between;
    margin-bottom: 16px;
    padding: 10px 16px;
  }

  #panel_resumen .alerta-panel[hidden] {
    display: none;
  }

  @media (max-width: 991.98px) {
    #panel_resumen .panel-datos {
      height: auto;
    }

    #panel_resumen .panel-catalogos {
      grid-template-columns: repeat(2, 1fr);
    }

    #panel_resumen .panel-catalogos a:nth-child(3) {
      border-left: 0;
    }

    #panel_resumen .panel-catalogos a:nth-child(n+3) {
      border-top: 1px solid var(--linea);
    }
  }

  @media (max-width: 575.98px) {
    #panel_resumen .col-avance {
      display: none;
    }

    #panel_resumen table {
      font-size: .875rem;
    }

    #panel_resumen thead th,
    #panel_resumen thead th.num {
      padding: 6px 8px;
      white-space: normal;
    }

    #panel_resumen tbody th,
    #panel_resumen tbody td,
    #panel_resumen tfoot th,
    #panel_resumen tfoot td {
      padding: 10px 8px;
    }

    #panel_resumen th:first-child,
    #panel_resumen td:first-child {
      padding-left: 16px;
    }

    #panel_resumen th:last-child,
    #panel_resumen td:last-of-type {
      padding-right: 16px;
    }

    /* Con Avance oculto, Sin diploma pasa a ser la última columna visible */
    #panel_resumen thead th:nth-child(4),
    #panel_resumen .celda-sin {
      padding-right: 16px;
    }

    #panel_resumen tbody th {
      min-width: 0;
    }

    #panel_resumen .fila-enlaces {
      flex-wrap: wrap;
    }

    #panel_resumen .panel-catalogos {
      grid-template-columns: 1fr;
    }

    #panel_resumen .panel-catalogos a + a {
      border-left: 0;
      border-top: 1px solid var(--linea);
    }
  }
  .panel-institucion {
    background: #fff;
    border: 1px solid #e3e7ec;
    border-radius: 8px;
    color: #1f2a37;
  }

  .panel-institucion h2 {
    font-size: 1.125rem;
    font-weight: 700;
    margin: 0;
    padding: 16px 20px 0;
  }
</style>
