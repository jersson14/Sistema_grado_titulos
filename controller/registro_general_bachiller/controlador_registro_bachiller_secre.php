<?php
    require '../../model/model_registro_general_bachiller.php';


    $MRGB = new Modelo_Registro_General_Bachiller();//Instaciamos
    //DATOS DE ESTUDIANTE
    $tipodoc = strtoupper(htmlspecialchars($_POST['tipodoc'],ENT_QUOTES,'UTF-8'));
    $documentoFinal = strtoupper(htmlspecialchars($_POST['documentoFinal'],ENT_QUOTES,'UTF-8'));
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
    $nombrearchivo = htmlspecialchars($_POST['nombrearchivo'],ENT_QUOTES,'UTF-8');

    //DATOS DE LA MODALIDAD
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
    $idusuario = strtoupper(htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8'));

    
    $auto_etnica = strtoupper(htmlspecialchars($_POST['auto_etnica'], ENT_QUOTES, 'UTF-8'));
    $pueblo_indi = strtoupper(htmlspecialchars($_POST['pueblo_indi'], ENT_QUOTES, 'UTF-8'));
    $lengua_indi = strtoupper(htmlspecialchars($_POST['lengua_indi'], ENT_QUOTES, 'UTF-8'));
    $lengua_detalle = strtoupper(htmlspecialchars($_POST['lengua_detalle'], ENT_QUOTES, 'UTF-8'));


        $ruta='controller/registro_general_bachiller/documentos/'.$nombrearchivo;
    
        $consulta = $MRGB->Registrar_Bachiller($tipodoc,$documentoFinal,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$ced,$esc,$bach,$moda,$idauto,$fecha,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$idusuario, $auto_etnica, $pueblo_indi, $lengua_indi, $lengua_detalle);
   

        if ($consulta) {
            if($nombrearchivo!=""){
                move_uploaded_file($_FILES['achivoobj']['tmp_name'],"documentos/".$nombrearchivo);
            }
            echo $consulta;
        }
        
        ?>