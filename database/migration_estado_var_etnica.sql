-- ============================================
-- ACTUALIZACIÓN: Agregar campo estado_var_etnica
-- Fecha: 2026-02-05
-- Descripción: Campo para controlar si el estudiante puede editar su declaración étnica
-- ============================================

USE u486624649_grados_titulos;

-- Agregar campo de estado
ALTER TABLE `estudiante` 
ADD COLUMN `estado_var_etnica` TINYINT(1) DEFAULT 0 COMMENT '0=Puede editar, 1=Bloqueado (ya llenó)' AFTER `fecha_declaracion_etnica`;

-- Verificar
DESCRIBE estudiante;

-- ============================================
-- STORED PROCEDURE ACTUALIZADO: Verificar si puede editar declaración étnica
-- ============================================

DELIMITER $$

DROP PROCEDURE IF EXISTS `SP_PUEDE_EDITAR_VAR_ETNICA`$$

CREATE PROCEDURE `SP_PUEDE_EDITAR_VAR_ETNICA`(IN dni_param VARCHAR(20))
BEGIN
    -- Retorna 1 si puede editar, 0 si está bloqueado
    SELECT 
        CASE 
            WHEN estado_var_etnica = 0 THEN 1
            ELSE 0
        END as puede_editar
    FROM estudiante
    WHERE Dni = dni_param;
END$$

DELIMITER ;

-- ============================================
-- STORED PROCEDURE: Habilitar edición de declaración étnica (Admin)
-- ============================================

DELIMITER $$

DROP PROCEDURE IF EXISTS `SP_HABILITAR_EDICION_VAR_ETNICA`$$

CREATE PROCEDURE `SP_HABILITAR_EDICION_VAR_ETNICA`(IN dni_param VARCHAR(20))
BEGIN
    -- Permite al admin habilitar la edición nuevamente
    UPDATE estudiante 
    SET estado_var_etnica = 0
    WHERE Dni = dni_param;
    
    SELECT ROW_COUNT() as filas_afectadas;
END$$

DELIMITER ;

-- ============================================
-- STORED PROCEDURE: Bloquear edición de declaración étnica
-- ============================================

DELIMITER $$

DROP PROCEDURE IF EXISTS `SP_BLOQUEAR_VAR_ETNICA`$$

CREATE PROCEDURE `SP_BLOQUEAR_VAR_ETNICA`(IN dni_param VARCHAR(20))
BEGIN
    -- Bloquea la edición después de que el estudiante guarda
    UPDATE estudiante 
    SET estado_var_etnica = 1
    WHERE Dni = dni_param;
    
    SELECT ROW_COUNT() as filas_afectadas;
END$$

DELIMITER ;

-- Probar los stored procedures
-- CALL SP_PUEDE_EDITAR_VAR_ETNICA('12345678');
-- CALL SP_HABILITAR_EDICION_VAR_ETNICA('12345678');
-- CALL SP_BLOQUEAR_VAR_ETNICA('12345678');

-- ============================================
-- NOTAS IMPORTANTES
-- ============================================
-- 1. estado_var_etnica = 0: El estudiante PUEDE editar su declaración étnica
-- 2. estado_var_etnica = 1: El estudiante ya llenó y está BLOQUEADO
-- 3. El admin puede cambiar de 1 a 0 si el estudiante se equivocó
-- 4. Al guardar por primera vez, se cambia automáticamente a 1
-- ============================================
