-- Tabla para el repositorio de diplomas digitales
CREATE TABLE IF NOT EXISTS `repo_archivos` (
  `id_archivo` INT(11) NOT NULL AUTO_INCREMENT,
  `id_colacion` INT(11) NOT NULL COMMENT 'ID de la tabla colacion',
  `dni_estudiante` CHAR(8) NOT NULL COMMENT 'DNI extraido del nombre del archivo',
  `nombre_archivo_original` VARCHAR(255) NOT NULL,
  `ruta_fisica` VARCHAR(255) NOT NULL,
  `fecha_subida` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `estado` INT(1) DEFAULT 1 COMMENT '1: Activo, 0: Eliminado',
  PRIMARY KEY (`id_archivo`),
  INDEX `idx_dni` (`dni_estudiante`),
  INDEX `idx_colacion` (`id_colacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
