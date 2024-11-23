<?php
    require '../../model/model_diploma_titulo.php';
    $MDT = new Modelo_Diplomas_Titulo();//Instaciamos
    //DATOS DE ESTUDIANTE
   
    $iddiploma = strtoupper(htmlspecialchars($_POST['iddiploma'],ENT_QUOTES,'UTF-8'));
    $archivoactual = htmlspecialchars($_POST['archivoactual'],ENT_QUOTES,'UTF-8');
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8');

    if (empty($nombrearchivo)) {
        $ruta = $archivoactual;
    } else {
        if ($nombrearchivo === ''|| $nombrearchivo===null) {
            $ruta = $archivoactual; // Simplemente usa el nombre sin modificarlo
        } else {
            $ruta = 'controller/diplomas/documentos/' . $nombrearchivo; // Construye la ruta completa para la nueva foto
        }
    }
    
    if (!empty($nombrearchivo)) {
        if ($nombrearchivo != 'controller/diplomas/documentos/' && move_uploaded_file($_FILES['achivoobj']['tmp_name'], "documentos/" . $nombrearchivo)) {
            $ruta = 'controller/diplomas/documentos/' . $nombrearchivo;
        } else {
            $ruta = $archivoactual;
        }
    }
    

    $consulta = $MDT->Subir_diploma($iddiploma,$ruta);
    echo $consulta;
    
?>