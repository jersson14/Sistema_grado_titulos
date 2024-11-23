-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 23:33:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `grados_y_titulo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_TODOS_MODALIDAD` ()   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE
escuela_profesional.Grado_academico = 'TITULO'
ORDER BY
modalidad.created_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MOSTRAR_TODOS_MODALIDAD_POSGRADO` ()   BEGIN
SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado as esta, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	date_format( expediente_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro1, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	date_format( modalidad_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro2, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad,
	informe_posgrado

ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_DIPLOMA` (IN `IDEXPE` CHAR(12), IN `ID` INT, IN `FECHACU` DATE, `FECHAFIRMA` DATE, IN `RESONUM` VARCHAR(30), IN `FECHARESO` DATE, IN `DIPLONUM` INT, IN `REGISNUM` INT, IN `REGISLIB` INT, IN `REGIFOL` VARCHAR(100), IN `TIPODIPLO` CHAR(1), IN `FECHA_INICI_TRAMI` DATE, IN `CREDI` INT, IN `OFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHA_INICI_TRAMI, NOW()));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHA_INICI_TRAMI, NOW()) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHA_INICI_TRAMI, NOW()) % 30.4375 ));
SET @CANTIDAD:=(SELECT COUNT(*) FROM diploma WHERE Resolucion_numero=RESONUM or Diploma_numero=DIPLONUM OR Registro_numero=REGISNUM);
IF @CANTIDAD=0 THEN
	UPDATE diploma SET
	fecha_consejo_uni=FECHACU,
	fecha_firma=FECHAFIRMA,
	Resolucion_numero=RESONUM,
	fecha_resolucion=FECHARESO,
	Diploma_numero=DIPLONUM,
	Registro_numero=REGISNUM,
	Registro_libro=REGISLIB,
	Registro_folio=REGIFOL,
	Diploma_tipo_emitido=TIPODIPLO,
	Fecha_inicio_tramite=FECHA_INICI_TRAMI,
	Fecha_finalizacion_tramite=NOW(),
	años_trans=@AÑO,
	mes_trans=@MES,
	dia_trand=@DIA,
	Nro_creditos=CREDI,
	Nro_oficio=OFICIO,
	fecha_secreatria_general=FECHASECRE,
	id_usuario=USU,
	updated_at=NOW(),
	estado='CON DIPLOMA'
	WHERE Id_Diploma=ID;
	UPDATE expediente
	SET
	Resolucion_rectoral_N=RESONUM,
	Libro=REGISLIB,
	Folio=REGIFOL,
	Registro=REGISNUM,
	estado='COLACION'
	WHERE expediente.Id_expediente=IDEXPE;
	SELECT 1;
ELSE
SELECT 2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_DIPLOMA_POSGRADO` (IN `IDEXPE` CHAR(12), IN `ID` INT, IN `FECHACU` DATE, `FECHAFIRMA` DATE, IN `RESONUM` VARCHAR(30), IN `FECHARESO` DATE, IN `DIPLONUM` INT, IN `REGISNUM` INT, IN `REGISLIB` INT, IN `REGIFOL` VARCHAR(100), IN `TIPODIPLO` CHAR(1), IN `FECHA_INICI_TRAMI` DATE, IN `CREDI` INT, IN `OFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHA_INICI_TRAMI, NOW()));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHA_INICI_TRAMI, NOW()) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHA_INICI_TRAMI, NOW()) % 30.4375 ));
SET @CANTIDAD:=(SELECT COUNT(*) FROM diploma_posgrado WHERE Resolucion_numero=RESONUM or Diploma_numero=DIPLONUM OR Registro_numero=REGISNUM);
IF @CANTIDAD=0 THEN
	UPDATE diploma_posgrado SET
	fecha_consejo_uni=FECHACU,
	fecha_firma=FECHAFIRMA,
	Resolucion_numero=RESONUM,
	fecha_resolucion=FECHARESO,
	Diploma_numero=DIPLONUM,
	Registro_numero=REGISNUM,
	Registro_libro=REGISLIB,
	Registro_folio=REGIFOL,
	Diploma_tipo_emitido=TIPODIPLO,
	Fecha_inicio_tramite=FECHA_INICI_TRAMI,
	Fecha_finalizacion_tramite=NOW(),
	años_trans=@AÑO,
	mes_trans=@MES,
	dia_trand=@DIA,
	Nro_creditos=CREDI,
	Nro_oficio=OFICIO,
	fecha_secreatria_general=FECHASECRE,
	id_usuario=USU,
	updated_at=NOW(),
	estado='CON DIPLOMA'
	WHERE Id_Diploma=ID;
	
	UPDATE expediente_posgrado
	SET
	Resolucion_rectoral_N=RESONUM,
	Libro=REGISLIB,
	Folio=REGIFOL,
	Registro=REGISNUM,
	estado='COLACION'
	WHERE expediente_posgrado.Id_expediente=IDEXPE;
	SELECT 1;
ELSE
SELECT 2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_NUMERO_GENERAL` ()   SELECT 
    MAX(diploma.Resolucion_numero) + 1 AS Resolucion,
    MAX(diploma.Diploma_numero) + 1 AS diploma,
    MAX(diploma.Registro_numero) + 1 AS registro,
    MAX(diploma.Registro_libro) + 1 AS libro,
    MAX(diploma.Registro_folio) AS folio
FROM 
    diploma
WHERE 
    diploma.updated_at = (
        SELECT MAX(updated_at) 
        FROM diploma
				WHERE NOT diploma.Diploma_numero=0
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_NUMERO_GENERAL_POS` ()   SELECT 
    MAX(diploma_posgrado.Resolucion_numero) + 1 AS Resolucion,
    MAX(diploma_posgrado.Diploma_numero) + 1 AS diploma,
    MAX(diploma_posgrado.Registro_numero) + 1 AS registro,
    MAX(diploma_posgrado.Registro_libro) + 1 AS libro,
    MAX(diploma_posgrado.Registro_folio) AS folio
FROM 
    diploma_posgrado
WHERE 
    diploma_posgrado.updated_at = (
        SELECT MAX(diploma_posgrado.updated_at) 
        FROM diploma_posgrado
				WHERE NOT diploma_posgrado.Diploma_numero=0
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO_GRADUADO` (IN `DNI` CHAR(8))   SELECT
estudiante.Dni, 
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
	CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Completos
FROM
	estudiante
WHERE estudiante.Dni=DNI$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO_GRADUADO_DETALLE` (IN `CODIGO` CHAR(8))   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad AS Modo_obtencion,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado AS estadoexpediente,
expediente.created_at AS expe,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
date_format(diploma.fecha_secreatria_general, "%d-%m-%Y") AS fecha_secretaria,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
colacion.`fecha_colación`,
DATE_FORMAT(colacion.fecha_colación, '%d') AS dia,
        CASE MONTH(colacion.fecha_colación)
            WHEN 1 THEN 'enero'
            WHEN 2 THEN 'febrero'
            WHEN 3 THEN 'marzo'
            WHEN 4 THEN 'abril'
            WHEN 5 THEN 'mayo'
            WHEN 6 THEN 'junio'
            WHEN 7 THEN 'julio'
            WHEN 8 THEN 'agosto'
            WHEN 9 THEN 'septiembre'
            WHEN 10 THEN 'octubre'
            WHEN 11 THEN 'noviembre'
            WHEN 12 THEN 'diciembre'
        END AS mes,
        DATE_FORMAT(colacion.fecha_colación, '%Y') AS año,
        CONCAT(DATE_FORMAT(colacion.fecha_colación, '%d'), ' de ', 
               CASE MONTH(colacion.fecha_colación)
                   WHEN 1 THEN 'enero'
                   WHEN 2 THEN 'febrero'
                   WHEN 3 THEN 'marzo'
                   WHEN 4 THEN 'abril'
                   WHEN 5 THEN 'mayo'
                   WHEN 6 THEN 'junio'
                   WHEN 7 THEN 'julio'
                   WHEN 8 THEN 'agosto'
                   WHEN 9 THEN 'septiembre'
                   WHEN 10 THEN 'octubre'
                   WHEN 11 THEN 'noviembre'
                   WHEN 12 THEN 'diciembre'
               END, 
               ' del ', DATE_FORMAT(colacion.fecha_colación, '%Y')) AS fecha_larga
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
WHERE
estudiante.Dni = CODIGO

ORDER BY
expediente.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO_GRADUADO_DETALLE_POSGRADO` (IN `CODIGO` CHAR(8))   SELECT
    estudiante_posgrado.Dni,
    estudiante_posgrado.Codigo,
    estudiante_posgrado.Nombres,
    estudiante_posgrado.Apellido_paterno,
    estudiante_posgrado.Apellido_materno,
    CONCAT_WS(' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno) AS Estudiante,
    estudiante_posgrado.Sexo,
    estudiante_posgrado.Celular,
    estudiante_posgrado.Direccion,
    estudiante_posgrado.Fecha_matricula,
    estudiante_posgrado.Fecha_egreso,
    estudiante_posgrado.correo_personal,
    estudiante_posgrado.correo_institucional,
    estudiante_posgrado.Observaciones,
    estudiante_posgrado.`Años_transcurridos`,
    estudiante_posgrado.Meses_transcurridos,
    estudiante_posgrado.Dias_transcurridos,
    estudiante_posgrado.id_usuario,
    estudiante_posgrado.updated_at,
    expediente_posgrado.Id_expediente,
    expediente_posgrado.Id_cede,
    expediente_posgrado.Dni,
    expediente_posgrado.Id_programa,
    expediente_posgrado.Grado_maestro_de,
    expediente_posgrado.Modalidad,
    expediente_posgrado.Acto_academico,
    expediente_posgrado.Acuerdo,
    expediente_posgrado.Resolucion_rectoral_N,
    expediente_posgrado.Expedicion,
    expediente_posgrado.Libro,
    expediente_posgrado.Folio,
    expediente_posgrado.Registro,
    expediente_posgrado.Archivo,
    expediente_posgrado.Id_usuario,
    expediente_posgrado.estado AS esta,
    expediente_posgrado.created_at AS expedicion_fecha,
    date_format(expediente_posgrado.created_at, "%d-%m-%Y") AS fecha_registro1,
    expediente_posgrado.updated_at,
    expediente_posgrado.id_autoridad,
    expediente_posgrado.doc_ncorrelativo,
    modalidad_posgrado.Id_modalidad,
    modalidad_posgrado.Modo_obtencion,
    modalidad_posgrado.Abreviatura_modo_estudio,
    modalidad_posgrado.Trabajo_investigacion,
    modalidad_posgrado.Modo_estudio,
    modalidad_posgrado.Turnitin,
    modalidad_posgrado.Porcentaje,
    modalidad_posgrado.Centro_investigacion,
    modalidad_posgrado.Reglamento_metadado,
    modalidad_posgrado.Proce_pais_ext,
    modalidad_posgrado.Proce_univ_ext,
    modalidad_posgrado.Proce_grado_ext,
    modalidad_posgrado.Fecha_matricula_modalidad,
    modalidad_posgrado.Fecha_inicio_modalidad,
    modalidad_posgrado.Fecha_fin_modalidad,
    modalidad_posgrado.Modo_sustentacion,
    modalidad_posgrado.Id_usuario,
    modalidad_posgrado.Id_expediente,
    modalidad_posgrado.created_at,
    date_format(modalidad_posgrado.created_at, "%d-%m-%Y") AS fecha_registro2,
    modalidad_posgrado.updated_at,
    diploma_posgrado.Id_Diploma,
    diploma_posgrado.fecha_consejo_uni,
    diploma_posgrado.fecha_firma,
    diploma_posgrado.Resolucion_numero,
    diploma_posgrado.fecha_resolucion,
    diploma_posgrado.Diploma_numero,
    diploma_posgrado.Registro_numero,
    diploma_posgrado.Registro_libro,
    diploma_posgrado.Registro_folio,
    diploma_posgrado.Diploma_tipo_emitido,
    diploma_posgrado.Fecha_inicio_tramite,
    diploma_posgrado.Fecha_finalizacion_tramite,
    diploma_posgrado.`años_trans`,
    diploma_posgrado.mes_trans,
    diploma_posgrado.dia_trand,
    CONCAT_WS(' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días') AS tiempotrancurrido,
    diploma_posgrado.Nro_creditos,
    diploma_posgrado.Nro_oficio,
    diploma_posgrado.fecha_secreatria_general,
    diploma_posgrado.id_usuario,
    diploma_posgrado.id_modalidad,
    diploma_posgrado.id_colacion,
    diploma_posgrado.created_at,
    diploma_posgrado.updated_at,
    diploma_posgrado.estado AS ESTADO,
    cp.id_colacion,
    cp.`año`,
    cp.nombre_colacion,
    cp.`fecha_colación`,
    cp.fecha_consejo_uni,
    cp.fecha_firma_consejo,
    cp.fecha_resolucion,
    cp.numero_oficio,
    cp.estado,
    cp.created_at,
    cp.updated_at,
    programa_posgrado.Id_programa,
    programa_posgrado.Nombre AS posgrado,
    programa_posgrado.Grado_academico,
    programa_posgrado.Abreviatura_grado,
    programa_posgrado.`Denominación_grado`,
    programa_posgrado.Programa_estudio,
    programa_posgrado.Estado,
    programa_posgrado.Numero_creditos,
    programa_posgrado.id_autoridad,
    programa_posgrado.created_at,
    programa_posgrado.updated_at,
    autoridades.Cod_autoridad,
    autoridades.Autoridad_1,
    autoridades.Cargo_auto1,
    autoridades.Cargo_auto2,
    autoridades.Autoridad_2,
    autoridades.Autoridad_3,
    autoridades.Cargo_auto3,
    autoridades.created_at,
    autoridades.updated_at,
    autoridades.Id_empresa,
    autoridades.estado,
    cede.cede_nombre,
    cp.`fecha_colación`,
		DATE_FORMAT(cp.fecha_colación, '%d') AS dia,
        CASE MONTH(cp.fecha_colación)
            WHEN 1 THEN 'enero'
            WHEN 2 THEN 'febrero'
            WHEN 3 THEN 'marzo'
            WHEN 4 THEN 'abril'
            WHEN 5 THEN 'mayo'
            WHEN 6 THEN 'junio'
            WHEN 7 THEN 'julio'
            WHEN 8 THEN 'agosto'
            WHEN 9 THEN 'septiembre'
            WHEN 10 THEN 'octubre'
            WHEN 11 THEN 'noviembre'
            WHEN 12 THEN 'diciembre'
        END AS mes,
        DATE_FORMAT(cp.fecha_colación, '%Y') AS año,
        CONCAT(DATE_FORMAT(cp.fecha_colación, '%d'), ' de ', 
               CASE MONTH(cp.fecha_colación)
                   WHEN 1 THEN 'enero'
                   WHEN 2 THEN 'febrero'
                   WHEN 3 THEN 'marzo'
                   WHEN 4 THEN 'abril'
                   WHEN 5 THEN 'mayo'
                   WHEN 6 THEN 'junio'
                   WHEN 7 THEN 'julio'
                   WHEN 8 THEN 'agosto'
                   WHEN 9 THEN 'septiembre'
                   WHEN 10 THEN 'octubre'
                   WHEN 11 THEN 'noviembre'
                   WHEN 12 THEN 'diciembre'
               END, 
               ' del ', DATE_FORMAT(cp.fecha_colación, '%Y')) AS fecha_larga

FROM
    estudiante_posgrado
INNER JOIN expediente_posgrado ON estudiante_posgrado.Dni = expediente_posgrado.Dni
INNER JOIN modalidad_posgrado ON expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
INNER JOIN programa_posgrado ON expediente_posgrado.Id_programa = programa_posgrado.Id_programa
INNER JOIN diploma_posgrado ON modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
INNER JOIN colacion_posgrado ON diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
INNER JOIN cede ON expediente_posgrado.Id_cede = cede.Id_cede
INNER JOIN autoridades ON expediente_posgrado.id_autoridad = autoridades.Cod_autoridad
INNER JOIN colacion_posgrado cp ON diploma_posgrado.id_colacion = cp.id_colacion
WHERE
    estudiante_posgrado.Dni = CODIGO
ORDER BY
    expedicion_fecha DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO_GRADUADO_DETALLE_UNIFICADO` (IN `CODIGO` CHAR(8))   BEGIN
    SELECT
        e.Id_expediente,
        e.Id_cede,
        e.Dni,
        e.Id_escuela,
        e.Titulo_de,
        e.Grado_bachiller_de,
        e.Modalidad,
        e.Acto_academico,
        e.Acuerdo,
        e.Resolucion_rectoral_N,
        e.Expedicion,
        e.Libro,
        e.Folio,
        e.Registro,
        e.Archivo,
        e.Id_usuario,
        e.estado AS estadoexpediente,
        e.created_at AS expe,
        DATE_FORMAT(e.created_at, "%d-%m-%Y") AS fecha_registro1,
        e.updated_at,
        e.doc_ncorrelativo,
        ep.Id_escuela,
        ep.Nombre AS Escuela,
        ep.Grado_academico,
        ep.Denominación_grado,
        ep.Cod_Escuela,
        ep.Id_facultad,
        est.Dni,
        est.Codigo,
        CONCAT_WS(' ', est.Nombres, est.Apellido_paterno, est.Apellido_materno) AS Estudiante,
        est.Nombres,
        est.Apellido_paterno,
        est.Apellido_materno,
        est.Sexo,
        est.Celular,
        est.Direccion,
        est.correo_personal,
        est.correo_institucional,
        est.Fecha_matricula,
        est.Fecha_egreso,
        est.Observaciones,
        c.Id_cede,
        c.cede_nombre,
        f.Nombre AS Facultad,
        m.Modo_obtencion,
        m.Abreviatura_modo_estudio,
        m.Modo_estudio,
        m.Id_usuario,
        m.Id_expediente,
        m.created_at,
        DATE_FORMAT(m.created_at, "%d-%m-%Y") AS fecha_registro2,
        m.Id_modalidad,
        m.Proce_insti_origen,
        m.Proce_titulo_peda,
        m.Proce_bachiller,
        m.Trabajo_investigacion,
        m.Turnitin,
        m.Porcentaje,
        m.Centro_investigacion,
        m.Reglamento_metadado,
        m.Fecha_matricula_modalidad,
        m.Fecha_inicio_modalidad,
        m.Fecha_fin_modalidad,
        m.Modo_sustentacion,
        d.Id_Diploma,
        d.fecha_consejo_uni,
        d.fecha_firma,
        d.Resolucion_numero,
        d.fecha_resolucion,
        d.Diploma_numero,
        d.Registro_numero,
        d.Registro_libro,
        d.Registro_folio,
        d.Diploma_tipo_emitido,
        d.Fecha_inicio_tramite,
        d.Fecha_finalizacion_tramite,
        d.años_trans,
        d.mes_trans,
        d.dia_trand,
        CONCAT_WS(' ', d.años_trans, ' años', d.mes_trans, ' meses y', d.dia_trand, ' días') AS tiempotrancurrido,
        d.Nro_creditos,
        d.Nro_oficio,
        d.fecha_secreatria_general,
        DATE_FORMAT(d.fecha_secreatria_general, "%d-%m-%Y") AS fecha_secretaria,
        d.id_usuario,
        d.id_modalidad,
        d.created_at,
        d.updated_at,
        d.estado,
        a.Autoridad_1,
        a.Cargo_auto1,
        a.Autoridad_2,
        a.Cargo_auto2,
        a.Autoridad_3,
        a.Cargo_auto3,
        colacion.fecha_colación,
        DATE_FORMAT(colacion.fecha_colación, '%d') AS dia,
        CASE MONTH(colacion.fecha_colación)
            WHEN 1 THEN 'enero'
            WHEN 2 THEN 'febrero'
            WHEN 3 THEN 'marzo'
            WHEN 4 THEN 'abril'
            WHEN 5 THEN 'mayo'
            WHEN 6 THEN 'junio'
            WHEN 7 THEN 'julio'
            WHEN 8 THEN 'agosto'
            WHEN 9 THEN 'septiembre'
            WHEN 10 THEN 'octubre'
            WHEN 11 THEN 'noviembre'
            WHEN 12 THEN 'diciembre'
        END AS mes,
        DATE_FORMAT(colacion.fecha_colación, '%Y') AS año,
        CONCAT(DATE_FORMAT(colacion.fecha_colación, '%d'), ' de ', 
               CASE MONTH(colacion.fecha_colación)
                   WHEN 1 THEN 'enero'
                   WHEN 2 THEN 'febrero'
                   WHEN 3 THEN 'marzo'
                   WHEN 4 THEN 'abril'
                   WHEN 5 THEN 'mayo'
                   WHEN 6 THEN 'junio'
                   WHEN 7 THEN 'julio'
                   WHEN 8 THEN 'agosto'
                   WHEN 9 THEN 'septiembre'
                   WHEN 10 THEN 'octubre'
                   WHEN 11 THEN 'noviembre'
                   WHEN 12 THEN 'diciembre'
               END, 
               ' del ', DATE_FORMAT(colacion.fecha_colación, '%Y')) AS fecha_larga,
        m.updated_at
    FROM
        expediente e
    INNER JOIN escuela_profesional ep ON e.Id_escuela = ep.Id_escuela
    INNER JOIN estudiante est ON e.Dni = est.Dni
    INNER JOIN cede c ON e.Id_cede = c.Id_cede
    INNER JOIN facultad f ON ep.Id_facultad = f.Cod_facultad
    INNER JOIN modalidad m ON e.Id_expediente = m.Id_expediente
    INNER JOIN diploma d ON m.Id_modalidad = d.id_modalidad
    INNER JOIN autoridades a ON f.Cod_autoridad = a.Cod_autoridad
    INNER JOIN colacion colacion ON d.id_colacion = colacion.id_colacion
    WHERE
        est.Dni = CODIGO

    UNION ALL

    SELECT
        ep.Id_expediente,
        ep.Id_cede,
        ep.Dni,
        ep.Id_programa,
        ep.Grado_maestro_de,
        ep.Modalidad,
        ep.Acto_academico,
        ep.Acuerdo,
        ep.Resolucion_rectoral_N,
        ep.Expedicion,
        ep.Libro,
        ep.Folio,
        ep.Registro,
        ep.Archivo,
        ep.Id_usuario,
        ep.estado AS esta,
        ep.created_at AS expedicion_fecha,
        DATE_FORMAT(ep.created_at, "%d-%m-%Y") AS fecha_registro1,
        ep.updated_at,
        ep.id_autoridad,
        ep.doc_ncorrelativo,
        mp.Id_modalidad,
        mp.Modo_obtencion,
        mp.Abreviatura_modo_estudio,
        mp.Trabajo_investigacion,
        mp.Modo_estudio,
        mp.Turnitin,
        mp.Porcentaje,
        mp.Centro_investigacion,
        mp.Reglamento_metadado,
        mp.Proce_pais_ext,
        mp.Proce_univ_ext,
        mp.Proce_grado_ext,
        mp.Fecha_matricula_modalidad,
        mp.Fecha_inicio_modalidad,
        mp.Fecha_fin_modalidad,
        mp.Modo_sustentacion,
        mp.Id_usuario,
        mp.Id_expediente,
        mp.created_at,
        DATE_FORMAT(mp.created_at, "%d-%m-%Y") AS fecha_registro2,
        mp.updated_at,
        dp.Id_Diploma,
        dp.fecha_consejo_uni,
        dp.fecha_firma,
        dp.Resolucion_numero,
        dp.fecha_resolucion,
        dp.Diploma_numero,
        dp.Registro_numero,
        dp.Registro_libro,
        dp.Registro_folio,
        dp.Diploma_tipo_emitido,
        dp.Fecha_inicio_tramite,
        dp.Fecha_finalizacion_tramite,
        dp.años_trans,
        dp.mes_trans,
        dp.dia_trand,
        CONCAT_WS(' ', dp.años_trans, ' años', dp.mes_trans, ' meses y', dp.dia_trand, ' días') AS tiempotrancurrido,
        dp.Nro_creditos,
        dp.Nro_oficio,
        dp.fecha_secreatria_general,
        dp.id_usuario,
        dp.id_modalidad,
        dp.id_colacion,
        dp.created_at,
        dp.updated_at,
        dp.estado AS ESTADO,
        cp.id_colacion,
        cp.`año`,
        cp.nombre_colacion,
        cp.fecha_colación,
        cp.fecha_consejo_uni,
        cp.fecha_firma_consejo,
        cp.fecha_resolucion,
        cp.numero_oficio,
        cp.estado,
        cp.created_at,
        cp.updated_at,
        pp.Id_programa,
        pp.Nombre AS posgrado,
        pp.Grado_academico,
        pp.Abreviatura_grado,
        pp.`Denominación_grado`,
        pp.Programa_estudio,
        pp.Estado,
        pp.Numero_creditos,
        pp.id_autoridad,
        pp.created_at,
        pp.updated_at,
        a.Cod_autoridad,
        a.Autoridad_1,
        a.Cargo_auto1,
        a.Autoridad_2,
        a.Autoridad_3,
        a.Cargo_auto3,
        a.created_at,
        a.updated_at,
        a.Id_empresa,
        a.estado,
        c.cede_nombre,
        cp.fecha_colación,
        DATE_FORMAT(cp.fecha_colación, '%d') AS dia,
        CASE MONTH(cp.fecha_colación)
            WHEN 1 THEN 'enero'
            WHEN 2 THEN 'febrero'
            WHEN 3 THEN 'marzo'
            WHEN 4 THEN 'abril'
            WHEN 5 THEN 'mayo'
            WHEN 6 THEN 'junio'
            WHEN 7 THEN 'julio'
            WHEN 8 THEN 'agosto'
            WHEN 9 THEN 'septiembre'
            WHEN 10 THEN 'octubre'
            WHEN 11 THEN 'noviembre'
            WHEN 12 THEN 'diciembre'
        END AS mes,
        DATE_FORMAT(cp.fecha_colación, '%Y') AS año,
        CONCAT(DATE_FORMAT(cp.fecha_colación, '%d'), ' de ', 
               CASE MONTH(cp.fecha_colación)
                   WHEN 1 THEN 'enero'
                   WHEN 2 THEN 'febrero'
                   WHEN 3 THEN 'marzo'
                   WHEN 4 THEN 'abril'
                   WHEN 5 THEN 'mayo'
                   WHEN 6 THEN 'junio'
                   WHEN 7 THEN 'julio'
                   WHEN 8 THEN 'agosto'
                   WHEN 9 THEN 'septiembre'
                   WHEN 10 THEN 'octubre'
                   WHEN 11 THEN 'noviembre'
                   WHEN 12 THEN 'diciembre'
               END, 
               ' del ', DATE_FORMAT(cp.fecha_colación, '%Y')) AS fecha_larga
    FROM
        expediente_posgrado ep
    INNER JOIN modalidad_posgrado mp ON ep.Id_expediente = mp.Id_expediente
    INNER JOIN diploma_posgrado dp ON mp.Id_modalidad = dp.id_modalidad
    INNER JOIN colacion_posgrado cp ON dp.id_colacion = cp.id_colacion
    INNER JOIN cede c ON ep.Id_cede = c.Id_cede
    INNER JOIN autoridades a ON ep.id_autoridad = a.Cod_autoridad
    INNER JOIN programa_posgrado pp ON ep.Id_programa = pp.Id_programa
    INNER JOIN estudiante est ON ep.Dni = est.Dni  -- Aquí se añade la tabla estudiante
    WHERE
        est.Dni = CODIGO;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SEGUIMIENTO_GRADUADO_POSGRADO` (IN `DNI` CHAR(8))   SELECT
estudiante_posgrado.Dni, 
estudiante_posgrado.Nombres,
estudiante_posgrado.Apellido_paterno,
estudiante_posgrado.Apellido_materno,
	CONCAT_WS(' ',estudiante_posgrado.Nombres,estudiante_posgrado.Apellido_paterno,estudiante_posgrado.Apellido_materno) AS Completos
FROM
	estudiante_posgrado
WHERE estudiante_posgrado.Dni=DNI$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_AREA` ()   SELECT
	area.area_cod, 
	area.area_nombre, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat,
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) AS ENCARGADO

FROM
	area
	INNER JOIN
	usuario
	ON 
		area.area_cod = usuario.area_id
	INNER JOIN
	empleado
	ON 
		usuario.empleado_id = empleado.empleado_id
WHERE area.area_estado="ACTIVO"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_AREA_SOLO` ()   SELECT
area.area_cod,area.area_nombre
FROM area
WHERE area_estado="ACTIVO"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_AUTORIDAD` ()   SELECT
autoridades.Cod_autoridad,
autoridades.Autoridad_3
FROM
autoridades$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_AUTORIDAD_POS` ()   SELECT
autoridades.Cod_autoridad,
autoridades.Autoridad_3


FROM
autoridades
WHERE autoridades.Cargo_auto3='Director'
ORDER BY autoridades.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_CARRERASOLO` ()   SELECT
	escuela_profesional.Id_escuela,
		facultad.Nombre, 
	escuela_profesional.Nombre, 
	escuela_profesional.Cod_Escuela,
		escuela_profesional.Grado_academico
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
where escuela_profesional.`Grado_academico`='BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_CARRERASOLO_TI` ()   SELECT
	escuela_profesional.Id_escuela,
		facultad.Nombre, 
	escuela_profesional.Nombre, 
	escuela_profesional.Cod_Escuela
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
		where escuela_profesional.`Grado_academico`='TITULO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_CEDES` ()   SELECT
	cede.Id_cede, 
	cede.cede_nombre
FROM
	cede
	WHERE estado='ACTIVO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_CEDES_TI` ()   SELECT
	cede.Id_cede, 
	cede.cede_nombre
FROM
	cede
	WHERE estado='ACTIVO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_EMPLEADO` ()   SELECT
	empleado.empleado_id, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat,
	CONCAT_WS(' ',emple_nombre,emple_apepat,emple_apemat)
FROM
	empleado
	WHERE empleado.emple_estatus="ACTIVO"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_ESCUELAS` (IN `ID` INT)   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.Nombre,  
	escuela_profesional.Cod_Escuela, 
	facultad.Cod_facultad
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
WHERE Cod_facultad= ID AND 	Grado_academico='BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_ESCUELAS_TITU` (IN `ID` INT)   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.Nombre,  
	escuela_profesional.Cod_Escuela, 
	facultad.Cod_facultad
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
WHERE Cod_facultad= ID AND 	Grado_academico='TITULO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_ESCUELA_BACH` ()   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.Nombre,  
	escuela_profesional.Cod_Escuela, 
	facultad.Cod_facultad
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
WHERE	Grado_academico='BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_ESCUELA_TITU` ()   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.Nombre,  
	escuela_profesional.Cod_Escuela, 
	facultad.Cod_facultad
FROM
	escuela_profesional
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
WHERE	Grado_academico='TITULO'
ORDER BY Nombre ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_ESTUDIANTES` ()   SELECT
	estudiante.Dni,
	CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno)AS Estudiante, 
	estudiante.Codigo, 
	estudiante.Nombres, 
	estudiante.Apellido_paterno, 
	estudiante.Apellido_materno
FROM
	estudiante
	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_FACULTAD` ()   SELECT
	facultad.Cod_facultad, 
	facultad.Nombre, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3
FROM
	facultad
	INNER JOIN
	autoridades
	ON 
		facultad.Cod_autoridad = autoridades.Cod_autoridad
WHERE NOT facultad.Nombre='DIRECCIÓN POSGRADO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_SELECT_PROGRAMA` ()   SELECT
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre
FROM
	programa_posgrado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_CEDE` (IN `ID` INT)   DELETE FROM cede WHERE Id_cede=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_COLACION` (IN `ID` INT)   DELETE FROM colacion WHERE colacion.id_colacion=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_REGISTRO_GENERAL` (IN `DNI` CHAR(8))   DELETE FROM estudiante WHERE estudiante.Dni=DNI$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_REGISTRO_POSGRADO` (IN `DNI` CHAR(8))   DELETE FROM estudiante_posgrado WHERE estudiante_posgrado.Dni=DNI$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_AREA` ()   SELECT
	area.area_cod, 
	area.area_nombre,
	date_format(area_fecha_registro, "%d-%m-%Y - %H:%i:%s") as fecha_formateada,
	area.area_fecha_registro, 
	area.area_estado
FROM
	area
	ORDER BY area_nombre asc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_AUTORIDAD` ()   SELECT
autoridades.Cod_autoridad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.created_at,
autoridades.updated_at,
autoridades.Id_empresa,
autoridades.estado
FROM
autoridades$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CARRERAS` ()   SELECT
escuela_profesional.Id_escuela,
escuela_profesional.Cod_Escuela,
escuela_profesional.Nombre,
escuela_profesional.Grado_academico,
escuela_profesional.Abreviatura_grado,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Programa_estudio,
escuela_profesional.Numero_creditos,
escuela_profesional.Id_facultad,
escuela_profesional.created_at,
escuela_profesional.updated_at,
escuela_profesional.Estado,
facultad.Nombre AS Facultad

FROM
escuela_profesional
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
ORDER BY `Denominación_grado` DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CEDES` ()   SELECT
	cede.Id_cede, 
	cede.cede_nombre, 
	cede.descripcion, 
	cede.estado, 
	cede.created_at,
	date_format(created_at, "%d-%m-%Y - %H:%i:%s") as fecha_formateada ,
	cede.updated_at
FROM
	cede$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COLACION` ()   SELECT
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
date_format(fecha_colación, "%d-%m-%Y") as fechacolacion,

colacion.fecha_consejo_uni,
date_format(fecha_consejo_uni, "%d-%m-%Y") as fechaconsejouni,

colacion.fecha_firma_consejo,
date_format(fecha_firma_consejo, "%d-%m-%Y") as fechafirmaconsejo,

colacion.fecha_resolucion,
date_format(fecha_resolucion, "%d-%m-%Y") as fecharesolucion,

colacion.numero_oficio,
colacion.estado,

colacion.created_at,
colacion.updated_at
FROM
colacion
ORDER BY `fecha_colación` desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COLACION_POS` ()   SELECT
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`,
	date_format(fecha_colación, "%d-%m-%Y") as fechacolacion,
 
	colacion_posgrado.fecha_consejo_uni, 
	date_format(fecha_consejo_uni, "%d-%m-%Y") as fechaconsejouni,

	colacion_posgrado.fecha_firma_consejo, 
	date_format(fecha_firma_consejo, "%d-%m-%Y") as fechafirmaconsejo,

	colacion_posgrado.numero_oficio, 
	colacion_posgrado.fecha_resolucion, 
	date_format(fecha_resolucion, "%d-%m-%Y") as fecharesolucion,

	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at
FROM
	colacion_posgrado
ORDER BY `fecha_colación` desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DIPLOMA_BACHILLER_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.id_informe,
informe.number_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad ,
informe
WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND diploma.estado='CON DIPLOMA' AND
expediente.created_at BETWEEN FECHAINI AND FECHAFI
ORDER BY
diploma.estado ASC,
diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DIPLOMA_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.id_informe,
informe.number_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad ,
informe
  WHERE escuela_profesional.Grado_academico='TITULO' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EMPLEADO` ()   SELECT
	empleado.empleado_id, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat, 
	empleado.emple_fechanacimiento, 
	empleado.emple_nrodocumento, 
	empleado.emple_movil,
	empleado.empl_modalidad,
	empleado.emple_email, 
	empleado.emple_estatus, 
	empleado.emple_direccion, 
	empleado.empl_fotoperfil,
	CONCAT_WS(' ',emple_nombre,emple_apepat,emple_apemat)as empleado
FROM
	empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EMPRESA` ()   SELECT empresa_id,emp_razon,emp_email,emp_cod,emp_telefono,emp_direccion,emp_logo
FROM empresa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ESTUDIANTES` ()   SELECT
estudiante.Dni,
estudiante.Codigo,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,	
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.Fecha_matricula,
DATE_FORMAT(Fecha_matricula, "%d-%m-%Y")as fecha_matricula_n,
DATE_FORMAT(Fecha_egreso, "%d-%m-%Y")as fecha_egreso_n,
CONCAT_WS(' ',Años_transcurridos,' años',Meses_transcurridos,' meses y',Dias_transcurridos,' días')as tiempotrancurrido,
estudiante.Fecha_egreso,
estudiante.`Años_transcurridos`,
estudiante.Meses_transcurridos,
estudiante.Dias_transcurridos,
estudiante.id_usuario,
estudiante.created_at,
estudiante.updated_at
FROM
estudiante
ORDER BY created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ESTUDIANTES_POS` ()   SELECT
estudiante_posgrado.Dni,
estudiante_posgrado.Codigo,
estudiante_posgrado.Nombres,
estudiante_posgrado.Apellido_paterno,
estudiante_posgrado.Apellido_materno,
CONCAT_WS(' ',estudiante_posgrado.Nombres,estudiante_posgrado.Apellido_paterno,estudiante_posgrado.Apellido_materno) AS Estudiante,	
estudiante_posgrado.Sexo,
estudiante_posgrado.Celular,
estudiante_posgrado.Direccion,
estudiante_posgrado.Fecha_matricula,
DATE_FORMAT(Fecha_matricula, "%d-%m-%Y")as fecha_matricula_n,
DATE_FORMAT(Fecha_egreso, "%d-%m-%Y")as fecha_egreso_n,
CONCAT_WS(' ',Años_transcurridos,' años',Meses_transcurridos,' meses y',Dias_transcurridos,' días')as tiempotrancurrido,
estudiante_posgrado.Fecha_egreso,
estudiante_posgrado.`Años_transcurridos`,
estudiante_posgrado.Meses_transcurridos,
estudiante_posgrado.Dias_transcurridos,
estudiante_posgrado.id_usuario,
estudiante_posgrado.created_at,
estudiante_posgrado.updated_at
FROM
estudiante_posgrado
ORDER BY created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_BACHILLER` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.Cod_autoridad
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 
WHERE
escuela_profesional.Grado_academico = 'BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_BACHILLER2` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.Cod_autoridad
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 
WHERE
	Grado_academico = 'BACHILLER' AND expediente.estado='PENDIENTE'
	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_BACHILLER_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.Cod_autoridad
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 

  WHERE escuela_profesional.Grado_academico='BACHILLER' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI
	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_MODALIDAD_FECHAS` (IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE escuela_profesional.Grado_academico='BACHILLER' AND modalidad.created_at BETWEEN FECHAINICIO AND FECHAFIN AND modalidad.lleno=0
ORDER BY
	modalidad.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_TITULADO` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.Cod_autoridad
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 
WHERE
	Grado_academico = 'TITULO'

	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_TITULADO_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
autoridades.Cod_autoridad
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 

  WHERE escuela_profesional.Grado_academico='TITULO' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI
	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_EXPEDIENTE_TITULO2` ()   SELECT
	expediente.Id_expediente, 
	expediente.Id_cede, 
	expediente.Dni, 
	expediente.Id_escuela, 
	expediente.Titulo_de, 
	expediente.Grado_bachiller_de, 
	expediente.Modalidad, 
	expediente.Acto_academico, 
	expediente.Acuerdo, 
	expediente.Resolucion_rectoral_N, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	escuela_profesional.Id_escuela, 
	escuela_profesional.Nombre AS Escuela, 
	escuela_profesional.Grado_academico, 
	escuela_profesional.`Denominación_grado`, 
	escuela_profesional.Grado_academico, 
	escuela_profesional.Cod_Escuela, 
	escuela_profesional.Id_facultad, 
	estudiante.Dni, 
	estudiante.Codigo, 
	CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante, 
	estudiante.Nombres, 
	estudiante.Apellido_paterno, 
	estudiante.Apellido_materno, 
	estudiante.Sexo, 
	cede.Id_cede, 
	cede.cede_nombre, 
	facultad.Nombre AS Facultad, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto2, 
	autoridades.Cargo_auto3, 
	autoridades.Cargo_auto1
FROM
	expediente
	INNER JOIN
	escuela_profesional
	ON 
		expediente.Id_escuela = escuela_profesional.Id_escuela
	INNER JOIN
	estudiante
	ON 
		expediente.Dni = estudiante.Dni
	INNER JOIN
	cede
	ON 
		expediente.Id_cede = cede.Id_cede
	INNER JOIN
	facultad
	ON 
		escuela_profesional.Id_facultad = facultad.Cod_facultad
	INNER JOIN
	autoridades
	ON 
		facultad.Cod_autoridad = autoridades.Cod_autoridad
WHERE
	Grado_academico = 'TITULO' AND expediente.estado='PENDIENTE'
	ORDER BY created_at desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_FACULTAD` ()   SELECT
facultad.Cod_facultad,
facultad.Nombre,
facultad.estado,
facultad.Cod_autoridad,
facultad.created_at,
facultad.updated_at,
autoridades.Autoridad_3
FROM
facultad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_BACHI_FECHAS_CEDE` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado as ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='BACHILLER' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND Cede.Id_cede=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='TITULO' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_FECHAS_BACHILLER` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND
expediente.created_at BETWEEN FECHAINI AND FECHAFI
ORDER BY
diploma.estado ASC,
diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_FECHAS_BACHILLER_SECRE` (IN `FECHAINI` DATE, IN `FECHAFIN` DATE, IN `SED` INT)   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND
expediente.created_at BETWEEN FECHAINI AND FECHAFIN AND
expediente.Id_cede = SED
ORDER BY
diploma.estado ASC,
diploma.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_FECHAS_SECRE` (IN `FECHAINI` DATE, IN `FECHAFIN` DATE, IN `SED` INT)   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='TITULO' AND expediente.created_at BETWEEN FECHAINI AND FECHAFIN AND expediente.Id_cede=SED
ORDER BY
	 diploma.estado,diploma.updated_at  desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	date_format( expediente_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro1, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	date_format( modalidad_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro2, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad,
	informe_posgrado
WHERE
	expediente_posgrado.created_at BETWEEN FECHAINI AND FECHAFI
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_CEDE` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado AS ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='TITULO' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND Cede.Id_cede=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_ESCU` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado AS ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='TITULO' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND escuela_profesional.Id_escuela=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_ESCU_BACH` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado AS ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='BACHILLER' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND escuela_profesional.Id_escuela=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_FACU` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado AS ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='TITULO' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND facultad.Cod_facultad=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_FACU_BACHI` (IN `FECHAINI` DATE, IN `FECHAFI` DATE, IN `ID` INT)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado AS ESTADO,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe


  WHERE escuela_profesional.Grado_academico='BACHILLER' AND diploma.estado='CON DIPLOMA' AND expediente.created_at BETWEEN FECHAINI AND FECHAFI AND facultad.Cod_facultad=ID
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_GENERAL_POSGRADO_FECHAS_SUNEDU` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
    empresa.emp_cod,
    empresa.emp_razon,
    programa_posgrado.Nombre as posgrado,
    estudiante_posgrado.Apellido_paterno,
    estudiante_posgrado.Apellido_materno,
    estudiante_posgrado.Nombres,
    estudiante_posgrado.Sexo,
    estudiante_posgrado.Dni,
    estudiante_posgrado.Fecha_matricula,
    estudiante_posgrado.Fecha_egreso,
    programa_posgrado.Abreviatura_grado,
    programa_posgrado.`Denominación_grado`,
    programa_posgrado.Grado_academico,
    programa_posgrado.Programa_estudio,
    programa_posgrado.Numero_creditos,
    expediente_posgrado.Modalidad,
    modalidad_posgrado.Modo_estudio,
    modalidad_posgrado.Reglamento_metadado,
    modalidad_posgrado.Trabajo_investigacion,
    diploma_posgrado.Fecha_inicio_tramite,
    modalidad_posgrado.Turnitin,
    modalidad_posgrado.Porcentaje,
    modalidad_posgrado.Centro_investigacion,
    diploma_posgrado.Resolucion_numero,
		diploma_posgrado.fecha_firma,
		diploma_posgrado.fecha_resolucion,
    diploma_posgrado.Diploma_numero,
    diploma_posgrado.Diploma_tipo_emitido,
    diploma_posgrado.Registro_libro,
    diploma_posgrado.Registro_folio,
    diploma_posgrado.Registro_numero,
    autoridades.Cargo_auto1,
    autoridades.Autoridad_1,
    autoridades.Cargo_auto2,
    autoridades.Autoridad_2,
    autoridades.Cargo_auto3,
    autoridades.Autoridad_3,
    modalidad_posgrado.Proce_pais_ext,
    modalidad_posgrado.Proce_univ_ext,
    modalidad_posgrado.Proce_grado_ext,
    diploma_posgrado.Nro_oficio,
    modalidad_posgrado.Fecha_matricula_modalidad,
    modalidad_posgrado.Fecha_inicio_modalidad,
    modalidad_posgrado.Fecha_fin_modalidad,
    modalidad_posgrado.Modo_sustentacion,
    CONCAT_WS(' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno) AS Estudiante, 
    diploma_posgrado.estado AS ESTADO,
		expediente_posgrado.Archivo,
			date_format( diploma_posgrado.fecha_resolucion, "%d-%m-%Y" ) AS fecha_registro2,
						date_format( diploma_posgrado.fecha_firma, "%d-%m-%Y" ) AS fecha_registro3


FROM
    estudiante_posgrado
INNER JOIN expediente_posgrado ON expediente_posgrado.Dni = estudiante_posgrado.Dni
INNER JOIN programa_posgrado ON expediente_posgrado.Id_programa = programa_posgrado.Id_programa
INNER JOIN modalidad_posgrado ON modalidad_posgrado.Id_expediente = expediente_posgrado.Id_expediente
INNER JOIN diploma_posgrado ON diploma_posgrado.id_modalidad = modalidad_posgrado.Id_modalidad
INNER JOIN autoridades ON expediente_posgrado.id_autoridad = autoridades.Cod_autoridad
INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id
where
expediente_posgrado.created_at BETWEEN FECHAINI AND FECHAFI AND diploma_posgrado.estado='CON DIPLOMA'
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_BACHILLER` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND modalidad=0
ORDER BY
modalidad.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_BACHILLER_TODO` ()   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE
escuela_profesional.Grado_academico = 'BACHILLER'
ORDER BY
modalidad.created_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_POSGRADO` ()   BEGIN
SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado as esta, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	date_format( expediente_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro1, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	date_format( modalidad_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro2, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad,
	informe_posgrado
WHERE modalidad_posgrado.lleno=0

ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_POSGRADO_FECHAS` (IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)   BEGIN
SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado as esta, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	date_format( expediente_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro1, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	date_format( modalidad_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro2, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad,
	informe_posgrado
WHERE
	expediente_posgrado.created_at BETWEEN FECHAINICIO AND FECHAFIN AND modalidad_posgrado.lleno=0
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_TITULO` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE
escuela_profesional.Grado_academico = 'TITULO' AND modalidad.lleno=0
ORDER BY
modalidad.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODALIDAD_TITULO_FECHAS` (IN `FECHAINICIO` DATE, IN `FECHAFIN` DATE)   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro1,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
WHERE escuela_profesional.Grado_academico='TITULO' AND modalidad.created_at BETWEEN FECHAINICIO AND FECHAFIN AND modalidad.lleno=0
ORDER BY
	modalidad.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROGRAMAS` ()   SELECT
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.Estado, 
	programa_posgrado.created_at, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_3
FROM
	programa_posgrado
	INNER JOIN
	autoridades
	ON 
		programa_posgrado.id_autoridad = autoridades.Cod_autoridad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_ALUMNOS_POS` ()   SELECT
Count(estudiante_posgrado.Dni) AS TOTAL_ALUMNOS_POS
FROM
diploma_posgrado
INNER JOIN modalidad_posgrado ON diploma_posgrado.id_modalidad = modalidad_posgrado.Id_modalidad
INNER JOIN expediente_posgrado ON modalidad_posgrado.Id_expediente = expediente_posgrado.Id_expediente
INNER JOIN programa_posgrado ON expediente_posgrado.Id_programa = programa_posgrado.Id_programa
INNER JOIN estudiante_posgrado ON expediente_posgrado.Dni = estudiante_posgrado.Dni$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_AUTO` ()   SELECT
	COUNT(autoridades.Cod_autoridad)AS TOTAL_programa
FROM
	autoridades$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_DIPLO_BACHILLER` ()   SELECT
Count(diploma.Id_Diploma) AS total_diploma
FROM
diploma
INNER JOIN modalidad ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN expediente ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
WHERE escuela_profesional.Grado_academico ='BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_DIPLO_TITULO` ()   SELECT
Count(diploma.Id_Diploma) AS total_diploma
FROM
diploma
INNER JOIN modalidad ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN expediente ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
WHERE escuela_profesional.Grado_academico ='TITULO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_EMPLEADO` ()   select count(empleado_id) as total from empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_ESCU` ()   SELECT DISTINCT
	COUNT(escuela_profesional.Id_escuela)AS TOTAL_ESCU
FROM
	escuela_profesional$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_EXPE_BACHILLER` ()   SELECT
Count(expediente.Id_expediente) AS total_expediente
FROM
diploma
INNER JOIN modalidad ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN expediente ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
WHERE escuela_profesional.Grado_academico ='BACHILLER'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_EXPE_POS` ()   SELECT
Count(expediente_posgrado.Id_expediente) AS TOTAL_EXPEDIENTE_POS
FROM
diploma_posgrado
INNER JOIN modalidad_posgrado ON diploma_posgrado.id_modalidad = modalidad_posgrado.Id_modalidad
INNER JOIN expediente_posgrado ON modalidad_posgrado.Id_expediente = expediente_posgrado.Id_expediente
INNER JOIN programa_posgrado ON expediente_posgrado.Id_programa = programa_posgrado.Id_programa
INNER JOIN estudiante_posgrado ON expediente_posgrado.Dni = estudiante_posgrado.Dni$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_EXPE_TITULO` ()   SELECT
Count(expediente.Id_expediente) AS total_expediente
FROM
diploma
INNER JOIN modalidad ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN expediente ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
WHERE escuela_profesional.Grado_academico ='TITULO'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_FACUL` ()   SELECT
	COUNT(facultad.Cod_facultad)AS TOTAL_FACU
FROM
	facultad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_POSGRADOS` ()   SELECT
Count(diploma_posgrado.Id_Diploma) AS TOTAL_DIPLOMA_POSGRADO
FROM
diploma_posgrado
INNER JOIN modalidad_posgrado ON diploma_posgrado.id_modalidad = modalidad_posgrado.Id_modalidad
INNER JOIN expediente_posgrado ON modalidad_posgrado.Id_expediente = expediente_posgrado.Id_expediente
INNER JOIN programa_posgrado ON expediente_posgrado.Id_programa = programa_posgrado.Id_programa
INNER JOIN estudiante_posgrado ON expediente_posgrado.Dni = estudiante_posgrado.Dni$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_PREGRADO` ()   SELECT
Count(estudiante.DNI) AS total_expediente,
estudiante.Dni
FROM
diploma
INNER JOIN modalidad ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN expediente ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_PROGRAM` ()   SELECT
	COUNT(programa_posgrado.Id_programa)AS TOTAL_programa
FROM
	programa_posgrado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_AUTORI` (IN `ID` INT)   SELECT
	facultad.Cod_facultad, 
	facultad.Nombre, 
		autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	escuela_profesional.Id_escuela
FROM
	facultad
	INNER JOIN
	autoridades
	ON 
		facultad.Cod_autoridad = autoridades.Cod_autoridad
	INNER JOIN
	escuela_profesional
	ON 
		facultad.Cod_facultad = escuela_profesional.Id_facultad
WHERE
	escuela_profesional.Id_escuela = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_AUTORI_POS` (IN `ID` INT)   SELECT
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre, 
	programa_posgrado.Grado_academico,
		autoridades.Cod_autoridad,  
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3
FROM
	programa_posgrado
	INNER JOIN
	autoridades
	ON 
		programa_posgrado.id_autoridad = autoridades.Cod_autoridad
WHERE
	programa_posgrado.Id_programa = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_GRADO` (IN `ID` INT)   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.`Denominación_grado`, 
	escuela_profesional.Cod_Escuela
FROM
	escuela_profesional
WHERE Id_escuela = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_GRADO_POS` (IN `ID` INT)   SELECT
	programa_posgrado.Id_programa, 
	programa_posgrado.`Denominación_grado` 

FROM
	programa_posgrado
WHERE
	programa_posgrado.Id_programa = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_GRADO_TITU` (IN `ID` INT)   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.`Denominación_grado`, 
	escuela_profesional.Cod_Escuela
FROM
	escuela_profesional
WHERE Id_escuela = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO` ()   SELECT
usuario.usu_id,
usuario.usu_usuario,
usuario.empleado_id,
usuario.usu_estatus,
usuario.area_id,
usuario.usu_rol,
usuario.empresa_id,
usuario.id_sede,
CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) AS nempleado,
area.area_nombre,
area.area_cod,
cede.cede_nombre
FROM
usuario
INNER JOIN empleado ON usuario.empleado_id = empleado.empleado_id
INNER JOIN area ON usuario.area_id = area.area_cod
INNER JOIN cede ON usuario.id_sede = cede.Id_cede
where not area_nombre='SISTEMA WEB'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_DIPLOMA_BACHILLER` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.id_informe,
informe.number_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad ,
informe
WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND diploma.estado='CON DIPLOMA'
ORDER BY
diploma.estado ASC,
diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_DIPLOMA_TITULO` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ',estudiante.Nombres,estudiante.Apellido_paterno,estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
date_format(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ',diploma.años_trans,' años',diploma.mes_trans,' meses y',diploma.dia_trand,' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado as estadiplo,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.id_informe,
informe.number_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad ,
informe
WHERE
	Grado_academico = 'TITULO' AND diploma.estado='CON DIPLOMA'
ORDER BY
	 diploma.estado,diploma.updated_at  desc$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
	Grado_academico = 'TITULO' 
ORDER BY
	diploma.estado ASC,
	diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL_BACHILLER` ()   SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
escuela_profesional.Grado_academico = 'BACHILLER'
ORDER BY
diploma.estado ASC,
diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL_BACHILLER_SECRE` (IN `SED` INT)   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
escuela_profesional.Grado_academico = 'BACHILLER' AND expediente.Id_cede=SED
ORDER BY
diploma.estado ASC,-
diploma.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL_POSGRADO` ()   SELECT
	estudiante_posgrado.Dni, 
	estudiante_posgrado.Codigo, 
	estudiante_posgrado.Nombres, 
	estudiante_posgrado.Apellido_paterno, 
	estudiante_posgrado.Apellido_materno, 
	CONCAT_WS( ' ', estudiante_posgrado.Nombres, estudiante_posgrado.Apellido_paterno, estudiante_posgrado.Apellido_materno ) AS Estudiante, 
	estudiante_posgrado.Sexo, 
	estudiante_posgrado.Celular, 
	estudiante_posgrado.Direccion, 
	estudiante_posgrado.Fecha_matricula, 
	estudiante_posgrado.Fecha_egreso, 
	estudiante_posgrado.correo_personal, 
	estudiante_posgrado.correo_institucional, 
	estudiante_posgrado.Observaciones, 
	estudiante_posgrado.`Años_transcurridos`, 
	estudiante_posgrado.Meses_transcurridos, 
	estudiante_posgrado.Dias_transcurridos, 
	estudiante_posgrado.id_usuario, 
	estudiante_posgrado.updated_at, 
	expediente_posgrado.Id_expediente, 
	expediente_posgrado.Id_cede, 
	expediente_posgrado.Dni, 
	expediente_posgrado.Id_programa, 
	expediente_posgrado.Grado_maestro_de, 
	expediente_posgrado.Modalidad, 
	expediente_posgrado.Acto_academico, 
	expediente_posgrado.Acuerdo, 
	expediente_posgrado.Resolucion_rectoral_N, 
	expediente_posgrado.Expedicion, 
	expediente_posgrado.Libro, 
	expediente_posgrado.Folio, 
	expediente_posgrado.Registro, 
	expediente_posgrado.Archivo, 
	expediente_posgrado.Id_usuario, 
	expediente_posgrado.estado as esta, 
	expediente_posgrado.created_at AS expedicion_fecha, 
	date_format( expediente_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro1, 
	expediente_posgrado.updated_at, 
	expediente_posgrado.id_autoridad, 
	expediente_posgrado.doc_ncorrelativo, 
	modalidad_posgrado.Id_modalidad, 
	modalidad_posgrado.Modo_obtencion, 
	modalidad_posgrado.Abreviatura_modo_estudio, 
	modalidad_posgrado.Trabajo_investigacion, 
	modalidad_posgrado.Modo_estudio, 
	modalidad_posgrado.Turnitin, 
	modalidad_posgrado.Porcentaje, 
	modalidad_posgrado.Centro_investigacion, 
	modalidad_posgrado.Reglamento_metadado, 
	modalidad_posgrado.Proce_pais_ext, 
	modalidad_posgrado.Proce_univ_ext, 
	modalidad_posgrado.Proce_grado_ext, 
	modalidad_posgrado.Fecha_matricula_modalidad, 
	modalidad_posgrado.Fecha_inicio_modalidad, 
	modalidad_posgrado.Fecha_fin_modalidad, 
	modalidad_posgrado.Modo_sustentacion, 
	modalidad_posgrado.Id_usuario, 
	modalidad_posgrado.Id_expediente, 
	modalidad_posgrado.created_at, 
	date_format( modalidad_posgrado.created_at, "%d-%m-%Y" ) AS fecha_registro2, 
	modalidad_posgrado.updated_at, 
	diploma_posgrado.Id_Diploma, 
	diploma_posgrado.fecha_consejo_uni, 
	diploma_posgrado.fecha_firma, 
	diploma_posgrado.Resolucion_numero, 
	diploma_posgrado.fecha_resolucion, 
	diploma_posgrado.Diploma_numero, 
	diploma_posgrado.Registro_numero, 
	diploma_posgrado.Registro_libro, 
	diploma_posgrado.Registro_folio, 
	diploma_posgrado.Diploma_tipo_emitido, 
	diploma_posgrado.Fecha_inicio_tramite, 
	diploma_posgrado.Fecha_finalizacion_tramite, 
	diploma_posgrado.`años_trans`, 
	diploma_posgrado.mes_trans, 
	diploma_posgrado.dia_trand, 
	CONCAT_WS( ' ', diploma_posgrado.años_trans, ' años', diploma_posgrado.mes_trans, ' meses y', diploma_posgrado.dia_trand, ' días' ) AS tiempotrancurrido, 
	diploma_posgrado.Nro_creditos, 
	diploma_posgrado.Nro_oficio, 
	diploma_posgrado.fecha_secreatria_general, 
	diploma_posgrado.id_usuario, 
	diploma_posgrado.id_modalidad, 
	diploma_posgrado.id_colacion, 
	diploma_posgrado.created_at, 
	diploma_posgrado.updated_at, 
	diploma_posgrado.estado AS ESTADO, 
	colacion_posgrado.id_colacion, 
	colacion_posgrado.`año`, 
	colacion_posgrado.nombre_colacion, 
	colacion_posgrado.`fecha_colación`, 
	colacion_posgrado.fecha_consejo_uni, 
	colacion_posgrado.fecha_firma_consejo, 
	colacion_posgrado.fecha_resolucion, 
	colacion_posgrado.numero_oficio, 
	colacion_posgrado.estado, 
	colacion_posgrado.created_at, 
	colacion_posgrado.updated_at, 
	programa_posgrado.Id_programa, 
	programa_posgrado.Nombre AS posgrado, 
	programa_posgrado.Grado_academico, 
	programa_posgrado.Abreviatura_grado, 
	programa_posgrado.`Denominación_grado`, 
	programa_posgrado.Programa_estudio, 
	programa_posgrado.Estado, 
	programa_posgrado.Numero_creditos, 
	programa_posgrado.id_autoridad, 
	programa_posgrado.created_at, 
	programa_posgrado.updated_at, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Cargo_auto1, 
	autoridades.Cargo_auto2, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
	autoridades.Cargo_auto3, 
	autoridades.created_at, 
	autoridades.updated_at, 
	autoridades.Id_empresa, 
	autoridades.estado, 
	cede.cede_nombre, 
	informe_posgrado.id_informe, 
	informe_posgrado.number_informe
FROM
	estudiante_posgrado
	INNER JOIN
	expediente_posgrado
	ON 
		estudiante_posgrado.Dni = expediente_posgrado.Dni
	INNER JOIN
	modalidad_posgrado
	ON 
		expediente_posgrado.Id_expediente = modalidad_posgrado.Id_expediente
	INNER JOIN
	programa_posgrado
	ON 
		expediente_posgrado.Id_programa = programa_posgrado.Id_programa
	INNER JOIN
	diploma_posgrado
	ON 
		modalidad_posgrado.Id_modalidad = diploma_posgrado.id_modalidad
	INNER JOIN
	colacion_posgrado
	ON 
		diploma_posgrado.id_colacion = colacion_posgrado.id_colacion
	INNER JOIN
	cede
	ON 
		expediente_posgrado.Id_cede = cede.Id_cede
	INNER JOIN
	autoridades
	ON 
		expediente_posgrado.id_autoridad = autoridades.Cod_autoridad,
	informe_posgrado
ORDER BY
	diploma_posgrado.estado ASC, 
	diploma_posgrado.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL_PREGRADO_SNEDU` (IN `FECHAINI` DATE, IN `FECHAFI` DATE)   SELECT
empresa.emp_cod,
empresa.emp_razon,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Nombres,
    CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante, 

estudiante.Sexo,
estudiante.Dni,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
escuela_profesional.Abreviatura_grado,
escuela_profesional.Nombre AS ESCUELA,
facultad.Nombre as FACULTAD,
escuela_profesional.`Grado_academico`as GRADO,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Programa_estudio,
escuela_profesional.Numero_creditos,
expediente.Modalidad,
expediente.Grado_bachiller_de,
expediente.Titulo_de,
expediente.Archivo,
modalidad.Modo_estudio,
modalidad.Reglamento_metadado,
modalidad.Trabajo_investigacion,
modalidad.Proce_bachiller,
modalidad.Proce_titulo_peda,
modalidad.Proce_insti_origen,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
modalidad.Centro_investigacion,
diploma.Diploma_numero,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.estado as ESTADO,
autoridades.Cargo_auto1,
autoridades.Autoridad_1,
autoridades.Cargo_auto2,
autoridades.Autoridad_2,
autoridades.Cargo_auto3,
autoridades.Autoridad_3,
diploma.Nro_oficio,
			date_format( diploma.fecha_resolucion, "%d-%m-%Y" ) AS fecha_registro2,
						date_format( diploma.fecha_firma, "%d-%m-%Y" ) AS fecha_registro3
FROM
estudiante
INNER JOIN expediente ON expediente.Dni = estudiante.Dni
INNER JOIN modalidad ON modalidad.Id_expediente = expediente.Id_expediente
INNER JOIN diploma ON diploma.id_modalidad = modalidad.Id_modalidad
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad 
INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id


where
expediente.created_at BETWEEN FECHAINI AND FECHAFI AND diploma.estado='CON DIPLOMA'
ORDER BY
	Grado_academico asc,
	Apellido_paterno asc,
	diploma.estado ASC, 
	diploma.updated_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTA_GENERAL_SECRE` (IN `SED` INT)   BEGIN
SELECT
expediente.Id_expediente,
expediente.Id_cede,
expediente.Dni,
expediente.Id_escuela,
expediente.Titulo_de,
expediente.Grado_bachiller_de,
expediente.Modalidad,
expediente.Acto_academico,
expediente.Acuerdo,
expediente.Resolucion_rectoral_N,
expediente.Expedicion,
expediente.Libro,
expediente.Folio,
expediente.Registro,
expediente.Archivo,
expediente.Id_usuario,
expediente.estado,
expediente.created_at AS expe,
DATE_FORMAT(expediente.created_at, "%d-%m-%Y") AS fecha_registro1,
expediente.updated_at,
expediente.id_autoridad,
expediente.doc_ncorrelativo,
escuela_profesional.Id_escuela,
escuela_profesional.Nombre AS Escuela,
escuela_profesional.Grado_academico,
escuela_profesional.`Denominación_grado`,
escuela_profesional.Grado_academico,
escuela_profesional.Cod_Escuela,
escuela_profesional.Id_facultad,
estudiante.Dni,
estudiante.Codigo,
CONCAT_WS(' ', estudiante.Nombres, estudiante.Apellido_paterno, estudiante.Apellido_materno) AS Estudiante,
estudiante.Nombres,
estudiante.Apellido_paterno,
estudiante.Apellido_materno,
estudiante.Sexo,
estudiante.Celular,
estudiante.Direccion,
estudiante.correo_personal,
estudiante.correo_institucional,
estudiante.Fecha_matricula,
estudiante.Fecha_egreso,
estudiante.Observaciones,
cede.Id_cede,
cede.cede_nombre,
facultad.Nombre AS Facultad,
modalidad.Modo_obtencion,
modalidad.Abreviatura_modo_estudio,
modalidad.Modo_estudio,
modalidad.Id_usuario,
modalidad.Id_expediente,
modalidad.created_at,
DATE_FORMAT(modalidad.created_at, "%d-%m-%Y") AS fecha_registro2,
modalidad.updated_at,
modalidad.Id_modalidad,
modalidad.Proce_insti_origen,
modalidad.Proce_titulo_peda,
modalidad.Proce_bachiller,
modalidad.Trabajo_investigacion,
modalidad.Turnitin,
modalidad.Porcentaje,
modalidad.Centro_investigacion,
modalidad.Reglamento_metadado,
modalidad.Fecha_matricula_modalidad,
modalidad.Fecha_inicio_modalidad,
modalidad.Fecha_fin_modalidad,
modalidad.Modo_sustentacion,
diploma.Id_Diploma,
diploma.fecha_consejo_uni,
diploma.fecha_firma,
diploma.Resolucion_numero,
diploma.fecha_resolucion,
diploma.Diploma_numero,
diploma.Registro_numero,
diploma.Registro_libro,
diploma.Registro_folio,
diploma.Diploma_tipo_emitido,
diploma.Fecha_inicio_tramite,
diploma.Fecha_finalizacion_tramite,
diploma.`años_trans`,
diploma.mes_trans,
diploma.dia_trand,
CONCAT_WS(' ', diploma.años_trans, ' años', diploma.mes_trans, ' meses y', diploma.dia_trand, ' días') AS tiempotrancurrido,
diploma.Nro_creditos,
diploma.Nro_oficio,
diploma.fecha_secreatria_general,
diploma.id_usuario,
diploma.id_modalidad,
diploma.created_at,
diploma.updated_at,
diploma.estado,
colacion.id_colacion,
colacion.`año`,
colacion.nombre_colacion,
colacion.`fecha_colación`,
colacion.fecha_consejo_uni,
colacion.fecha_firma_consejo,
colacion.fecha_resolucion,
colacion.numero_oficio,
autoridades.Autoridad_1,
autoridades.Cargo_auto1,
autoridades.Autoridad_2,
autoridades.Cargo_auto2,
autoridades.Autoridad_3,
autoridades.Cargo_auto3,
informe.number_informe,
informe.id_informe
FROM
expediente
INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
INNER JOIN autoridades ON expediente.id_autoridad = autoridades.Cod_autoridad ,
informe

WHERE
	Grado_academico = 'TITULO' AND expediente.Id_cede=SED
ORDER BY
	diploma.estado ASC,
	diploma.updated_at DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_AREA` (IN `ID` INT, IN `NAREA` VARCHAR(255), IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE AREAACTUAL VARCHAR(255);
DECLARE CANTIDAD INT;
SET @AREAACTUAL:=(SELECT area_nombre FROM area WHERE area_cod=ID);
IF @AREAACTUAL = NAREA THEN
	UPDATE area SET
	area_estado=ESTADO,
	area_nombre=NAREA
	WHERE area_cod=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM area WHERE area_nombre=NAREA);
	IF @CANTIDAD=0 THEN
		UPDATE area SET
		area_estado=ESTADO,
		area_nombre=NAREA
		WHERE area_cod=ID;
		SELECT 1;	
	ELSE
		SELECT 2;	
	END IF;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_AUTORIDAD` (IN `ID` INT, IN `AUTO1` VARCHAR(100), IN `CARGO1` VARCHAR(100), IN `AUTO2` VARCHAR(100), IN `CARGO2` VARCHAR(100), IN `AUTO3` VARCHAR(100), IN `CARGO3` VARCHAR(100), IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM autoridades WHERE Autoridad_1=AUTO1 AND Autoridad_2=AUTO2 AND Autoridad_3=AUTO3 AND estado='ACTIVO');
IF @CANTIDAD=0 THEN
	UPDATE autoridades SET
	Autoridad_1=AUTO1,
	Cargo_auto1=CARGO1,
	Autoridad_2=AUTO2,
	Cargo_auto2=CARGO2,
	Autoridad_3=AUTO3,
	Cargo_auto3=CARGO3,
	updated_at=NOW(),
	estado=ESTADO
	WHERE Cod_autoridad=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_BACHILLER` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `CED` INT, IN `IDESCUE` INT, IN `BACH` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
  DECLARE AÑO INT;
  DECLARE MES INT;
  DECLARE DIA INT;

  DECLARE AÑODIPLO INT;
  DECLARE MESDIPLO INT;
  DECLARE DIADIPLO INT;

  DECLARE NDOCUMENTOACTUAL INT;
  DECLARE verificar INT;

  SET @AÑO := (TIMESTAMPDIFF(YEAR, FECHAMATRI, FECHAEGRE));
  SET @MES := (TIMESTAMPDIFF(MONTH, FECHAMATRI, FECHAEGRE) % 12);
  SET @DIA := (FLOOR(TIMESTAMPDIFF(DAY, FECHAMATRI, FECHAEGRE) % 30.4375));

  SET @AÑODIPLO := (TIMESTAMPDIFF(YEAR, FECHA_INI_TRA, NOW()));
  SET @MESDIPLO := (TIMESTAMPDIFF(MONTH, FECHA_INI_TRA, NOW()) % 12);
  SET @DIADIPLO := (FLOOR(TIMESTAMPDIFF(DAY, FECHA_INI_TRA, NOW()) % 30.4375));

  SET @NDOCUMENTOACTUAL := (SELECT Dni FROM estudiante WHERE Dni = NDOCUMENTO);

  -- Verificar duplicados antes de proceder con la actualización
  SET @verificar := (SELECT COUNT(*) FROM diploma 
                     WHERE (Resolucion_numero = RESOLDIPLO OR Diploma_numero = NUMDIPLO OR Registro_numero = REGINUM AND Id_Diploma != IDDIPLO));

  IF @verificar > 0 THEN
    -- Verificar si los valores actuales coinciden con los nuevos valores
    SET @verificar := (SELECT COUNT(*) FROM diploma 
                       WHERE (Resolucion_numero = RESOLDIPLO AND Diploma_numero = NUMDIPLO AND Registro_numero = REGINUM AND Id_Diploma = IDDIPLO));

    IF @verificar = 0 THEN
      SELECT 2;
    END IF;
  END IF;

  IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
    UPDATE estudiante
    SET	
      Dni = NDOCUMENTO,
      Codigo = CODIGO,
      Nombres = NOMBRE,
      Apellido_paterno = APEPAT,
      Apellido_materno = APEMAT,
      Sexo = SEXO,
      Celular = MOVIL,
      Direccion = DIRECCION,
      Fecha_matricula = FECHAMATRI,
      Fecha_egreso = FECHAEGRE,
      correo_personal = EMAPER,
      correo_institucional = EMAINSTI,
      Observaciones = OBERSER,
      Años_transcurridos = @AÑO,
      Meses_transcurridos = @MES,
      Dias_transcurridos = @DIA,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Dni = NDOCUMENTO;

  UPDATE expediente 
    SET
      Id_escuela = IDESCUE,
      Grado_bachiller_de = BACH,
      Modalidad = MODA,
      Acto_academico = '',
      Acuerdo = ACUER,
      Resolucion_rectoral_N = RESOL,
      Expedicion = EXPE,
      Libro = LIB,
      Folio = FOLI,
      Registro = REGIS,
      Archivo = RUTA,
      Id_usuario = USU,
			id_autoridad=IDAUTO,
      estado = 'PROCESO',
      id_usuario = USU,
      updated_at = FECHA
    WHERE Id_expediente = IDEXPE;

    UPDATE modalidad 
    SET
      Modo_obtencion = MODA,
      Abreviatura_modo_estudio = 'P',
      Modo_estudio = MODO_ESTU,
      Trabajo_investigacion = TRABA_INV,
      Turnitin = TURNITIN,
      Porcentaje = PORCENTAJE,
      Centro_investigacion = CENTRO_INVE,
      Reglamento_metadado = REGLA_META,
      Proce_bachiller = PRO_BACH,
      Proce_insti_origen = PRO_INST,
      Proce_titulo_peda = PRO_TITU,
      Fecha_matricula_modalidad = FECHA_MATRI_MOD,
      Fecha_inicio_modalidad = FECHA_INIC_MOD,
      Fecha_fin_modalidad = FECHA_FIN_MOD,
      Modo_sustentacion = MODO_SUSTE,
      Id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_modalidad = IDMODA;

    UPDATE diploma 
    SET
		  fecha_consejo_uni=FECHACU,
			fecha_firma=FECHAFIRMA,
      Resolucion_numero = RESOLDIPLO,
			fecha_resolucion=FECHARESO,
      Diploma_numero = NUMDIPLO,
      Registro_numero = REGINUM,
      Registro_libro = REGISLIB,
      Registro_folio = REGISFOL,
      Diploma_tipo_emitido = TIPODIPLO,
      Fecha_inicio_tramite = FECHA_INI_TRA,
      Fecha_finalizacion_tramite = CURDATE(),
      años_trans = @AÑODIPLO,
      mes_trans = @MESDIPLO,
      dia_trand = @DIADIPLO,
      Nro_creditos = NROCREDI,
      Nro_oficio = NROOFICIO,
			fecha_secreatria_general=FECHASECRE,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_Diploma = IDDIPLO;

    SELECT 1;
  ELSE
    SELECT 2;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CARRERA` (IN `ID` INT, IN `ESCUE` CHAR(11), IN `NOMBRES` VARCHAR(100), IN `GRADOACA` VARCHAR(100), IN `ABRE` CHAR(2), IN `DENOMI` VARCHAR(100), IN `PROGRAMA` VARCHAR(100), IN `CRED` INT, IN `FACUL` INT, IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE DENO VARCHAR(20);
DECLARE CANTIDAD INT;
SET @DENO:=(SELECT escuela_profesional.`Denominación_grado` FROM escuela_profesional WHERE Id_escuela=ID);
IF @DENO = DENOMI THEN
	UPDATE escuela_profesional SET
	Cod_Escuela=ESCUE,
	Nombre=NOMBRES,
	Grado_academico=GRADOACA,
	Abreviatura_grado=ABRE,
	Denominación_grado=DENOMI,
	Programa_estudio=PROGRAMA,
	Numero_creditos=CRED,
	Id_facultad=FACUL,
	updated_at=NOW(),
	estado=ESTADO
	WHERE Id_escuela=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM escuela_profesional WHERE Nombre=NOMBRES AND Grado_academico=GRADOACA AND `Denominación_grado`=DENOMI);
IF @CANTIDAD=0 THEN
	UPDATE escuela_profesional SET
		Cod_Escuela=ESCUE,
	Nombre=NOMBRES,
	Grado_academico=GRADOACA,
	Abreviatura_grado=ABRE,
	Denominación_grado=DENOMI,
	Programa_estudio=PROGRAMA,
	Numero_creditos=CRED,
	Id_facultad=FACUL,
	updated_at=NOW(),
	estado=ESTADO
	WHERE Id_escuela=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CEDE` (IN `ID` INT, IN `CED` VARCHAR(255), IN `DESCRIP` VARCHAR(255), IN `ESTA` VARCHAR(100))   BEGIN
DECLARE CEDACTUAL CHAR(12);
DECLARE CANTIDAD INT;
SET @CEDACTUAL:=(SELECT cede_nombre FROM cede WHERE Id_cede=ID);
IF @CEDACTUAL = CED THEN
	UPDATE cede SET
	cede_nombre=CED,
	descripcion=DESCRIP,
	estado=ESTA,
	updated_at=NOW()
	WHERE Id_cede=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM cede WHERE cede_nombre=CED);
IF @CANTIDAD=0 THEN
UPDATE cede SET
	cede_nombre=CED,
	descripcion=DESCRIP,
	estado=ESTA,
	updated_at=NOW()
	WHERE Id_cede=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_COLACION` (IN `ID` INT, IN `COLA` VARCHAR(255), IN `FECHACOLA` DATE, IN `FECHACONSEJO` DATE, IN `FECHAFIRMA` DATE, IN `FECHARESOL` DATE, IN `OFICIIO` VARCHAR(255))   BEGIN
DECLARE AÑO INT;
DECLARE FECHA_ACTUAL DATE;
DECLARE CANTIDAD INT;
SET @AÑO:=(SELECT YEAR(NOW()));
SET @FECHA_ACTUAL:=(SELECT colacion.fecha_colación FROM colacion WHERE colacion.id_colacion=ID);
IF @FECHA_ACTUAL = FECHACOLA THEN
	UPDATE colacion SET
	año=@AÑO,
	nombre_colacion=COLA,
	fecha_colación=FECHACOLA,
	fecha_consejo_uni=FECHACONSEJO,
	fecha_firma_consejo=FECHAFIRMA,
	fecha_resolucion=FECHARESOL,
	numero_oficio=OFICIIO,
	updated_at=NOW()
	WHERE id_colacion=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM colacion WHERE colacion.`fecha_colación`=FECHACOLA);
IF @CANTIDAD=0 THEN
	UPDATE colacion SET
	año=@AÑO,
	nombre_colacion=COLA,
	fecha_colación=FECHACOLA,
	fecha_consejo_uni=FECHACONSEJO,
	fecha_firma_consejo=FECHAFIRMA,
	fecha_resolucion=FECHARESOL,
	numero_oficio=OFICIIO,
	updated_at=NOW()
	WHERE id_colacion=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_COLACION_POS` (IN `ID` INT, IN `COLA` VARCHAR(255), IN `FECHACOLA` DATE, IN `FECHACONSEJO` DATE, IN `FECHAFIRMA` DATE, IN `FECHARESOL` DATE, IN `OFICIIO` VARCHAR(255))   BEGIN
DECLARE AÑO INT;
DECLARE FECHA_ACTUAL DATE;
DECLARE CANTIDAD INT;
SET @AÑO:=(SELECT YEAR(NOW()));
SET @FECHA_ACTUAL:=(SELECT colacion_posgrado.fecha_colación FROM colacion_posgrado WHERE colacion_posgrado.id_colacion=ID);
IF @FECHA_ACTUAL = FECHACOLA THEN
	UPDATE colacion_posgrado SET
	año=@AÑO,
	nombre_colacion=COLA,
	fecha_colación=FECHACOLA,
	fecha_consejo_uni=FECHACONSEJO,
	fecha_firma_consejo=FECHAFIRMA,
	fecha_resolucion=FECHARESOL,
	numero_oficio=OFICIIO,
	updated_at=NOW()
	WHERE id_colacion=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM colacion_posgrado WHERE colacion_posgrado.`fecha_colación`=FECHACOLA);
IF @CANTIDAD=0 THEN
	UPDATE colacion_posgrado SET
	año=@AÑO,
	nombre_colacion=COLA,
	fecha_colación=FECHACOLA,
	fecha_consejo_uni=FECHACONSEJO,
	fecha_firma_consejo=FECHAFIRMA,
	fecha_resolucion=FECHARESOL,
	numero_oficio=OFICIIO,
	updated_at=NOW()
	WHERE id_colacion=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EMPLEADO` (IN `ID` INT, IN `NDOCUMENTO` CHAR(12), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `FECHA` DATE, IN `MOVIL` CHAR(9), IN `MODALIDAD` VARCHAR(255), IN `DIRECCION` VARCHAR(255), IN `EMAIL` VARCHAR(255), IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE NDOCUMENTOACTUAL CHAR(12);
DECLARE CANTIDAD INT;
SET @NDOCUMENTOACTUAL:=(SELECT emple_nrodocumento FROM empleado WHERE empleado_id=ID);
IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
	UPDATE empleado SET
	emple_nrodocumento=NDOCUMENTO,
	emple_nombre=NOMBRE,
	emple_apepat=APEPAT,
	emple_apemat=APEMAT,
	emple_fechanacimiento=FECHA,
	emple_movil=MOVIL,
	empl_modalidad=MODALIDAD,
	emple_direccion=DIRECCION,
	emple_email=EMAIL,
	 emple_estatus=ESTADO
	WHERE empleado_id=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado WHERE emple_nrodocumento=NDOCUMENTO);
IF @CANTIDAD=0 THEN
UPDATE empleado SET
	emple_nrodocumento=NDOCUMENTO,
	emple_nombre=NOMBRE,
	emple_apepat=APEPAT,
	emple_apemat=APEMAT,
	emple_fechanacimiento=FECHA,
	emple_movil=MOVIL,
	empl_modalidad=MODALIDAD,
	emple_direccion=DIRECCION,
	emple_email=EMAIL,
	 emple_estatus=ESTADO
	WHERE empleado_id=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EMPLEADO_FOTO` (IN `ID` INT, IN `RUTA` VARCHAR(255))   UPDATE empleado SET
empl_fotoperfil=RUTA
WHERE empleado_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EMPRESA` (IN `ID` INT, IN `NOMBRE` VARCHAR(250), IN `EMAIL` VARCHAR(250), IN `COD` VARCHAR(10), IN `TELEFONO` VARCHAR(20), IN `DIRECCION` VARCHAR(250))   UPDATE empresa SET
	emp_razon=NOMBRE,
	emp_email=EMAIL,
	emp_cod=COD,
	emp_telefono=TELEFONO,
	emp_direccion=DIRECCION
	WHERE empresa_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EMPRESA_FOTO` (IN `ID` INT, IN `RUTA` VARCHAR(255))   UPDATE empresa SET
emp_logo=RUTA
WHERE empresa_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTUDIANTE` (IN `NDOCUMENTO` CHAR(8), IN `CODIGO` CHAR(15), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `IDUSER` INT)   BEGIN
DECLARE NDOCUMENTOACTUAL CHAR(12);
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));
SET @NDOCUMENTOACTUAL:=(SELECT Dni FROM estudiante WHERE Dni=NDOCUMENTO);
IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
	UPDATE estudiante SET
	Dni=NDOCUMENTO,
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=IDUSER,
	 updated_at=CURDATE()
	WHERE Dni=NDOCUMENTO;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM estudiante WHERE Dni=NDOCUMENTO);
IF @CANTIDAD=0 THEN
UPDATE estudiante SET
	Dni=NDOCUMENTO,
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=IDUSER,
	 updated_at=CURDATE()
	WHERE Dni=NDOCUMENTO;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTUDIANTE_POS` (IN `NDOCUMENTO` CHAR(8), IN `CODIGO` CHAR(15), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `IDUSER` INT)   BEGIN
DECLARE NDOCUMENTOACTUAL CHAR(12);
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));
SET @NDOCUMENTOACTUAL:=(SELECT Dni FROM estudiante_posgrado WHERE Dni=NDOCUMENTO);
IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
	UPDATE estudiante_posgrado SET
	Dni=NDOCUMENTO,
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=IDUSER,
	 updated_at=CURDATE()
	WHERE Dni=NDOCUMENTO;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM estudiante_posgrado WHERE Dni=NDOCUMENTO);
IF @CANTIDAD=0 THEN
UPDATE estudiante_posgrado SET
	Dni=NDOCUMENTO,
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=IDUSER,
	 updated_at=CURDATE()
	WHERE Dni=NDOCUMENTO;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EXPEDIENTE_BA` (IN `ID` CHAR(12), IN `CED` INT, IN `DNI` CHAR(8), IN `IDESCUE` INT, IN `DENO` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `FECHA` DATE, IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `AUTORIDAD` INT, IN `IDUSER` INT)   UPDATE expediente SET
	Id_cede=CED,
	Dni=DNI,
	Id_escuela=IDESCUE,
	Grado_bachiller_de=DENO,
	Acuerdo=ACUER,
	Resolucion_rectoral_N=RESOL,
	Fecha=FECHA,
	Expedicion=EXPE,
	Libro=LIB,
	Folio=FOLI,
	Registro=REGIS,
	Archivo=RUTA,
	Id_autoridad=AUTORIDAD,
	Id_usuario=IDUSER,
	updated_at=NOW()
	WHERE Id_expediente=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_EXPEDIENTE_TI` (IN `ID` CHAR(12), IN `CED` INT, IN `DNI` CHAR(8), IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `FECHA` DATE, IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `AUTORIDAD` INT, IN `IDUSER` INT)   UPDATE expediente SET
	Id_cede=CED,
	Dni=DNI,
	Id_escuela=IDESCUE,
	Titulo_de =TITU,
	modalidad=MODA,
	Acto_academico=ACTOACA,
	Acuerdo=ACUER,
	Resolucion_rectoral_N=RESOL,
	Fecha=FECHA,
	Expedicion=EXPE,
	Libro=LIB,
	Folio=FOLI,
	Registro=REGIS,
	Archivo=RUTA,
	Id_autoridad=AUTORIDAD,
	Id_usuario=IDUSER,
	updated_at=NOW()
	WHERE Id_expediente=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_FACULTAD` (IN `ID` INT, IN `FACULTAD` VARCHAR(50), IN `AUTO` INT, IN `ESTA` VARCHAR(20))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM facultad WHERE Nombre=FACULTAD AND Cod_autoridad=AUTO);
IF @CANTIDAD=0 THEN
	UPDATE facultad SET
	Nombre=FACULTAD,
	Cod_autoridad=AUTO,
	estado=ESTA,
	updated_at=NOW()
	WHERE Cod_facultad=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_INFORME` (IN `ID` INT, IN `NUM` INT)   BEGIN
UPDATE informe
SET informe.number_informe=NUM
WHERE informe.id_informe=ID;
SELECT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_MODALIDAD_BACHILLER` (IN `ID_MODA` INT, IN `EXPE_ACT` CHAR(12), IN `EXPE` VARCHAR(12), IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
IF EXPE_ACT = EXPE THEN
	UPDATE modalidad SET
	Modo_obtencion=MODO_OB,
	Modo_estudio=MODO_ESTU,
	Proce_bachiller=PRO_BACH,
	Proce_insti_origen=PRO_INST,
	Proce_titulo_peda=PRO_TITU,
	Id_usuario=USU,
	Id_expediente=EXPE,
	updated_at=NOW()
	WHERE Id_modalidad=ID_MODA;
	
	SELECT 1;
ELSE
IF EXPE_ACT <> EXPE THEN
	UPDATE modalidad SET
	Modo_obtencion=MODO_OB,
	Modo_estudio=MODO_ESTU,
	Proce_bachiller=PRO_BACH,
	Proce_insti_origen=PRO_INST,
	Proce_titulo_peda=PRO_TITU,
	Id_usuario=USU,
	Id_expediente=EXPE,
	updated_at=NOW()
	WHERE Id_modalidad=ID_MODA;
UPDATE expediente
SET expediente.estado='PENDIENTE'
WHERE expediente.Id_expediente=EXPE_ACT;
UPDATE expediente
SET expediente.estado='EN PROCESO'
WHERE expediente.Id_expediente=EXPE;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_MODALIDAD_POSGRADO` (IN `ID_MODA` INT, IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PROPAIS` VARCHAR(255), IN `PROUNI` VARCHAR(255), IN `PROGRADO` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN

	UPDATE modalidad_posgrado SET
	Modo_obtencion=MODO_OB,
	Modo_estudio=MODO_ESTU,
	Trabajo_investigacion=TRABA_INV,
	Turnitin=TURNITIN,
	Porcentaje=PORCENTAJE,
	Centro_investigacion=CENTRO_INVE,
	Reglamento_metadado=REGLA_META,
	Proce_pais_ext=`PROPAIS`,
	Proce_univ_ext=`PROUNI`,
	Proce_grado_ext=`PROGRADO`,
	Fecha_matricula_modalidad=FECHA_MATRI_MOD,
	Fecha_inicio_modalidad=FECHA_INIC_MOD,
	Fecha_fin_modalidad=FECHA_FIN_MOD,
	Modo_sustentacion=MODO_SUSTE,
	Id_usuario=USU,
	updated_at=NOW(),
	lleno=1
	WHERE Id_modalidad=ID_MODA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_MODALIDAD_TITULO` (IN `ID_MODA` INT, IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN

	UPDATE modalidad SET
	Modo_obtencion=MODO_OB,
	Modo_estudio=MODO_ESTU,
	Trabajo_investigacion=TRABA_INV,
	Turnitin=TURNITIN,
	Porcentaje=PORCENTAJE,
	Centro_investigacion=CENTRO_INVE,
	Reglamento_metadado=REGLA_META,
	Proce_bachiller=PRO_BACH,
	Proce_insti_origen=PRO_INST,
	Proce_titulo_peda=PRO_TITU,
	Fecha_matricula_modalidad=FECHA_MATRI_MOD,
	Fecha_inicio_modalidad=FECHA_INIC_MOD,
	Fecha_fin_modalidad=FECHA_FIN_MOD,
	Modo_sustentacion=MODO_SUSTE,
	Id_usuario=USU,
	updated_at=NOW(),
	lleno=1
	WHERE Id_modalidad=ID_MODA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_POSGRADO` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `IDPROGRA` INT, IN `MAES` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATE, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_PAIS` VARCHAR(255), IN `PRO_UNI` VARCHAR(255), IN `PRO_GRADO` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
  DECLARE AÑO INT;
  DECLARE MES INT;
  DECLARE DIA INT;

  DECLARE AÑODIPLO INT;
  DECLARE MESDIPLO INT;
  DECLARE DIADIPLO INT;

  DECLARE NDOCUMENTOACTUAL INT;
  DECLARE verificar INT;

  SET @AÑO := (TIMESTAMPDIFF(YEAR, FECHAMATRI, FECHAEGRE));
  SET @MES := (TIMESTAMPDIFF(MONTH, FECHAMATRI, FECHAEGRE) % 12);
  SET @DIA := (FLOOR(TIMESTAMPDIFF(DAY, FECHAMATRI, FECHAEGRE) % 30.4375));

  SET @AÑODIPLO := (TIMESTAMPDIFF(YEAR, FECHA_INI_TRA, NOW()));
  SET @MESDIPLO := (TIMESTAMPDIFF(MONTH, FECHA_INI_TRA, NOW()) % 12);
  SET @DIADIPLO := (FLOOR(TIMESTAMPDIFF(DAY, FECHA_INI_TRA, NOW()) % 30.4375));

  SET @NDOCUMENTOACTUAL := (SELECT Dni FROM estudiante_posgrado WHERE Dni = NDOCUMENTO);

  -- Verificar duplicados antes de proceder con la actualización
  SET @verificar := (SELECT COUNT(*) FROM diploma_posgrado
                     WHERE (Resolucion_numero = RESOLDIPLO OR Diploma_numero = NUMDIPLO OR Registro_numero = REGINUM AND Id_Diploma != IDDIPLO));


  IF @verificar > 0 THEN
    -- Verificar si los valores actuales coinciden con los nuevos valores
    SET @verificar := (SELECT COUNT(*) FROM diploma_posgrado 
                       WHERE (Resolucion_numero = RESOLDIPLO AND Diploma_numero = NUMDIPLO AND Registro_numero = REGINUM AND Id_Diploma = IDDIPLO));

    IF @verificar = 0 THEN
      SELECT 2;
    END IF;
  END IF;

  IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
    UPDATE estudiante_posgrado
    SET	
      Dni = NDOCUMENTO,
      Codigo = CODIGO,
      Nombres = NOMBRE,
      Apellido_paterno = APEPAT,
      Apellido_materno = APEMAT,
      Sexo = SEXO,
      Celular = MOVIL,
      Direccion = DIRECCION,
      Fecha_matricula = FECHAMATRI,
      Fecha_egreso = FECHAEGRE,
      correo_personal = EMAPER,
      correo_institucional = EMAINSTI,
      Observaciones = OBERSER,
      Años_transcurridos = @AÑO,
      Meses_transcurridos = @MES,
      Dias_transcurridos = @DIA,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Dni = NDOCUMENTO;

    UPDATE expediente_posgrado 
    SET
      Id_programa = IDPROGRA,
      Grado_maestro_de = MAES,
      Modalidad = MODA,
      Acto_academico = ACTOACA,
      Acuerdo = ACUER,
      Resolucion_rectoral_N = RESOL,
      Expedicion = EXPE,
      Libro = LIB,
      Folio = FOLI,
      Registro = REGIS,
      Archivo = RUTA,
      Id_usuario = USU,
      estado = 'PREOCESO',
      id_usuario = USU,
			id_autoridad=IDAUTO,
      created_at = FECHA,
      updated_at = CURDATE()
    WHERE Id_expediente = IDEXPE;

    UPDATE modalidad_posgrado
    SET
      Modo_obtencion = MODA,
      Abreviatura_modo_estudio = 'P',
      Modo_estudio = MODO_ESTU,
      Trabajo_investigacion = TRABA_INV,
      Turnitin = TURNITIN,
      Porcentaje = PORCENTAJE,
      Centro_investigacion = CENTRO_INVE,
      Reglamento_metadado = REGLA_META,
      Proce_pais_ext = PRO_PAIS,
      Proce_univ_ext = PRO_UNI,
      Proce_grado_ext = PRO_GRADO,
      Fecha_matricula_modalidad = FECHA_MATRI_MOD,
      Fecha_inicio_modalidad = FECHA_INIC_MOD,
      Fecha_fin_modalidad = FECHA_FIN_MOD,
      Modo_sustentacion = MODO_SUSTE,
      Id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_modalidad = IDMODA;

    UPDATE diploma_posgrado
    SET
		  fecha_consejo_uni=FECHACU,
			fecha_firma=FECHAFIRMA,
      Resolucion_numero = RESOLDIPLO,
			fecha_resolucion=FECHARESO,
      Diploma_numero = NUMDIPLO,
      Registro_numero = REGINUM,
      Registro_libro = REGISLIB,
      Registro_folio = REGISFOL,
      Diploma_tipo_emitido = TIPODIPLO,
      Fecha_inicio_tramite = FECHA_INI_TRA,
      Fecha_finalizacion_tramite = CURDATE(),
      años_trans = @AÑODIPLO,
      mes_trans = @MESDIPLO,
      dia_trand = @DIADIPLO,
      Nro_creditos = NROCREDI,
      Nro_oficio = NROOFICIO,
			fecha_secreatria_general=FECHASECRE,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_Diploma = IDDIPLO;

    SELECT 1;
  ELSE
    SELECT 2;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PROGRAMA` (IN `ID` INT, IN `NOMBRES` VARCHAR(100), IN `GRADOACA` VARCHAR(100), IN `ABRE` CHAR(2), IN `DENOMI` VARCHAR(100), IN `PROGRAMA` VARCHAR(100), IN `CRED` INT, IN `DIRE` INT, IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE DENO VARCHAR(20);
DECLARE CANTIDAD INT;
SET @DENO:=(SELECT programa_posgrado.`Denominación_grado` FROM programa_posgrado WHERE Id_programa=ID);
IF @DENO = DENOMI THEN
	UPDATE programa_posgrado SET
	Nombre=NOMBRES,
	Grado_academico=GRADOACA,
	Abreviatura_grado=ABRE,
	Denominación_grado=DENOMI,
	Programa_estudio=PROGRAMA,
	Numero_creditos=CRED,
	id_autoridad=DIRE,
	updated_at=NOW(),
	estado=ESTADO
	WHERE Id_programa=ID;
	SELECT 1;
ELSE
SET @CANTIDAD:=(SELECT COUNT(*) FROM programa_posgrado WHERE Nombre=NOMBRES AND `Denominación_grado`=DENOMI);
IF @CANTIDAD=0 THEN
	UPDATE programa_posgrado SET
	Nombre=NOMBRES,
	Grado_academico=GRADOACA,
	Abreviatura_grado=ABRE,
	Denominación_grado=DENOMI,
	Programa_estudio=PROGRAMA,
	Numero_creditos=CRED,
	id_autoridad=DIRE,
	updated_at=NOW(),
	estado=ESTADO
	WHERE Id_programa=ID;
	SELECT 1;
ELSE
SELECT 2;

END IF;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_TITULADO` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `CED` INT, IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `ID_AUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
  DECLARE AÑO INT;
  DECLARE MES INT;
  DECLARE DIA INT;

  DECLARE AÑODIPLO INT;
  DECLARE MESDIPLO INT;
  DECLARE DIADIPLO INT;

  DECLARE NDOCUMENTOACTUAL INT;
  DECLARE verificar INT;

  SET @AÑO := (TIMESTAMPDIFF(YEAR, FECHAMATRI, FECHAEGRE));
  SET @MES := (TIMESTAMPDIFF(MONTH, FECHAMATRI, FECHAEGRE) % 12);
  SET @DIA := (FLOOR(TIMESTAMPDIFF(DAY, FECHAMATRI, FECHAEGRE) % 30.4375));

  SET @AÑODIPLO := (TIMESTAMPDIFF(YEAR, FECHA_INI_TRA, NOW()));
  SET @MESDIPLO := (TIMESTAMPDIFF(MONTH, FECHA_INI_TRA, NOW()) % 12);
  SET @DIADIPLO := (FLOOR(TIMESTAMPDIFF(DAY, FECHA_INI_TRA, NOW()) % 30.4375));

  SET @NDOCUMENTOACTUAL := (SELECT Dni FROM estudiante WHERE Dni = NDOCUMENTO);

  -- Verificar duplicados antes de proceder con la actualización
  SET @verificar := (SELECT COUNT(*) FROM diploma 
                     WHERE (Resolucion_numero = RESOLDIPLO OR Diploma_numero = NUMDIPLO OR Registro_numero = REGINUM AND Id_Diploma != IDDIPLO));

  IF @verificar > 0 THEN
    -- Verificar si los valores actuales coinciden con los nuevos valores
    SET @verificar := (SELECT COUNT(*) FROM diploma 
                       WHERE (Resolucion_numero = RESOLDIPLO AND Diploma_numero = NUMDIPLO AND Registro_numero = REGINUM AND Id_Diploma = IDDIPLO));

    IF @verificar = 0 THEN
      SELECT 2;
    END IF;
  END IF;

  IF @NDOCUMENTOACTUAL = NDOCUMENTO THEN
    UPDATE estudiante
    SET	
      Dni = NDOCUMENTO,
      Codigo = CODIGO,
      Nombres = NOMBRE,
      Apellido_paterno = APEPAT,
      Apellido_materno = APEMAT,
      Sexo = SEXO,
      Celular = MOVIL,
      Direccion = DIRECCION,
      Fecha_matricula = FECHAMATRI,
      Fecha_egreso = FECHAEGRE,
      correo_personal = EMAPER,
      correo_institucional = EMAINSTI,
      Observaciones = OBERSER,
      Años_transcurridos = @AÑO,
      Meses_transcurridos = @MES,
      Dias_transcurridos = @DIA,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Dni = NDOCUMENTO;

    UPDATE expediente 
    SET
      Id_escuela = IDESCUE,
      Titulo_de = TITU,
      Modalidad = MODA,
      Acto_academico = ACTOACA,
      Acuerdo = ACUER,
      Resolucion_rectoral_N = RESOL,
      Expedicion = EXPE,
      Libro = LIB,
      Folio = FOLI,
      Registro = REGIS,
      Archivo = RUTA,
      Id_usuario = USU,
      estado = 'PROCESO',
      id_usuario = USU,
			id_autoridad=ID_AUTO,
      updated_at = FECHA
    WHERE Id_expediente = IDEXPE;

    UPDATE modalidad 
    SET
      Modo_obtencion = MODA,
      Abreviatura_modo_estudio = 'P',
      Modo_estudio = MODO_ESTU,
      Trabajo_investigacion = TRABA_INV,
      Turnitin = TURNITIN,
      Porcentaje = PORCENTAJE,
      Centro_investigacion = CENTRO_INVE,
      Reglamento_metadado = REGLA_META,
      Proce_bachiller = PRO_BACH,
      Proce_insti_origen = PRO_INST,
      Proce_titulo_peda = PRO_TITU,
      Fecha_matricula_modalidad = FECHA_MATRI_MOD,
      Fecha_inicio_modalidad = FECHA_INIC_MOD,
      Fecha_fin_modalidad = FECHA_FIN_MOD,
      Modo_sustentacion = MODO_SUSTE,
      Id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_modalidad = IDMODA;

    UPDATE diploma 
    SET
		  fecha_consejo_uni=FECHACU,
			fecha_firma=FECHAFIRMA,
      Resolucion_numero = RESOLDIPLO,
			fecha_resolucion=FECHARESO,
      Diploma_numero = NUMDIPLO,
      Registro_numero = REGINUM,
      Registro_libro = REGISLIB,
      Registro_folio = REGISFOL,
      Diploma_tipo_emitido = TIPODIPLO,
      Fecha_inicio_tramite = FECHA_INI_TRA,
      Fecha_finalizacion_tramite = CURDATE(),
      años_trans = @AÑODIPLO,
      mes_trans = @MESDIPLO,
      dia_trand = @DIADIPLO,
      Nro_creditos = NROCREDI,
      Nro_oficio = NROOFICIO,
			fecha_secreatria_general=FECHASECRE,
      id_usuario = USU,
      updated_at = CURDATE()
    WHERE Id_Diploma = IDDIPLO;

    SELECT 1;
  ELSE
    SELECT 2;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `ID` VARCHAR(255), IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25), IN `SED` INT)   UPDATE usuario SET
usuario.empleado_id = IDEMPLEADO,
usuario.area_id=IDAREA,
usuario.usu_rol=ROL,
usuario.updated_at=NOW(),
usuario.id_sede=SED
WHERE usuario.usu_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO_CONTRA` (IN `ID` INT, IN `CONTRA` VARCHAR(250))   UPDATE usuario SET
usuario.usu_contra=CONTRA
WHERE usuario.usu_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO_ESTATUS` (IN `ID` INT, IN `ESTATUS` VARCHAR(20))   UPDATE usuario SET
usuario.usu_estatus=ESTATUS
WHERE usuario.usu_id=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_AREA` (IN `NAREA` VARCHAR(255))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM area where area_nombre=NAREA);
IF @CANTIDAD = 0 THEN
INSERT INTO area(area_nombre,area_fecha_registro)VALUE(NAREA,NOW());
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_AUTORIDAD` (IN `AUTO1` VARCHAR(100), IN `CARGO1` VARCHAR(100), IN `AUTO2` VARCHAR(100), IN `CARGO2` VARCHAR(100), IN `AUTO3` VARCHAR(100), IN `CARGO3` VARCHAR(100))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM autoridades WHERE Autoridad_1=AUTO1 AND Autoridad_2=AUTO2 AND Autoridad_3=AUTO3);
IF @CANTIDAD=0 THEN
INSERT INTO autoridades(Autoridad_1,Cargo_auto1,Autoridad_2,Cargo_auto2,Autoridad_3,Cargo_auto3,created_at,updated_at,Id_empresa,estado)VALUES(AUTO1,CARGO1,AUTO2,CARGO2,AUTO3,CARGO3,NOW(),'',2,'ACTIVO');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_BACHILLER` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `IDESCUE` INT, IN `BACH` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
DECLARE cantidad INT;
DECLARE cod char(12);
DECLARE verificar INT;
DECLARE conteo INT;
DECLARE ulti int;
DECLARE ULID INT;


SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));
SET @cantidad :=(SELECT IFNULL(MAX(doc_ncorrelativo),0) FROM expediente );
IF @cantidad >= 1 AND @cantidad <= 8 THEN
SET @cod :=(SELECT CONCAT('E000000',(@cantidad+1)));
ELSEIF @cantidad >= 9 AND @cantidad <= 98 THEN
SET @cod :=(SELECT CONCAT('E00000',(@cantidad+1)));
ELSEIF @cantidad >= 99 AND @cantidad <= 998 THEN
SET @cod :=(SELECT CONCAT('E0000',(@cantidad+1)));
ELSEIF @cantidad >= 999 AND @cantidad <= 9998 THEN
SET @cod :=(SELECT CONCAT('E000',(@cantidad+1)));
ELSEIF @cantidad >= 9999 AND @cantidad <= 99998 THEN
SET @cod :=(SELECT CONCAT('E00',(@cantidad+1)));
ELSEIF @cantidad >= 99999 AND @cantidad <= 999998 THEN
SET @cod :=(SELECT CONCAT('E0',(@cantidad+1)));
ELSEIF @cantidad >= 999999 THEN
SET @cod :=(SELECT CONCAT('E',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('E0000001'));
END IF;
SET @verificar:=(SELECT COUNT(*) FROM expediente where Dni=NDOCUMENTO and Id_escuela=IDESCUE);
IF @verificar = 0 THEN
SET @conteo:=(SELECT COUNT(*) FROM estudiante where Dni=NDOCUMENTO);
	IF @conteo > 0 THEN
	UPDATE estudiante SET
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	correo_personal=EMAPER,
	correo_institucional=EMAINSTI,
	Observaciones = OBERSER,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=USU,
	 updated_at=NOW()
	WHERE Dni=NDOCUMENTO; 
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,'',BACH,MODA,'',ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

	INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA');
	SELECT 1;
	ELSE
	INSERT INTO estudiante(Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,'',BACH,MODA,'',ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));


	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

	INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA');
	SELECT 1;
	END IF;
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CARRERAS` (IN `ESCUE` CHAR(11), IN `NOMBREES` VARCHAR(100), IN `GRADOACA` VARCHAR(100), IN `ABRE` CHAR(2), IN `DENOMI` VARCHAR(100), IN `PROGRAMA` VARCHAR(100), IN `CRED` INT, IN `FACUL` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM escuela_profesional WHERE Nombre=NOMBREES AND Grado_academico=GRADOACA AND `Denominación_grado`=DENOMI);
IF @CANTIDAD=0 THEN
INSERT INTO escuela_profesional(Cod_Escuela,Nombre,Grado_academico,Abreviatura_grado,Denominación_grado,Programa_estudio,Numero_creditos,Id_facultad,created_at,updated_at,estado)VALUES(ESCUE,NOMBREES,GRADOACA,ABRE,DENOMI,PROGRAMA,CRED,FACUL,NOW(),'','ACTIVO');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CEDES` (IN `CED` VARCHAR(255), IN `DESCRIP` VARCHAR(255))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM cede where cede_nombre=CED);
IF @CANTIDAD = 0 THEN
INSERT INTO cede(cede_nombre,descripcion,estado,created_at,updated_at)VALUE(CED,DESCRIP,'ACTIVO',NOW(),'');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COLACION` (IN `COLA` VARCHAR(255), IN `FECHACOLA` DATE, IN `FECHACONSEJO` DATE, IN `FECHAFIRMA` DATE, IN `FECHARESOL` DATE, IN `OFICIIO` VARCHAR(255))   BEGIN
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE ULID INT;
SET @AÑO:=(SELECT YEAR(NOW()));
SET @CANTIDAD:=(SELECT COUNT(*) FROM colacion WHERE colacion.nombre_colacion=COLA and colacion.`fecha_colación`=FECHACOLA);
IF @CANTIDAD=0 THEN
UPDATE colacion
SET estado='PASADO';
INSERT INTO colacion(año,nombre_colacion,fecha_colación,fecha_consejo_uni,fecha_firma_consejo,fecha_resolucion,numero_oficio,estado,created_at,updated_at)VALUES(@AÑO,COLA,FECHACOLA,FECHACONSEJO,FECHAFIRMA,FECHARESOL,OFICIIO,'VIGENTE',NOW(),'');

SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);
UPDATE diploma
set diploma.id_colacion=@ULID
where diploma.estado='SIN DIPLOMA';
SELECT 1;
ELSE
SELECT 2;

END IF;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COLACION_POS` (IN `COLA` VARCHAR(255), IN `FECHACOLA` DATE, IN `FECHACONSEJO` DATE, IN `FECHAFIRMA` DATE, IN `FECHARESOL` DATE, IN `OFICIIO` VARCHAR(255))   BEGIN
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE ULID INT;
SET @AÑO:=(SELECT YEAR(NOW()));
SET @CANTIDAD:=(SELECT COUNT(*) FROM colacion_posgrado WHERE colacion_posgrado.nombre_colacion=COLA and colacion_posgrado.`fecha_colación`=FECHACOLA);
IF @CANTIDAD=0 THEN
UPDATE colacion_posgrado
SET estado='PASADO';
INSERT INTO colacion_posgrado(año,nombre_colacion,fecha_colación,fecha_consejo_uni,fecha_firma_consejo,fecha_resolucion,numero_oficio,estado,created_at,updated_at)VALUES(@AÑO,COLA,FECHACOLA,FECHACONSEJO,FECHAFIRMA,FECHARESOL,OFICIIO,'VIGENTE',NOW(),'');

SET @ULID:=(SELECT MAX(colacion_posgrado.id_colacion) FROM colacion_posgrado);
UPDATE diploma_posgrado
set diploma_posgrado.id_colacion=@ULID
where diploma_posgrado.estado='SIN DIPLOMA';
SELECT 1;
ELSE
SELECT 2;

END IF;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EMPLEADO` (IN `NDOCUMENTO` CHAR(12), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `FECHA` DATE, IN `MOVIL` CHAR(9), `MODALIDAD` VARCHAR(255), IN `DIRECCION` VARCHAR(255), IN `EMAIL` VARCHAR(255))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado WHERE emple_nrodocumento=NDOCUMENTO);
IF @CANTIDAD=0 THEN
INSERT INTO empleado(emple_nrodocumento,emple_nombre,emple_apepat,emple_apemat,emple_fechanacimiento,emple_movil,empl_modalidad,emple_direccion,emple_email,emple_feccreacion,emple_estatus,empl_fotoperfil)VALUES(NDOCUMENTO,NOMBRE,APEPAT,APEMAT,FECHA,MOVIL,MODALIDAD,DIRECCION,EMAIL,CURDATE(),'ACTIVO','controller/empleado/FOTOS/usuario.png');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ESTUDIANTES` (IN `NDOCUMENTO` CHAR(8), IN `CODIGO` CHAR(15), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `IDUSER` INT)   BEGIN
DECLARE CANTIDAD INT;
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));

SET @CANTIDAD:=(SELECT COUNT(*) FROM estudiante WHERE Dni=NDOCUMENTO);
IF @CANTIDAD=0 THEN
INSERT INTO estudiante(Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,@AÑO,@MES,@DIA,IDUSER,CURDATE(),'');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EXPEDIENTE_BA` (IN `CED` INT, IN `DNI` CHAR(8), IN `IDESCUE` INT, IN `DENO` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `FECHA` DATE, IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `AUTORIDAD` INT, IN `IDUSER` INT)   BEGIN
DECLARE cantidad INT;
DECLARE cod char(12);
SET @cantidad :=(SELECT IFNULL(MAX(doc_ncorrelativo),0) FROM expediente );
IF @cantidad >= 1 AND @cantidad <= 8 THEN
SET @cod :=(SELECT CONCAT('E000000',(@cantidad+1)));
ELSEIF @cantidad >= 9 AND @cantidad <= 98 THEN
SET @cod :=(SELECT CONCAT('E00000',(@cantidad+1)));
ELSEIF @cantidad >= 99 AND @cantidad <= 998 THEN
SET @cod :=(SELECT CONCAT('E0000',(@cantidad+1)));
ELSEIF @cantidad >= 999 AND @cantidad <= 9998 THEN
SET @cod :=(SELECT CONCAT('E000',(@cantidad+1)));
ELSEIF @cantidad >= 9999 AND @cantidad <= 99998 THEN
SET @cod :=(SELECT CONCAT('E00',(@cantidad+1)));
ELSEIF @cantidad >= 99999 AND @cantidad <= 999998 THEN
SET @cod :=(SELECT CONCAT('E0',(@cantidad+1)));
ELSEIF @cantidad >= 999999 THEN
SET @cod :=(SELECT CONCAT('E',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('E0000001'));
END IF;
INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Fecha,Expedicion,Libro,Folio,Registro,Archivo,Id_autoridad,Id_usuario,estado,created_at,updated_at,doc_ncorrelativo) VALUES(@cod,CED,DNI,IDESCUE,'',DENO,'','',ACUER,RESOL,FECHA,EXPE,LIB,FOLI,REGIS,RUTA,AUTORIDAD,IDUSER,'PENDIENTE',NOW(),'',(@cantidad+1));
SELECT @cod;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EXPEDIENTE_TI` (IN `CED` INT, IN `DNI` CHAR(8), IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `FECHA` DATE, IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `AUTORIDAD` INT, IN `IDUSER` INT)   BEGIN
DECLARE cantidad INT;
DECLARE cod char(12);
SET @cantidad :=(SELECT IFNULL(MAX(doc_ncorrelativo),0) FROM expediente );
IF @cantidad >= 1 AND @cantidad <= 8 THEN
SET @cod :=(SELECT CONCAT('E000000',(@cantidad+1)));
ELSEIF @cantidad >= 9 AND @cantidad <= 98 THEN
SET @cod :=(SELECT CONCAT('E00000',(@cantidad+1)));
ELSEIF @cantidad >= 99 AND @cantidad <= 998 THEN
SET @cod :=(SELECT CONCAT('E0000',(@cantidad+1)));
ELSEIF @cantidad >= 999 AND @cantidad <= 9998 THEN
SET @cod :=(SELECT CONCAT('E000',(@cantidad+1)));
ELSEIF @cantidad >= 9999 AND @cantidad <= 99998 THEN
SET @cod :=(SELECT CONCAT('E00',(@cantidad+1)));
ELSEIF @cantidad >= 99999 AND @cantidad <= 999998 THEN
SET @cod :=(SELECT CONCAT('E0',(@cantidad+1)));
ELSEIF @cantidad >= 999999 THEN
SET @cod :=(SELECT CONCAT('E',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('E0000001'));
END IF;
INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Fecha,Expedicion,Libro,Folio,Registro,Archivo,Id_autoridad,Id_usuario,estado,created_at,updated_at,doc_ncorrelativo) VALUES(@cod,CED,DNI,IDESCUE,TITU,'',MODA,ACTOACA,ACUER,RESOL,FECHA,EXPE,LIB,FOLI,REGIS,RUTA,AUTORIDAD,IDUSER,'PENDIENTE',NOW(),'',(@cantidad+1));
SELECT @cod;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_FACULTAD` (IN `FACULTAD` VARCHAR(50), IN `AUTO` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM facultad WHERE Nombre=FACULTAD AND Cod_autoridad=AUTO);
IF @CANTIDAD=0 THEN
INSERT INTO facultad(Nombre,Cod_autoridad,estado,created_at,updated_at)VALUES(FACULTAD,AUTO,'ACTIVO',NOW(),'');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MODALIDAD_BACHILLER` (IN `EXPE` CHAR(12), IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM modalidad WHERE Id_expediente=EXPE);
IF @CANTIDAD=0 THEN
INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODO_OB,'P',MODO_ESTU,'','','','','',PRO_BACH,PRO_INST,PRO_TITU,'','','','',USU,EXPE,NOW(),'');
UPDATE expediente
SET expediente.estado='EN PROCESO',
expediente.updated_at=NOW()
WHERE Id_expediente=EXPE;
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MODALIDAD_TITULO` (IN `EXPE` CHAR(12), IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM modalidad WHERE Id_expediente=EXPE);
IF @CANTIDAD=0 THEN
INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODO_OB,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,EXPE,NOW(),'');
UPDATE expediente
SET expediente.estado='EN PROCESO',
expediente.updated_at=NOW()
WHERE Id_expediente=EXPE;
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_POSGRADO` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `PROGRA` INT, IN `DENO` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_PAIS` VARCHAR(255), IN `PRO_UNI` VARCHAR(255), IN `PRO_GRAD` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
	DECLARE AÑO INT;
	DECLARE MES INT;
	DECLARE DIA INT;
	DECLARE cantidad INT;
	DECLARE cod char(12);
	DECLARE verificar INT;
	DECLARE conteo INT;
	DECLARE ulti int;
	DECLARE ULID INT;
	SET @ULID:=(SELECT MAX(colacion_posgrado.id_colacion) FROM colacion_posgrado);
	SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
	SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
	SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));
	SET @cantidad :=(SELECT IFNULL(MAX(doc_ncorrelativo),0) FROM expediente_posgrado );
	IF @cantidad >= 1 AND @cantidad <= 8 THEN
	SET @cod :=(SELECT CONCAT('E000000',(@cantidad+1)));
	ELSEIF @cantidad >= 9 AND @cantidad <= 98 THEN
	SET @cod :=(SELECT CONCAT('E00000',(@cantidad+1)));
	ELSEIF @cantidad >= 99 AND @cantidad <= 998 THEN
	SET @cod :=(SELECT CONCAT('E0000',(@cantidad+1)));
	ELSEIF @cantidad >= 999 AND @cantidad <= 9998 THEN
	SET @cod :=(SELECT CONCAT('E000',(@cantidad+1)));
	ELSEIF @cantidad >= 9999 AND @cantidad <= 99998 THEN
	SET @cod :=(SELECT CONCAT('E00',(@cantidad+1)));
	ELSEIF @cantidad >= 99999 AND @cantidad <= 999998 THEN
	SET @cod :=(SELECT CONCAT('E0',(@cantidad+1)));
	ELSEIF @cantidad >= 999999 THEN
	SET @cod :=(SELECT CONCAT('E',(@cantidad+1)));
	ELSE
	SET @cod :=(SELECT CONCAT('E0000001'));
	END IF;
	SET @verificar:=(SELECT COUNT(*) FROM expediente_posgrado where expediente_posgrado.Dni=NDOCUMENTO and expediente_posgrado.Id_programa=PROGRA);
	IF @verificar = 0 THEN
	SET @conteo:=(SELECT COUNT(*) FROM estudiante_posgrado where estudiante_posgrado.Dni=NDOCUMENTO);
		IF @conteo > 0 THEN
		UPDATE estudiante_posgrado SET
		Codigo=CODIGO,
		Nombres=NOMBRE,
		Apellido_paterno=APEPAT,
		Apellido_materno=APEMAT,
		Sexo=SEXO,
		Celular=MOVIL,
		Direccion=DIRECCION,
		Fecha_matricula=FECHAMATRI,
		Fecha_egreso=FECHAEGRE,
		correo_personal=EMAPER,
		correo_institucional=EMAINSTI,
		Observaciones = OBERSER,
		Años_transcurridos=@AÑO,
		Meses_transcurridos=@MES,
		Dias_transcurridos=@DIA,
		id_usuario=USU,
		 updated_at=CURDATE()
		WHERE Dni=NDOCUMENTO; 
		INSERT INTO expediente_posgrado(Id_expediente,Id_cede,Dni,Id_programa,Grado_maestro_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,PROGRA,DENO,MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));

		INSERT INTO modalidad_posgrado(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_pais_ext,Proce_univ_ext,Proce_grado_ext,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_PAIS,PRO_UNI,PRO_GRAD,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
		SET @ulti:=(SELECT MAX(modalidad_posgrado.Id_modalidad) AS id FROM modalidad_posgrado);

		INSERT INTO diploma_posgrado(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','O','','','','','','',USU,@ulti,@ULID,'',NOW(),'SIN DIPLOMA');
		SELECT 1;
		
		ELSE
		
		INSERT INTO estudiante_posgrado(Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
		
		INSERT INTO expediente_posgrado(Id_expediente,Id_cede,Dni,Id_programa,Grado_maestro_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,PROGRA,DENO,MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));


		INSERT INTO modalidad_posgrado(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_pais_ext,Proce_univ_ext,Proce_grado_ext,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_PAIS,PRO_UNI,PRO_GRAD,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
		SET @ulti:=(SELECT MAX(modalidad_posgrado.Id_modalidad) AS id FROM modalidad_posgrado);

		INSERT INTO diploma_posgrado(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','O','','','','','','',USU,@ulti,@ULID,'',NOW(),'SIN DIPLOMA');
		SELECT 1;
		END IF;
		SELECT 1;
	ELSE
		SELECT 2;
	END IF;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROGRAMA` (IN `NOMBRES` VARCHAR(100), IN `GRADOACA` VARCHAR(100), IN `ABRE` CHAR(2), IN `DENOMI` VARCHAR(100), IN `PROGRAMA` VARCHAR(100), IN `CRED` INT, IN `DIRE` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM programa_posgrado WHERE Nombre=NOMBRES AND Grado_academico=GRADOACA AND `Denominación_grado`=DENOMI);
IF @CANTIDAD=0 THEN
INSERT INTO programa_posgrado(Nombre,Grado_academico,Abreviatura_grado,Denominación_grado,Programa_estudio,Numero_creditos,Estado,id_autoridad,created_at,updated_at)VALUES(NOMBRES,GRADOACA,ABRE,DENOMI,PROGRAMA,CRED,'ACTIVO',DIRE,NOW(),'');
SELECT 1;
ELSE
SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TITULADO` (IN `NDOCUMENTO` CHAR(8), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
DECLARE AÑO INT;
DECLARE MES INT;
DECLARE DIA INT;
DECLARE cantidad INT;
DECLARE cod char(12);
DECLARE verificar INT;
DECLARE conteo INT;
DECLARE ulti int;
DECLARE ULID INT;
SET @AÑO:=(TIMESTAMPDIFF( YEAR, FECHAMATRI, FECHAEGRE));
SET @MES:=(TIMESTAMPDIFF( MONTH, FECHAMATRI, FECHAEGRE) % 12);
SET @DIA:=(FLOOR( TIMESTAMPDIFF( DAY, FECHAMATRI, FECHAEGRE) % 30.4375 ));
SET @cantidad :=(SELECT IFNULL(MAX(doc_ncorrelativo),0) FROM expediente );
IF @cantidad >= 1 AND @cantidad <= 8 THEN
SET @cod :=(SELECT CONCAT('E000000',(@cantidad+1)));
ELSEIF @cantidad >= 9 AND @cantidad <= 98 THEN
SET @cod :=(SELECT CONCAT('E00000',(@cantidad+1)));
ELSEIF @cantidad >= 99 AND @cantidad <= 998 THEN
SET @cod :=(SELECT CONCAT('E0000',(@cantidad+1)));
ELSEIF @cantidad >= 999 AND @cantidad <= 9998 THEN
SET @cod :=(SELECT CONCAT('E000',(@cantidad+1)));
ELSEIF @cantidad >= 9999 AND @cantidad <= 99998 THEN
SET @cod :=(SELECT CONCAT('E00',(@cantidad+1)));
ELSEIF @cantidad >= 99999 AND @cantidad <= 999998 THEN
SET @cod :=(SELECT CONCAT('E0',(@cantidad+1)));
ELSEIF @cantidad >= 999999 THEN
SET @cod :=(SELECT CONCAT('E',(@cantidad+1)));
ELSE
SET @cod :=(SELECT CONCAT('E0000001'));
END IF;
SET @verificar:=(SELECT COUNT(*) FROM expediente where Dni=NDOCUMENTO and Id_escuela=IDESCUE);
IF @verificar = 0 THEN
SET @conteo:=(SELECT COUNT(*) FROM estudiante where Dni=NDOCUMENTO);
	IF @conteo > 0 THEN
	UPDATE estudiante SET
	Codigo=CODIGO,
	Nombres=NOMBRE,
	Apellido_paterno=APEPAT,
	Apellido_materno=APEMAT,
	Sexo=SEXO,
	Celular=MOVIL,
	Direccion=DIRECCION,
	Fecha_matricula=FECHAMATRI,
	Fecha_egreso=FECHAEGRE,
	correo_personal=EMAPER,
	correo_institucional=EMAINSTI,
	Observaciones = OBERSER,
	Años_transcurridos=@AÑO,
	Meses_transcurridos=@MES,
	Dias_transcurridos=@DIA,
	id_usuario=USU,
	 updated_at=CURDATE()
	WHERE Dni=NDOCUMENTO; 
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,TITU,'',MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

		INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA');
	SELECT 1;
	ELSE
	INSERT INTO estudiante(Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,TITU,'',MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

		INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA');
	SELECT 1;
	END IF;
	SELECT 1;
ELSE
	SELECT 2;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO` (IN `USU` VARCHAR(255), IN `CONTRA` VARCHAR(255), IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25), IN `SED` INT)   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usu_usuario=USU);
IF @CANTIDAD=0 THEN
INSERT INTO usuario(usu_usuario,usu_contra,empleado_id,area_id,usu_rol,usu_feccreacion,usu_estatus,empresa_id,created_at,id_sede)VALUES(USU,CONTRA,IDEMPLEADO,IDAREA,ROL,CURDATE(),'ACTIVO',2,NOW(),SED);
SELECT 1;
ELSE
SELECT 2;
END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO` (IN `USU` VARCHAR(250))   SELECT
        usuario.usu_id, 
        usuario.usu_usuario, 
        usuario.usu_contra, 
        usuario.usu_feccreacion, 
        usuario.empleado_id, 
        usuario.usu_estatus, 
        usuario.area_id, 
        usuario.usu_rol, 
        usuario.empresa_id,
        usuario.id_sede, 
        area.area_nombre, 
        area.area_cod, 
        empleado.emple_nombre, 
        empleado.emple_apepat, 
        empleado.emple_apemat, 
        CONCAT_WS(' ', empleado.emple_nombre, empleado.emple_apepat, empleado.emple_apemat) AS USUARIO, 
        empleado.empl_fotoperfil, 
        empresa.emp_logo,
        empresa.emp_razon,
				usuario.id_sede
    FROM
        usuario
        INNER JOIN area ON usuario.area_id = area.area_cod
        INNER JOIN empleado ON usuario.empleado_id = empleado.empleado_id
        INNER JOIN empresa ON usuario.empresa_id = empresa.empresa_id
    WHERE usuario.usu_usuario = BINARY USU$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `area_cod` int(11) NOT NULL COMMENT 'Codigo auto-incrementado del movimiento del area',
  `area_nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del area',
  `area_fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'fecha del registro del movimiento',
  `area_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'estado del area',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Entidad Area' ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`area_cod`, `area_nombre`, `area_fecha_registro`, `area_estado`, `created_at`, `updated_at`) VALUES
(1, 'MESA DE PARTES', '2023-08-25 14:08:00', 'ACTIVO', NULL, NULL),
(2, 'SISTEMA WEB', '2023-08-25 14:08:07', 'INACTIVO', NULL, NULL),
(3, 'CONTABILIDAD', '2024-06-09 23:07:52', 'ACTIVO', NULL, NULL),
(4, 'PATRIMONIO', '2023-08-25 18:30:29', 'ACTIVO', NULL, NULL),
(5, 'ESTADISTICA', '2023-08-25 18:30:37', 'ACTIVO', NULL, NULL),
(6, 'EPIDEMIOLOGIA', '2023-08-25 18:30:57', 'ACTIVO', NULL, NULL),
(7, 'DIRECCION GENERAL', '2023-08-25 18:31:09', 'ACTIVO', NULL, NULL),
(8, 'RECURSOS HUMANOS', '2023-08-25 18:32:09', 'ACTIVO', NULL, NULL),
(9, 'PLANIFICACION', '2023-09-18 20:43:13', 'ACTIVO', NULL, NULL),
(10, 'PANIFICACIÓN', '2024-03-19 17:22:10', 'ACTIVO', NULL, NULL),
(11, 'PLANEAMIENTO', '2024-03-19 21:34:33', 'ACTIVO', NULL, NULL),
(12, 'HOLA', '2024-08-02 00:36:29', 'ACTIVO', NULL, NULL),
(13, 'DIRESA', '2024-08-12 02:04:33', 'ACTIVO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autoridades`
--

CREATE TABLE `autoridades` (
  `Cod_autoridad` int(11) NOT NULL,
  `Autoridad_1` varchar(100) NOT NULL,
  `Cargo_auto1` enum('RECTOR','SECRETARIA GENERAL','DECANO') NOT NULL,
  `Autoridad_2` varchar(100) NOT NULL,
  `Cargo_auto2` enum('RECTOR','SECRETARIA GENERAL','DECANO') DEFAULT NULL,
  `Autoridad_3` varchar(100) DEFAULT NULL,
  `Cargo_auto3` enum('RECTOR','SECRETARIA GENERAL','DECANO','DIRECTOR') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `Id_empresa` int(11) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autoridades`
--

INSERT INTO `autoridades` (`Cod_autoridad`, `Autoridad_1`, `Cargo_auto1`, `Autoridad_2`, `Cargo_auto2`, `Autoridad_3`, `Cargo_auto3`, `created_at`, `updated_at`, `Id_empresa`, `estado`) VALUES
(1, 'DR. ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'MG. JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'MG. JUAN ALARCON CAMACHO', 'DECANO', '2024-05-25 22:19:18', '2024-08-16 17:00:44', 2, 'ACTIVO'),
(2, 'ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'BONIFACIO ROBLES AGUIRRE', 'DECANO', '2024-05-30 21:55:20', '2024-06-02 10:40:51', 2, 'ACTIVO'),
(3, 'ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'GILDA LUCY LOAYZA ROJAS ', 'DECANO', '2024-05-30 21:56:25', '2024-06-15 09:08:06', 2, 'ACTIVO'),
(6, 'DR. ZENóN HUMBERTO ARéVALO MEZARINA', 'RECTOR', 'MAG. ALFREDO MARISCAL ZúNIGA', 'SECRETARIA GENERAL', 'MAG. ALFREDO MARISCAL ZúNIGA', 'DIRECTOR', '2024-06-22 20:39:26', '0000-00-00 00:00:00', 2, 'ACTIVO'),
(7, 'DR. RAMIRO TRUJILLO ROMAN', 'RECTOR', 'DR. JOSE SANCHEZ JIMENEZ', 'SECRETARIA GENERAL', 'DR. TORIBIO TAPIA MOLINA', 'DECANO', '2024-06-29 02:29:31', '2024-08-03 10:16:59', 2, 'ACTIVO'),
(8, 'DR.ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'MG.JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'MG. JORGE MEDINA PEÑA', 'DIRECTOR', '2024-08-03 15:41:42', '2024-08-03 10:41:58', 2, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cede`
--

CREATE TABLE `cede` (
  `Id_cede` int(11) NOT NULL,
  `cede_nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cede`
--

INSERT INTO `cede` (`Id_cede`, `cede_nombre`, `descripcion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'SEDE ABANCAY', 'ES LA SEDE PRINCIPAL', 'ACTIVO', '2024-06-18 15:12:11', '2024-08-03 10:27:49'),
(2, 'ANDAHUAYLAS ', 'SEDE QUE SE ENCUENTRA EN ANADAHUAYLAS CON 7 CARRERAS', 'ACTIVO', '2024-06-18 15:18:29', '2024-07-18 16:16:07'),
(3, 'CUSCO', 'SEDE EN LA CIUDAD IMPERIAL CONSTA DE 6 CARRERAS PROFESIONALES', 'ACTIVO', '2024-06-18 15:18:45', '2024-07-18 16:16:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colacion`
--

CREATE TABLE `colacion` (
  `id_colacion` int(11) NOT NULL,
  `año` int(11) DEFAULT NULL,
  `nombre_colacion` varchar(255) DEFAULT NULL,
  `fecha_colación` date DEFAULT NULL,
  `fecha_consejo_uni` date DEFAULT NULL,
  `fecha_firma_consejo` date DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `numero_oficio` varchar(255) DEFAULT NULL,
  `estado` enum('VIGENTE','PASADO') DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colacion`
--

INSERT INTO `colacion` (`id_colacion`, `año`, `nombre_colacion`, `fecha_colación`, `fecha_consejo_uni`, `fecha_firma_consejo`, `fecha_resolucion`, `numero_oficio`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2024, 'colación 05 de abril', '2024-04-05', '2024-03-20', '2024-03-21', '2024-03-21', 'Oficio N. 049-2024-UTEA-SG\r\n', 'PASADO', '2024-04-02', NULL),
(2, 2024, '26 DE JULIO DEL 2024-100', '2024-07-26', '2024-07-15', '2024-07-16', '2024-07-16', '599', 'PASADO', '2024-07-23', '2024-07-23 15:25:41'),
(3, 2024, '13 DE SETIEMBRE 2024', '2024-09-13', '2024-08-29', '2024-08-29', '2024-08-28', '6966', 'VIGENTE', '2024-08-11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colacion_posgrado`
--

CREATE TABLE `colacion_posgrado` (
  `id_colacion` int(11) NOT NULL,
  `año` int(11) DEFAULT NULL,
  `nombre_colacion` varchar(255) DEFAULT NULL,
  `fecha_colación` date DEFAULT NULL,
  `fecha_consejo_uni` date DEFAULT NULL,
  `fecha_firma_consejo` date DEFAULT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  `numero_oficio` varchar(255) DEFAULT NULL,
  `estado` enum('VIGENTE','PASADO') DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colacion_posgrado`
--

INSERT INTO `colacion_posgrado` (`id_colacion`, `año`, `nombre_colacion`, `fecha_colación`, `fecha_consejo_uni`, `fecha_firma_consejo`, `fecha_resolucion`, `numero_oficio`, `estado`, `created_at`, `updated_at`) VALUES
(2, 2024, '26 DE JULIO DEL 2024-100', '2024-07-26', '2024-07-15', '2024-07-16', '2024-07-16', '599', 'PASADO', '2024-07-23', '2024-07-23 15:25:41'),
(3, 2024, '30 DE AGOSTO DE 2024', '2024-08-31', '2024-08-20', '2024-08-20', '2024-08-20', '2444', 'VIGENTE', '2024-08-11', '2024-08-11 15:56:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diploma`
--

CREATE TABLE `diploma` (
  `Id_Diploma` int(11) NOT NULL,
  `fecha_consejo_uni` date DEFAULT NULL,
  `fecha_firma` date DEFAULT NULL,
  `Resolucion_numero` int(11) NOT NULL,
  `fecha_resolucion` varchar(255) DEFAULT NULL,
  `Diploma_numero` int(11) NOT NULL,
  `Registro_numero` int(11) DEFAULT NULL,
  `Registro_libro` int(11) NOT NULL,
  `Registro_folio` text NOT NULL,
  `Diploma_tipo_emitido` char(1) NOT NULL,
  `Fecha_inicio_tramite` date DEFAULT NULL,
  `Fecha_finalizacion_tramite` date DEFAULT NULL,
  `años_trans` int(11) DEFAULT NULL,
  `mes_trans` int(11) DEFAULT NULL,
  `dia_trand` int(11) DEFAULT NULL,
  `Nro_creditos` int(11) DEFAULT NULL,
  `Nro_oficio` varchar(255) DEFAULT NULL,
  `fecha_secreatria_general` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_modalidad` int(11) DEFAULT NULL,
  `id_colacion` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `estado` enum('SIN DIPLOMA','CON DIPLOMA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diploma`
--

INSERT INTO `diploma` (`Id_Diploma`, `fecha_consejo_uni`, `fecha_firma`, `Resolucion_numero`, `fecha_resolucion`, `Diploma_numero`, `Registro_numero`, `Registro_libro`, `Registro_folio`, `Diploma_tipo_emitido`, `Fecha_inicio_tramite`, `Fecha_finalizacion_tramite`, `años_trans`, `mes_trans`, `dia_trand`, `Nro_creditos`, `Nro_oficio`, `fecha_secreatria_general`, `id_usuario`, `id_modalidad`, `id_colacion`, `created_at`, `updated_at`, `estado`) VALUES
(0, '0000-00-00', '0000-00-00', 0, '', 0, NULL, 0, '', '', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, '0000-00-00', '0000-00-00 00:00:00', ''),
(1, '2024-03-21', '2024-03-22', 909, '2024-03-22', 16413, 36727, 369, '176', 'O', '2024-01-02', '2024-07-07', 0, 6, 4, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-03-28', 2, 1, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(2, '2024-03-21', '2024-03-22', 908, '2024-03-22', 16412, 36726, 369, '176', 'O', '2024-01-02', '2024-07-07', 0, 6, 4, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-03-28', 2, 2, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(3, '2024-03-21', '2024-03-22', 907, '2024-03-22', 16411, 36725, 369, '176', 'O', '2024-03-10', '2024-07-07', 0, 3, 27, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-03-28', 2, 3, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(4, '2024-03-21', '2024-03-22', 905, '2024-03-22', 16409, 36723, 369, '176', 'O', '2024-01-08', '2024-07-07', 0, 5, 28, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-03-28', 2, 4, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(5, '2024-06-10', '2024-06-11', 909, '2024-06-11', 16413, 36727, 371, '206', 'O', '2024-01-08', '2024-07-07', 0, 5, 28, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-06-27', 2, 5, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(6, '2024-03-20', '2024-03-21', 887, '2024-03-21', 16391, 36705, 369, '174', 'O', '2024-01-10', '2024-07-07', 0, 5, 26, 212, 'OFICIO N. 049-2024-UTEA-SG', '2024-04-15', 2, 10, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(7, '2024-03-20', '2024-03-21', 885, '2024-03-21', 16389, 36703, 369, '174', 'O', '2024-01-03', '2024-07-07', 0, 6, 3, 210, 'OFICIO N. 049-2024-UTEA-SG', '2024-05-05', 2, 11, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(8, '2024-03-20', '2024-03-21', 888, '2024-03-21', 16392, 36706, 369, '174', 'O', '2024-01-17', '2024-07-07', 0, 5, 19, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-05-05', 2, 12, 1, '0000-00-00', '2024-07-07 00:00:00', 'CON DIPLOMA'),
(9, '2024-03-20', '2024-03-21', 889, '2024-03-21', 16393, 36707, 369, '174', 'O', '2023-12-26', '2024-07-17', 0, 6, 21, 212, 'OFICIO N. 049-2024-UTEA-SG', '2024-05-05', 2, 13, 1, '0000-00-00', '2024-07-17 00:00:00', 'CON DIPLOMA'),
(10, '2024-03-20', '2024-03-21', 892, '2024-03-21', 16396, 36710, 369, '174', 'O', '2023-12-26', '2024-07-17', 0, 6, 21, 212, 'OFICIO N. 049-2024-UTEA-SG', '2024-05-05', 2, 14, 1, '0000-00-00', '2024-07-17 00:00:00', 'CON DIPLOMA'),
(11, '2022-04-19', '2022-04-20', 1347, '2022-04-20', 14461, 31753, 319, '310 - 311', 'O', '2024-02-01', '2024-07-16', 0, 5, 13, 220, '955959', '2022-06-02', 2, 15, 1, '0000-00-00', '2024-07-16 14:18:32', 'CON DIPLOMA'),
(13, '2024-03-21', '2024-03-22', 627, '2024-03-22', 14185, 36445, 366, '136-137', 'O', '2024-02-03', '2024-07-19', 0, 5, 14, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-04-10', 2, 18, 1, '0000-00-00', '2024-07-19 17:59:21', 'CON DIPLOMA'),
(15, '2024-03-20', '2024-03-21', 629, '2024-03-21', 14187, 36447, 366, '136', 'O', '2024-01-29', '2024-07-17', 0, 5, 17, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-05-05', 2, 20, 1, '0000-00-00', '2024-07-17 00:00:00', 'CON DIPLOMA'),
(16, '2024-07-09', '2024-07-10', 1510, '2024-07-10', 16475, 37155, 372, '226-227', 'O', '2024-04-02', '2024-07-19', 0, 3, 16, 220, '565', '2024-07-26', 2, 21, 1, '0000-00-00', '2024-07-19 14:21:04', 'CON DIPLOMA'),
(17, '2024-07-09', '2024-07-10', 1511, '2024-07-10', 16476, 37156, 372, '226-227', 'O', '2024-04-02', '2024-07-19', 0, 3, 16, 220, '565', '2024-07-26', 2, 22, 1, '0000-00-00', '2024-07-19 14:26:38', 'CON DIPLOMA'),
(18, '2024-03-20', '2024-03-21', 910, '2024-03-21', 16414, 36728, 369, '176', 'O', '2024-07-20', '2024-08-16', 0, 0, 27, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-04-05', 2, 23, 1, '0000-00-00', '2024-08-16 00:00:00', 'CON DIPLOMA'),
(19, '2024-03-20', '2024-03-21', 633, '2024-03-21', 14191, 36451, 366, '140 - 141', 'O', '2024-02-22', '2024-07-21', 0, 4, 28, 220, 'OFICIO N. 049-2024-UTEA-SG', '2024-04-05', 2, 24, 1, '0000-00-00', '2024-07-21 12:45:43', 'CON DIPLOMA'),
(20, '2020-08-13', '2020-08-14', 587, '2020-08-14', 8938, 29343, 295, '386-387', 'O', '2020-01-05', '2024-07-21', 4, 6, 15, 220, '22626', '2020-10-16', 2, 25, 1, '0000-00-00', '2024-07-21 12:37:21', 'CON DIPLOMA'),
(21, '2024-07-15', '2024-07-16', 634, '2024-07-16', 14192, 36452, 367, '140 - 141', 'O', '2024-04-03', '2024-08-03', 0, 4, 0, 220, '559', '2024-07-26', 2, 26, 2, '0000-00-00', '2024-08-03 11:44:57', 'CON DIPLOMA'),
(22, '2024-07-15', '0000-00-00', 0, '2024-07-16', 0, 0, 0, '0', '', '0000-00-00', '2024-08-16', 0, 4, 0, 220, '', '0000-00-00', 2, 27, 3, '0000-00-00', '2024-08-16 00:00:00', 'SIN DIPLOMA'),
(24, '2024-07-15', '0000-00-00', 0, '2024-07-16', 0, 0, 0, '0', '', '0000-00-00', '2024-08-16', 0, 4, 0, 0, '', '0000-00-00', 2, 29, 3, '0000-00-00', '2024-08-16 00:00:00', 'SIN DIPLOMA'),
(25, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 30, 3, '0000-00-00', '2024-08-09 17:12:55', 'SIN DIPLOMA'),
(26, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 31, 3, '0000-00-00', '2024-08-16 15:38:14', 'SIN DIPLOMA'),
(27, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 32, 3, '0000-00-00', '2024-08-16 15:50:12', 'SIN DIPLOMA'),
(28, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 33, 3, '2024-08-16', '2024-08-16 15:56:53', 'SIN DIPLOMA'),
(29, '2024-07-15', '0000-00-00', 0, '2024-07-16', 0, 0, 0, '0', '', '0000-00-00', '2024-08-16', 0, 4, 0, 0, '', '0000-00-00', 2, 34, 3, '2024-08-16', '2024-08-16 00:00:00', 'SIN DIPLOMA'),
(30, '2024-07-15', '2024-07-16', 911, '2024-07-16', 16415, 36729, 370, '176', 'O', '2024-08-23', '2024-08-23', 0, 0, 0, 220, '5655', '2024-07-26', 2, 35, 3, '2024-08-23', '2024-08-23 17:17:55', 'CON DIPLOMA'),
(31, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 36, 3, '2024-09-12', '2024-09-12 16:42:03', 'SIN DIPLOMA'),
(32, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 37, 3, '2024-09-12', '2024-09-12 16:47:33', 'SIN DIPLOMA'),
(33, '2024-08-29', '0000-00-00', 0, '2024-08-28', 0, 0, 0, '0', '', '0000-00-00', '2024-09-12', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 38, 3, '2024-09-12', '2024-09-12 00:00:00', 'SIN DIPLOMA'),
(34, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 39, 3, '2024-09-12', '2024-09-12 16:54:31', 'SIN DIPLOMA'),
(35, '2024-08-29', '2024-08-29', 926, '2024-08-28', 16430, 36744, 385, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 40, 3, '2024-11-15', '2024-11-16 11:55:45', 'CON DIPLOMA'),
(36, '2024-08-29', '2024-08-29', 925, '2024-08-28', 16429, 36743, 384, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 41, 3, '2024-11-15', '2024-11-16 11:53:12', 'CON DIPLOMA'),
(37, '2024-08-29', '2024-08-29', 924, '2024-08-28', 16428, 36742, 383, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 42, 3, '2024-11-15', '2024-11-16 11:52:16', 'CON DIPLOMA'),
(38, '2024-08-29', '2024-08-29', 923, '2024-08-28', 16427, 36741, 382, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 43, 3, '2024-11-15', '2024-11-16 11:50:58', 'CON DIPLOMA'),
(39, '2024-08-29', '2024-08-29', 922, '2024-08-28', 16426, 36740, 381, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 44, 3, '2024-11-15', '2024-11-16 11:50:00', 'CON DIPLOMA'),
(40, '2024-08-29', '2024-08-29', 921, '2024-08-28', 16425, 36739, 380, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 45, 3, '2024-11-15', '2024-11-16 11:48:12', 'CON DIPLOMA'),
(41, '2024-08-29', '2024-08-29', 920, '2024-08-28', 16424, 36738, 379, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 46, 3, '2024-11-15', '2024-11-16 11:43:13', 'CON DIPLOMA'),
(42, '2024-08-29', '2024-08-29', 919, '2024-08-28', 16423, 36737, 378, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 47, 3, '2024-11-15', '2024-11-16 11:40:04', 'CON DIPLOMA'),
(43, '2024-08-29', '2024-08-29', 918, '2024-08-28', 16422, 36736, 377, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 48, 3, '2024-11-15', '2024-11-16 11:38:24', 'CON DIPLOMA'),
(44, '2024-08-29', '2024-08-29', 917, '2024-08-28', 16421, 36735, 376, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 49, 3, '2024-11-16', '2024-11-16 11:34:19', 'CON DIPLOMA'),
(45, '2024-08-29', '2024-08-29', 916, '2024-08-28', 16420, 36734, 375, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 50, 3, '2024-11-16', '2024-11-16 11:25:59', 'CON DIPLOMA'),
(46, '2024-08-29', '2024-08-29', 915, '2024-08-28', 16419, 36733, 374, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 51, 3, '2024-11-16', '2024-11-16 11:21:17', 'CON DIPLOMA'),
(47, '2024-08-29', '2024-08-29', 914, '2024-08-28', 16418, 36732, 373, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 52, 3, '2024-11-16', '2024-11-16 11:19:24', 'CON DIPLOMA'),
(48, '2024-08-29', '2024-08-29', 913, '2024-08-28', 16417, 36731, 372, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 53, 3, '2024-11-16', '2024-11-16 11:15:57', 'CON DIPLOMA'),
(49, '2024-08-29', '2024-08-29', 912, '2024-08-28', 16416, 36730, 371, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 54, 3, '2024-11-16', '2024-11-16 11:07:26', 'CON DIPLOMA'),
(50, '2024-08-29', '2024-08-29', 927, '2024-08-28', 16431, 36745, 386, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 55, 3, '2024-11-16', '2024-11-16 11:58:31', 'CON DIPLOMA'),
(51, '2024-08-29', '2024-08-29', 928, '2024-08-28', 16432, 36746, 387, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 56, 3, '2024-11-16', '2024-11-16 12:04:48', 'CON DIPLOMA'),
(52, '2024-08-29', '2024-08-29', 929, '2024-08-28', 16433, 36747, 388, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 57, 3, '2024-11-16', '2024-11-16 12:06:48', 'CON DIPLOMA'),
(53, '2024-08-29', '2024-08-29', 930, '2024-08-28', 16434, 36748, 389, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 58, 3, '2024-11-16', '2024-11-16 12:10:42', 'CON DIPLOMA'),
(54, '2024-08-29', '2024-08-29', 931, '2024-08-28', 16435, 36749, 390, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 59, 3, '2024-11-16', '2024-11-16 12:13:36', 'CON DIPLOMA'),
(55, '2024-08-29', '2024-08-29', 932, '2024-08-28', 16436, 36750, 391, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 60, 3, '2024-11-16', '2024-11-16 12:16:38', 'CON DIPLOMA'),
(56, '2024-08-29', '2024-08-29', 933, '2024-08-28', 16437, 36751, 392, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 61, 3, '2024-11-16', '2024-11-16 12:43:44', 'CON DIPLOMA'),
(57, '2024-08-29', '2024-08-29', 934, '2024-08-28', 16438, 36752, 393, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 62, 3, '2024-11-16', '2024-11-16 12:46:20', 'CON DIPLOMA'),
(58, '2024-08-29', '2024-08-29', 935, '2024-08-28', 16439, 36753, 394, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 63, 3, '2024-11-16', '2024-11-16 13:21:18', 'CON DIPLOMA'),
(59, '2024-08-29', '2024-08-29', 936, '2024-08-28', 16440, 36754, 395, '176', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 220, '6966', '2024-09-13', 2, 64, 3, '2024-11-16', '2024-11-16 13:24:00', 'CON DIPLOMA'),
(60, '2024-08-29', '0000-00-00', 0, '2024-08-28', 0, 0, 0, '0', '', '0000-00-00', '2024-11-17', NULL, NULL, NULL, 0, '', '0000-00-00', 10, 65, 3, '2024-11-17', '2024-11-17 00:00:00', 'SIN DIPLOMA'),
(61, '2024-08-29', '0000-00-00', 0, '2024-08-28', 0, 0, 0, '0', '', '0000-00-00', '2024-11-17', NULL, NULL, NULL, 0, '', '0000-00-00', 10, 66, 3, '2024-11-17', '2024-11-17 00:00:00', 'SIN DIPLOMA'),
(62, '2024-08-29', '0000-00-00', 0, '2024-08-28', 0, 0, 0, '0', '', '0000-00-00', '2024-11-17', NULL, NULL, NULL, 0, '', '0000-00-00', 10, 67, 3, '2024-11-17', '2024-11-17 00:00:00', 'SIN DIPLOMA'),
(63, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 10, 68, 3, '2024-11-17', '2024-11-17 14:37:47', 'SIN DIPLOMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diploma_posgrado`
--

CREATE TABLE `diploma_posgrado` (
  `Id_Diploma` int(11) NOT NULL,
  `fecha_consejo_uni` date DEFAULT NULL,
  `fecha_firma` date DEFAULT NULL,
  `Resolucion_numero` varchar(30) NOT NULL,
  `fecha_resolucion` varchar(255) DEFAULT NULL,
  `Diploma_numero` int(11) NOT NULL,
  `Registro_numero` int(11) DEFAULT NULL,
  `Registro_libro` int(11) NOT NULL,
  `Registro_folio` text NOT NULL,
  `Diploma_tipo_emitido` char(1) NOT NULL,
  `Fecha_inicio_tramite` date DEFAULT NULL,
  `Fecha_finalizacion_tramite` date DEFAULT NULL,
  `años_trans` int(11) DEFAULT NULL,
  `mes_trans` int(11) DEFAULT NULL,
  `dia_trand` int(11) DEFAULT NULL,
  `Nro_creditos` int(11) DEFAULT NULL,
  `Nro_oficio` varchar(255) DEFAULT NULL,
  `fecha_secreatria_general` varchar(255) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_modalidad` int(11) DEFAULT NULL,
  `id_colacion` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `estado` enum('SIN DIPLOMA','CON DIPLOMA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diploma_posgrado`
--

INSERT INTO `diploma_posgrado` (`Id_Diploma`, `fecha_consejo_uni`, `fecha_firma`, `Resolucion_numero`, `fecha_resolucion`, `Diploma_numero`, `Registro_numero`, `Registro_libro`, `Registro_folio`, `Diploma_tipo_emitido`, `Fecha_inicio_tramite`, `Fecha_finalizacion_tramite`, `años_trans`, `mes_trans`, `dia_trand`, `Nro_creditos`, `Nro_oficio`, `fecha_secreatria_general`, `id_usuario`, `id_modalidad`, `id_colacion`, `created_at`, `updated_at`, `estado`) VALUES
(23, '2024-07-15', '0000-00-00', '', '2024-07-16', 0, 0, 0, '0', '', '0000-00-00', '2024-08-10', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 30, 3, '0000-00-00', '2024-08-10 00:00:00', 'SIN DIPLOMA'),
(25, '2024-07-15', '2024-07-16', '406', '2024-07-16', 13, 12, 1, '2', 'O', '2024-08-10', '2024-08-10', 0, 0, 0, 48, '0035-2024-UTEA-CU', '2024-07-26', 2, 32, 2, '0000-00-00', '2024-08-10 00:00:00', 'CON DIPLOMA'),
(26, '2024-08-20', '2024-08-20', '2324', '2024-08-20', 456, 2344, 33, '22-548', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 48, '2444', '2024-08-31', 2, 33, 3, '0000-00-00', '2024-11-16 13:08:30', 'CON DIPLOMA'),
(27, '2024-08-20', '2024-08-20', '2325', '2024-08-20', 457, 2345, 34, '22-548', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 48, '2444', '2024-08-31', 2, 34, 3, '0000-00-00', '2024-11-16 13:10:17', 'CON DIPLOMA'),
(28, '2024-08-20', '2024-08-20', '2326', '2024-08-20', 458, 2346, 35, '22-548', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 48, '2444', '2024-08-31', 2, 35, 3, '0000-00-00', '2024-11-16 13:12:28', 'CON DIPLOMA'),
(29, '2024-08-20', '2024-08-20', '2327', '2024-08-20', 459, 2347, 36, '22-548', 'O', '2024-11-16', '2024-11-16', 0, 0, 0, 48, '2444', '2024-08-31', 2, 36, 3, '0000-00-00', '2024-11-16 13:17:38', 'CON DIPLOMA'),
(30, '2024-08-20', '0000-00-00', '', '2024-08-20', 0, 0, 0, '0', '', '0000-00-00', '2024-11-17', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 37, 3, '0000-00-00', '2024-11-17 00:00:00', 'SIN DIPLOMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `empleado_id` int(11) NOT NULL,
  `emple_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emple_apepat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emple_apemat` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emple_feccreacion` date DEFAULT NULL,
  `emple_fechanacimiento` date DEFAULT NULL,
  `emple_nrodocumento` char(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emple_movil` char(9) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empl_modalidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emple_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emple_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `emple_direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `empl_fotoperfil` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Fotos/admin.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`empleado_id`, `emple_nombre`, `emple_apepat`, `emple_apemat`, `emple_feccreacion`, `emple_fechanacimiento`, `emple_nrodocumento`, `emple_movil`, `empl_modalidad`, `emple_email`, `emple_estatus`, `emple_direccion`, `empl_fotoperfil`, `created_at`, `updated_at`) VALUES
(1, 'JERSSON JORGE', 'CORILLA', 'MIRANDA', '2023-03-01', '2023-03-31', '234234', '918654046', 'Funcionario', 'jersson14071996@gmail.com', 'ACTIVO', 'JR. NICOLAS DE PIEROLA Nº 105', 'controller/empleado/FOTOS/IMG13-6-2024-14-13.jpg', NULL, NULL),
(2, 'JOSE', 'SANCHEZ', 'MEDINA', '2023-08-25', '1985-01-24', '55151151', '926262625', 'CAS', 'jose21@gmail.com', 'ACTIVO', 'JR. CHALHUANCA N° 222', 'controller/empleado/FOTOS/IMG28-8-2023-11-195.png', NULL, NULL),
(3, 'ANDREA', 'SANCHEZ', 'JIMENEZ', '2023-08-25', '1995-01-24', '26626266', '966226262', 'CAS', 'andrea12@gmail.com', 'ACTIVO', 'AV. DIAZ BARCENAS N° 323', 'controller/empleado/FOTOS/IMG28-8-2023-11-271.jpeg', NULL, NULL),
(4, 'LUIS', 'CAMACHO', 'VELARDE', '2023-08-25', '1998-01-24', '15511515', '926622656', 'Servidor Público', 'luis2112@gmail.com', 'ACTIVO', 'JR. HUANCAVELICA N° 323', 'controller/empleado/FOTOS/IMG21-10-2023-15-225.png', NULL, NULL),
(5, 'JUAN CARLOS', 'MEDINA', 'SANCHEZ', '2023-08-27', '2000-07-25', '62262626', '926161616', 'Practicante', 'juanca2@gmail.com', 'ACTIVO', 'JR. CUSCO N° 323', 'controller/empleado/FOTOS/IMG8-11-2023-9-146.png', NULL, NULL),
(6, 'CELIA', 'MIRANDA', 'MUNGUIA', '2023-08-29', '1972-01-24', '09747535', '988505521', 'Tercero', 'cmirandam@utea.edu.pe', 'ACTIVO', 'JR NICOLAS DE PIEROLA N° 105', 'controller/empleado/FOTOS/IMG29-8-2023-16-940.jpg', NULL, NULL),
(7, 'WILFREDO', 'CARRIÓN', 'UMERES', '2023-09-07', '1995-05-11', '31044054', '952541551', 'CAS', 'willy22@gmail.co', 'ACTIVO', 'AV 28 DE ABRIL 234', 'controller/empleado/FOTOS/IMG7-9-2023-18-768.jpg', NULL, NULL),
(8, 'ELIAS', 'CARRIÓN', 'UMERES', '2023-09-10', '1985-05-25', '41239943', '935951872', 'Tercero', 'eliascar888@hotmail.com', 'ACTIVO', 'AV 28 DE ABRIL N° 234', 'controller/empleado/FOTOS/IMG10-9-2023-11-957.jpg', NULL, NULL),
(9, 'PEDRO', 'JIMENEZ', 'SANCHES', '2023-10-22', '1980-08-14', '51151515', '915151551', 'CAS', 'pedro3@gmail.com', 'ACTIVO', 'AV. CANADA S/N', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(10, 'JOSUE', 'SANCHEZ', 'PERALTA', '2023-10-22', '1990-01-15', '65611661', '915615515', 'Servidor Público', 'josue21@gmail.com', 'ACTIVO', 'JR. CUSCO N° 455', 'controller/empleado/FOTOS/IMG11-2-2024-11-772.jpg', NULL, NULL),
(11, 'ROLANDO', 'SANCHEZ', '', '2024-05-19', '0000-00-00', '11151515', '', 'CAS', '', 'ACTIVO', '', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(12, 'DANIELA', 'PEREZ', 'SANCHEZ', '2024-06-09', '1992-07-14', '45454848', '994448484', 'CAS', 'danie12@gmail.com', 'ACTIVO', 'JR. NICOLAS DE PIEROLA', 'controller/empleado/FOTOS/IMG9-6-2024-18-834.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `emp_razon` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_cod` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `emp_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `emp_razon`, `emp_email`, `emp_cod`, `emp_telefono`, `emp_direccion`, `emp_logo`, `created_at`, `updated_at`) VALUES
(2, 'UNIVERSIDAD TECNOLÓGICA DE LOS ANDES', 'UTEA@GMAIL.COM', '40', '(083) 321559', 'AV. PERU Nº 700 ABANCAY, APURíMAC, PERU', 'controller/empresa/FOTOS/IMG14-11-2024-15-235.png', '2024-05-25 21:53:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela_profesional`
--

CREATE TABLE `escuela_profesional` (
  `Id_escuela` int(11) NOT NULL,
  `Cod_Escuela` char(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Grado_academico` enum('BACHILLER','TITULO') NOT NULL,
  `Abreviatura_grado` enum('B','T') DEFAULT NULL,
  `Denominación_grado` varchar(50) NOT NULL,
  `Programa_estudio` varchar(50) NOT NULL,
  `Numero_creditos` int(11) NOT NULL,
  `Id_facultad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Estado` enum('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `escuela_profesional`
--

INSERT INTO `escuela_profesional` (`Id_escuela`, `Cod_Escuela`, `Nombre`, `Grado_academico`, `Abreviatura_grado`, `Denominación_grado`, `Programa_estudio`, `Numero_creditos`, `Id_facultad`, `created_at`, `updated_at`, `Estado`) VALUES
(1, 'EPISEIA', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'TITULO', 'T', 'INGENIERO DE SISTEMAS E INFORMATICO', 'CICLO REGULAR', 220, 1, '2024-06-01 21:25:37', '2024-06-15 14:12:09', 'ACTIVO'),
(2, 'EPIC', 'Ingenieria Civil	', 'TITULO', 'T', 'INGENIERO CIVIL	', 'CICLO REGULAR', 225, 1, '2024-06-01 21:25:37', '2024-09-12 22:17:29', 'ACTIVO'),
(3, 'EPIA', 'INGENIERÍA AMBIENTAL Y RECURSOS NATURALES', 'TITULO', 'T', 'INGENIERO AMBIENTAL', 'CICLO REGULAR', 220, 1, '2024-06-01 21:29:01', '2024-06-15 14:12:27', 'ACTIVO'),
(4, 'EPA', 'AGRONOMIA', 'TITULO', 'T', 'INGENIERO AGRONOMO', 'CICLO REGULAR', 220, 1, '2024-06-01 21:31:24', '2024-06-15 14:12:33', 'ACTIVO'),
(5, 'EPISEI', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER', 'B', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'CICLO REGULAR', 220, 1, '2024-06-01 22:09:51', '2024-07-23 21:10:42', 'ACTIVO'),
(6, 'EPIC', 'Ingenieria Civil', 'BACHILLER', 'B', 'INGENIERIA CIVIL', 'CICLO REGULAR', 220, 1, '2024-06-01 22:19:51', '2024-09-12 22:17:00', 'ACTIVO'),
(7, 'EPCO', 'CONTABILIDAD', 'BACHILLER', 'B', 'CIENCIAS CONTABLES Y FINANCIERAS', 'CICLO REGULAR', 220, 3, '2024-06-08 21:24:17', '2024-06-15 14:12:54', 'ACTIVO'),
(8, 'EPES', 'ESTOMATOLOGIA', 'BACHILLER', 'B', 'ESTOMATOLOGIA', 'CICLO REGULAR', 220, 2, '2024-06-08 23:29:50', '2024-06-15 14:13:01', 'ACTIVO'),
(9, 'EPD', 'DERECHO', 'BACHILLER', 'B', 'DERECHO', 'CICLO REGULAR', 260, 3, '2024-06-10 01:27:50', '2024-06-15 14:13:07', 'ACTIVO'),
(10, 'EPCO', 'CONTABILIDAD', 'TITULO', 'T', 'CONTADOR PUBLICO', 'CICLO REGULAR', 220, 3, '2024-06-15 20:57:49', '0000-00-00 00:00:00', 'ACTIVO'),
(11, 'EPDE', 'DERECHO', 'TITULO', 'T', 'ABOGADO', 'CICLO REGULAR', 260, 3, '2024-06-15 21:01:25', '0000-00-00 00:00:00', 'ACTIVO'),
(12, 'EPEDU', 'EDUCACION', 'TITULO', 'T', 'EDUCACION', 'CICLO REGULAR', 220, 3, '2024-06-15 21:03:00', '0000-00-00 00:00:00', 'ACTIVO'),
(13, 'EPTHG', 'TURISMO HOTELERIA Y GASTRONOMIA', 'TITULO', 'T', 'LICENCIADO EN TURISMO HOTELERIA Y GASTRONOMIA', 'CICLO REGULAR', 220, 3, '2024-06-15 21:04:43', '2024-08-03 16:27:56', 'ACTIVO'),
(14, 'EPEN', 'ENFERMERIA', 'TITULO', 'T', 'LICENCIADO EN ENFERMERIA', 'CICLO REGULAR', 222, 2, '2024-06-15 21:05:23', '2024-08-03 16:26:00', 'ACTIVO'),
(15, 'EPED', 'ESTOMATOLOGIA', 'TITULO', 'T', 'CIRUJANO DENTISTA', 'CICLO REGULAR', 220, 2, '2024-06-15 21:05:56', '0000-00-00 00:00:00', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `Dni` char(8) NOT NULL,
  `Codigo` char(15) DEFAULT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellido_paterno` varchar(50) NOT NULL,
  `Apellido_materno` varchar(50) NOT NULL,
  `Sexo` enum('F','M') NOT NULL,
  `Celular` char(9) DEFAULT NULL,
  `Direccion` text DEFAULT NULL,
  `Fecha_matricula` date NOT NULL,
  `Fecha_egreso` date NOT NULL,
  `correo_personal` varchar(255) DEFAULT NULL,
  `correo_institucional` varchar(255) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL,
  `Años_transcurridos` int(11) DEFAULT NULL,
  `Meses_transcurridos` int(11) DEFAULT NULL,
  `Dias_transcurridos` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Dni`, `Codigo`, `Nombres`, `Apellido_paterno`, `Apellido_materno`, `Sexo`, `Celular`, `Direccion`, `Fecha_matricula`, `Fecha_egreso`, `correo_personal`, `correo_institucional`, `Observaciones`, `Años_transcurridos`, `Meses_transcurridos`, `Dias_transcurridos`, `id_usuario`, `created_at`, `updated_at`) VALUES
('09747535', '201511498A', 'CELIA', 'MIRANDA', 'MUNGUIA', 'F', '992299292', 'JR. CANADA N° 478', '2015-04-20', '2020-08-20', 'cmirandam@gmail.com', '', '', 5, 4, 1, 2, '2024-07-17 05:00:00', '2024-07-23 00:00:00'),
('21125115', '2015118874W', 'CONSUELO SOLEDAD', 'RAU', 'ALANIA', 'F', '946461166', 'AV. SAN MARTIN N° 232', '2015-03-14', '2019-12-20', 'consuelo112@gmail.com', '', '', 4, 9, 7, 2, '2024-08-16 05:00:00', '2024-08-16 00:00:00'),
('23522151', '20114154515F', 'FELICITA', 'MADRID', 'FLORES', 'F', '926662266', 'AV. TOMAS ZANO N° 233', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('23997944', '933456K', 'MARITZA ANTONIA', 'BRAÑEZ', 'FRANCO', 'F', '979006912', 'AV COROEL', '1993-04-01', '2000-08-18', 'wsdws@gmail.com', '', '', 7, 4, 17, 2, '2024-07-19 05:00:00', '0000-00-00 00:00:00'),
('31000154', '906266G', 'MAXIMO', 'CHIRINOS', 'UTANI', 'M', '995226625', 'JR. TARAPACA N° 324', '1990-04-01', '2003-07-31', 'maximo12@gmail.com', '', '', 13, 3, 29, 2, '2024-07-07 05:00:00', '2024-07-17 00:00:00'),
('31003535', '2014114582S', 'ISABEL', 'QUINTANILLA', 'GOMEZ', 'F', '954128885', 'JR. CANADA N° 478', '2014-03-14', '2019-12-12', 'isabel21@gmail.com', '', '', 5, 8, 29, 2, '2024-08-16 05:00:00', '2024-08-16 00:00:00'),
('31004111', '201454544V', 'GABINA', 'FERRO', 'MONDRAGON', 'F', '929926262', 'AV. HUAMANDA N° 212', '2024-11-16', '2024-11-16', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('31004577', '2015322323D', 'SERNA PERALTA LUCY VIOLETA', 'SOTO', 'LA', 'F', '912616161', 'JR. CUSCO N° 233', '2024-11-15', '2024-11-15', 'serna1221@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31004584', '20142332FD', 'CIRILO', 'CERVANTES', 'MONZON', 'M', '992292992', 'AV. PERU N° 32', '2024-11-15', '2024-11-15', 'jersson1407@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31005200', '2010115484W', 'ALEJANDRO', 'ANTEZANA', 'ALTAMIRANO', 'M', '926262626', 'AV. CANADA N° 200', '2010-03-10', '2021-12-19', 'alejandro12@gmail.com', '', '', 11, 9, 10, 2, '2024-09-12 05:00:00', '0000-00-00 00:00:00'),
('31005511', '200511D', 'JULIA', 'ROJAS', 'DE ALSAMORA', 'F', '929626262', 'JR CANADA N° 323', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('31005514', '20141221D', 'H ELIAS', 'SALAS', 'MEDINA', 'M', '929266262', 'AV. PERU', '2024-11-15', '2024-11-15', 'jersson1407@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31005515', '20156655S', 'LIDIA', 'RUCOBA', 'VELA', 'F', '952626262', 'JR. CANADA N° 211', '2015-03-14', '2022-12-12', 'lidia12@gmail.com', '', '', 7, 8, 29, 2, '2024-09-12 05:00:00', '0000-00-00 00:00:00'),
('31005536', '205225252D', 'DINA', 'GARAY', 'MENDEZ', 'F', '926626262', 'JR. CHALU N° 2343', '2024-11-15', '2024-11-15', 'jersson14076@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31005777', '2014122558F', 'GUMERCINDA', 'VEGA', 'DE HILARES', 'F', '926626262', 'JR. CUSCO N° 477', '2014-04-14', '2020-12-02', 'fumercinda12@gmail.com', '', '', 6, 7, 19, 2, '2024-08-16 05:00:00', '0000-00-00 00:00:00'),
('31005821', '20114142132D', 'PAULINA', 'CHIRINOS', 'ALEGRIA', 'F', '922262626', 'JR.PUNOI12', '2024-11-15', '2024-11-15', 'jersson123@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31005874', '20141212', 'VILMA', 'VALER', 'DE ACOSTA', 'F', '926226626', 'JR.PERU N° 21', '2024-11-15', '2024-11-15', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31008511', '201512142F', 'TOMASA', 'VILLEGAS', 'SILVA', 'F', '926262626', 'JR. NICOLAS DE PIEROLA ', '2024-11-15', '2024-11-15', 'tomasa12@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31008974', '2014125544F', 'LUCHA NELY', 'PAGAZA', 'LOAIZA', 'F', '926622962', 'JR. CANADA N° 232', '2024-11-15', '2024-11-15', 'lucha@gmail.com', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('31152548', '201422121F', 'BIBIANA', 'GUTIERREZ', 'MACHACCA', 'F', '995956262', 'JR. HUANCA N° 123', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('31481092', '200322188G', 'WILBER', 'CHINCHAY', 'ANAYA', 'M', '922266225', 'AV. PERU N° 587', '2003-09-01', '2013-01-30', 'wilber12@gmail.com', '', '', 9, 4, 30, 2, '2024-07-07 05:00:00', '2024-07-07 00:00:00'),
('43884500', '200915478H', 'HENRY', 'VARGAS', 'GRANDA', 'M', '926262626', 'JR. LIMA N° 48', '2009-05-11', '2017-12-21', 'HENRY12@GMAIL.COM', '', '', 8, 7, 10, 2, '2024-07-06 05:00:00', '2024-07-07 00:00:00'),
('44455444', '201211498FG', 'ASHA YAJAIRA', 'PINEDO', 'NARVAES', 'F', '959959595', 'JR. CUSCO N° 442', '2012-03-03', '2018-12-24', 'asha21@gmail.com', '', '', 6, 9, 21, 2, '2024-08-03 05:00:00', '2024-08-16 00:00:00'),
('45000511', '201012115F', 'NADDIA FROILANDA', 'ALZAMORA', 'GUEVARA', 'F', '926661616', 'AV. AYACUCHO N° 232', '2024-11-17', '2024-11-17', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 10, '2024-11-17 05:00:00', '0000-00-00 00:00:00'),
('45202352', '20079595T', 'JUAN CARLOS', 'CERQUIN', 'GONZALEZ', 'M', '992262625', 'JR. PUNO N° 587', '2007-09-03', '2016-12-31', 'JUAN12@GMAIL.COM', '', '', 9, 3, 28, 2, '2024-07-07 05:00:00', '2024-07-07 00:00:00'),
('45740202', '201011657A', 'ERIKA TANIA', 'SALAS', 'ARAUJO', 'F', '962262626', 'AV. ARENAS Nª 477', '2010-03-01', '2018-12-12', 'erika12@gmail.com', '', '', 8, 9, 12, 2, '2024-07-20 05:00:00', '2024-08-16 00:00:00'),
('45844005', '201555651A', 'ROBERTO', 'ALENCASTRE', 'QUISPE', 'M', '912612611', 'JR ANDAHUAYLAS N° 211', '2015-04-06', '2023-01-24', 'roberto12@gmail.com', '', '', 7, 9, 19, 2, '2024-08-09 05:00:00', '2024-08-10 00:00:00'),
('48151509', '201123548F', 'FRAY MIGUEL', 'MALDONADO', 'HUARANCA', 'M', '926622620', 'AV. PERÚ N° 477', '2011-09-05', '2013-12-31', 'FRAY@GMAIL.COM', 'FRAY12@UTEA.EDU.PE', '', 2, 3, 26, 2, '2024-07-06 05:00:00', '2024-07-07 00:00:00'),
('48564444', '201189777G', 'KARINA', 'ARREDONDO', 'HUAMAN', 'F', '969216611', 'AV. PERÚ S/N', '2011-04-04', '2017-07-31', 'KARINA12@GMAIL.COM', 'KARREDONDO@UTEA.EDU.PE', '', 6, 3, 27, 2, '2024-07-06 05:00:00', '2024-07-07 00:00:00'),
('48841144', '201411847S', 'JAVIER', 'SALVATIERRA', 'VIDAL', 'M', '995959292', 'AV. TACNA N° 477', '2014-04-10', '2021-12-20', 'javier12@gmail.com', '', '', 7, 8, 10, 2, '2024-08-23 05:00:00', '2024-08-23 00:00:00'),
('62626666', '201855944Q', 'ANGELA VALENTINA', 'RIVERA', 'DEXTRE', 'F', '989559595', 'AV. HUASCAR N° 233', '2018-03-14', '2023-12-20', 'angela21@gmail.com', '', '', 5, 9, 6, 2, '2024-08-03 05:00:00', '2024-08-16 00:00:00'),
('70001454', '201425115F', 'ELEAZAR', 'VALDEZ', 'FLORES', 'M', '926626262', 'AV. PERU', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('70141152', '2015212212H', 'CARMEN ROSMERY', 'ATENCIO', 'AMESQUITA', 'F', '929262266', 'JR. CUSCO N° 323', '2024-11-17', '2024-11-17', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 10, '2024-11-17 05:00:00', '2024-11-17 00:00:00'),
('70225414', '2015155115D', 'FLEDEMIR', 'HENRIQUEZ', 'BENITES', 'M', '926262626', 'AV. CANAS N° 323', '2024-11-17', '2024-11-17', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 10, '2024-11-17 05:00:00', '2024-11-17 00:00:00'),
('70419838', '201411487S', 'JHONATAN STIFE', 'ROJAS', 'GUTIERREZ', 'M', '959292992', 'JR. PUNO N° 587', '2014-04-05', '2019-10-03', 'JHONATAN@GMAIL.COM', '', '', 5, 5, 28, 2, '2024-07-06 05:00:00', '2024-07-07 00:00:00'),
('71254111', '2014021212D', 'ALEJANDRO FRANCISCO', 'VASQUEZ', 'VIDAURRE', 'M', '962662266', 'AV. SUAREZ N° 233', '2024-11-17', '2024-11-17', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 10, '2024-11-17 05:00:00', '2024-11-17 00:00:00'),
('72005899', '201211457Q', 'JUAN CARLOS', 'CHILON', 'ACUÑA', 'M', '926226626', 'AV. CANADA N° 211', '2012-03-14', '2022-12-20', 'juan12@gmail.com', '', '', 10, 9, 6, 2, '2024-09-12 05:00:00', '2024-09-12 00:00:00'),
('72080609', '201688987S', 'HILDERSON', 'CORRALES', 'CASTAÑEDA', 'M', '959955959', 'AV. ABANCAY N° 577', '2016-04-04', '2023-11-24', 'henry12@gmail.com', '', '', 7, 7, 20, 2, '2024-07-17 05:00:00', '0000-00-00 00:00:00'),
('72121511', '201515151D', 'LIZBETH KELY', 'GOMEZ', 'HUAMAN', 'F', '926626262', 'JR. HUANCA N ° 322', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72458874', '2010115859S', 'NOELIA NAOKY', 'OLIVA', 'CAMERO', 'F', '929626626', 'AV. CUSCO N° 213', '2010-03-14', '2020-12-20', 'noelia12@gmail.com', '', '', 10, 9, 7, 2, '2024-09-12 05:00:00', '0000-00-00 00:00:00'),
('72510000', '2010151515S', 'LAUTERIO', 'CORREA', 'TINEO', 'M', '962323003', 'AV. LA CULTURA N° 122', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72522000', '202415115F', 'JERSON ADAIR', 'VEGA', 'PALOMINO', 'M', '952929922', 'JR  PERU N° 212', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72545855', '2024121198D', 'IVETTE ELOISA', 'CARBAJAL', 'BERMUDEZ', 'F', '926622662', 'AV. CANADA N° 233', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72558855', '2015155115S', 'NILTON IVAN', 'HINOSTROZA', 'CAMACHO', 'M', '926262626', 'AV. TUPAC AMARU', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72585520', '2014155151F', 'STEFAN', 'LANAO', 'VON DER MULBE', 'M', '926626262', 'JR. CUSCO N° 233', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72585554', '201451454F', 'NICOLE AYLIN', 'VILLALOBOS', 'LAZARO', 'F', '926626226', 'JR. CURSO N° 211', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72641454', '201511789A', 'DEYVIN LUIS', 'CLAVO', 'SANCHEZ', 'M', '995599559', 'AV. GUATEMALA', '2015-03-03', '2019-12-20', 'deyvin12@gmail.com', '', '', 4, 9, 18, 2, '2024-08-03 05:00:00', '2024-08-16 00:00:00'),
('72645855', '20154444A', 'ALEXANDER JORGE', 'MAQUERA', 'DIAZ', 'M', '961551155', 'JR. PERU N° 2112', '2024-11-14', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 2, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72646120', '20153223D', 'KEDYN', 'PRADA', 'ZUÑIGA', 'M', '992262626', 'AV. PERU N° 212', '2024-11-15', '2024-11-15', 'KEDYM1@GMAIL.COM', '', '', 0, 0, 0, 2, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('72646121', '201411495G', 'JERSSON JORGE', 'CORILLA', 'MIRANDA', 'M', '974031318', 'JR. NICOLAS DE  PIEROLA N° 105', '2014-04-13', '2020-01-12', 'jersson1407miranda@gmail.com', '', '', 5, 8, 30, 2, '2024-07-16 05:00:00', '2024-07-21 00:00:00'),
('72646122', '201578484D', 'ESMITH JHOJAN', 'AYALA', 'AYMA', 'M', '992266226', 'AV. CANADA N° 112', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72646158', '201562332G', 'GEORGE FREDERICK', 'TAMAY', 'DIAZ', 'M', '926626262', 'AV. CUSCO N° 212', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72651144', '2014125154A', 'LEONARDO MICKEL', 'LINO', 'CASTILLO', 'M', '926626226', 'JR. PANAMA N° 323', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72651474', '201511885D', 'LUIS GUILLERMO', 'ARBULU', 'PEZZINI', 'M', '929929225', 'JR. CANADA N° 577', '2015-03-14', '2021-12-20', 'luis125@gmail.com', '', '', 6, 9, 7, 2, '2024-08-16 05:00:00', '2024-08-16 00:00:00'),
('72771135', '2010232323D', 'JHONATHAN RONI', 'HERRERA', 'BARRA', 'M', '999226261', 'JR. AREQUIPA N° 548', '2010-09-06', '2020-12-05', 'jhonatan21@gmail.com', '', '', 10, 2, 29, 2, '2024-07-07 05:00:00', '2024-07-07 00:00:00'),
('73306073', '201714542S', 'ALVARO', 'GONZALES', 'TORRES', 'M', '926622626', 'AV. PERU S/N', '2017-09-01', '2023-11-24', 'alvaro12@gmail.com', '', '', 6, 2, 22, 2, '2024-07-20 05:00:00', '0000-00-00 00:00:00'),
('75863955', '201311748A', 'ROSMERY YASMIN', 'TORRES', 'HURTADO', 'F', '955995200', 'JR. LIMA N° 574', '2013-04-01', '2021-09-03', 'ROSMERY12@GMAIL.COM', 'RTORRES@UTEA.EDU.PE', '', 8, 5, 2, 2, '2024-07-06 05:00:00', '2024-07-07 00:00:00'),
('77659722', '2018484848G', 'LENY IRAIDA', 'CUSIPUMA', 'GALLEGOS', 'F', '929292925', 'AV. PERÚ N° 457', '2018-09-03', '2023-11-24', 'leny12@gmail.com', '', '', 5, 2, 20, 2, '2024-07-17 05:00:00', '2024-07-17 00:00:00'),
('80044531', '2012944848V', 'FIDEL', 'POVEA', 'VILCA', 'M', '922626622', 'AV. CHALHUANCA N° 547', '2012-09-09', '2017-07-31', 'fidel12@gmail.com', '', '', 4, 10, 20, 2, '2024-07-07 05:00:00', '2024-07-17 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_posgrado`
--

CREATE TABLE `estudiante_posgrado` (
  `Dni` char(8) NOT NULL,
  `Codigo` char(15) DEFAULT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellido_paterno` varchar(50) NOT NULL,
  `Apellido_materno` varchar(50) NOT NULL,
  `Sexo` enum('F','M') NOT NULL,
  `Celular` char(9) DEFAULT NULL,
  `Direccion` text DEFAULT NULL,
  `Fecha_matricula` date NOT NULL,
  `Fecha_egreso` date NOT NULL,
  `correo_personal` varchar(255) DEFAULT NULL,
  `correo_institucional` varchar(255) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL,
  `Años_transcurridos` int(11) DEFAULT NULL,
  `Meses_transcurridos` int(11) DEFAULT NULL,
  `Dias_transcurridos` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante_posgrado`
--

INSERT INTO `estudiante_posgrado` (`Dni`, `Codigo`, `Nombres`, `Apellido_paterno`, `Apellido_materno`, `Sexo`, `Celular`, `Direccion`, `Fecha_matricula`, `Fecha_egreso`, `correo_personal`, `correo_institucional`, `Observaciones`, `Años_transcurridos`, `Meses_transcurridos`, `Dias_transcurridos`, `id_usuario`, `created_at`, `updated_at`) VALUES
('09747535', '201511498A', 'CELIA', 'MIRANDA', 'MUNGUIA', 'F', '992299292', 'JR. CANADA N° 478', '2015-04-20', '2020-08-20', 'cmirandam@gmail.com', '', '', 5, 4, 1, 2, '2024-07-17 05:00:00', '2024-07-23 00:00:00'),
('25121552', '2015155151G', 'ANDREA', 'APAZA', 'HUILLCA', 'F', '926622626', 'JR. PUNO N° 323', '2024-11-17', '2024-11-17', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-17 05:00:00', '2024-11-17 00:00:00'),
('43559383', '201951522D', 'FREDY', 'ALARCON', 'CONTRERAS', 'M', '991911999', 'JR. CUSCO N° 211', '2019-09-06', '2021-04-14', 'fredy12@gmail.com', '', '', 1, 7, 7, 2, '2024-08-09 05:00:00', '2024-08-10 00:00:00'),
('70086232', '201922626S', 'RODRIGO', 'LOAYZA', 'ELGUERA', 'M', '984991616', 'AV. GUATEMALA N° 111', '2019-01-25', '2020-03-04', 'rodrigo1256@gmail.com', '', '', 1, 1, 8, 2, '2024-08-09 05:00:00', '2024-08-10 00:00:00'),
('71211555', '2011251515H', 'LUIS MIGUEL', 'MORENO', 'NARVAES', 'M', '926626262', 'JR. APURIMAC N° 322', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72522022', '20145251512F', 'DANIEL ANTERO', 'CHUMPITAZ', 'ALFARO', 'M', '992929626', 'AV. PUNO N° 332', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72541110', '2010121515Q', 'YAJAT MARTIN', 'RAMIREZ', 'AHUANARI', 'M', '992626262', 'AV. AYACUCHO N° 212', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00'),
('72545541', '20110551511D', 'ROSSY PATRICIA', 'SULCA', 'GONZALES', 'F', '926626262', 'AV. CACERES N° 322', '2024-11-16', '2024-11-16', 'jersson1407miranda@gmail.com', '', '', 0, 0, 0, 2, '2024-11-16 05:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `Id_expediente` char(12) NOT NULL,
  `Id_cede` int(11) DEFAULT NULL,
  `Dni` char(8) DEFAULT NULL,
  `Id_escuela` int(11) DEFAULT NULL,
  `Titulo_de` varchar(255) DEFAULT NULL,
  `Grado_bachiller_de` varchar(255) DEFAULT NULL,
  `Modalidad` varchar(255) DEFAULT NULL,
  `Acto_academico` varchar(255) DEFAULT NULL,
  `Acuerdo` varchar(255) DEFAULT NULL,
  `Resolucion_rectoral_N` varchar(255) DEFAULT NULL,
  `Expedicion` varchar(255) DEFAULT NULL,
  `Libro` varchar(255) DEFAULT NULL,
  `Folio` varchar(255) DEFAULT NULL,
  `Registro` varchar(255) DEFAULT NULL,
  `Archivo` varchar(255) DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `estado` enum('PENDIENTE','EN PROCESO','COLACION') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_autoridad` int(11) DEFAULT NULL,
  `doc_ncorrelativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`Id_expediente`, `Id_cede`, `Dni`, `Id_escuela`, `Titulo_de`, `Grado_bachiller_de`, `Modalidad`, `Acto_academico`, `Acuerdo`, `Resolucion_rectoral_N`, `Expedicion`, `Libro`, `Folio`, `Registro`, `Archivo`, `Id_usuario`, `estado`, `created_at`, `updated_at`, `id_autoridad`, `doc_ncorrelativo`) VALUES
('E0000001', 2, '75863955', 2, 'Ingeniero Civil', '', 'TESIS', '', '', '909-2024-UTEA-CU', '', '369', '176- 177', '36727', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/EXPE-75863955-6-7-2024-16-26-11.PDF', 2, 'COLACION', '2024-07-06 00:00:00', '2024-07-07 00:00:00', 1, 1),
('E0000002', 1, '48151509', 2, 'Ingeniero Civil', '', 'TESIS', '', '', '908-2024-UTEA-CU', '', '369', '176- 177', '36726', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/EXPE-48151509-6-7-2024-16-31-0.PDF', 2, 'COLACION', '2024-07-06 00:00:00', '2024-07-07 00:00:00', 1, 2),
('E0000003', 1, '48564444', 2, 'Ingeniero Civil', '', 'TESIS', '', '', '907-2024-UTEA-CU', '', '369', '176- 177', '36725', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/EXPE-48564444-6-7-2024-16-35-54.PDF', 2, 'COLACION', '2024-07-06 00:00:00', '2024-07-07 00:00:00', 1, 3),
('E0000004', 1, '43884500', 15, 'CIRUJANO DENTISTA', '', 'TESIS', '', '', '905-2024-UTEA-CU', '', '369', '176- 177', '36723', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/EXPE-43884500-6-7-2024-17-34-12.PDF', 2, 'COLACION', '2024-07-06 00:00:00', '2024-07-07 00:00:00', 3, 4),
('E0000005', 1, '70419838', 15, 'CIRUJANO DENTISTA', '', 'TESIS', '', '', '1252', '', '371', '206-207', '36949', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/EXPE-70419838-7-7-2024-12-42-15.PDF', 2, 'COLACION', '2024-07-06 00:00:00', '2024-07-07 00:00:00', 3, 5),
('E0000006', 1, '45202352', 10, 'CONTADOR PUBLICO', '', 'TESIS', '', '', '887-2024-UTEA-CU', '', '369', '174- 175', '36705', 'controller/registro_general/documentos/EXPE-45202352-7-7-2024-14-23-24.PDF', 2, 'COLACION', '2024-07-07 00:00:00', '2024-07-07 00:00:00', 2, 6),
('E0000007', 1, '31481092', 4, 'INGENIERO AGRONOMO', '', 'TESIS', '', '', '885-2024-UTEA-CU', '', '369', '174- 175', '36703', 'CONTROLLER/REGISTRO_GENERAL/DOCUMENTOS/', 2, 'COLACION', '2024-07-07 00:00:00', '2024-07-07 00:00:00', 1, 7),
('E0000008', 1, '72771135', 10, 'CONTADOR PUBLICO', '', 'TESIS', '', '', '888-2024-UTEA-CU', '', '369', '174- 175', '36706', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-07-07 00:00:00', '2024-07-07 00:00:00', 2, 8),
('E0000009', 1, '80044531', 10, 'CONTADOR PUBLICO', '', 'TESIS', '', '', '889-2024-UTEA-CU', '', '369', '174- 175', '36707', 'controller/registro_general/documentos/EXPE-80044531-17-7-2024-16-55-18.pdf', 2, 'COLACION', '2024-07-07 00:00:00', '2024-07-17 00:00:00', 2, 9),
('E0000010', 1, '31000154', 11, 'ABOGADO', '', 'SUFICIENCIA PROFESIONAL', '', '', '892-2024-UTEA-CU', '', '369', '174- 175', '36710', 'controller/registro_general/documentos/EXPE-31000154-17-7-2024-16-52-57.pdf', 2, 'COLACION', '2024-07-07 00:00:00', '2024-07-17 00:00:00', 2, 10),
('E0000011', 1, '72646121', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '1347', '', '319', '310 - 311', '31753', 'controller/registro_general/documentos/EXPE-72646121-16-7-2024-14-16-51.pdf', 2, 'COLACION', '2024-07-16 00:00:00', '0000-00-00 00:00:00', 1, 11),
('E0000014', 1, '72080609', 7, '', 'CIENCIAS CONTABLES Y FINANCIERAS', 'BACHILLER AUTOMATICO', '', '', '627', '', '366', '136-137', '36445', 'controller/registro_general_bachiller/documentos/EXPE-72080609-17-7-2024-15-53-18.pdf', 2, 'EN PROCESO', '2024-07-17 00:00:00', '0000-00-00 00:00:00', 2, 14),
('E0000016', 1, '77659722', 7, '', 'CIENCIAS CONTABLES Y FINANCIERAS', 'BACHILLER AUTOMATICO', '', '', '629', '', '366', '136 - 137', '36447', 'controller/registro_general_bachiller/documentos/EXPE-77659722-17-7-2024-17-21-19.pdf', 2, 'COLACION', '2024-07-17 00:00:00', '2024-07-17 00:00:00', 2, 16),
('E0000017', 1, '09747535', 10, 'CONTADOR PUBLICO', '', 'SUFICIENCIA PROFESIONAL', '', '', '1510', '', '372', '226-227', '37155', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-07-17 00:00:00', '0000-00-00 00:00:00', 2, 17),
('E0000018', 1, '23997944', 12, 'EDUCACION', '', 'ACTUALIZACIÓN PROFESIONAL', '', '', '1511', '', '372', '226-227', '37156', 'controller/registro_general/documentos/', 2, 'PENDIENTE', '2024-07-19 00:00:00', '0000-00-00 00:00:00', 2, 18),
('E0000019', 1, '45740202', 1, 'INGENIERA DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '910', '', '369', '176- 177', '36728', 'controller/registro_general/documentos/EXPE-45740202-20-7-2024-14-51-24.pdf', 2, 'COLACION', '2024-07-20 00:00:00', '2024-08-16 00:00:00', 1, 19),
('E0000020', 1, '73306073', 7, '', 'CIENCIAS CONTABLES Y FINANCIERAS', 'BACHILLER AUTOMATICO', '', '', '633', '', '366', '140 - 141', '36451', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-07-20 00:00:00', '0000-00-00 00:00:00', 2, 20),
('E0000021', 1, '72646121', 5, '', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER AUTOMATICO', '', '', '0587', '', '295', '386-387', '29343', 'controller/registro_general_bachiller/documentos/EXPE-72646121-21-7-2024-12-33-6.pdf', 2, 'COLACION', '2024-07-21 00:00:00', '0000-00-00 00:00:00', 1, 21),
('E0000022', 1, '09747535', 12, 'EDUCACION', '', 'TESIS', '', '', '634', '', '367', '140 - 141', '36452', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-07-23 00:00:00', '0000-00-00 00:00:00', 2, 22),
('E0000023', 1, '72641454', 2, 'Ingeniero Civil', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-08-03 00:00:00', '2024-08-16 00:00:00', 1, 23),
('E0000024', 1, '62626666', 10, 'CONTADOR PUBLICO', '', 'ACTUALIZACIÓN PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-08-03 00:00:00', '2024-08-16 00:00:00', 2, 24),
('E0000025', 1, '44455444', 11, 'ABOGADO', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-08-03 00:00:00', '2024-08-16 00:00:00', 2, 25),
('E0000026', 1, '45844005', 9, '', 'DERECHO', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/EXPE-45844005-9-8-2024-17-12-55.pdf', 2, 'PENDIENTE', '2024-08-09 00:00:00', '0000-00-00 00:00:00', 3, 26),
('E0000027', 1, '31003535', 14, 'LICENCIADA EN ENFERMERIA', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '', '', '', '', '', 2, 'PENDIENTE', '2024-08-16 00:00:00', '0000-00-00 00:00:00', 3, 27),
('E0000028', 1, '21125115', 10, 'CONTADOR PUBLICO', '', 'ACTUALIZACIÓN PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/EXPE-21125115-16-8-2024-15-50-12.pdf', 2, 'PENDIENTE', '2024-08-16 00:00:00', '0000-00-00 00:00:00', 1, 28),
('E0000029', 1, '31005777', 14, 'LICENCIADO EN ENFERMERIA', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'PENDIENTE', '2024-08-16 00:00:00', '0000-00-00 00:00:00', 3, 29),
('E0000030', 1, '72651474', 5, 'INGENIERIA DE SISTEMAS E INFORMATICA', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-08-16 00:00:00', '2024-08-16 00:00:00', 1, 30),
('E0000031', 1, '48841144', 2, 'Ingeniero Civil', '', 'TESIS', '', '', '911', '', '370', '176', '36729', 'controller/registro_general/documentos/EXPE-48841144-23-8-2024-17-12-30.pdf', 2, 'COLACION', '2024-08-23 00:00:00', '2024-08-23 00:00:00', 8, 31),
('E0000032', 1, '31005515', 2, 'Ingeniero Civil', '', 'ACTUALIZACIÓN PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'PENDIENTE', '2024-09-12 16:45:00', '0000-00-00 00:00:00', 8, 32),
('E0000033', 1, '72458874', 2, 'Ingeniero Civil', '', 'ACTUALIZACIÓN PROFESIONAL', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, 'PENDIENTE', '2024-09-12 10:00:00', '0000-00-00 00:00:00', 8, 33),
('E0000034', 1, '72005899', 6, '', 'INGENIERIA CIVIL', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, 'PENDIENTE', '2024-09-12 10:00:00', '2024-09-12 00:00:00', 8, 34),
('E0000035', 1, '31005200', 6, '', 'INGENIERIA CIVIL', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, 'PENDIENTE', '2024-09-12 16:52:00', '0000-00-00 00:00:00', 8, 35),
('E0000036', 1, '31004584', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '926', '', '385', '176', '36744', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 18:55:00', '0000-00-00 00:00:00', 8, 36),
('E0000037', 1, '31005821', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '925', '', '384', '176', '36743', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:00:00', '0000-00-00 00:00:00', 8, 37),
('E0000038', 1, '31008511', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '924', '', '383', '176', '36742', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:02:00', '0000-00-00 00:00:00', 8, 38),
('E0000039', 1, '31008974', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '923', '', '382', '176', '36741', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:04:00', '0000-00-00 00:00:00', 8, 39),
('E0000040', 1, '31004577', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '922', '', '381', '176', '36740', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:06:00', '0000-00-00 00:00:00', 8, 40),
('E0000041', 1, '31005514', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '921', '', '380', '176', '36739', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:14:00', '0000-00-00 00:00:00', 8, 41),
('E0000042', 1, '72646120', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '920', '', '379', '176', '36738', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:27:00', '0000-00-00 00:00:00', 8, 42),
('E0000043', 1, '31005536', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '919', '', '378', '176', '36737', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:41:00', '0000-00-00 00:00:00', 8, 43),
('E0000044', 1, '31005874', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '918', '', '377', '176', '36736', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-15 19:45:00', '0000-00-00 00:00:00', 8, 44),
('E0000045', 1, '31004111', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '917', '', '376', '176', '36735', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 08:10:00', '0000-00-00 00:00:00', 8, 45),
('E0000046', 2, '31152548', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '916', '', '375', '176', '36734', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 10:18:00', '0000-00-00 00:00:00', 8, 46),
('E0000047', 1, '72646158', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '915', '', '374', '176', '36733', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 10:25:00', '0000-00-00 00:00:00', 8, 47),
('E0000048', 2, '72646122', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '914', '', '373', '176', '36732', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 10:25:00', '0000-00-00 00:00:00', 8, 48),
('E0000049', 1, '72645855', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '913', '', '372', '176', '36731', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 10:38:00', '0000-00-00 00:00:00', 8, 49),
('E0000050', 1, '72545855', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '912', '', '371', '176', '36730', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 10:46:00', '0000-00-00 00:00:00', 8, 50),
('E0000051', 3, '31005511', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '927', '', '386', '176', '36745', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-05-16 11:57:00', '0000-00-00 00:00:00', 8, 51),
('E0000052', 1, '72585554', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '928', '', '387', '176', '36746', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 12:03:00', '0000-00-00 00:00:00', 8, 52),
('E0000053', 3, '70001454', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '929', '', '388', '176', '36747', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 12:05:00', '0000-00-00 00:00:00', 8, 53),
('E0000054', 2, '72651144', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '930', '', '389', '176', '36748', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 12:09:00', '0000-00-00 00:00:00', 8, 54),
('E0000055', 2, '23522151', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '931', '', '390', '176', '36749', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 12:12:00', '0000-00-00 00:00:00', 8, 55),
('E0000056', 1, '72585520', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '932', '', '391', '176', '36750', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 12:15:00', '0000-00-00 00:00:00', 8, 56),
('E0000057', 1, '72522000', 5, '', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER AUTOMATICO', '', '', '933', '', '392', '176', '36751', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-11-16 12:36:00', '0000-00-00 00:00:00', 8, 57),
('E0000058', 1, '72558855', 5, '', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER AUTOMATICO', '', '', '934', '', '393', '176', '36752', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-11-16 12:45:00', '0000-00-00 00:00:00', 8, 58),
('E0000059', 1, '72121511', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'TESIS', '', '', '935', '', '394', '176', '36753', 'controller/registro_general/documentos/', 2, 'COLACION', '2024-11-16 13:20:00', '0000-00-00 00:00:00', 8, 59),
('E0000060', 3, '72510000', 5, '', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER AUTOMATICO', '', '', '936', '', '395', '176', '36754', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-11-16 13:22:00', '0000-00-00 00:00:00', 8, 60),
('E0000061', 3, '71254111', 6, '', 'INGENIERIA CIVIL', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 10, '', '2024-10-18 00:00:00', '2024-10-18 14:11:00', 8, 61),
('E0000062', 3, '70141152', 4, 'INGENIERO AGRONOMO', '', 'EXAMEN DE TITULACIÓN', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 10, '', '2024-11-17 00:00:00', '2024-11-17 01:01:00', 8, 62),
('E0000063', 3, '70225414', 3, 'INGENIERO AMBIENTAL', '', 'EXAMEN DE TITULACIÓN', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 10, '', '2024-11-17 13:05:00', '2024-11-17 13:05:00', 8, 63),
('E0000064', 3, '45000511', 8, '', 'ESTOMATOLOGIA', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 10, 'PENDIENTE', '2024-11-17 14:36:00', '0000-00-00 00:00:00', 3, 64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_posgrado`
--

CREATE TABLE `expediente_posgrado` (
  `Id_expediente` char(12) NOT NULL,
  `Id_cede` int(11) DEFAULT NULL,
  `Dni` char(8) DEFAULT NULL,
  `Id_programa` int(11) DEFAULT NULL,
  `Grado_maestro_de` varchar(255) DEFAULT NULL,
  `Modalidad` varchar(255) DEFAULT NULL,
  `Acto_academico` varchar(255) DEFAULT NULL,
  `Acuerdo` varchar(255) DEFAULT NULL,
  `Resolucion_rectoral_N` varchar(255) DEFAULT NULL,
  `Expedicion` varchar(255) DEFAULT NULL,
  `Libro` varchar(255) DEFAULT NULL,
  `Folio` varchar(255) DEFAULT NULL,
  `Registro` varchar(255) DEFAULT NULL,
  `Archivo` varchar(255) DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `estado` enum('PENDIENTE','EN PROCESO','COLACION') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_autoridad` int(11) DEFAULT NULL,
  `doc_ncorrelativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expediente_posgrado`
--

INSERT INTO `expediente_posgrado` (`Id_expediente`, `Id_cede`, `Dni`, `Id_programa`, `Grado_maestro_de`, `Modalidad`, `Acto_academico`, `Acuerdo`, `Resolucion_rectoral_N`, `Expedicion`, `Libro`, `Folio`, `Registro`, `Archivo`, `Id_usuario`, `estado`, `created_at`, `updated_at`, `id_autoridad`, `doc_ncorrelativo`) VALUES
('E0000003', 1, '43559383', 16, 'Pedagogia de Educación Superior', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general_posgrado/documentos/EXPE-43559383-10-8-2024-11-22-47.pdf', 2, 'COLACION', '2024-08-09 00:00:00', '2024-08-10 00:00:00', 6, 3),
('E0000004', 1, '70086232', 16, 'Pedagogia de Educación Superior', 'TESIS', '', '', '406', '', '1', '02-03', '12', 'controller/registro_general_posgrado/documentos/EXPE-70086232-9-8-2024-17-39-36.pdf', 2, 'COLACION', '2024-08-09 00:00:00', '2024-08-10 00:00:00', 6, 4),
('E0000005', 1, '72545541', 16, 'Maestro en Pedagogía de Educación Superior', 'TESIS', '', '', '2324', '', '33', '22-548', '2344', 'controller/registro_general_posgrado/documentos/', 2, 'COLACION', '2024-11-16 13:00:00', '0000-00-00 00:00:00', 8, 5),
('E0000006', 1, '72541110', 16, 'Maestro en Pedagogía de Educación Superior', 'TESIS', '', '', '2325', '', '34', '22-548', '2345', 'controller/registro_general_posgrado/documentos/', 2, 'COLACION', '2024-11-16 13:09:00', '0000-00-00 00:00:00', 8, 6),
('E0000007', 1, '71211555', 16, 'Maestro en Pedagogía de Educación Superior', 'TESIS', '', '', '2326', '', '35', '22-548', '2346', 'controller/registro_general_posgrado/documentos/', 2, 'COLACION', '2024-11-16 13:11:00', '0000-00-00 00:00:00', 8, 7),
('E0000008', 1, '72522022', 16, 'Maestro en Pedagogía de Educación Superior', 'TESIS', '', '', '2327', '', '36', '22-548', '2347', 'controller/registro_general_posgrado/documentos/', 2, 'COLACION', '2024-10-22 13:16:00', '0000-00-00 00:00:00', 8, 8),
('E0000009', 1, '25121552', 17, 'Maestro en Salud Pública', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general_posgrado/documentos/EXPE-25121552-17-11-2024-17-31-7.pdf', 2, '', '2024-11-17 00:00:00', '2024-11-17 00:00:00', 8, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `Cod_facultad` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Cod_autoridad` int(11) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`Cod_facultad`, `Nombre`, `Cod_autoridad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Ingenieria', 8, 'ACTIVO', '2024-06-01 18:19:41', '2024-09-12 22:18:04'),
(2, 'Cencias de la Salud', 3, 'ACTIVO', '2024-06-01 18:20:04', '2024-09-12 22:18:20'),
(3, 'Ciencias Jurídicas, Contables y Sociales', 2, 'ACTIVO', '2024-06-01 18:20:25', '2024-09-12 22:18:50'),
(5, 'DIRECCIÓN POSGRADO', 6, 'ACTIVO', '2024-06-22 21:20:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE `informe` (
  `id_informe` int(11) NOT NULL,
  `number_informe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informe`
--

INSERT INTO `informe` (`id_informe`, `number_informe`) VALUES
(1, 264);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe_posgrado`
--

CREATE TABLE `informe_posgrado` (
  `id_informe` int(11) NOT NULL,
  `number_informe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informe_posgrado`
--

INSERT INTO `informe_posgrado` (`id_informe`, `number_informe`) VALUES
(1, 257);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `Id_modalidad` int(11) NOT NULL,
  `Modo_obtencion` varchar(50) CHARACTER SET utf16le COLLATE utf16le_general_ci NOT NULL DEFAULT '',
  `Abreviatura_modo_estudio` varchar(2) DEFAULT NULL,
  `Modo_estudio` varchar(255) NOT NULL,
  `Trabajo_investigacion` text DEFAULT NULL,
  `Turnitin` varchar(20) DEFAULT NULL,
  `Porcentaje` varchar(12) DEFAULT NULL,
  `Centro_investigacion` varchar(250) DEFAULT NULL,
  `Reglamento_metadado` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Proce_bachiller` varchar(255) DEFAULT NULL,
  `Proce_insti_origen` varchar(255) DEFAULT NULL,
  `Proce_titulo_peda` varchar(255) DEFAULT NULL,
  `Fecha_matricula_modalidad` date DEFAULT NULL,
  `Fecha_inicio_modalidad` date DEFAULT NULL,
  `Fecha_fin_modalidad` date DEFAULT NULL,
  `Modo_sustentacion` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `Id_expediente` char(12) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lleno` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`Id_modalidad`, `Modo_obtencion`, `Abreviatura_modo_estudio`, `Modo_estudio`, `Trabajo_investigacion`, `Turnitin`, `Porcentaje`, `Centro_investigacion`, `Reglamento_metadado`, `Proce_bachiller`, `Proce_insti_origen`, `Proce_titulo_peda`, `Fecha_matricula_modalidad`, `Fecha_inicio_modalidad`, `Fecha_fin_modalidad`, `Modo_sustentacion`, `Id_usuario`, `Id_expediente`, `created_at`, `updated_at`, `lleno`) VALUES
(1, 'TESIS', 'P', 'PRESENCIAL', 'INFLUENCIA DE LA SUSTITUCIóN PARCIAL DEL AGREGADO GRUESO POR LADRILLO TRITURADO HúMEDO PARA LA DISMINUCIóN DE FISURAS Y LA RESISTENCIA A LA COMPRESIóN EN LOSAS ALIGERADAS ABANCAY - 2022\r\n', 'SI (TURNITIN)', '19%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE INGENIERíA CIVIL\r\n', 'https://repositorio.utea.edu.pe/items/2990cabc-c42d-46a6-b59a-85a995a2fffe', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000001', '2024-07-06', '2024-07-07 05:00:00', 0),
(2, 'TESIS', 'P', 'PRESENCIAL', 'INFLUENCIA DE LA SUSTITUCIóN PARCIAL DEL AGREGADO GRUESO POR LADRILLO TRITURADO HúMEDO PARA LA DISMINUCIóN DE FISURAS Y LA RESISTENCIA A LA COMPRESIóN EN LOSAS ALIGERADAS ABANCAY - 2022\r\n', 'SI (TURNITIN)', '19%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE INGENIERíA CIVIL\r\n', 'https://repositorio.utea.edu.pe/items/ffffe42a-1147-433d-8ec7-719eab8ca5ae', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000002', '2024-07-06', '2024-07-07 05:00:00', 0),
(3, 'TESIS', 'P', 'PRESENCIAL', 'VARIACIóN DEL COMPORTAMIENTO MECáNICO EN PRISMAS DE ALBAñILERíA TRADICIONAL Y REFORZADAS CON SOGA DRIZA UTILIZANDO BLOQUES HUECOS DE CONCRETO EN LA CIUDAD DE ABANCAY, 2021\r\n', 'SI (TURNITIN)', '16%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE INGENIERíA CIVIL\r\n', 'https://repositorio.utea.edu.pe/items/a9767055-03cc-4729-a024-98db70774e31', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000003', '2024-07-06', '2024-07-07 05:00:00', 0),
(4, 'TESIS', 'P', 'PRESENCIAL', 'RIESGO CARIOGéNICO DE LA DIETA EN ESCOLARES ORIUNDOS DEL DISTRITO DE CHALHUAHUACHO-COTABAMBAS, 2022\r\n', 'SI (TURNITIN)', '20%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ESTOMATOLOGíA\r\n', 'https://repositorio.utea.edu.pe/handle/utea/574\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000004', '2024-07-06', '2024-07-07 05:00:00', 0),
(5, 'TESIS', 'P', 'PRESENCIAL', 'NIVEL DE CONOCIMIENTO SOBRE PROTOCOLOS DE ATENCIóN EN URGENCIAS MéDICAS EN LA PRáCTICA ODONTOLóGICA EN CONSULTORIOS PRIVADOS EN LA CIUDAD DE ABANCAY,2022', 'SI (TURNITIN)', '19%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ESTOMATOLOGíA\r\n', 'https://repositorio.utea.edu.pe/handle/utea/637\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000005', '2024-07-06', '2024-07-07 05:00:00', 0),
(10, 'TESIS', 'P', 'PRESENCIAL', 'LA EVASIóN TRIBUTARIA EN LOS CENTROS DE EXPLOTACIóN MINERA DEL DISTRITO DE HUEPETUHE EN LA PROVINCIA DEL MANU REGIóN DE MADRE DE DIOS AñO – 2016\r\n', 'SI (TURNITIN)', '16%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE CONTABILIDAD\r\n', 'https://repositorio.utea.edu.pe/handle/utea/632\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000006', '2024-07-07', '2024-07-07 05:00:00', 0),
(11, 'TESIS', 'P', 'PRESENCIAL', 'COMPORTAMIENTO DE DIETAS ALIMENTICIAS EN EL ENGORDE DE CUYES POST DESTETE EN EL CENTRO DE INVESTIGACIóN Y PRODUCCIóN SANTO TOMAS – ABANCAY\r\n', 'SI (TURNITIN)', '24%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE AGRONOMíA\r\n', 'https://repositorio.utea.edu.pe/handle/utea/645\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000007', '2024-07-07', '2024-07-07 05:00:00', 0),
(12, 'TESIS', 'P', 'PRESENCIAL', 'EL COSTO TOTAL DE PRODUCCIóN Y SU RELACIóN CON LA RENTABILIDAD DE LAS CEVICHERíAS EN EL DISTRITO DE WANCHAQ - CUSCO, 2021\r\n', 'SI (TURNITIN)', '15%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE CONTABILIDAD\r\n', 'https://repositorio.utea.edu.pe/handle/utea/657\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000008', '2024-07-07', '2024-07-07 05:00:00', 0),
(13, 'TESIS', 'P', 'PRESENCIAL', 'EVASIóN TRIBUTARIA Y SU INCIDENCIA EN EL NIVEL DE RECAUDACIóN DEL IMPUESTO PREDIAL DE LA MUNICIPALIDAD DISTRITAL DE CAICAY PROVINCIA DE PAUCARTAMBO CUSCO AñO – 2017\r\n', 'SI (TURNITIN)', '21%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE CONTABILIDAD\r\n', 'https://repositorio.utea.edu.pe/handle/utea/658\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000009', '2024-07-07', '2024-07-17 05:00:00', 0),
(14, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000010', '2024-07-07', '2024-07-17 05:00:00', 0),
(15, 'TESIS', 'P', 'PRESENCIAL', 'DESARROLLO DE UN SISTEMA WEB PARA MEJORAR LA GESTIÓN DE HISTORIAS CLÍNICAS EN EL CONSULTORIO DENTAL ODOTOSTETIC, ABANCAY 2021', 'SI (TURNITIN)', '23%', 'CENTRO DE INVESTIGACIÓN DE LA ESCUELA DE INGENIERÍA DE SISTEMAS E INFORMÁTICA', 'https://repositorio.utea.edu.pe/items/aa931d09-042a-4b72-96ad-8524deae589b', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000011', '2024-07-16', '0000-00-00 00:00:00', 0),
(18, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000014', '2024-07-17', '0000-00-00 00:00:00', 0),
(20, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000016', '2024-07-17', '2024-07-17 05:00:00', 0),
(21, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000017', '2024-07-17', '0000-00-00 00:00:00', 0),
(22, 'ACTUALIZACIÓN PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000018', '2024-07-19', '0000-00-00 00:00:00', 0),
(23, 'TESIS', 'P', 'PRESENCIAL', 'IMPLEMENTACIóN DE UNA SOLUCIóN DE INTELIGENCIA DE NEGOCIOS PARA EL ANáLISIS DE LA INFORMACIóN EN LA DIRECCIóN DE ADMISIóN DE LA UNIVERSIDAD TECNOLóGICA DE LOS ANDES, ABANCAY–2023\r\n', 'SI (TURNITIN)', '23%', 'CENTRO DE INVESTIGACIÒN DE INGENIERIA DE SISTEMAS', 'https://repositorio.utea.edu.pe/items/b5bbcb30-d35d-4910-a5bf-9bb354db1ce2', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000019', '2024-07-20', '2024-08-16 05:00:00', 0),
(24, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000020', '2024-07-20', '0000-00-00 00:00:00', 0),
(25, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000021', '2024-07-21', '0000-00-00 00:00:00', 0),
(26, 'TESIS', 'P', 'PRESENCIAL', 'LA PSICOMOTRICIDAD Y SU RELACIóN CON EL DESARROLLO COGNITIVO EN LOS NIñOS DE 3, 4 Y 5 AñOS DE LA I.E.I. N° 344, DE LLANTUYHUANCA 2020', 'SI (TURNITIN)', '20%', 'CENTRO DE INVESTIGACIÓN DE CONTABILIDAD', 'https://repositorio.utea.edu.pe/items/51fb7797-501e-4b48-913b-63b2f933995e', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000022', '2024-07-23', '0000-00-00 00:00:00', 0),
(27, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000023', '2024-08-03', '2024-08-16 05:00:00', 0),
(28, 'ACTUALIZACIÓN PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000024', '2024-08-03', '2024-08-16 05:00:00', 0),
(29, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000025', '2024-08-03', '2024-08-16 05:00:00', 0),
(30, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000026', '2024-08-09', '0000-00-00 00:00:00', 0),
(31, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000027', '2024-08-16', '0000-00-00 00:00:00', 0),
(32, 'ACTUALIZACIÓN PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000028', '2024-08-16', '0000-00-00 00:00:00', 0),
(33, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000029', '2024-08-16', '0000-00-00 00:00:00', 0),
(34, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000030', '2024-08-16', '2024-08-16 05:00:00', 0),
(35, 'TESIS', 'P', 'PRESENCIAL', 'GRADO DE CONTAMINACIóN EN UNIFORMES DE ESTUDIANTES DEL LABORATORIO ESTOMATOLóGICO CLíNICO DE LA UNIVERSIDAD TECNOLóGICA DE LOS ANDES, ABANCAY, 2022', 'SI (TURNITIN)', '12%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ESTOMATOLOGíA\r\n', 'https://repositorio.utea.edu.pe/handle/utea/633', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000031', '2024-08-23', '2024-08-23 05:00:00', 0),
(36, 'ACTUALIZACIÓN PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000032', '2024-09-12', '0000-00-00 00:00:00', 0),
(37, 'ACTUALIZACIÓN PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000033', '2024-09-12', '0000-00-00 00:00:00', 0),
(38, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000034', '2024-09-12', '2024-09-12 05:00:00', 0),
(39, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000035', '2024-09-12', '0000-00-00 00:00:00', 0),
(40, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000036', '2024-11-15', '0000-00-00 00:00:00', 0),
(41, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000037', '2024-11-15', '0000-00-00 00:00:00', 0),
(42, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000038', '2024-11-15', '0000-00-00 00:00:00', 0),
(43, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000039', '2024-11-15', '0000-00-00 00:00:00', 0),
(44, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000040', '2024-11-15', '0000-00-00 00:00:00', 0),
(45, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000041', '2024-11-15', '0000-00-00 00:00:00', 0),
(46, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000042', '2024-11-15', '0000-00-00 00:00:00', 0),
(47, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000043', '2024-11-15', '0000-00-00 00:00:00', 0),
(48, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000044', '2024-11-15', '0000-00-00 00:00:00', 0),
(49, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000045', '2024-11-16', '0000-00-00 00:00:00', 0),
(50, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000046', '2024-11-16', '0000-00-00 00:00:00', 0),
(51, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000047', '2024-11-16', '0000-00-00 00:00:00', 0),
(52, 'TESIS', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000048', '2024-11-16', '0000-00-00 00:00:00', 0),
(53, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000049', '2024-11-16', '0000-00-00 00:00:00', 0),
(54, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000050', '2024-11-16', '0000-00-00 00:00:00', 0),
(55, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000051', '2024-11-16', '0000-00-00 00:00:00', 0),
(56, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000052', '2024-11-16', '0000-00-00 00:00:00', 0),
(57, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000053', '2024-11-16', '0000-00-00 00:00:00', 0),
(58, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000054', '2024-11-16', '0000-00-00 00:00:00', 0),
(59, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000055', '2024-11-16', '0000-00-00 00:00:00', 0),
(60, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000056', '2024-11-16', '0000-00-00 00:00:00', 0),
(61, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000057', '2024-11-16', '0000-00-00 00:00:00', 0),
(62, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000058', '2024-11-16', '0000-00-00 00:00:00', 0),
(63, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000059', '2024-11-16', '0000-00-00 00:00:00', 0),
(64, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000060', '2024-11-16', '0000-00-00 00:00:00', 0),
(65, 'CURSO (TRABAJO DE INVESTIGACIÓN)', 'P', 'PRESENCIAL', 'SDFSDF', 'SI', '12', 'DSF', 'SDF', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000061', '2024-11-17', '2024-11-17 21:33:38', 1),
(66, 'EXAMEN DE TITULACIÓN', 'P', 'PRESENCIAL', 'DFSDF', 'SI', '12', 'SAF', 'SDF', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000062', '2024-11-17', '2024-11-17 20:53:07', 1),
(67, 'EXAMEN DE TITULACIÓN', 'P', 'PRESENCIAL', 'SDFDSF', 'si', '21', 'SDFDSF', 'sdf', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000063', '2024-11-17', '2024-11-17 20:59:19', 1),
(68, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 10, 'E0000064', '2024-11-17', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad_posgrado`
--

CREATE TABLE `modalidad_posgrado` (
  `Id_modalidad` int(11) NOT NULL,
  `Modo_obtencion` varchar(50) CHARACTER SET utf16le COLLATE utf16le_general_ci NOT NULL DEFAULT '',
  `Abreviatura_modo_estudio` varchar(2) DEFAULT NULL,
  `Modo_estudio` varchar(255) NOT NULL,
  `Trabajo_investigacion` text DEFAULT NULL,
  `Turnitin` varchar(20) DEFAULT NULL,
  `Porcentaje` varchar(12) DEFAULT NULL,
  `Centro_investigacion` varchar(250) DEFAULT NULL,
  `Reglamento_metadado` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Proce_pais_ext` varchar(255) DEFAULT NULL,
  `Proce_univ_ext` varchar(255) DEFAULT NULL,
  `Proce_grado_ext` varchar(255) DEFAULT NULL,
  `Fecha_matricula_modalidad` date DEFAULT NULL,
  `Fecha_inicio_modalidad` date DEFAULT NULL,
  `Fecha_fin_modalidad` date DEFAULT NULL,
  `Modo_sustentacion` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `Id_expediente` char(12) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lleno` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad_posgrado`
--

INSERT INTO `modalidad_posgrado` (`Id_modalidad`, `Modo_obtencion`, `Abreviatura_modo_estudio`, `Modo_estudio`, `Trabajo_investigacion`, `Turnitin`, `Porcentaje`, `Centro_investigacion`, `Reglamento_metadado`, `Proce_pais_ext`, `Proce_univ_ext`, `Proce_grado_ext`, `Fecha_matricula_modalidad`, `Fecha_inicio_modalidad`, `Fecha_fin_modalidad`, `Modo_sustentacion`, `Id_usuario`, `Id_expediente`, `created_at`, `updated_at`, `lleno`) VALUES
(30, 'TESIS', 'P', 'PRESENCIAL', 'LA EDUCACIóN COOPERATIVA Y LA CALIDAD DE LA ADMINISTRACIóN EN LA COOPERATIVA DE AHORRO Y CRéDITO “LOS ANDES” COTARUSI AYMARAES 2021\r\n', 'SI (TURNITIN)', '19%', 'SUB DIRECCION  DE INVESTIGACIÓN DE PEDAGOGIA EN EDUCACION SUPERIOR\r\n', 'https://repositorio.utea.edu.pe/handle/utea/622\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000003', '2024-08-09', '2024-08-10 05:00:00', 1),
(32, 'TESIS', 'P', 'PRESENCIAL', 'CONDICIONAMIENTO DE LOS HáBITOS DE ESTUDIO EN EL RENDIMIENTO ACADéMICO DE LOS ESTUDIANTES DE QUINTO SEMESTRE DE LA E.P. INGENIERíA CIVIL DE LA UTEA ABANCAY 2020', 'SI (TURNITIN)', '18%', 'SUB DIRECCION  DE INVESTIGACIÓN DE PEDAGOGIA EN EDUCACION SUPERIOR\r\n', 'https://repositorio.utea.edu.pe/handle/utea/625666', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000004', '2024-08-09', '2024-08-10 05:00:00', 1),
(33, 'TESIS', 'P', 'PRESENCIAL', 'ANáLISIS DE LOS FACTORES QUE CONTRIBUYEN Y LIMITAN LA ESTRATEGIA DE SEGUIMIENTO E IMPLEMENTACIóN DE FORTALECIMIENTO DE LA GESTIóN EN LA UGEL-PUNO PARA LA PREVENCIóN DE LA VIOLENCIA CONTRA LAS MUJERES E INTEGRANTES DEL GRUPO FAMILIAR: UNA MIRADA DESDE LA E', 'SI (TURNITIN)', '15%', 'CENTRO DE INVESTIGACIÓN DE LA ESCUELA DE POSGRADO', 'https://tesis.pucp.edu.pe/repositorio/handle/20.500.12404/29419', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000005', '2024-11-16', '2024-11-17 22:23:44', 1),
(34, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000006', '2024-11-16', '0000-00-00 00:00:00', 0),
(35, 'TESIS', 'P', 'PRESENCIAL', 'MODELO PROLAB: PYMESHIELD, PROPUESTA DE MODELO DE NEGOCIO SOSTENIBLE DE CIBERSEGURIDAD PARA PYMES\n', 'SI (TURNITIN)', '15%', 'CENTRO DE INVESTIGACIÓN DE LA ESCUELA DE POSGRADO', 'https://tesis.pucp.edu.pe/repositorio/handle/20.500.12404/29414', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000007', '2024-11-16', '2024-11-17 22:24:28', 1),
(36, 'TESIS', 'P', 'PRESENCIAL', 'SDFD', 'SI (TURNITIN)', '12', 'SDF', 'DSF', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 13, 'E0000008', '2024-11-16', '2024-11-17 22:22:05', 1),
(37, 'TESIS', 'P', 'PRESENCIAL', 'GESTIóN DE LA POLíTICA CáRCELES PRODUCTIVAS EN EL MEDIO LIBRE CALLAO PARA FORTALECER LAS COMPETENCIAS LABORALES DE LA POBLACIóN POSTPENITENCIARIA EN EL PROCESO DE LA REINSERCIóN LABORAL\r\n', 'SI (TURNITIN)', '15%', 'CENTRO DE INVESTIGACIÓN DE LA  ESCUELA DE POSGRADO', 'https://tesis.pucp.edu.pe/repositorio/handle/20.500.12404/29403', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000009', '2024-11-17', '2024-11-17 05:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_posgrado`
--

CREATE TABLE `programa_posgrado` (
  `Id_programa` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Grado_academico` enum('MAESTRIA','DOCTORADO','SEGUNDA ESPECIALIDAD') NOT NULL,
  `Abreviatura_grado` enum('M','D','SE') DEFAULT NULL,
  `Denominación_grado` varchar(50) NOT NULL,
  `Programa_estudio` varchar(50) NOT NULL,
  `Numero_creditos` int(11) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `id_autoridad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programa_posgrado`
--

INSERT INTO `programa_posgrado` (`Id_programa`, `Nombre`, `Grado_academico`, `Abreviatura_grado`, `Denominación_grado`, `Programa_estudio`, `Numero_creditos`, `Estado`, `id_autoridad`, `created_at`, `updated_at`) VALUES
(16, 'Pedagogia de  Educación Superior', 'MAESTRIA', 'M', 'Maestro en Pedagogía de Educación Superior', 'CICLO REGULAR', 48, 'ACTIVO', 8, '2024-08-03 14:32:05', '2024-09-12 22:33:21'),
(17, 'Salud Pública', 'MAESTRIA', 'M', 'Maestro en Salud Pública', 'CICLO REGULAR', 48, 'ACTIVO', 8, '2024-08-03 16:00:33', '2024-09-12 22:32:15'),
(18, 'Proyectos de Inversión', 'MAESTRIA', 'M', 'Maestro en Proyectos de Inversión', 'CICLO REGULAR', 48, 'ACTIVO', 8, '2024-08-03 16:08:12', '2024-09-12 22:32:28'),
(19, 'Derecho Ambiental', 'MAESTRIA', 'M', 'Maestro en Derecho Ambiental', 'CICLO REGULAR', 48, 'ACTIVO', 8, '2024-08-03 16:08:49', '2024-09-12 22:32:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_usuario` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT '',
  `usu_contra` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_feccreacion` date DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `usu_rol` enum('Secretario (a)','Super Administrador','Repositorio','Administrador') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `empresa_id` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_usuario`, `usu_contra`, `usu_feccreacion`, `empleado_id`, `usu_estatus`, `area_id`, `usu_rol`, `empresa_id`, `created_at`, `updated_at`, `id_sede`) VALUES
(2, 'jersson', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', 1, 'ACTIVO', 2, 'Super Administrador', 2, NULL, NULL, 1),
(3, 'JOSE', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', 2, 'ACTIVO', 1, 'Secretario (a)', 2, NULL, NULL, 2),
(4, 'ANDREA', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', 3, 'ACTIVO', 3, 'Secretario (a)', 2, NULL, NULL, 1),
(5, 'LUIS', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', 4, 'ACTIVO', 5, 'Secretario (a)', 2, NULL, NULL, 1),
(6, 'JUAN', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-27', 5, 'ACTIVO', 4, 'Secretario (a)', 2, NULL, NULL, 2),
(7, 'WILLY', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-09-07', 7, 'ACTIVO', 4, 'Administrador', 2, NULL, NULL, 2),
(8, 'eliascar', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-09-10', 8, 'ACTIVO', 6, 'Secretario (a)', 2, NULL, NULL, 3),
(9, 'jose123', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2024-02-11', 10, 'ACTIVO', 7, 'Secretario (a)', 2, NULL, NULL, 3),
(10, 'DANIELA', '$2y$12$1iqz9wo.zSSb.f0DEKlykeH6wqFCh71aw/0IEMmPBSASjWbFrjBcG', '2024-11-17', 12, 'ACTIVO', 1, 'Secretario (a)', 2, '2024-11-17 15:39:39', NULL, 3),
(11, 'ROLANDO', '$2y$12$Je77Mbmri92xKnAYZiSas.0yU8llAAP4/FoNlcpK1oUlUhCw56KpC', '2024-11-17', 11, 'ACTIVO', 11, 'Administrador', 2, '2024-11-17 16:09:06', '2024-11-17 16:14:38', 1),
(13, 'PEDRO', '$2y$12$dacgwRFJhnjhAdn6IPo3BuYvLDb0EhdKTHPt8vgTRXlt7p1eoCprK', '2024-11-17', 9, 'ACTIVO', 3, 'Repositorio', 2, '2024-11-17 19:50:56', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_cod`) USING BTREE,
  ADD UNIQUE KEY `unico` (`area_nombre`) USING BTREE;

--
-- Indices de la tabla `autoridades`
--
ALTER TABLE `autoridades`
  ADD PRIMARY KEY (`Cod_autoridad`),
  ADD KEY `fk_empres` (`Id_empresa`);

--
-- Indices de la tabla `cede`
--
ALTER TABLE `cede`
  ADD PRIMARY KEY (`Id_cede`);

--
-- Indices de la tabla `colacion`
--
ALTER TABLE `colacion`
  ADD PRIMARY KEY (`id_colacion`);

--
-- Indices de la tabla `colacion_posgrado`
--
ALTER TABLE `colacion_posgrado`
  ADD PRIMARY KEY (`id_colacion`);

--
-- Indices de la tabla `diploma`
--
ALTER TABLE `diploma`
  ADD PRIMARY KEY (`Id_Diploma`),
  ADD KEY `fk_usuario2` (`id_usuario`),
  ADD KEY `fk_modalidad` (`id_modalidad`),
  ADD KEY `fk_colacion` (`id_colacion`);

--
-- Indices de la tabla `diploma_posgrado`
--
ALTER TABLE `diploma_posgrado`
  ADD PRIMARY KEY (`Id_Diploma`),
  ADD KEY `fk_usuario2` (`id_usuario`),
  ADD KEY `fk_modalidad` (`id_modalidad`),
  ADD KEY `fk_colacion` (`id_colacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`) USING BTREE;

--
-- Indices de la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  ADD PRIMARY KEY (`Id_escuela`) USING BTREE,
  ADD KEY `fk_facu` (`Id_facultad`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Dni`),
  ADD KEY `fk_usuario` (`id_usuario`);

--
-- Indices de la tabla `estudiante_posgrado`
--
ALTER TABLE `estudiante_posgrado`
  ADD PRIMARY KEY (`Dni`),
  ADD KEY `fk_usuario` (`id_usuario`);

--
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`Id_expediente`),
  ADD KEY `fk_estudiante6` (`Dni`),
  ADD KEY `fk_escuelaa` (`Id_escuela`),
  ADD KEY `fk_usuario5` (`Id_usuario`),
  ADD KEY `fk_cede` (`Id_cede`),
  ADD KEY `fk_autopre` (`id_autoridad`);

--
-- Indices de la tabla `expediente_posgrado`
--
ALTER TABLE `expediente_posgrado`
  ADD PRIMARY KEY (`Id_expediente`),
  ADD KEY `fk_estudiante6` (`Dni`),
  ADD KEY `fk_escuelaa` (`Id_programa`),
  ADD KEY `fk_usuario5` (`Id_usuario`),
  ADD KEY `fk_cede` (`Id_cede`),
  ADD KEY `expediente_posgrado_ibfk_5` (`id_autoridad`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD KEY `fk_autoridad` (`Cod_autoridad`),
  ADD KEY `Cod_facultad` (`Cod_facultad`);

--
-- Indices de la tabla `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`id_informe`);

--
-- Indices de la tabla `informe_posgrado`
--
ALTER TABLE `informe_posgrado`
  ADD PRIMARY KEY (`id_informe`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`Id_modalidad`),
  ADD KEY `fk_user` (`Id_usuario`),
  ADD KEY `fk_expediente` (`Id_expediente`);

--
-- Indices de la tabla `modalidad_posgrado`
--
ALTER TABLE `modalidad_posgrado`
  ADD PRIMARY KEY (`Id_modalidad`),
  ADD KEY `fk_user` (`Id_usuario`),
  ADD KEY `fk_expediente` (`Id_expediente`);

--
-- Indices de la tabla `programa_posgrado`
--
ALTER TABLE `programa_posgrado`
  ADD PRIMARY KEY (`Id_programa`) USING BTREE,
  ADD KEY `fk_autoridad_pro` (`id_autoridad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`) USING BTREE,
  ADD KEY `empleado_id` (`empleado_id`) USING BTREE,
  ADD KEY `area_id` (`area_id`) USING BTREE,
  ADD KEY `empresa_id` (`empresa_id`) USING BTREE,
  ADD KEY `usuario_sede` (`id_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `area_cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del area', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `autoridades`
--
ALTER TABLE `autoridades`
  MODIFY `Cod_autoridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cede`
--
ALTER TABLE `cede`
  MODIFY `Id_cede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `colacion`
--
ALTER TABLE `colacion`
  MODIFY `id_colacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `colacion_posgrado`
--
ALTER TABLE `colacion_posgrado`
  MODIFY `id_colacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `diploma`
--
ALTER TABLE `diploma`
  MODIFY `Id_Diploma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `diploma_posgrado`
--
ALTER TABLE `diploma_posgrado`
  MODIFY `Id_Diploma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `empleado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  MODIFY `Id_escuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
  MODIFY `Cod_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `informe`
--
ALTER TABLE `informe`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `informe_posgrado`
--
ALTER TABLE `informe_posgrado`
  MODIFY `id_informe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `Id_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `modalidad_posgrado`
--
ALTER TABLE `modalidad_posgrado`
  MODIFY `Id_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `programa_posgrado`
--
ALTER TABLE `programa_posgrado`
  MODIFY `Id_programa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autoridades`
--
ALTER TABLE `autoridades`
  ADD CONSTRAINT `fk_empres` FOREIGN KEY (`Id_empresa`) REFERENCES `empresa` (`empresa_id`);

--
-- Filtros para la tabla `diploma`
--
ALTER TABLE `diploma`
  ADD CONSTRAINT `cola` FOREIGN KEY (`id_colacion`) REFERENCES `colacion` (`id_colacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad` (`Id_modalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `diploma_posgrado`
--
ALTER TABLE `diploma_posgrado`
  ADD CONSTRAINT `diploma_posgrado_ibfk_1` FOREIGN KEY (`id_colacion`) REFERENCES `colacion_posgrado` (`id_colacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `diploma_posgrado_ibfk_2` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad_posgrado` (`Id_modalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diploma_posgrado_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  ADD CONSTRAINT `fk_facu` FOREIGN KEY (`Id_facultad`) REFERENCES `facultad` (`Cod_facultad`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `estudiante_posgrado`
--
ALTER TABLE `estudiante_posgrado`
  ADD CONSTRAINT `estudiante_posgrado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `fk_autopre` FOREIGN KEY (`id_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cede` FOREIGN KEY (`Id_cede`) REFERENCES `cede` (`Id_cede`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_escuelaa` FOREIGN KEY (`Id_escuela`) REFERENCES `escuela_profesional` (`Id_escuela`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estudiante6` FOREIGN KEY (`Dni`) REFERENCES `estudiante` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario5` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `expediente_posgrado`
--
ALTER TABLE `expediente_posgrado`
  ADD CONSTRAINT `expediente_posgrado_ibfk_1` FOREIGN KEY (`Id_cede`) REFERENCES `cede` (`Id_cede`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_2` FOREIGN KEY (`Id_programa`) REFERENCES `programa_posgrado` (`Id_programa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_3` FOREIGN KEY (`Dni`) REFERENCES `estudiante_posgrado` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_4` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_5` FOREIGN KEY (`id_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `fk_autoridad` FOREIGN KEY (`Cod_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`);

--
-- Filtros para la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD CONSTRAINT `fk_expe` FOREIGN KEY (`Id_expediente`) REFERENCES `expediente` (`Id_expediente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `modalidad_posgrado`
--
ALTER TABLE `modalidad_posgrado`
  ADD CONSTRAINT `modalidad_posgrado_ibfk_1` FOREIGN KEY (`Id_expediente`) REFERENCES `expediente_posgrado` (`Id_expediente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modalidad_posgrado_ibfk_2` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `programa_posgrado`
--
ALTER TABLE `programa_posgrado`
  ADD CONSTRAINT `fk_autoridad_pro` FOREIGN KEY (`id_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`),
  ADD CONSTRAINT `usuario_sede` FOREIGN KEY (`id_sede`) REFERENCES `cede` (`Id_cede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
