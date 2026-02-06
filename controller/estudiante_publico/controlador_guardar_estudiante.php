<?php
/**
 * Controlador: Guardar/Actualizar datos de estudiante
 * Maneja tanto INSERT como UPDATE según si el DNI existe
 */

header('Content-Type: application/json');
require '../../model/model_estudiante_publico.php';
require '../../src/PHPMailer.php';
require '../../src/SMTP.php';
require '../../src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

try {
    // Obtener datos del POST
    $dni = isset($_POST['dni']) ? trim($_POST['dni']) : '';
    $tipo_documento = isset($_POST['tipo_documento']) ? $_POST['tipo_documento'] : 'DNI';
    $nombres = isset($_POST['nombres']) ? strtoupper(trim($_POST['nombres'])) : '';
    $apellido_paterno = isset($_POST['apellido_paterno']) ? strtoupper(trim($_POST['apellido_paterno'])) : '';
    $apellido_materno = isset($_POST['apellido_materno']) ? strtoupper(trim($_POST['apellido_materno'])) : '';
    $sexo = isset($_POST['sexo']) ? $_POST['sexo'] : '';
    $codigo = isset($_POST['codigo']) ? trim($_POST['codigo']) : '';
    
    // Datos opcionales
    $celular = isset($_POST['celular']) ? trim($_POST['celular']) : null;
    $direccion = isset($_POST['direccion']) ? trim($_POST['direccion']) : null;
    $correo_personal = isset($_POST['correo_personal']) ? trim($_POST['correo_personal']) : null;
    $correo_institucional = isset($_POST['correo_institucional']) ? trim($_POST['correo_institucional']) : null;
    $fecha_matricula = isset($_POST['fecha_matricula']) && !empty($_POST['fecha_matricula']) ? $_POST['fecha_matricula'] : '0000-00-00';
    $fecha_egreso = isset($_POST['fecha_egreso']) && !empty($_POST['fecha_egreso']) ? $_POST['fecha_egreso'] : '0000-00-00';
    $observaciones = isset($_POST['observaciones']) ? trim($_POST['observaciones']) : null;
    
    // Declaración étnica (Mapeo a estándar SUNEDU)
    $det_etnica = isset($_POST['det_etnica']) ? $_POST['det_etnica'] : null;
    $cod_etnia = isset($_POST['cod_etnia']) && $_POST['cod_etnia'] !== '' ? $_POST['cod_etnia'] : null;
    $det_lengua = isset($_POST['det_lengua']) ? $_POST['det_lengua'] : null;
    $cod_lengua = isset($_POST['cod_lengua']) && $_POST['cod_lengua'] !== '' ? $_POST['cod_lengua'] : null;
    
    // Rutas de archivos (se establecen después de subir)
    $foto_pasaporte = isset($_POST['foto_pasaporte']) ? $_POST['foto_pasaporte'] : null;
    $declaracion_etnica_pdf = isset($_POST['declaracion_etnica_pdf']) ? $_POST['declaracion_etnica_pdf'] : null;
    
    // Validaciones
    if (empty($dni) || strlen($dni) != 8) {
        echo json_encode([
            'success' => false,
            'message' => 'DNI inválido'
        ]);
        exit;
    }
    
    if (empty($nombres) || empty($apellido_paterno) || empty($apellido_materno)) {
        echo json_encode([
            'success' => false,
            'message' => 'Nombres y apellidos son requeridos'
        ]);
        exit;
    }
    
    if (empty($codigo)) {
        echo json_encode([
            'success' => false,
            'message' => 'Código de estudiante es requerido'
        ]);
        exit;
    }

    if (empty($celular)) {
        echo json_encode([
            'success' => false,
            'message' => 'Celular es requerido'
        ]);
        exit;
    }

    if (empty($correo_personal)) {
        echo json_encode([
            'success' => false,
            'message' => 'Correo personal es requerido'
        ]);
        exit;
    }
    
    if (empty($sexo)) {
        echo json_encode([
            'success' => false,
            'message' => 'Sexo es requerido'
        ]);
        exit;
    }
    
    // Preparar array de datos
    // Convertir strings vacíos a NULL para campos numéricos
    $cod_etnia_final = (!empty($cod_etnia) && $cod_etnia !== '') ? $cod_etnia : null;
    $cod_lengua_final = (!empty($cod_lengua) && $cod_lengua !== '') ? $cod_lengua : null;
    $det_etnica_final = (!empty($det_etnica) && $det_etnica !== '') ? $det_etnica : null;
    $det_lengua_final = (!empty($det_lengua) && $det_lengua !== '') ? $det_lengua : null;
    
    $datos = [
        'tipo_documento' => $tipo_documento,
        'dni' => $dni,
        'nombres' => $nombres,
        'apellido_paterno' => $apellido_paterno,
        'apellido_materno' => $apellido_materno,
        'sexo' => $sexo,
        'codigo' => $codigo,
        'celular' => $celular,
        'direccion' => $direccion,
        'correo_personal' => $correo_personal,
        'correo_institucional' => $correo_institucional,
        'fecha_matricula' => $fecha_matricula,
        'fecha_egreso' => $fecha_egreso,
        'observaciones' => $observaciones,
        'foto_pasaporte' => $foto_pasaporte,
        'declaracion_etnica_pdf' => $declaracion_etnica_pdf,
        'det_etnica' => $det_etnica_final,
        'cod_etnia' => $cod_etnia_final,
        'det_lengua' => $det_lengua_final,
        'cod_lengua' => $cod_lengua_final
    ];
    
    $modelo = new Modelo_Estudiante_Publico();
    
    // Verificar si existe
    $estudiante_existe = $modelo->Buscar_Estudiante_Por_DNI($dni);
    
    if ($estudiante_existe) {
        // Verificar si puede actualizar
        if (!$modelo->Puede_Actualizar($dni)) {
            echo json_encode([
                'success' => false,
                'message' => 'No puede actualizar sus datos porque ya tiene un diploma registrado.'
            ]);
            exit;
        }
        
        // Verificar si puede editar declaración étnica
        $puede_editar_var_etnica = $modelo->Puede_Editar_Var_Etnica($dni);
        
        // Si está intentando modificar la declaración étnica pero está bloqueada
        if (!$puede_editar_var_etnica && !empty($autoidentificacion_etnica)) {
            echo json_encode([
                'success' => false,
                'message' => 'Ya llenó su declaración étnica. Si necesita modificarla, contacte al administrador.'
            ]);
            exit;
        }
        
        // Actualizar
        $resultado = $modelo->Actualizar_Estudiante($datos);
        
        if ($resultado) {
            // Si llenó declaración étnica y puede editarla, bloquearla
            if ($puede_editar_var_etnica && !empty($autoidentificacion_etnica)) {
                $modelo->Bloquear_Var_Etnica($dni);
            }
            
            echo json_encode([
                'success' => true,
                'action' => 'update',
                'message' => 'Datos actualizados correctamente'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Error al actualizar datos'
            ]);
        }
    } else {
        // Insertar nuevo
        $resultado = $modelo->Registrar_Estudiante($datos);
        
        if ($resultado) {
            // Si llenó declaración étnica, bloquearla automáticamente
            if (!empty($det_etnica_final)) {
                $modelo->Bloquear_Var_Etnica($dni);
            }
            
            echo json_encode([
                'success' => true,
                'action' => 'insert',
                'id' => $resultado,
                'message' => 'Datos registrados correctamente'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Error al registrar datos'
            ]);
        }
    }
    
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Error: ' . $e->getMessage()
    ]);
}
?>
