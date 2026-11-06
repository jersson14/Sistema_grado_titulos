<?php
    session_start();
    header('Content-Type: application/json; charset=utf-8');

    $roles = array("Super Administrador","Administrador");
    if (!isset($_SESSION['S_ID']) || !in_array($_SESSION['S_ROL'],$roles)) {
        http_response_code(403);
        echo json_encode(array("error" => "Sin permiso para ver el resumen."));
        exit;
    }

    // El buffer evita que el BOM o un mensaje de la conexión rompan el JSON
    ob_start();
    try {
        require '../../model/model_dashboard.php';
        $MD = new Modelo_Dashboard();//Instaciamos
        $consulta = $MD->Resumen();
        ob_end_clean();
        echo json_encode($consulta);
    } catch (Throwable $e) {
        ob_end_clean();
        error_log("Dashboard: ".$e->getMessage());
        http_response_code(500);
        echo json_encode(array("error" => "No se pudo calcular el resumen."));
    }
?>
