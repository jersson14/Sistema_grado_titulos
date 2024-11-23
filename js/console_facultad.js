var tbl_facultad;
function listar_facultad(){
  tbl_facultad = $("#tabla_facultad").DataTable({
      "ordering":true,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 10,
      "destroy":true,
      pagingType: 'full_numbers',
      scrollCollapse: true,
      responsive: true,
      "async": false ,
      "processing": true,
      "ajax":{
          "url":"../controller/facultad/controlador_listar_facultad.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE FACULTADES";
          },
          title: function() {
            return "LISTA DE FACULTADES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estado"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE FACULTADES";
          },
          title: function() {
            return "LISTA DE FACULTADES";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estado"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE FACULTADES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estado"
          }
        }
      ],
      "columns":[
        {"data":"Cod_facultad"},
        {"data":"Nombre"},
        {"data":"Autoridad_3"},
        {"data":"created_at"},
        {"data":"estado",
        render: function(data,type,row){
                if(data=='ACTIVO'){
                return '<span class="badge bg-success">ACTIVO</span>';
                }else{
                return '<span class="badge bg-danger">INACTIVO</span>';
                }
        }   
    },        
    {"defaultContent":"<button class='editar btn btn-primary  btn-sm' title='Editar datos de área'><i class='fa fa-edit'></i> Editar</button>"},
        
    ],

    "language":idioma_espanol,
    select: true
});
tbl_facultad.on('draw.td',function(){
  var PageInfo = $("#tabla_facultad").DataTable().page.info();
  tbl_facultad.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

function Cargar_Select_Autoridad(){
  $.ajax({
    "url":"../controller/facultad/controlador_cargar_select_autoridad.php",
    type:'POST',
   
  }).done(function(resp){
    let data=JSON.parse(resp);
    if(data.length>0){
      let cadena ="<option value=''>Seleccionar Encargado</option>";
      for (let i = 0; i < data.length; i++) {
        cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
      }
        document.getElementById('select_autoridad').innerHTML=cadena;
        document.getElementById('autoridad_editar').innerHTML=cadena;

    }else{
      cadena+="<option value=''>No hay tipos disponibles</option>";
      document.getElementById('select_autoridad').innerHTML=cadena;
      document.getElementById('autoridad_editar').innerHTML=cadena;

    }
  })
}
$('#tabla_facultad').on('click','.editar',function(){
  var data = tbl_facultad.row($(this).parents('tr')).data();

  if(tbl_facultad.row(this).child.isShown()){
      var data = tbl_facultad.row(this).data();
  }
  $("#modal_editar").modal('show');
  document.getElementById('txt_id_facultad').value=data.Cod_facultad;
  document.getElementById('txt_facultad_editar').value=data.Nombre;
  $("#autoridad_editar").select2().val(data.Cod_autoridad).trigger('change.select2');
  document.getElementById('txt_estatus').value=data.estado;

})

function AbrirRegistro(){
  $("#modal_registro").modal({backdrop:'static',keyboard:false})
  $("#modal_registro").modal('show');
}



function Registrar_Facultad(){
  let facultad = document.getElementById('txt_facultad').value;
  let autoridad = document.getElementById('select_autoridad').value;
  if(facultad.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
  }
  $.ajax({
    "url":"../controller/facultad/controlador_registro_facultad.php",
    type:'POST',
    data:{
      facultad:facultad,
      autoridad:autoridad
    }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Nueva Facultad registrada","success").then((value)=>{
          tbl_facultad.ajax.reload();
          document.getElementById('txt_facultad').value="";
        $("#modal_registro").modal('hide');
        });
      }else{
        Swal.fire("Mensaje de Advertencia","La facultad ingresada ya se encuentra en la base de datos,revise por favor","warning");
      }
    }else{
      return Swal.fire("Mensaje de Error","No se completo el registro","error");

    }
  })
}
function Modificar_Facultad(){
  let id = document.getElementById('txt_id_facultad').value;
  let facultad = document.getElementById('txt_facultad_editar').value;
  let autoridad = document.getElementById('autoridad_editar').value;
  let esta = document.getElementById('txt_estatus').value;

  if(id.length==0 || facultad.length==0||autoridad.length==0 || esta.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
  }
  $.ajax({
    "url":"../controller/facultad/controlador_modificar_facultad.php",
    type:'POST',
    data:{
      id:id,
      facultad:facultad,
      autoridad:autoridad,
      esta:esta

    }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
          tbl_facultad.ajax.reload();
        $("#modal_editar").modal('hide');
        });
      }else{
        Swal.fire("Mensaje de Advertencia","La facultad que intenta actualizar ya se encuentra en la base de datos, por favor revise","warning");
      }
    }else{
      return Swal.fire("Mensaje de Error","No se completo la actualización","error");

    }
  })
}