<?php
    require '../../model/model_diploma_posgrado.php';
    $MDPO = new Modelo_Diplomas_Posgrado();//Instaciamos
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
            $ruta = 'controller/diploma_posgrado/documentos/' . $nombrearchivo; // Construye la ruta completa para la nueva foto
        }
    }
    
    if (!empty($nombrearchivo)) {
        if ($nombrearchivo != 'controller/diploma_posgrado/documentos/' && move_uploaded_file($_FILES['achivoobj']['tmp_name'], "documentos/" . $nombrearchivo)) {
            $ruta = 'controller/diploma_posgrado/documentos/' . $nombrearchivo;
        } else {
            $ruta = $archivoactual;
        }
    }
    

    $consulta = $MDPO->Subir_diploma($iddiploma,$ruta);
    echo $consulta;
    
?>