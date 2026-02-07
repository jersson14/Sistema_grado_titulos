<?php
/**
 * Modelo para gestión de estudiantes - Portal Público
 * Maneja registro y actualización de datos de estudiantes
 */

require_once 'model_conexion.php';

class Modelo_Estudiante_Publico extends conexionBD {
    
    /**
     * Buscar estudiante por DNI
     * @param string $dni
     * @return array|null Datos del estudiante o null si no existe
     */
    public function Buscar_Estudiante_Por_DNI($dni) {
        $c = conexionBD::conexionPDO();
        $sql = "SELECT * FROM estudiante WHERE Dni = ?";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado ? $resultado : null;
    }
    
    /**
     * Verificar si el estudiante puede actualizar sus datos
     * No puede actualizar si ya tiene diploma registrado
     * @param string $dni
     * @return bool
     */
    public function Puede_Actualizar($dni) {
        $c = conexionBD::conexionPDO();
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
     * @param array $datos Array con todos los datos del estudiante
     * @return bool|string ID insertado o false
     */
    public function Registrar_Estudiante($datos) {
        $c = conexionBD::conexionPDO();
        
        try {
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
            
            // Nuevos campos
            $query->bindParam(19, $datos['det_etnica']);
            $query->bindParam(20, $datos['cod_etnia']);
            $query->bindParam(21, $datos['det_lengua']);
            $query->bindParam(22, $datos['cod_lengua']);
            
            $resultado = $query->execute();
            // $id = $c->lastInsertId(); // No confiable si no es auto-increment
            conexionBD::cerrar_conexion();
            return $resultado;
        } catch (PDOException $e) {
            // Manejo de errores, por ejemplo, loguear el error o relanzarlo
            error_log("Error al registrar estudiante: " . $e->getMessage());
            conexionBD::cerrar_conexion();
            return false;
        }
        return false;
    }
    
    /**
     * Actualizar datos de estudiante existente
     * @param array $datos Array con todos los datos del estudiante
     * @return bool
     */
    public function Actualizar_Estudiante($datos) {
        $c = conexionBD::conexionPDO();
        
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
        
        $resultado = $query->execute();
        conexionBD::cerrar_conexion();
        
        return $resultado;
    }
    
    /**
     * Verificar si puede editar declaración étnica
     * @param string $dni
     * @return bool
     */
    public function Puede_Editar_Var_Etnica($dni) {
        $c = conexionBD::conexionPDO();
        $sql = "CALL SP_PUEDE_EDITAR_VAR_ETNICA(?)";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado && $resultado['puede_editar'] == 1;
    }
    
    /**
     * Bloquear edición de declaración étnica (después de guardar)
     * @param string $dni
     * @return bool
     */
    public function Bloquear_Var_Etnica($dni) {
        $c = conexionBD::conexionPDO();
        $sql = "CALL SP_BLOQUEAR_VAR_ETNICA(?)";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado && $resultado['filas_afectadas'] > 0;
    }
    
    /**
     * Habilitar edición de declaración étnica (Admin)
     * @param string $dni
     * @return bool
     */
    public function Habilitar_Edicion_Var_Etnica($dni) {
        $c = conexionBD::conexionPDO();
        $sql = "CALL SP_HABILITAR_EDICION_VAR_ETNICA(?)";
        
        $query = $c->prepare($sql);
        $query->bindParam(1, $dni);
        $query->execute();
        
        $resultado = $query->fetch(PDO::FETCH_ASSOC);
        conexionBD::cerrar_conexion();
        
        return $resultado && $resultado['filas_afectadas'] > 0;
    }
}
?>
