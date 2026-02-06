<?php
    // Controlador para subida masiva (ZIP o Archivos Sueltos)
    
    // Aumentar la memoria y el tiempo de ejecución para archivos grandes
    ini_set('memory_limit', '256M');
    ini_set('max_execution_time', 300);

    require_once '../../model/model_repositorio.php';

    $MU = new Modelo_Repositorio();

    $id_colacion = htmlspecialchars($_POST['id_colacion'], ENT_QUOTES, 'UTF-8');
    
    if(empty($id_colacion)){
        echo json_encode(['success' => false, 'message' => 'No se seleccionó ninguna colación.']);
        exit;
    }

    // Ruta base para guardar los archivos
    // Estructura: uploads/repositorio/{id_colacion}/
    $base_dir = '../../uploads/repositorio/';
    if (!file_exists($base_dir)) {
        mkdir($base_dir, 0777, true);
    }

    $target_dir = $base_dir . $id_colacion . '/';
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $response = [
        'success' => true,
        'message' => '',
        'processed' => 0,
        'errors' => 0,
        'details' => []
    ];

    // Función auxiliar para procesar un archivo individual
    function procesar_archivo_pdf($tmp_path, $original_name, $target_dir, $id_colacion, $MU) {
        // Validar extensión
        $ext = strtolower(pathinfo($original_name, PATHINFO_EXTENSION));
        if($ext != 'pdf'){
            return ['status' => false, 'msg' => "El archivo '$original_name' no es un PDF."];
        }

        // Extraer DNI del nombre (8 dígitos consecutivos)
        if(preg_match('/(\d{8})/', $original_name, $matches)){
            $dni = $matches[1];
        } else {
            return ['status' => false, 'msg' => "No se encontró un DNI válido (8 dígitos) en el nombre '$original_name'."];
        }

        $clean_name = preg_replace('/[^A-Za-z0-9\-\_\.]/', '', $original_name);
        $final_path = $target_dir . $clean_name;
        
        if(copy($tmp_path, $final_path)) {
            // Registrar en BD
            $ruta_bd = 'uploads/repositorio/' . $id_colacion . '/' . $clean_name;
            $res = $MU->Registrar_Archivo($id_colacion, $dni, $original_name, $ruta_bd);
            
            if($res){
                return ['status' => true, 'dni' => $dni];
            } else {
                return ['status' => false, 'msg' => "Error al registrar '$original_name' en base de datos."];
            }
        } else {
            return ['status' => false, 'msg' => "Error al guardar el archivo físico '$original_name'."];
        }
    }

    /**
     * Función para eliminar carpetas y archivos recursivamente
     */
    function eliminar_carpeta_recursiva($dir) {
        if (!file_exists($dir)) return true;
        if (!is_dir($dir)) return unlink($dir);
        foreach (scandir($dir) as $item) {
            if ($item == '.' || $item == '..') continue;
            if (!eliminar_carpeta_recursiva($dir . DIRECTORY_SEPARATOR . $item)) return false;
        }
        return rmdir($dir);
    }

    // --- PROCESAMIENTO COMPRIMIDO (ZIP) ---
    if (isset($_FILES['archivo_zip']) && $_FILES['archivo_zip']['error'] == 0) {
        $filename = $_FILES['archivo_zip']['name'];
        $tmp_path = $_FILES['archivo_zip']['tmp_name'];
        $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
        
        $extraction_success = false;
        $temp_extract_dir = $target_dir . 'temp_' . uniqid() . '/';
        $extraction_error_msg = "";

        if ($ext != 'zip') {
            $extraction_error_msg = "Solo se permiten archivos en formato .ZIP";
        } else {
            $zip = new ZipArchive;
            $res = $zip->open($tmp_path);
            if ($res === TRUE) {
                if (!file_exists($temp_extract_dir)) mkdir($temp_extract_dir);
                $zip->extractTo($temp_extract_dir);
                $zip->close();
                $extraction_success = true;
            } else {
                $extraction_error_msg = "No se pudo abrir el archivo ZIP.";
            }
        }

        if ($extraction_success) {
            // Iterar todos los archivos recursivamente (por si vienen dentro de carpetas)
            $iterator = new RecursiveIteratorIterator(
                new RecursiveDirectoryIterator($temp_extract_dir, RecursiveDirectoryIterator::SKIP_DOTS),
                RecursiveIteratorIterator::SELF_FIRST
            );

            foreach($iterator as $fileInfo){
                if($fileInfo->isDir()) continue;
                
                $path = $fileInfo->getRealPath();
                $name = $fileInfo->getFilename();
                
                // Ignorar archivos de sistema ocultos (como .DS_Store o __MACOSX)
                if(strpos($name, '.') === 0 || strpos($path, '__MACOSX') !== false) continue;
                
                $result = procesar_archivo_pdf($path, $name, $target_dir, $id_colacion, $MU);
                
                if($result['status']){
                    $response['processed']++;
                } else {
                    // Solo incrementamos error si no es un archivo basura (que ya filtramos arriba)
                    // procesar_archivo_pdf ya valida si es .pdf
                    if (strtolower(pathinfo($name, PATHINFO_EXTENSION)) == 'pdf') {
                        $response['errors']++;
                        $response['details'][] = $result['msg'];
                    }
                }
            }
            
            // Limpiar temp de forma recursiva (para borrar __MACOSX y carpetas extraídas)
            eliminar_carpeta_recursiva($temp_extract_dir);
            
            $response['message'] = "Procesado ZIP finalizado. {$response['processed']} archivos importados correctamente.";
            
        } else {
            $response['success'] = false;
            $response['message'] = $extraction_error_msg;
        }
    }
    // --- PROCESAMIENTO MÚLTIPLE (Archivos sueltos) ---
    elseif (isset($_FILES['archivos'])) {
        $total_files = count($_FILES['archivos']['name']);
        
        for($i = 0; $i < $total_files; $i++) {
            if($_FILES['archivos']['error'][$i] == 0) {
                $tmp_name = $_FILES['archivos']['tmp_name'][$i];
                $name = $_FILES['archivos']['name'][$i];
                
                // move_uploaded_file es necesario para $_FILES, pero mi función usa copy.
                // copy funciona con tmp_name también.
                
                $result = procesar_archivo_pdf($tmp_name, $name, $target_dir, $id_colacion, $MU);
                
                 if($result['status']){
                    $response['processed']++;
                } else {
                    $response['errors']++;
                    $response['details'][] = $result['msg'];
                }
            }
        }
        $response['message'] = "Procesamiento finalizado. {$response['processed']} archivos subidos.";
    } else {
        $response['success'] = false;
        $response['message'] = "No se recibieron archivos.";
    }

    echo json_encode($response);
?>
