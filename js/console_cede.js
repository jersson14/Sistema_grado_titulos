//LISTADO DE ROLES
var tbl_cedes;
function listar_cedes(){
    tbl_cedes = $("#tabla_cedes").DataTable({
      "ordering":false,   
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
          "url":"../controller/cedes/controlador_listar_cedes.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      "buttons": [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i>',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE CEDES";
          },
          title: function() {
            return "LISTA DE CEDES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i>',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE CEDES";
          },
          title: function() {
            return "LISTA DE CEDES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i>',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE CEDES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4]  // Especifica las columnas a exportar hasta "estadiplo"
          }
        }
      ],
      "columns":[
        {"data":"Id_cede"},
        {"data":"cede_nombre"},
        {"data":"descripcion"},
        {"data":"fecha_formateada"},
        {"data":"estado",
            render: function(data,type,row){
                    if(data=='ACTIVO'){
                    return '<span class="badge bg-success">ACTIVO</span>';
                    }else{
                    return '<span class="badge bg-danger">INACTIVO</span>';
                    }
            }   
        },
        {"defaultContent":"<button class='editar btn btn-primary  btn-sm' title='Editar datos de especialidad'><i class='fa fa-edit'></i> Editar</button>&nbsp;&nbsp; <button class='delete btn btn-danger  btn-sm' title='Eliminar datos de especialidad'><i class='fa fa-trash'></i> Eliminar</button>"},
        
    ],

    "language":idioma_espanol,
    select: true
});
tbl_cedes.on('draw.td',function(){
  var PageInfo = $("#tabla_cedes").DataTable().page.info();
  tbl_cedes.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}
//ENVIANDO DATOS PARA EDITAR
$('#tabla_cedes').on('click','.editar',function(){
  var data = tbl_cedes.row($(this).parents('tr')).data();

  if(tbl_cedes.row(this).child.isShown()){
      var data = tbl_cedes.row(this).data();
  }
  $("#modal_editar").modal('show');
  document.getElementById('txt_idcede').value=data.Id_cede;
  document.getElementById('txt_cede_editar').value=data.cede_nombre;
  document.getElementById('txt_descripcion_editar').value=data.descripcion;
  document.getElementById('txt_estatus').value=data.estado;
})

//ABRIENDO MODAL REGISTRO
function AbrirRegistro(){
  $("#modal_registro").modal({backdrop:'static',keyboard:false})
  $("#modal_registro").modal('show');
}

//REGISTRANDO ROLES
function Registrar_cede(){
  let cede = document.getElementById('txt_cede').value;
  let descrip = document.getElementById('txt_descripcion').value;

  if(cede.length==0){
      return Swal.fire("Mensaje de Advertencia","El nombre del rol debe esta completo","warning");
  }
  $.ajax({
    "url":"../controller/cedes/controlador_registro_cedes.php",
    type:'POST',
    data:{
        cede:cede,
        descrip:descrip
    }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Nueva cede registrada satisfactoriamente!!!","success").then((value)=>{
        tbl_cedes.ajax.reload();
          document.getElementById('txt_cede').value="";
          document.getElementById('txt_descripcion').value="";
        $("#modal_registro").modal('hide');
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
function Modificar_Cede(){
  let id = document.getElementById('txt_idcede').value;
  let cede = document.getElementById('txt_cede_editar').value;
  let descrip = document.getElementById('txt_descripcion_editar').value;
  let esta = document.getElementById('txt_estatus').value;

  if(cede.length==0 || id.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios.","warning");
  }
  $.ajax({
    "url":"../controller/cedes/controlador_modificar_cede.php",
    type:'POST',
    data:{
      id:id,
      cede:cede,
      descrip:descrip,
      esta:esta
    }
  }).done(function(resp){
    if(resp>0){
      if(resp==1){
        Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_cedes.ajax.reload();
        $("#modal_editar").modal('hide');
        });
      }else{
        Swal.fire("Mensaje de Advertencia","La Cede que intentas actualizar ya se encuentra en la base de datos, revise por favor.","warning");
      }
    }else{
      return Swal.fire("Mensaje de Error","No se completo la actualización.","error");

    }
  })
}
//ELIMINANDO ROL
function Eliminar_Cede(id){
    $.ajax({
      "url":"../controller/cedes/controlador_eliminar_cede.php",
      type:'POST',
      data:{
        id:id
      }
    }).done(function(resp){
      if(resp>0){
          Swal.fire("Mensaje de Confirmación","Se elimino la cede con exito","success").then((value)=>{
            tbl_cedes.ajax.reload();
          });
      }else{
        return Swal.fire("Mensaje de Error","No se pudo completar el proceso","error");
  
      }
    })
  }

  //ENVIANDO AL BOTON DELETE
$('#tabla_cedes').on('click','.delete',function(){
    var data = tbl_cedes.row($(this).parents('tr')).data();
  
    if(tbl_cedes.row(this).child.isShown()){
        var data = tbl_cedes.row(this).data();
    }
    Swal.fire({
      title: 'Desea eliminar la cede: '+data.cede_nombre+'?',
      text: "Una vez aceptado la cede sera eliminado!!!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar'
    }).then((result) => {
      if (result.isConfirmed) {
        Eliminar_Cede(data.Id_cede);
      }
    })
  })