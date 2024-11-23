var tbl_colacion;
function listar_colacion() {
    tbl_colacion = $("#tabla_colacion").DataTable({
        "ordering": false,
        "bLengthChange": true,
        "searching": { "regex": false },
        "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        "pageLength": 10,
        "destroy": true,
        pagingType: 'full_numbers',
        scrollCollapse: true,
        responsive: true,
        "async": false,
        "processing": true,
        "ajax": {
            "url": "../controller/colacion/controlador_listar_colacion.php",
            type: 'POST'
        },
        dom: 'Bfrtip',
        buttons: [
          {
              extend: 'excelHtml5',
              text: '<i class="fas fa-file-excel"></i> ',
              titleAttr: 'Exportar a Excel',
              filename: function() {
                  return "LISTA DE COLACIONES PREGRADO";
              },
              title: function() {
                return "LISTA DE COLACIONES PREGRADO";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'pdfHtml5',
              text: '<i class="fas fa-file-pdf"></i> ',
              titleAttr: 'Exportar a PDF',
              orientation: 'landscape',  // Exportar en formato horizontal
              filename: function() {
                return "LISTA DE COLACIONES PREGRADO";
              },
              title: function() {
                return "LISTA DE COLACIONES PREGRADO";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "estado"
              }
          },
          {
              extend: 'print',
              text: '<i class="fa fa-print"></i> ',
              titleAttr: 'Imprimir',
              title: function() {
                return "LISTA DE COLACIONES PREGRADO";
              },
              exportOptions: {
                  columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "estado"
              }
          }
      ],
        "columns": [
            { "data": "id_colacion" },
            { "data": "nombre_colacion" },
            { "data": "año" },
            { "data": "fechacolacion" },
            { "data": "fechaconsejouni" },
            { "data": "fechafirmaconsejo" },
            { "data": "fecharesolucion" },
            { "data": "numero_oficio" },

            {
                "data": "estado",
                render: function(data, type, row) {
                    if (data == 'VIGENTE') {
                        return '<span class="badge bg-success">VIGENTE</span>';
                    } else {
                        return '<span class="badge bg-dark">PASADO</span>';
                    }
                }
            },
            {
                "data": "estado",
                render: function(data, type, row) {
                    if (data == 'VIGENTE') {
                        return "<button class='editar btn btn-primary  btn-sm' title='Editar datos de especialidad'><i class='fa fa-edit'></i> Editar</button>&nbsp;&nbsp; <button class='imprimir btn btn-warning  btn-sm' title='Imprimir Colación'><i class='fa fa-print'></i> Imprimir colación</button>";
                    } else {
                        return "<button hidden class='editar btn btn-primary  btn-sm' title='Editar datos de especialidad'><i class='fa fa-edit'></i> Editar</button>&nbsp;&nbsp; <button class='imprimir btn btn-warning  btn-sm' title='Imprimir Colación'><i class='fa fa-print'></i> Imprimir colación</button>";
                    }
                }
            },

        ],

        "language": idioma_espanol,
        select: true,

        // Aquí añadimos el rowCallback para cambiar el color de la fila
        "rowCallback": function(row, data, index) {
            if (data.estado == 'PASADO') {
                $(row).css('background-color', '#E93838');
            }
        }
    });


tbl_colacion.on('draw.td',function(){
  var PageInfo = $("#tabla_colacion").DataTable().page.info();
  tbl_colacion.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
//ENVIANDO DATOS PARA EDITAR
$('#tabla_colacion').on('click', '.editar', function() {
    // Obtener los datos de la fila
    var data = tbl_colacion.row($(this).parents('tr')).data();
    
    // Comprobar si hay una fila de detalle mostrada
    if (tbl_colacion.row(this).child.isShown()) {
        data = tbl_colacion.row(this).data();
    }
    
    // Mostrar el modal de edición
    $("#modal_editar").modal('show');
    
    // Rellenar los campos del modal con los datos de la fila
    document.getElementById('txt_id_colacion').value = data.id_colacion;
    document.getElementById('txt_nombre_colacion_editar').value = data.nombre_colacion;
    document.getElementById('txt_fecha_cola_editar').value = data.fecha_colación;
    document.getElementById('txt_fecha_consejo_editar').value = data.fecha_consejo_uni;
    document.getElementById('txt_fecha_firma_con_editar').value = data.fecha_firma_consejo;
    document.getElementById('txt_fecha_resol_editar').value = data.fecha_resolucion;
    document.getElementById('txt_oficio_editar').value = data.numero_oficio;
  });
  

//ABRIENDO MODAL REGISTRO
function AbrirRegistro(){
  $("#modal_registro").modal({backdrop:'static',keyboard:false})
  $("#modal_registro").modal('show');
}

//REGISTRANDO ROLES
function Registrar_colacion(){
  let cola = document.getElementById('txt_nombre_colacion').value;
  let fecha_cola = document.getElementById('txt_fecha_cola').value;
  let fecha_conse = document.getElementById('txt_fecha_consejo').value;
  let fecha_firma = document.getElementById('txt_fecha_firma_con').value;
  let fecha_resol = document.getElementById('txt_fecha_resol').value;
  let oficio = document.getElementById('txt_oficio').value;

  
  if(cola.length==0||fecha_cola.length==0||fecha_conse.length==0||fecha_firma.length==0||fecha_resol.length==0||oficio.length==0){
      return Swal.fire("Mensaje de Advertencia","Todo los campos se deben de llenar de forma obligatoria","warning");
  }
  $.ajax({
    "url":"../controller/colacion/controlador_registro_colacion.php",
    type:'POST',
    data:{
        cola:cola,
        fecha_cola:fecha_cola,
        fecha_conse:fecha_conse,
        fecha_firma:fecha_firma,
        fecha_resol:fecha_resol,
        oficio:oficio
    }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Nueva cede registrada satisfactoriamente!!!","success").then((value)=>{
        tbl_colacion.ajax.reload();

        $("#modal_registro").modal('hide');
        document.getElementById('txt_cede').value="";
        document.getElementById('txt_descripcion').value="";
        });
      }else{
        Swal.fire("Mensaje de Advertencia","La cede que intentas registrar ya se encuentra en la base de datos, revise por favor","warning");
      }
    }else{
      return Swal.fire("Mensaje de Error","No se completo el registro","error");

    }
  })
}
//EDITANDO ROL
function Modificar_Colacion(){
    let id = document.getElementById('txt_id_colacion').value;
    let cola = document.getElementById('txt_nombre_colacion_editar').value;
    let fecha_cola = document.getElementById('txt_fecha_cola_editar').value;
    let fecha_conse = document.getElementById('txt_fecha_consejo_editar').value;
    let fecha_firma = document.getElementById('txt_fecha_firma_con_editar').value;
    let fecha_resol = document.getElementById('txt_fecha_resol_editar').value;
    let oficio = document.getElementById('txt_oficio_editar').value;
  
    
    if(cola.length==0||fecha_cola.length==0||fecha_conse.length==0||fecha_firma.length==0||fecha_resol.length==0||oficio.length==0){
        return Swal.fire("Mensaje de Advertencia","Todo los campos se deben de llenar de forma obligatoria","warning");
    }
    $.ajax({
      "url":"../controller/colacion/controlador_modificar_colacion.php",
      type:'POST',
      data:{
          id:id,
          cola:cola,
          fecha_cola:fecha_cola,
          fecha_conse:fecha_conse,
          fecha_firma:fecha_firma,
          fecha_resol:fecha_resol,
          oficio:oficio
      }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_colacion.ajax.reload();
        $("#modal_editar").modal('hide');
        });
      }else{
        Swal.fire("Mensaje de Advertencia","La Fecha de Colación que intentas actualizar ya se encuentra en la base de datos, revise por favor.","warning");
      }
    }else{
      return Swal.fire("Mensaje de Error","No se completo la actualización.","error");

    }
  })
}
function Cargar_Select_Cede(){
  $.ajax({
    "url":"../controller/expediente_bachiller/controlador_cargar_select_cede.php",
    type:'POST',
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
      }
      document.getElementById('txt_sede').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay cedes en la base de datos</option>";
      document.getElementById('txt_sede').innerHTML=cadena;

    }
  })
}
$('#tabla_colacion').on('click','.imprimir',function(){
  var data = tbl_colacion.row($(this).parents('tr')).data();

  if(tbl_colacion.row(this).child.isShown()){
      var data = tbl_colacion.row(this).data();
  }
  $("#modal_colacion").modal('show');
  document.getElementById('fechacola').value=data.fecha_colación;

});



function Imprimir_colacion() {
  var sede = document.getElementById('txt_sede').value.toString();
  var fecha1 = document.getElementById('fechacola').value.toString();
  var hora = document.getElementById('txt_hora').value.toString();
  var fechaaper = document.getElementById('txt_aper').value.toString();

  var url = "../view/MPDF/REPORTE/colacion.php?"
    + "sede=" + encodeURIComponent(sede)
    + "&fecha1=" + encodeURIComponent(fecha1)
    + "&hora=" + encodeURIComponent(hora)
    + "&fechaaper=" + encodeURIComponent(fechaaper)

    + "#zoom=100%";
  
  var width = screen.width;
  var height = screen.height;
  
  window.open(url, "COLACION PREGRADO", "scrollbars=NO,width=" + width + ",height=" + height + ",top=0,left=0");
}