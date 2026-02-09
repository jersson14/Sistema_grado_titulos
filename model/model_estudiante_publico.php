<?php
/**
 * Modelo para gestión de estudiantes - Portal Público
 * Maneja registro y actualización de datos de estudiantes
 */

require_once 'model_conexion.php';

class Modelo_Estudiante_Publico extends conexionBD {
    
    /**
     * Buscar estudiante por DNI y Nivel
     * @param string $dni
     * @param string $nivel (PREGRADO o POSGRADO)
     * @return array|null Datos del estudiante o null si no existe
     */
    public function Buscar_Estudiante_Por_DNI($dni, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        $tabla = ($nivel === 'POSGRADO') ? 'estudiante_posgrado' : 'estudiante';
        $sql = "SELECT * FROM {$tabla} WHERE Dni = ?";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado ? $resultado : null;
    }
    
    /**
     * Verificar si el estudiante puede actualizar sus datos
     * @param string $dni
     * @param string $nivel
     * @return bool
     */
    public function Puede_Actualizar($dni, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        // NOTA: Para posgrado, por ahora permitimos siempre o podríamos crear SP_PUEDE_ACTUALIZAR_ESTUDIANTE_POS
        if ($nivel === 'POSGRADO') {
            return true; // Simplificación para posgrado
        }
        
        $sql = "CALL SP_PUEDE_ACTUALIZAR_ESTUDIANTE(?)";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado && $resultado['puede_actualizar'] == 1;
    }
    
    /**
     * Registrar nuevo estudiante
     * @param array $datos
     * @param string $nivel
     * @return bool
     */
    public function Registrar_Estudiante($datos, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        
        try {
            if ($nivel === 'POSGRADO') {
                $sql = "INSERT INTO estudiante_posgrado (
                            tipo_documento, Dni, Codigo, Nombres, Apellido_paterno, Apellido_materno, Sexo, 
                            Celular, Direccion, correo_personal, correo_institucional, 
                            Fecha_matricula, Fecha_egreso, Observaciones, 
                            foto_pasaporte, declaracion_etnica_pdf, 
                            DET_ETNICA, COD_ETNIA, DET_LENGUA, COD_LENGUA,
                            Posgrado, fecha_declaracion_etnica, estado_var_etnica,
                            created_at, updated_at
                        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),1,NOW(),NOW())";
                
                $query = $c->prepare($sql);
                $query->bindParam(1, $datos['tipo_documento']);
                $query->bindParam(2, $datos['dni']);
                $query->bindParam(3, $datos['codigo']);
                $query->bindParam(4, $datos['nombres']);
                $query->bindParam(5, $datos['apellido_paterno']);
                $query->bindParam(6, $datos['apellido_materno']);
                $query->bindParam(7, $datos['sexo']);
                $query->bindParam(8, $datos['celular']);
                $query->bindParam(9, $datos['direccion']);
                $query->bindParam(10, $datos['correo_personal']);
                $query->bindParam(11, $datos['correo_institucional']);
                $query->bindParam(12, $datos['fecha_matricula']);
                $query->bindParam(13, $datos['fecha_egreso']);
                $query->bindParam(14, $datos['observaciones']);
                $query->bindParam(15, $datos['foto_pasaporte']);
                $query->bindParam(16, $datos['declaracion_etnica_pdf']);
                $query->bindParam(17, $datos['det_etnica']);
                $query->bindParam(18, $datos['cod_etnia']);
                $query->bindParam(19, $datos['det_lengua']);
                $query->bindParam(20, $datos['cod_lengua']);
                $query->bindParam(21, $datos['posgrado']);
            } else {
                $sql = "INSERT INTO estudiante (
                            Tipo_documento, Dni, Nombres, Apellido_paterno, Apellido_materno, Sexo, 
                            Codigo, Facultad, Escuela, Celular, Direccion, correo_personal, correo_institucional, 
                            Fecha_matricula, Fecha_egreso, Observaciones, foto_pasaporte, 
                            declaracion_etnica_pdf, 
                            DET_ETNICA, COD_ETNIA, DET_LENGUA, COD_LENGUA,
                            fecha_declaracion_etnica, estado_var_etnica
                        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NOW(),1)";
                
