// JS para Buzón Digital

var tbl_archivos;

$(document).ready(function() {
    $('.select2').select2();
    Cargar_Select_Colacion_Buzon();
    
    // Inicializar tabla vacía
    listar_archivos(0);
});

// Cargar select de colaciones (Reutilizando controlador existente o apuntando al nuevo si fuera necesario, 
// pero usaremos el existente de registro general si sirve, o creamos uno simple)
// El usuario mencionó "controlador_cargar_select_colacion.php" en su mental model.
// Revisé los archivos y existe "controller/registro_general/controlador_cargar_select_colacion.php".
function Cargar_Select_Colacion_Buzon() {
    $.ajax({
        "url": "../controller/registro_general/controlador_cargar_select_colacion.php",
        type: 'POST'
    }).done(function(resp) {
        let data = JSON.parse(resp);
        if (data.length > 0) {
            let cadena = "<option value=''>-- Seleccione Colación --</option>";
            for (let i = 0; i < data.length; i++) {
                // data[i][0] is ID, data[i][1] is Name (usually)
                cadena += "<option value='" + data[i][0] + "'>" + data[i][1] + "</option>";
            }
            $('#cbo_colacion').html(cadena);
            $('#cbo_colacion').trigger('change');
        } else {
            $('#cbo_colacion').html("<option value=''>No se encontraron colaciones</option>");
        }
    });
}

// Al seleccionar colación, listar archivos
$('#cbo_colacion').on('change', function() {
    let id_colacion = $(this).val();
    if(id_colacion){
        listar_archivos(id_colacion);
        $('#btn_subir_mostrar').prop('disabled', false);
    } else {
        listar_archivos(0); // Limpiar
        $('#btn_subir_mostrar').prop('disabled', true);
    }
});

function listar_archivos(id_colacion) {
    if(id_colacion == 0) {
        if ($.fn.DataTable.isDataTable('#tabla_archivos')) {
            $('#tabla_archivos').DataTable().clear().draw();
        }
        return;
    }

    tbl_archivos = $("#tabla_archivos").DataTable({
        "ordering": true,
        "pageLength": 10,
        "destroy": true,
        "async": false,
        "responsive": true,
        "processing": true,
        "ajax": {
            "url": "../controller/repositorio/controlador_listar_archivos.php",
            type: 'POST',
            data: { id_colacion: id_colacion }
        },
        "columns": [
            { "data": "id_archivo" },
            { "data": "dni_estudiante" },
            { "data": "nombre_archivo_original" },
            { "data": "fecha_subida" },
            { 
                "data": "id_archivo",
                "render": function(data, type, row) {
                     return `<div class="text-center">
                        <a href="../${row.ruta_fisica}" target="_blank" class="btn btn-sm btn-primary m-1"><i class="fas fa-eye"></i> Ver Diploma</a>
                        <button onclick="EliminarArchivo(${data})" class="btn btn-sm btn-danger m-1"><i class="fas fa-trash"></i> Eliminar</button>
                    </div>`;
                }
            }
        ],
        "language": {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ registros",
            "sZeroRecords":    "No se encontraron resultados",
            "sEmptyTable":     "No se encontraron diplomas en esta colación",
            "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix":    "",
            "sSearch":         "Buscar:",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst":    "Primero",
                "sLast":     "Último",
                "sNext":     "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        },
        "order": [[3, "desc"]] // Ordenar por fecha subida
    });
}

// Subida Masiva
function AbrirModalSubida() {
    $("#modal_subir_archivos").modal('show');
}

function ProcesarSubida() {
    let id_colacion = $('#cbo_colacion').val();
    if (!id_colacion) {
        return Swal.fire("Atención", "Seleccione una colación primero", "warning");
    }

    let formData = new FormData();
    formData.append('id_colacion', id_colacion);

    let archivoZip = $('#file_zip')[0].files[0];
    let archivosPdf = $('#file_pdf')[0].files;

    if (!archivoZip && archivosPdf.length === 0) {
        return Swal.fire("Atención", "Debe seleccionar un archivo ZIP o PDFs sueltos", "warning");
    }

    if (archivoZip) {
        formData.append('archivo_zip', archivoZip);
    }
    
    for (let i = 0; i < archivosPdf.length; i++) {
        formData.append('archivos[]', archivosPdf[i]);
    }

    // UI Feedback
    $('#btn_procesar').prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Subiendo...');

    $.ajax({
        url: '../controller/repositorio/controlador_subir_masivo.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(resp) {
            let data = JSON.parse(resp);
            if (data.success) {
                let msg = data.message;
                if(data.processed > 0) {
                    Swal.fire("Éxito", msg, "success");
                    listar_archivos(id_colacion);
                    $("#modal_subir_archivos").modal('hide');
                    // Limpiar inputs
                    $('#file_zip').val('');
                    $('#file_pdf').val('');
                } else {
                     Swal.fire("Advertencia", msg + " (0 procesados)", "warning");
                }
                
                if(data.errors > 0){
                    console.log("Errores:", data.details);
                    // Opcional: mostrar detalle de errores
                }
            } else {
                Swal.fire("Error", data.message, "error");
            }
            $('#btn_procesar').prop('disabled', false).html('Iniciar Subida');
        },
        error: function() {
             Swal.fire("Error", "Error de servidor", "error");
             $('#btn_procesar').prop('disabled', false).html('Iniciar Subida');
        }
    });
}

