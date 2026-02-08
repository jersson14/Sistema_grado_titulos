<?php
/**
 * Controlador para obtener variables étnicas de un estudiante por DNI
 * Usado cuando se consulta UMIL para pre-cargar variables étnicas guardadas
 */

// Suprimir warnings y notices para JSON limpio
error_reporting(E_ERROR | E_PARSE);
ini_set('display_errors', 0);

header('Content-Type: application/json');

require '../../model/model_conexion.php';

if (!isset($_POST['dni']) || empty($_POST['dni'])) {
    echo json_encode(['existe' => false, 'error' => 'DNI no proporcionado']);
    exit;
}

$dni = trim($_POST['dni']);

// Validar formato DNI (8 dígitos)
if (!preg_match('/^\d{8}$/', $dni)) {
    echo json_encode(['existe' => false, 'error' => 'DNI inválido']);
    exit;
}

try {
    // Instanciar la clase de conexión
    $db = new conexionBD();
    $conexion = $db->conexionPDO();
    
    $sql = "SELECT 
                Codigo,
                COD_ETNIA, 
                COD_LENGUA, 
                DET_ETNICA, 
                DET_LENGUA 
            FROM estudiante 
            WHERE Dni = ? 
            LIMIT 1";
    
    $stmt = $conexion->prepare($sql);
    $stmt->execute([$dni]);
    $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // Mapeo de etnias (códigos 1-55)
    $ETNIAS = [
        1 => 'Achuar', 2 => 'Aimara', 3 => 'Amahuaca', 4 => 'Arabela',
        5 => 'Ashaninka', 6 => 'Asheninka', 7 => 'Awajún', 8 => 'Bora',
        9 => 'Cashinahua', 10 => 'Chamicuro', 11 => 'Chapra', 12 => 'Chitonahua',
        13 => 'Ese eja', 14 => 'Harakbut', 15 => 'Iñapari', 16 => 'Isconahua',
        17 => 'Jaqaru', 18 => 'Kakataibo', 19 => 'Kakinte (Caquinte)', 20 => 'Kandozi',
        21 => 'Kapanawa', 22 => 'Kichwa', 23 => 'Kukama kukamiria', 24 => 'Madija (Culina)',
        25 => 'Maijuna', 26 => 'Matsigenka', 27 => 'Matsés', 28 => 'Murui-muinani',
        29 => 'Nahua', 30 => 'Nanti', 31 => 'Nomatsigenga', 32 => 'Ocaina',
        33 => 'Omagua', 34 => 'Resígaro', 35 => 'Secoya', 36 => 'Sharanahua',
        37 => 'Shawi', 38 => 'Shipibo-konibo', 39 => 'Shiwilu', 40 => 'Quechuas',
        41 => 'Taushiro', 42 => 'Tikuna (Ticuna)', 43 => 'Urarina', 44 => 'Vacacocha',
        45 => 'Wampis', 46 => 'Yagua', 47 => 'Yaminahua', 48 => 'Yanesha',
        49 => 'Yine', 50 => 'Yora (Nahua)', 51 => 'Afroperuano', 52 => 'Mestizo',
        53 => 'Blanco', 54 => 'Otro', 55 => 'No sabe/No responde'
    ];
    
    // Mapeo de lenguas (códigos 1-48)
    $LENGUAS = [
        1 => 'Achuar', 2 => 'Aimara', 3 => 'Amahuaca', 4 => 'Arabela',
        5 => 'Ashaninka', 6 => 'Asheninka', 7 => 'Awajún', 8 => 'Bora',
        9 => 'Cashinahua', 10 => 'Chamicuro', 11 => 'Chapra', 12 => 'Chitonahua',
        13 => 'Ese eja', 14 => 'Harakbut', 15 => 'Iñapari', 16 => 'Isconahua',
        17 => 'Jaqaru', 18 => 'Kakataibo', 19 => 'Kakinte (Caquinte)', 20 => 'Kandozi',
        21 => 'Kapanawa', 22 => 'Kichwa', 23 => 'Kukama kukamiria', 24 => 'Madija (Culina)',
        25 => 'Maijuna', 26 => 'Matsigenka', 27 => 'Matsés', 28 => 'Murui-muinani',
        29 => 'Nahua', 30 => 'Nanti', 31 => 'Nomatsigenga', 32 => 'Ocaina',
        33 => 'Omagua', 34 => 'Quechua', 35 => 'Resígaro', 36 => 'Secoya',
        37 => 'Sharanahua', 38 => 'Shawi', 39 => 'Shipibo-konibo', 40 => 'Shiwilu',
        41 => 'Taushiro', 42 => 'Tikuna (Ticuna)', 43 => 'Urarina', 44 => 'Vacacocha',
        45 => 'Wampis', 46 => 'Yagua', 47 => 'Yaminahua', 48 => 'Yanesha'
    ];
    
    if ($resultado) {
        // Convertir códigos a enteros
        $cod_etnia = intval($resultado['COD_ETNIA']);
        $cod_lengua = intval($resultado['COD_LENGUA']);
        
        // Obtener nombres (solo para el mensaje informativo)
        $nombre_etnia = isset($ETNIAS[$cod_etnia]) ? $ETNIAS[$cod_etnia] : '';
        $nombre_lengua = isset($LENGUAS[$cod_lengua]) ? $LENGUAS[$cod_lengua] : '';
        
        echo json_encode([
            'existe' => true,
            'codigo_estudiante' => $resultado['Codigo'], // ⭐ NUEVO: Código del estudiante
            'cod_etnia' => $cod_etnia,
            'cod_lengua' => $cod_lengua,
            'det_etnica' => $resultado['DET_ETNICA'],
            'det_lengua' => $resultado['DET_LENGUA'],
            'nombre_etnia' => $nombre_etnia,  // Solo para mensaje informativo
            'nombre_lengua' => $nombre_lengua // Solo para mensaje informativo
        ]);
    } else {
        echo json_encode([
            'existe' => false,
            'mensaje' => 'No se encontraron variables étnicas para el DNI proporcionado'
        ]);
    }
    
    // Cerrar conexión
    $db->cerrar_conexion();
    
} catch (Exception $e) {
    http_response_code(500);
    error_log("Error en controlador_obtener_variables_etnicas: " . $e->getMessage());
    echo json_encode([
        'existe' => false,
        'error' => 'Error al consultar variables étnicas'
    ]);
}
