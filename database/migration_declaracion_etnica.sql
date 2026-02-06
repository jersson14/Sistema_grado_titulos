-- ============================================
-- SCRIPT DE MIGRACIÓN: DECLARACIÓN ÉTNICA Y FOTO PASAPORTE
-- Fecha: 2026-02-05
-- Descripción: Agregar campos para declaración étnica y foto a tabla estudiante
-- ============================================

USE u486624649_grados_titulos;

-- Agregar nuevos campos a la tabla estudiante
ALTER TABLE `estudiante` 
ADD COLUMN `foto_pasaporte` VARCHAR(255) NULL COMMENT 'Ruta de la foto tamaño pasaporte' AFTER `updated_at`,
ADD COLUMN `declaracion_etnica_pdf` VARCHAR(255) NULL COMMENT 'Ruta del PDF de declaración étnica' AFTER `foto_pasaporte`,
ADD COLUMN `autoidentificacion_etnica` VARCHAR(100) NULL COMMENT 'Opción seleccionada: Pueblo indígena, Afroperuano, No, No sabe' AFTER `declaracion_etnica_pdf`,
ADD COLUMN `nombre_etnia` VARCHAR(100) NULL COMMENT 'Nombre de la etnia si seleccionó pueblo indígena' AFTER `autoidentificacion_etnica`,
ADD COLUMN `lengua_indigena` VARCHAR(100) NULL COMMENT 'Opción de lengua: Sí, No, No sabe' AFTER `nombre_etnia`,
ADD COLUMN `nombre_lengua` VARCHAR(100) NULL COMMENT 'Nombre de la lengua si seleccionó Sí' AFTER `lengua_indigena`,
ADD COLUMN `fecha_declaracion_etnica` DATETIME NULL COMMENT 'Fecha de registro/actualización de declaración' AFTER `nombre_lengua`;

-- Verificar los cambios
DESCRIBE estudiante;

-- ============================================
-- STORED PROCEDURE: Verificar si puede actualizar
-- ============================================

DELIMITER $$

DROP PROCEDURE IF EXISTS `SP_PUEDE_ACTUALIZAR_ESTUDIANTE`$$

CREATE PROCEDURE `SP_PUEDE_ACTUALIZAR_ESTUDIANTE`(IN dni_param VARCHAR(20))
BEGIN
    -- Retorna 1 si puede actualizar, 0 si ya tiene diploma
    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM expediente exp
                INNER JOIN modalidad m ON exp.Id_expediente = m.Id_expediente
                INNER JOIN diploma d ON m.Id_modalidad = d.id_modalidad
                WHERE exp.Dni = dni_param 
                AND d.estado = 'CON DIPLOMA'
            ) THEN 0
            ELSE 1
        END as puede_actualizar;
END$$

DELIMITER ;

-- Probar el stored procedure
-- CALL SP_PUEDE_ACTUALIZAR_ESTUDIANTE('12345678');

-- ============================================
-- NOTAS IMPORTANTES
-- ============================================
-- 1. Los campos son NULL para permitir actualización gradual
-- 2. foto_pasaporte: Ruta relativa, ej: "uploads/fotos_pasaporte/12345678_foto.jpg"
-- 3. declaracion_etnica_pdf: Ruta relativa, ej: "uploads/declaraciones_etnicas/12345678_declaracion.pdf"
-- 4. autoidentificacion_etnica: Valores posibles:
--    - "Pueblo indígena u originario"
--    - "Población afroperuana"
--    - "No"
--    - "No sabe / No responde"
-- 5. nombre_etnia: Texto libre del nombre de la etnia (ej: "Ashaninka", "Quechua")
-- 6. lengua_indigena: Valores posibles: "Sí", "No", "No sabe / No responde"
-- 7. nombre_lengua: Texto libre del nombre de la lengua (ej: "Quechua", "Aimara")
-- ============================================

-- Fin del script
