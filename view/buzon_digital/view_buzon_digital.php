<script src="../js/console_buzon_digital.js?rev=<?php echo time(); ?>"></script>

<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0"><b>BUZÓN DIGITAL DE DIPLOMAS</b></h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="../index.php">MENU</a></li>
          <li class="breadcrumb-item active">BUZÓN DIGITAL</li>
        </ol>
      </div>
    </div>
  </div>
</div>

<div class="content">
  <div class="container-fluid">
    
    <div class="card card-primary card-outline card-tabs">
      <div class="card-header p-0 pt-1 border-bottom-0">
        <ul class="nav nav-tabs" id="buzonTabs" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="tab-gestion-tab" data-toggle="pill" href="#tab-gestion" role="tab" aria-controls="tab-gestion" aria-selected="true">
                <i class="fas fa-folder-open"></i> Gestión por Colación
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="tab-busqueda-tab" data-toggle="pill" href="#tab-busqueda" role="tab" aria-controls="tab-busqueda" aria-selected="false">
                <i class="fas fa-search"></i> Búsqueda Global (Por DNI)
            </a>
          </li>
        </ul>
      </div>
      
      <div class="card-body">
        <div class="tab-content" id="buzonTabsContent">
            
            <!-- TAB 1: GESTIÓN -->
            <div class="tab-pane fade show active" id="tab-gestion" role="tabpanel" aria-labelledby="tab-gestion-tab">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Seleccione Colación:</label>
                            <select class="form-control select2" id="cbo_colacion" style="width: 100%;">
                                <!-- Carga AJAX -->
                            </select>
                        </div>
                    </div>
                    <div class="col-md-8 text-right">
                        <label>&nbsp;</label><br>
                        <button class="btn btn-primary" id="btn_subir_mostrar" onclick="AbrirModalSubida()" disabled>
                            <i class="fas fa-cloud-upload-alt"></i> Subir Diplomas (ZIP/PDF)
                        </button>
                    </div>
                </div>
                
                <hr>
                
                <div class="table-responsive">
                    <table id="tabla_archivos" class="table table-striped table-bordered" style="width:100%">
                        <thead style="background-color:#0A5D86;color:#FFFFFF;">
                            <tr>
                                <th>ID</th>
                                <th>DNI Estudiante</th>
                                <th>Nombre Archivo</th>
                                <th>Fecha Subida</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            
            <!-- TAB 2: BÚSQUEDA -->
            <div class="tab-pane fade" id="tab-busqueda" role="tabpanel" aria-labelledby="tab-busqueda-tab">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                         <div class="input-group mb-3">
                          <input type="text" class="form-control form-control-lg" id="txt_buscar_dni" placeholder="Ingrese DNI del estudiante">
                          <div class="input-group-append">
                            <button class="btn btn-success btn-lg" onclick="BuscarGlobal()">
                                <i class="fas fa-search"></i> Buscar
                            </button>
                          </div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-12" id="resultados_busqueda">
                        <!-- Resultados AJAX -->
                    </div>
                </div>
            </div>
            
        </div>
      </div>
    </div>

  </div>
</div>

<!-- Modal Subida de Archivos -->
<div class="modal fade" id="modal_subir_archivos" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">Subir Diplomas Digitales</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div class="alert alert-info">
             <i class="fas fa-info-circle"></i> <b>Nota Importante:</b>
             <ul>
                 <li>El sistema reconocerá automáticamente el <b>DNI</b> si está en el nombre del archivo (Ej: <code>71251155_Titulo.pdf</code>).</li>
                 <li>Puede subir un solo archivo <b>.zip</b> con todos los PDFs dentro (Recomendado).</li>
                 <li>O puede seleccionar múltiples archivos PDF a la vez.</li>
             </ul>
         </div>
         
         <div class="form-group">
             <label for="file_zip">Opción A: Subir archivo comprimido (.ZIP)</label>
             <input type="file" class="form-control-file" id="file_zip" accept=".zip">
         </div>
         
         <hr>
         
         <div class="form-group">
             <label for="file_pdf">Opción B: Subir PDFs sueltos (Selección múltiple)</label>
             <input type="file" class="form-control-file" id="file_pdf" accept="application/pdf" multiple>
         </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-success" id="btn_procesar" onclick="ProcesarSubida()">
            <i class="fas fa-play"></i> Iniciar Subida
        </button>
      </div>
    </div>
  </div>
</div>
