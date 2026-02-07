<?php
    // Evitar salida de errores HTML
    error_reporting(0); // Desactivar reportes visuales inmediatos
    ini_set('display_errors', 0);
    header('Content-Type: application/json');

    try {
        require '../../model/model_carreras.php';
        
        // Verificar si la clase existe
        if (!class_exists('Modelo_Carreras')) {
            throw new Exception("Clase Modelo_Carreras no encontrada");
        }

        $MCA = new Modelo_Carreras();
        $id_facultad = isset($_POST['id']) ? $_POST['id'] : null;
        
        // Loguear petición
        $logFile = __DIR__ . '/debug_escuela.log';
        file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Petición recibida. ID Facultad: " . ($id_facultad ?? 'NULL') . PHP_EOL, FILE_APPEND);

        if (!$id_facultad) {
            file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Error: ID nulo" . PHP_EOL, FILE_APPEND);
            echo json_encode([]); // Retornar array vacío si no hay ID
            exit;
        }

        $consulta = $MCA->Cargar_Escuelas_Por_Facultad($id_facultad);
        
        // Loguear resultado
        file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Respuesta Modelo: " . json_encode($consulta) . PHP_EOL, FILE_APPEND);
        
        // Verificar si hubo error en la consulta (ej. tabla no existe)
        if ($consulta === false) {
             file_put_contents($logFile, date('[Y-m-d H:i:s] ') . "Error: Modelo retornó false" . PHP_EOL, FILE_APPEND);
        }

        echo json_encode($consulta);

    } catch (Exception $e) {
        // Devolver error en formato JSON para verlo en la consola del navegador
        echo json_encode(['error' => $e->getMessage()]);
    }
?>
