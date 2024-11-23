var tbl_estudiantes;
function listar_estudiantes(){
    tbl_estudiantes = $("#tabla_estudiantes").DataTable({
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
          "url":"../controller/estudiantes_posgrado/controlador_listar_estudiantes.php",
          type:'POST'
      },
      dom: 'Bfrtip', 
     
      buttons: [
        {
          extend: 'excelHtml5',
          text: '<i class="fas fa-file-excel"></i> ',
          titleAttr: 'Exportar a Excel',
          filename: function() {
            return "LISTA DE ESTUDIANTES POSGRADO";
          },
          title: function() {
            return "LISTA DE ESTUDIANTES POSGRADO";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "tiempotrancurrido"
          }
        },
        {
          extend: 'pdfHtml5',
          text: '<i class="fas fa-file-pdf"></i> ',
          titleAttr: 'Exportar a PDF',
          filename: function() {
            return "LISTA DE ESTUDIANTES POSGRADO";
          },
          title: function() {
            return "LISTA DE ESTUDIANTES POSGRADO";
          },
          orientation: 'landscape',  // Exportar en formato horizontal
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "tiempotrancurrido"
          }
        },
        {
          extend: 'print',
          text: '<i class="fa fa-print"></i> ',
          titleAttr: 'Imprimir',
          title: function() {
            return "LISTA DE ESTUDIANTES POSGRADO";
          },
          exportOptions: {
            columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]  // Especifica las columnas a exportar hasta "tiempotrancurrido"
          }
        }
      ],
      "columns":[
        {"data":"tipo_documento"},
        {"data":"Dni"},
        {"data":"Codigo",
        render: function(data,type,row){
            if(data==data){
                return '<span class="badge bg-warning">'+data+'</span>';
            }
         } 
        },        {"data":"Estudiante"},
        {"data":"Sexo",
        render: function(data,type,row){
            if(data=='F'){
                return '<span class="badge bg-success">FEMENINO</span>';
            }else{
                return '<span class="badge bg-primary">MASCULINO</span>';
            }
         } 
        },
        {"data":"Celular"},
        {"data":"Direccion"},
        {"data":"fecha_matricula_n"},
        {"data":"fecha_egreso_n"},   
        {"data":"tiempotrancurrido",
        render: function(data,type,row){
            if(data==data){
                return '<span class="badge bg-dark">'+data+'</span>';
            }
         } 
        },
        {"defaultContent":"<button class='editar btn btn-primary  btn-sm' title='Editar datos de área'><i class='fa fa-edit'></i> Editar</button>"},
        
    ],

    "language":idioma_espanol,
    select: true
});
tbl_estudiantes.on('draw.td',function(){
  var PageInfo = $("#tabla_estudiantes").DataTable().page.info();
    
});
}

$('#tabla_estudiantes').on('click','.editar',function(){
    var data = tbl_estudiantes.row($(this).parents('tr')).data();
  
    if(tbl_estudiantes.row(this).child.isShown()){
        var data = tbl_estudiantes.row(this).data();
    }
    $("#modal_editar").modal('show');
    document.getElementById('txt_dni_editar').value=data.Dni;
    document.getElementById('txt_codigo_editar').value=data.Codigo;
    document.getElementById('txt_nom_editar').value=data.Nombres;
    document.getElementById('txt_apepa_editar').value=data.Apellido_paterno;
    document.getElementById('txt_apema_editar').value=data.Apellido_materno;
    document.getElementById('select_sexo_editar').value=data.Sexo;
    document.getElementById('txt_movil_editar').value=data.Celular;
    document.getElementById('txt_dire_editar').value=data.Direccion;
    document.getElementById('txt_fecha_matri_editar').value=data.Fecha_matricula;
    document.getElementById('txt_fecha_egres_editar').value=data.Fecha_egreso;

})
  

  function Modificarr_Estudiante(){
    let dni = document.getElementById('txt_dni_editar').value;
    let codigo=document.getElementById('txt_codigo_editar').value;
    let nombres = document.getElementById('txt_nom_editar').value;
    let apepa = document.getElementById('txt_apepa_editar').value;
    let apema = document.getElementById('txt_apema_editar').value;
    let sexo = document.getElementById('select_sexo_editar').value;
    let celular = document.getElementById('txt_movil_editar').value;
    let direc = document.getElementById('txt_dire_editar').value;
    let fecha_matr = document.getElementById('txt_fecha_matri_editar').value;
    let fecha_egre = document.getElementById('txt_fecha_egres_editar').value;
    let id_usuario = document.getElementById('txtprincipalid').value;
  
    if(dni.length==0 ||nombres.length==0  || apepa.length==0 ||apema.length==0 || sexo.length==0 ||celular.length==0 || direc.length==0 || fecha_matr.length==0 ||fecha_egre.length==0){
      return Swal.fire("Mensaje de Advertencia","Tiene campos vacios","warning");
    }
    $.ajax({
      "url":"../controller/estudiantes_posgrado/controlador_modificar_estudiantes.php",
      type:'POST',
      data:{
        dni:dni,
        codigo:codigo,
        nombres:nombres,
        apepa:apepa,
        apema:apema,
        sexo:sexo,
        celular:celular,
        direc:direc,
        fecha_matr:fecha_matr,
        fecha_egre:fecha_egre,
        id_usuario:id_usuario,
      }
    }).done(function(resp){
      if(resp>0){
        if(resp==1){
          Swal.fire("Mensaje de Confirmación","Datos actualizados correctamente","success").then((value)=>{
            tbl_estudiantes.ajax.reload();
          $("#modal_editar").modal('hide');
          });
        }else{
          Swal.fire("Mensaje de Advertencia","El DNI del estudiante que intentas ingresar ya se encuentra en la base de datos, revise por favor","warning");
        }
      }else{
        return Swal.fire("Mensaje de Error","No se completo la actualización","error");
  
      }
    })
  }