// Búsqueda Global
function BuscarGlobal() {
    let dni = $('#txt_buscar_dni').val();
    if(dni.length != 8) {
        return Swal.fire("Atención", "Ingrese un DNI válido de 8 dígitos", "warning");
    }

    $('#resultados_busqueda').html('<div class="text-center"><i class="fas fa-spinner fa-spin fa-3x"></i></div>');

    $.ajax({
        url: '../controller/repositorio/controlador_buscar_global.php',
        type: 'POST',
        data: { dni: dni },
        success: function(resp) {
            let data = JSON.parse(resp);
            let html = '';
            if(data.length > 0) {
                html += '<div class="alert alert-success">Se encontraron <b>'+data.length+'</b> documentos para el DNI '+dni+'</div>';
                html += '<table class="table table-bordered table-striped">';
                html += '<thead><tr><th>Colación</th><th>Fecha Subida</th><th>Archivo</th><th>Acción</th></tr></thead><tbody>';
                
                data.forEach(function(item) {
                     html += `<tr>
                        <td>${item.nombre_colacion} (${item.fechacolacion})</td>
                        <td>${item.fecha_subida}</td>
                        <td>${item.nombre_archivo_original}</td>
                        <td class="text-center">
                            <a href="../${item.ruta_fisica}" target="_blank" class="btn btn-primary btn-sm m-1"><i class="fas fa-eye"></i> Ver Diploma</a>
                            <button onclick="EliminarArchivo(${item.id_archivo})" class="btn btn-danger btn-sm m-1"><i class="fas fa-trash"></i> Eliminar</button>
                        </td>
                     </tr>`;
                });
                html += '</tbody></table>';
            } else {
                html = '<div class="alert alert-warning">No se encontraron documentos digitales para el DNI '+dni+'</div>';
            }
            $('#resultados_busqueda').html(html);
        }
    });
}

function EliminarArchivo(id) {
    Swal.fire({
        title: '¿Está seguro?',
        text: "¡No podrá recuperar este archivo, solo desde la base de datos!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminarlo!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '../controller/repositorio/controlador_eliminar_archivo.php',
                type: 'POST',
                data: {
                    id_archivo: id
                }
            }).done(function(resp) {
                if (resp > 0) {
                    Swal.fire(
                        '¡Eliminado!',
                        'El archivo ha sido eliminado.',
                        'success'
                    );
                    
                    // Recargar tabla si está en gestión
                    let id_col = $('#cbo_colacion').val();
                    if(id_col) {
                        listar_archivos(id_col);
                    }
                    
                    // Recargar búsqueda si hay algo escrito
                    if($('#txt_buscar_dni').val()) {
                        BuscarGlobal();
                    }
                } else {
                    Swal.fire(
                        'Error',
                        'No se pudo eliminar el archivo.',
                        'error'
                    );
                }
            })
        }
    })
}