                $query = $c->prepare($sql);
                $query->bindParam(1, $datos['tipo_documento']);
                $query->bindParam(2, $datos['dni']);
                $query->bindParam(3, $datos['nombres']);
                $query->bindParam(4, $datos['apellido_paterno']);
                $query->bindParam(5, $datos['apellido_materno']);
                $query->bindParam(6, $datos['sexo']);
                $query->bindParam(7, $datos['codigo']);
                $query->bindParam(8, $datos['facultad']);
                $query->bindParam(9, $datos['escuela']);
                $query->bindParam(10, $datos['celular']);
                $query->bindParam(11, $datos['direccion']);
                $query->bindParam(12, $datos['correo_personal']);
                $query->bindParam(13, $datos['correo_institucional']);
                $query->bindParam(14, $datos['fecha_matricula']);
                $query->bindParam(15, $datos['fecha_egreso']);
                $query->bindParam(16, $datos['observaciones']);
                $query->bindParam(17, $datos['foto_pasaporte']);
                $query->bindParam(18, $datos['declaracion_etnica_pdf']);
                $query->bindParam(19, $datos['det_etnica']);
                $query->bindParam(20, $datos['cod_etnia']);
                $query->bindParam(21, $datos['det_lengua']);
                $query->bindParam(22, $datos['cod_lengua']);
            }
            
            $resultado = $query->execute();
            conexionBD::cerrar_conexion();
            return $resultado;
        } catch (PDOException $e) {
            error_log("Error al registrar estudiante {$nivel}: " . $e->getMessage());
            conexionBD::cerrar_conexion();
            return false;
        }
    }
    
    /**
     * Actualizar datos de estudiante existente
     * @param array $datos
     * @param string $nivel
     * @return bool
     */
    public function Actualizar_Estudiante($datos, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        
        if ($nivel === 'POSGRADO') {
            $sql = "UPDATE estudiante_posgrado SET
                Codigo = ?,
                Posgrado = ?,
                Celular = ?,
                Direccion = ?,
                correo_personal = ?,
                correo_institucional = ?,
                Fecha_matricula = ?,
                Fecha_egreso = ?,
                Observaciones = ?,
                foto_pasaporte = ?,
                declaracion_etnica_pdf = ?,
                DET_ETNICA = ?,
                COD_ETNIA = ?,
                DET_LENGUA = ?,
                COD_LENGUA = ?,
                fecha_declaracion_etnica = NOW(),
                updated_at = NOW()
            WHERE Dni = ?";
            
            $query = $c->prepare($sql);
            $query->bindParam(1, $datos['codigo']);
            $query->bindParam(2, $datos['posgrado']);
            $query->bindParam(3, $datos['celular']);
            $query->bindParam(4, $datos['direccion']);
            $query->bindParam(5, $datos['correo_personal']);
            $query->bindParam(6, $datos['correo_institucional']);
            $query->bindParam(7, $datos['fecha_matricula']);
            $query->bindParam(8, $datos['fecha_egreso']);
            $query->bindParam(9, $datos['observaciones']);
            $query->bindParam(10, $datos['foto_pasaporte']);
            $query->bindParam(11, $datos['declaracion_etnica_pdf']);
            $query->bindParam(12, $datos['det_etnica']);
            $query->bindParam(13, $datos['cod_etnia']);
            $query->bindParam(14, $datos['det_lengua']);
            $query->bindParam(15, $datos['cod_lengua']);
            $query->bindParam(16, $datos['dni']);
        } else {
            $sql = "UPDATE estudiante SET
                Codigo = ?,
                Facultad = ?,
                Escuela = ?,
                Celular = ?,
                Direccion = ?,
                correo_personal = ?,
                correo_institucional = ?,
                Fecha_matricula = ?,
                Fecha_egreso = ?,
                Observaciones = ?,
                foto_pasaporte = ?,
                declaracion_etnica_pdf = ?,
                DET_ETNICA = ?,
                COD_ETNIA = ?,
                DET_LENGUA = ?,
                COD_LENGUA = ?,
                fecha_declaracion_etnica = NOW(),
                updated_at = NOW()
            WHERE Dni = ?";
            
            $query = $c->prepare($sql);
            $query->bindParam(1, $datos['codigo']);
            $query->bindParam(2, $datos['facultad']);
            $query->bindParam(3, $datos['escuela']);
            $query->bindParam(4, $datos['celular']);
            $query->bindParam(5, $datos['direccion']);
            $query->bindParam(6, $datos['correo_personal']);
            $query->bindParam(7, $datos['correo_institucional']);
            $query->bindParam(8, $datos['fecha_matricula']);
            $query->bindParam(9, $datos['fecha_egreso']);
            $query->bindParam(10, $datos['observaciones']);
            $query->bindParam(11, $datos['foto_pasaporte']);
            $query->bindParam(12, $datos['declaracion_etnica_pdf']);
            $query->bindParam(13, $datos['det_etnica']);
            $query->bindParam(14, $datos['cod_etnia']);
            $query->bindParam(15, $datos['det_lengua']);
            $query->bindParam(16, $datos['cod_lengua']);
            $query->bindParam(17, $datos['dni']);
        }
        
        $resultado = $query->execute();
        conexionBD::cerrar_conexion();
        
        return $resultado;
    }
    
    /**
     * Verificar si puede editar declaración étnica
     * @param string $dni
     * @param string $nivel
     * @return bool
     */
    public function Puede_Editar_Var_Etnica($dni, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        $tabla = ($nivel === 'POSGRADO') ? 'estudiante_posgrado' : 'estudiante';
        
        $sql = "SELECT estado_var_etnica FROM {$tabla} WHERE Dni = ?";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        // Retorna true si estado es 0, false si es 1
        return $resultado && $resultado['estado_var_etnica'] == 0;
    }
    
    /**
     * Bloquear edición de declaración étnica
     * @param string $dni
     * @param string $nivel
     * @return bool
     */
    public function Bloquear_Var_Etnica($dni, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        $tabla = ($nivel === 'POSGRADO') ? 'estudiante_posgrado' : 'estudiante';
        
        $sql = "UPDATE {$tabla} SET estado_var_etnica = 1 WHERE Dni = ?";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $resultado = $query->execute();
        conexionBD::cerrar_conexion();
        
        return $resultado;
    }
    
    /**
     * Habilitar edición de declaración étnica (Admin)
     * @param string $dni
     * @param string $nivel
     * @return bool
     */
    public function Habilitar_Edicion_Var_Etnica($dni, $nivel = 'PREGRADO') {
        $c = conexionBD::conexionPDO();
        $tabla = ($nivel === 'POSGRADO') ? 'estudiante_posgrado' : 'estudiante';
        
        $sql = "UPDATE {$tabla} SET estado_var_etnica = 0 WHERE Dni = ?";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $resultado = $query->execute();
        conexionBD::cerrar_conexion();
        
        return $resultado;
    }
}
?>
