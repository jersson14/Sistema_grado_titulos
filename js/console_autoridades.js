var tbl_autoridad;
function listar_autoridad(){
    tbl_autoridad = $("#tabla_autoridad").DataTable({
      "ordering":true,   
      "bLengthChange":true,
      "searching": { "regex": false },
      "lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ],
      "pageLength": 10,
      "destroy":true,
      "pagingType": 'full_numbers',
      "scrollCollapse": true,
      "responsive": true,
      "async": false ,
      "processing": true,
      "ajax":{
          "url":"../controller/autoridades/controlador_listar_autoridades.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE AUTORIDADES";
          },
          title: function() {
            return "LISTA DE AUTORIDADES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "estado"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE AUTORIDADES";
          },
          title: function() {
            return "LISTA DE AUTORIDADES";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "estado"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE AUTORIDADES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "estado"
          }
        }
      ],
      "columns":[
        {"data":"Cod_autoridad"},
        {"data":"Autoridad_1"},
        {"data":"Cargo_auto1",
        render: function(data,type,row){
            if(data=='RECTOR'){
            return '<span class="badge bg-primary">RECTOR</span>';
            }
         } 
        },
        {"data":"Autoridad_2"},
        {"data":"Cargo_auto2",
        render: function(data,type,row){
            if(data=='SECRETARIA GENERAL'){
            return '<span class="badge bg-success">SECRETARIA GENERAL</span>';
            }
         } 
        },
        {"data":"Autoridad_3"},
        {"data":"Cargo_auto3",
        render: function(data,type,row){
            if(data=='DECANO'){
            return '<span class="badge bg-warning">DECANO</span>';
            }else if(data=='DIRECTOR'){
            return '<span class="badge bg-dark">DIRECTOR POSGRADO</span>';
            }
         } 
        },   
        {"data":"estado" ,
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
tbl_autoridad.on('draw.td',function(){
  var PageInfo = $("#tabla_autoridad").DataTable().page.info();
  tbl_autoridad.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

$('#tabla_autoridad').on('click','.editar',function(){
    var data = tbl_autoridad.row($(this).parents('tr')).data();
  
    if(tbl_autoridad.row(this).child.isShown()){
        var data = tbl_autoridad.row(this).data();
    }
    $("#modal_editar").modal('show');
    document.getElementById('txt_id_autoridad').value=data.Cod_autoridad;
    document.getElementById('txt_autoridad1_editar').value=data.Autoridad_1;
    document.getElementById('select_rol1_editar').value=data.Cargo_auto1;
    document.getElementById('txt_autoridad2_editar').value=data.Autoridad_2;
    document.getElementById('select_rol2_editar').value=data.Cargo_auto2;
    document.getElementById('txt_autoridad3_editar').value=data.Autoridad_3;
    document.getElementById('select_rol3_editar').value=data.Cargo_auto3;
    document.getElementById('select_estado').value=data.estado;

})
  
function AbrirRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registrar_Autoridad(){
    let autoridad1 = document.getElementById('txt_autoridad1').value;
    let cargo1 = document.getElementById('select_rol1').value;
    let autoridad2 = document.getElementById('txt_autoridad2').value;
    let cargo2 = document.getElementById('select_rol2').value;
    let autoridad3 = document.getElementById('txt_autoridad3').value;
    let cargo3 = document.getElementById('select_rol3').value;
    if(autoridad1.length==0 ||cargo1.length==0  || autoridad2.length==0 ||cargo2.length==0 || autoridad3.length==0 ||cargo3.length==0 ){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios revise por favor","warning");
    }
    $.ajax({
      "url":"../controller/autoridades/controlador_registro_autoridad.php",
      type:'POST',
      data:{
        autoridad1:autoridad1,
        cargo1:cargo1,
        autoridad2:autoridad2,
        cargo2:cargo2,
        autoridad3:autoridad3,
        cargo3:cargo3,
      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Nueva Área registrada","success").then((value)=>{
            tbl_autoridad.ajax.reload();
            document.getElementById('txt_autoridad1').value="";
            document.getElementById('txt_autoridad2').value="";
            document.getElementById('txt_autoridad3').value="";

          $("#modal_registro").modal('hide');
          });
        }else{
          Swal.fire("Mensaje de Advertencia","Las autoridades ingresadas ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo el registro","error");
  
      }
    })
  }

  function Modificar_Autoridad(){
    let id = document.getElementById('txt_id_autoridad').value;
    let autoridad1 = document.getElementById('txt_autoridad1_editar').value;
    let cargo1 = document.getElementById('select_rol1_editar').value;
    let autoridad2 = document.getElementById('txt_autoridad2_editar').value;
    let cargo2 = document.getElementById('select_rol2_editar').value;
    let autoridad3 = document.getElementById('txt_autoridad3_editar').value;
    let cargo3 = document.getElementById('select_rol3_editar').value;
    let esta = document.getElementById('select_estado').value;

    if(autoridad1.length==0 ||cargo1.length==0  || autoridad2.length==0 ||cargo2.length==0 || autoridad3.length==0 ||cargo3.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    $.ajax({
      "url":"../controller/autoridades/controlador_modificar_autoridades.php",
      type:'POST',
      data:{
        id:id,
        autoridad1:autoridad1,
        cargo1:cargo1,
        autoridad2:autoridad2,
        cargo2:cargo2,
        autoridad3:autoridad3,
        cargo3:cargo3,
        esta:esta,

      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_autoridad.ajax.reload();
          $("#modal_editar").modal('hide');
          });
        }else{
          Swal.fire("Mensaje de Advertencia","Las autoridades ingresadas ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo la actualización","error");
  
      }
    })
  }