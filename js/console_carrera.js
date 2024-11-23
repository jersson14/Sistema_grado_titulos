var tbl_carrera;
function listar_carreras(){
    tbl_carrera = $("#tabla_carrera").DataTable({
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
          "url":"../controller/carreras/controlador_listar_carreras.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE ESCUELAS PROFESIONALES";
          },
          title: function() {
            return "LISTA DE ESCUELAS PROFESIONALES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE ESCUELAS PROFESIONALES";
          },
          title: function() {
            return "LISTA DE ESCUELAS PROFESIONALES";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE ESCUELAS PROFESIONALES";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7]  // Especifica las columnas a exportar hasta "Estado"
          }
        }
      ],
      "columns":[
        {"data":"Cod_Escuela",
            render: function(data,type,row){
                    if(data==data){
                    return '<span class="badge bg-dark">'+data+'</span>';
                    }
            }   
        },
        {"data":"Nombre"},
        {"data":"Grado_academico",
        render: function(data,type,row){
            if(data=='BACHILLER'){
                return '<span class="badge bg-warning">BACHILLER</span>';
            }else{
                return '<span class="badge bg-primary">TITULO</span>';
            }
         } 
        },
        
        {"data":"Denominación_grado"},
        {"data":"Programa_estudio"},
        {"data":"Numero_creditos"},
        {"data":"Facultad"},   
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
tbl_carrera.on('draw.td',function(){
  var PageInfo = $("#tabla_carrera").DataTable().page.info();
  tbl_carrera.column(0, {page: 'current'}).nodes().each(function(cell, i){
  });
});
}

function Cargar_Select_Facultad(){
    $.ajax({
      "url":"../controller/carreras/controlador_cargar_select_facultad.php",
      type:'POST',
     
    }).done(function(resp){
      let data=JSON.parse(resp);
      if(data.length>0){
        let cadena ="<option value=''>Seleccionar Facultad</option>";
        for (let i = 0; i < data.length; i++) {
          cadena+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";    
        }
          document.getElementById('select_facultad').innerHTML=cadena;
          document.getElementById('select_facultad_editar').innerHTML=cadena;
  
      }else{
        cadena+="<option value=''>No hay tipos disponibles</option>";
        document.getElementById('select_facultad').innerHTML=cadena;
        document.getElementById('select_facultad_editar').innerHTML=cadena;
  
      }
    })
  }


$('#tabla_carrera').on('click','.editar',function(){
    var data = tbl_carrera.row($(this).parents('tr')).data();
  
    if(tbl_carrera.row(this).child.isShown()){
        var data = tbl_carrera.row(this).data();
    }
    $("#modal_editar").modal('show');
    document.getElementById('txt_id_escuela').value=data.Id_escuela;
    document.getElementById('txt_codigo_escuela_editar').value=data.Cod_Escuela;
    document.getElementById('txte_nombre_editar').value=data.Nombre;
    document.getElementById('select_grado_editar').value=data.Grado_academico;
    document.getElementById('txt_abreviatura_editar').value=data.Abreviatura_grado;
    document.getElementById('txt_deno_editar').value=data.Denominación_grado;
    document.getElementById('txt_programa_editar').value=data.Programa_estudio;
    document.getElementById('txt_credito_editar').value=data.Numero_creditos;
    $("#select_facultad_editar").select2().val(data.Id_facultad).trigger('change.select2');
    document.getElementById('txt_estatus').value=data.Estado;


})
  
function AbrirRegistro(){
    $("#modal_registro").modal({backdrop:'static',keyboard:false})
    $("#modal_registro").modal('show');
}

function Registrar_Carrera(){
    let codesc = document.getElementById('txt_codigo_escuela').value;
    let nombre = document.getElementById('txte_nombre').value;
    let gradoaca = document.getElementById('select_grado').value;
    let abrevi = document.getElementById('txt_abreviatura').value;
    let deno = document.getElementById('txt_deno').value;
    let progra = document.getElementById('txt_programa').value;
    let cred = document.getElementById('txt_credito').value;
    let facul = document.getElementById('select_facultad').value;


    if(codesc.length==0 ||nombre.length==0  || gradoaca.length==0 ||abrevi.length==0 || deno.length==0 ||progra.length==0 || cred.length==0 || facul.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios revise por favor","warning");
    }
    $.ajax({
      "url":"../controller/carreras/controlador_registro_carreras.php",
      type:'POST',
      data:{
        codesc:codesc,
        nombre:nombre,
        gradoaca:gradoaca,
        abrevi:abrevi,
        deno:deno,
        progra:progra,
        cred:cred,
        facul:facul,


      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Nueva escuela profesional registrada","success").then((value)=>{
            tbl_carrera.ajax.reload();
            document.getElementById('txt_codigo_escuela').value="";
            document.getElementById('txte_nombre').value="";
            document.getElementById('txt_deno').value="";
            document.getElementById('txt_credito').value="";

          $("#modal_registro").modal('hide');
          });
        }else{
          Swal.fire("Mensaje de Advertencia","La escuela profesional que intentas ingresar ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo el registro","error");
  
      }
    })
  }

  function Modificarr_Estudiante(){
    let id = document.getElementById('txt_id_escuela').value;
    let codesc = document.getElementById('txt_codigo_escuela_editar').value;
    let nombre = document.getElementById('txte_nombre_editar').value;
    let gradoaca = document.getElementById('select_grado_editar').value;
    let abrevi = document.getElementById('txt_abreviatura_editar').value;
    let deno = document.getElementById('txt_deno_editar').value;
    let progra = document.getElementById('txt_programa_editar').value;
    let cred = document.getElementById('txt_credito_editar').value;
    let facul = document.getElementById('select_facultad_editar').value;
    let estado = document.getElementById('txt_estatus').value;
  
    if(id.length==0||codesc.length==0 ||nombre.length==0  || gradoaca.length==0 ||abrevi.length==0 || deno.length==0 ||progra.length==0 || cred.length==0 || facul.length==0){
        return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    $.ajax({
      "url":"../controller/carreras/controlador_modificar_carreras.php",
      type:'POST',
      data:{
        id:id,
        codesc:codesc,
        nombre:nombre,
        gradoaca:gradoaca,
        abrevi:abrevi,
        deno:deno,
        progra:progra,
        cred:cred,
        facul:facul,
        estado:estado
      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_carrera.ajax.reload();
          $("#modal_editar").modal('hide');
          });
        }else{
            Swal.fire("Mensaje de Advertencia","La escuela profesional que intentas actualizar ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo la actualización","error");
  
      }
    })
  }