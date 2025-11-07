<?php
require '../../model/model_registro_general_bachiller.php';
$MRGB = new Modelo_Registro_General_Bachiller();

$numero = strtoupper(htmlspecialchars($_POST['numero'],ENT_QUOTES,'UTF-8'));
$grado1 = strtoupper(htmlspecialchars($_POST['grado1'],ENT_QUOTES,'UTF-8'));
$program = strtoupper(htmlspecialchars($_POST['program'],ENT_QUOTES,'UTF-8'));
$fedes1 = strtoupper(htmlspecialchars($_POST['fedes1'],ENT_QUOTES,'UTF-8'));
$fehas1 = strtoupper(htmlspecialchars($_POST['fehas1'],ENT_QUOTES,'UTF-8'));
$ruta_pdf = isset($_POST['ruta_pdf']) ? htmlspecialchars($_POST['ruta_pdf'],ENT_QUOTES,'UTF-8') : '';

$consulta = $MRGB->Registrar_informe($numero, $grado1, $program, $fedes1, $fehas1, $ruta_pdf);
echo $consulta;
?>