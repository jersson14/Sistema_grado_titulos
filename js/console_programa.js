var tbl_programa;
function listar_programas(){
    tbl_programa = $("#tabla_programa").DataTable({
      "ordering":false,   
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
          "url":"../controller/programas/controlador_listar_programas.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE PROGRAMAS POSGRADO";
          },
          title: function() {
            return "LISTA DE PROGRAMAS POSGRADO";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE PROGRAMAS POSGRADO";
          },
          title: function() {
            return "LISTA DE PROGRAMAS POSGRADO";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE PROGRAMAS POSGRADO";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5]  // Especifica las columnas a exportar hasta "Estado"
          }
        }
      ],
      "columns":[
        {"data":"Id_programa"},
        {"data":"Nombre"},
        {"data":"Grado_academico",
        render: function(data,type,row){
            if(data=='MAESTRIA'){
                return '<span class="badge bg-success">MAESTRIA</span>';
            }else if(data=='DOCTORADO'){
                return '<span class="badge bg-primary">DOCTORADO</span>';
            }else{
                return '<span class="badge bg-primary">SEGUNDA ESPECIALIDAD</span>';

            }
         } 
        },
        
        {"data":"Denominación_grado"},
        {"data":"Programa_estudio"},
        {"data":"Numero_creditos"},
        {"data":"Estado",
            render: function(data,type,row){
                    if(data=='ACTIVO'){
                    return '<span class="badge bg-success">ACTIVO</span>';
                    }else{
                    return '<span class="badge bg-danger">INACTIVO</span>';
                    }
            }   
        },
        {"defaultContent":"<button class='editar btn btn-primary  btn-sm' title='Editar datos de escuela'><i class='fa fa-edit'></i> Editar</button>"},
        
    ],

    "language":idioma_espanol,
    select: true
});
tbl_programa.on('draw.td',function(){
  var PageInfo = $("#tabla_programa").DataTable().page.info();
  tbl_programa.column(0, {page: 'current'}).nodes().each(function(cell, i){
    cell.innerHTML = i + 1 + PageInfo.start;
  });
});
}

function Cargar_Select_Autoridad(){
    $.ajax({
      "url":"../controller/programas/controlador_cargar_select_autoridad.php",
      type:'POST',
     
    }).done(function(resp){
      let data=JSON.parse(resp);
      if(data.length>0){
        let cadena ="<option value=''>Seleccionar autoridad</option>";
        for (let i = 0; i < data.length; i++) {
          cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
        }
          document.getElementById('select_director').innerHTML=cadena;
          document.getElementById('select_director_editar').innerHTML=cadena;
  
      }else{
        cadena+="<option value=''>No hay tipos disponibles</option>";
        document.getElementById('select_director').innerHTML=cadena;
        document.getElementById('select_director_editar').innerHTML=cadena;
  
      }
    })
  }


$('#tabla_programa').on('click','.editar',function(){
    var data = tbl_programa.row($(this).parents('tr')).data();
  
    if(tbl_programa.row(this).child.isShown()){
        var data = tbl_programa.row(this).data();
    }
    $("#modal_editar").modal('show');
    document.getElementById('txt_id_programa').value=data.Id_programa;
    document.getElementById('txte_nombre_editar').value=data.Nombre;
    document.getElementById('select_grado_editar').value=data.Grado_academico;
    document.getElementById('txt_abreviatura_editar').value=data.Abreviatura_grado;
    document.getElementById('txt_deno_editar').value=data.Denominación_grado;
    document.getElementById('txt_programa_editar').value=data.Programa_estudio;
    document.getElementById('txt_credito_editar').value=data.Numero_creditos;
    $("#select_director_editar").select2().val(data.id_autoridad).trigger('change.select2');
    document.getElementById('txt_estatus').value=data.Estado;


})
  
function AbrirRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registrar_Programa(){
    let pro = document.getElementById('txte_nombre').value;
    let grado = document.getElementById('select_grado').value;
    let abre = document.getElementById('txt_abreviatura').value;
    let deno = document.getElementById('txt_deno').value;
    let estu = document.getElementById('txt_programa').value;
    let cred = document.getElementById('txt_credito').value;
    let dire = document.getElementById('select_director').value;


    if(pro.length==0 ||grado.length==0  || abre.length==0 ||deno.length==0 || estu.length==0 ||cred.length==0 || dire.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios revise por favor","warning");
    }
    $.ajax({
      "url":"../controller/programas/controlador_registro_programas.php",
      type:'POST',
      data:{
        pro:pro,
        grado:grado,
        abre:abre,
        deno:deno,
        estu:estu,
        cred:cred,
        dire:dire

      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Nueva programa de posgrado registrado","success").then((value)=>{
            tbl_programa.ajax.reload();
            document.getElementById('txte_nombre').value="";
            document.getElementById('txt_deno').value="";

          $("#modal_registro").modal('hide');
          });
        }else{
          Swal.fire("Mensaje de Advertencia","EL programa que intentas ingresar ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo el registro","error");
  
      }
    })
  }

  function Modificarr_Estudiante(){
    let id = document.getElementById('txt_id_programa').value;
    let pro = document.getElementById('txte_nombre_editar').value;
    let grado = document.getElementById('select_grado_editar').value;
    let abre = document.getElementById('txt_abreviatura_editar').value;
    let deno = document.getElementById('txt_deno_editar').value;
    let estu = document.getElementById('txt_programa_editar').value;
    let cred = document.getElementById('txt_credito_editar').value;
    let dire = document.getElementById('select_director_editar').value;
    let esta = document.getElementById('txt_estatus').value;

  
    if(id.length==0||pro.length==0 ||grado.length==0  || abre.length==0 ||deno.length==0 || estu.length==0 ||cred.length==0 || dire.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    $.ajax({
      "url":"../controller/programas/controlador_modificar_programas.php",
      type:'POST',
      data:{
        id:id,
        pro:pro,
        grado:grado,
        abre:abre,
        deno:deno,
        estu:estu,
        cred:cred,
        dire:dire,
        esta:esta
      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_programa.ajax.reload();
          $("#modal_editar").modal('hide');
          });
        }else{
            Swal.fire("Mensaje de Advertencia","El programa que intentas actualizar ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo la actualización","error");
  
      }
    })
  }