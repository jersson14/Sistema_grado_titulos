<?php
    require '../../model/model_registro_general_bachiller.php';
    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    //DATOS DE ESTUDIANTE
    $dni = strtoupper(htmlspecialchars($_POST['dni'],ENT_QUOTES,'UTF-8'));
    $nombres = strtoupper(htmlspecialchars($_POST['nombres'],ENT_QUOTES,'UTF-8'));
    $apepa = strtoupper(htmlspecialchars($_POST['apepa'],ENT_QUOTES,'UTF-8'));
    $apema = strtoupper(htmlspecialchars($_POST['apema'],ENT_QUOTES,'UTF-8'));
    $codigo = strtoupper(htmlspecialchars($_POST['codigo'],ENT_QUOTES,'UTF-8'));
    $sexo = strtoupper(htmlspecialchars($_POST['sexo'],ENT_QUOTES,'UTF-8'));
    $celular = strtoupper(htmlspecialchars($_POST['celular'],ENT_QUOTES,'UTF-8'));
    $direc = strtoupper(htmlspecialchars($_POST['direc'],ENT_QUOTES,'UTF-8'));
    $emaper = htmlspecialchars($_POST['emaper'],ENT_QUOTES,'UTF-8');
    $emainsti = htmlspecialchars($_POST['emainsti'],ENT_QUOTES,'UTF-8');
    $fecha_matr = strtoupper(htmlspecialchars($_POST['fecha_matr'],ENT_QUOTES,'UTF-8'));
    $fecha_egre = strtoupper(htmlspecialchars($_POST['fecha_egre'],ENT_QUOTES,'UTF-8'));
    $observa = strtoupper(htmlspecialchars($_POST['observa'],ENT_QUOTES,'UTF-8'));
    //DATOS DE EXPEDIENTE
    $idexpe = strtoupper(htmlspecialchars($_POST['idexpe'],ENT_QUOTES,'UTF-8'));
    $ced = strtoupper(htmlspecialchars($_POST['ced'],ENT_QUOTES,'UTF-8'));
    $esc = strtoupper(htmlspecialchars($_POST['esc'],ENT_QUOTES,'UTF-8'));
    $bach = htmlspecialchars($_POST['bach'],ENT_QUOTES,'UTF-8');
    $moda = strtoupper(htmlspecialchars($_POST['moda'],ENT_QUOTES,'UTF-8'));
    $idauto = strtoupper(htmlspecialchars($_POST['idauto'],ENT_QUOTES,'UTF-8'));
    $fecha = strtoupper(htmlspecialchars($_POST['fecha'],ENT_QUOTES,'UTF-8'));
    $acu = strtoupper(htmlspecialchars($_POST['acu'],ENT_QUOTES,'UTF-8'));
    $res = strtoupper(htmlspecialchars($_POST['res'],ENT_QUOTES,'UTF-8'));
    $exped = strtoupper(htmlspecialchars($_POST['exped'],ENT_QUOTES,'UTF-8'));
    $lib = strtoupper(htmlspecialchars($_POST['lib'],ENT_QUOTES,'UTF-8'));
    $fol = strtoupper(htmlspecialchars($_POST['fol'],ENT_QUOTES,'UTF-8'));
    $reg = strtoupper(htmlspecialchars($_POST['reg'],ENT_QUOTES,'UTF-8'));
    $archivoactual = htmlspecialchars($_POST['archivoactual'],ENT_QUOTES,'UTF-8');
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8');

    //DATOS DE LA MODALIDAD
    $idmoda = strtoupper(htmlspecialchars($_POST['idmoda'],ENT_QUOTES,'UTF-8'));
    $mod_estu = strtoupper(htmlspecialchars($_POST['mod_estu'],ENT_QUOTES,'UTF-8'));
    $tra_inv = strtoupper(htmlspecialchars($_POST['tra_inv'],ENT_QUOTES,'UTF-8'));

    $turn = strtoupper(htmlspecialchars($_POST['turn'],ENT_QUOTES,'UTF-8'));
    $porc = strtoupper(htmlspecialchars($_POST['porc'],ENT_QUOTES,'UTF-8'));
    $cent = strtoupper(htmlspecialchars($_POST['cent'],ENT_QUOTES,'UTF-8'));
    $meta = htmlspecialchars($_POST['meta'],ENT_QUOTES,'UTF-8');
    $proce_bach = strtoupper(htmlspecialchars($_POST['proce_bach'],ENT_QUOTES,'UTF-8'));
    
    $proce_insti = strtoupper(htmlspecialchars($_POST['proce_insti'],ENT_QUOTES,'UTF-8'));
    $proce_titu = strtoupper(htmlspecialchars($_POST['proce_titu'],ENT_QUOTES,'UTF-8'));
    $fecha_matri = strtoupper(htmlspecialchars($_POST['fecha_matri'],ENT_QUOTES,'UTF-8'));
    $fecha_inici = strtoupper(htmlspecialchars($_POST['fecha_inici'],ENT_QUOTES,'UTF-8'));
    $fecha_fin = strtoupper(htmlspecialchars($_POST['fecha_fin'],ENT_QUOTES,'UTF-8'));
    $mod_sustenta = strtoupper(htmlspecialchars($_POST['mod_sustenta'],ENT_QUOTES,'UTF-8'));

    $iddiploma = strtoupper(htmlspecialchars($_POST['iddiploma'],ENT_QUOTES,'UTF-8'));
    $fechacu = strtoupper(htmlspecialchars($_POST['fechacu'],ENT_QUOTES,'UTF-8'));
    $fechafirma = strtoupper(htmlspecialchars($_POST['fechafirma'],ENT_QUOTES,'UTF-8'));

    $resol = strtoupper(htmlspecialchars($_POST['resol'],ENT_QUOTES,'UTF-8'));
    $fechareso = strtoupper(htmlspecialchars($_POST['fechareso'],ENT_QUOTES,'UTF-8'));
    $numdiplo = strtoupper(htmlspecialchars($_POST['numdiplo'],ENT_QUOTES,'UTF-8'));
    $numregis = strtoupper(htmlspecialchars($_POST['numregis'],ENT_QUOTES,'UTF-8'));
    $libroregi = strtoupper(htmlspecialchars($_POST['libroregi'],ENT_QUOTES,'UTF-8'));
    $regisfolio = strtoupper(htmlspecialchars($_POST['regisfolio'],ENT_QUOTES,'UTF-8'));
    $tipodiplo = strtoupper(htmlspecialchars($_POST['tipodiplo'],ENT_QUOTES,'UTF-8'));
    $fechaini = strtoupper(htmlspecialchars($_POST['fechaini'],ENT_QUOTES,'UTF-8'));
    $nrocre = strtoupper(htmlspecialchars($_POST['nrocre'],ENT_QUOTES,'UTF-8'));
    $nrooficio = strtoupper(htmlspecialchars($_POST['nrooficio'],ENT_QUOTES,'UTF-8'));
    $fechasecre = strtoupper(htmlspecialchars($_POST['fechasecre'],ENT_QUOTES,'UTF-8'));
    $ciclo_tra = strtoupper(htmlspecialchars($_POST['ciclo_tra'],ENT_QUOTES,'UTF-8'));

    $idusuario = strtoupper(htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8'));

    if (empty($nombrearchivo)) {
        $ruta = $archivoactual;
    } else {
        if ($nombrearchivo == 'controller/registro_general_bachiller/documentos/') {
            $ruta = $archivoactual; // Simplemente usa el nombre sin modificarlo
        } else {
            $ruta = 'controller/registro_general_bachiller/documentos/' . $nombrearchivo; // Construye la ruta completa para la nueva foto
        }
    }
    
    if (!empty($nombrearchivo)) {
        if ($nombrearchivo != 'controller/registro_general_bachiller/documentos/' && move_uploaded_file($_FILES['achivoobj']['tmp_name'], "documentos/" . $nombrearchivo)) {
            $ruta = 'controller/registro_general_bachiller/documentos/' . $nombrearchivo;
        } else {
            $ruta = $archivoactual;
        }
    }
    

    $consulta = $MRGB->Modificar_Bachiller($dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$idexpe,$ced,$esc,$bach,$moda,$idauto,$fecha,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$idmoda,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$iddiploma,$fechacu,$fechafirma,$resol,$fechareso,$numdiplo,$numregis,$libroregi,$regisfolio,$tipodiplo,$fechaini,$nrocre,$nrooficio,$fechasecre,$ciclo_tra,$idusuario);
    echo $consulta;
    
?>