-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2024 a las 20:50:17
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
estudiante.tipo_documento,

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
estudiante_posgrado.tipo_documento,
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_NUMERITO` ()   SELECT
informe.id_informe,
informe.number_informe
FROM
informe$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CARGAR_NUMERITO_POS` ()   SELECT
informe_posgrado.id_informe,
informe_posgrado.number_informe
FROM
informe_posgrado$$

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
estudiante.tipo_documento,
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
diploma.estado_diploma_escaneo,
diploma.diploma_escaneado,
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
estudiante.tipo_documento,

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
diploma.estado_diploma_escaneo,
diploma.diploma_escaneado,
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
estudiante.tipo_documento,
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
estudiante_posgrado.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
	estudiante_posgrado.tipo_documento,
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
	diploma_posgrado.estado_diploma_escaneo,
	diploma_posgrado.diploma_escaneado, 
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
						date_format( diploma_posgrado.fecha_firma, "%d-%m-%Y" ) AS fecha_registro3,
estudiante_posgrado.tipo_documento



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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante_posgrado.tipo_documento,
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
estudiante_posgrado.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,

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
diploma.estado_diploma_escaneo,
diploma.diploma_escaneado,
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
estudiante.tipo_documento,

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
diploma.estado_diploma_escaneo,
diploma.diploma_escaneado,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
estudiante.tipo_documento,
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
	estudiante_posgrado.tipo_documento,
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
	expediente_posgrado.estado as estadito, 
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
	diploma_posgrado.estado_diploma_escaneo,
	diploma_posgrado.diploma_escaneado,
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
						date_format( diploma.fecha_firma, "%d-%m-%Y" ) AS fecha_registro3,
estudiante.tipo_documento
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
estudiante.tipo_documento,

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_BACHILLER` (IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `CED` INT, IN `IDESCUE` INT, IN `BACH` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
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

		IF  MODA = 'BACHILLER AUTOMATICO' THEN


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
      updated_at = CURDATE(),
			lleno=0
    WHERE Id_modalidad = IDMODA;

	ELSE
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
      updated_at = CURDATE(),
			lleno=1
    WHERE Id_modalidad = IDMODA;

END IF;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_INFORME` (IN `ID` INT, IN `NUM` INT)   UPDATE informe
SET informe.number_informe=NUM
WHERE informe.id_informe=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_INFORME_POS` (IN `ID` INT, IN `NUM` INT)   UPDATE informe_posgrado
SET informe_posgrado.number_informe=NUM
WHERE informe_posgrado.id_informe=ID$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_POSGRADO` (IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `IDPROGRA` INT, IN `MAES` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATE, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_PAIS` VARCHAR(255), IN `PRO_UNI` VARCHAR(255), IN `PRO_GRADO` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
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
      estado = 'EN PROCESO',
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_TITULADO` (IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `IDEXPE` CHAR(12), IN `CED` INT, IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `ID_AUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `IDMODA` INT, IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `IDDIPLO` INT, IN `FECHACU` DATE, IN `FECHAFIRMA` DATE, IN `RESOLDIPLO` VARCHAR(30), IN `FECHARESO` DATE, IN `NUMDIPLO` INT, IN `REGINUM` INT, IN `REGISLIB` INT, IN `REGISFOL` INT, IN `TIPODIPLO` CHAR(1), IN `FECHA_INI_TRA` DATE, IN `NROCREDI` INT, IN `NROOFICIO` VARCHAR(255), IN `FECHASECRE` DATE, IN `USU` INT)   BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_BACHILLER` (IN `TIPODOC` VARCHAR(20), IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `IDESCUE` INT, IN `BACH` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
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

	IF  MODA = 'BACHILLER AUTOMATICO' THEN

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at,lleno)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'',1);
	
	ELSE
	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at,lleno)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'',0);

	END IF;
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

	INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA','NO');
	SELECT 1;



	ELSE
	INSERT INTO estudiante(tipo_documento,Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(TIPODOC,NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,'',BACH,MODA,'',ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));


IF  MODA = 'CURSO (TRABAJO DE INVESTIGACIÓN)' THEN

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at,lleno)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'',1);
	
	ELSE
	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at,lleno)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'',0);

	END IF;	
SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

	INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA','NO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_POSGRADO` (IN `TIPODOCUMEN` VARCHAR(20), IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `PROGRA` INT, IN `DENO` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_PAIS` VARCHAR(255), IN `PRO_UNI` VARCHAR(255), IN `PRO_GRAD` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
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

		INSERT INTO diploma_posgrado(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','O','','','','','','',USU,@ulti,@ULID,'',NOW(),'SIN DIPLOMA','NO');
		SELECT 1;
		
		ELSE
		
		INSERT INTO estudiante_posgrado(tipo_documento,Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(TIPODOCUMEN,NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
		
		INSERT INTO expediente_posgrado(Id_expediente,Id_cede,Dni,Id_programa,Grado_maestro_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,PROGRA,DENO,MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));


		INSERT INTO modalidad_posgrado(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_pais_ext,Proce_univ_ext,Proce_grado_ext,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_PAIS,PRO_UNI,PRO_GRAD,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
		SET @ulti:=(SELECT MAX(modalidad_posgrado.Id_modalidad) AS id FROM modalidad_posgrado);

		INSERT INTO diploma_posgrado(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','O','','','','','','',USU,@ulti,@ULID,'',NOW(),'SIN DIPLOMA','NO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TITULADO` (IN `TIPODOC` VARCHAR(20), IN `NDOCUMENTO` CHAR(20), IN `NOMBRE` VARCHAR(150), IN `APEPAT` VARCHAR(100), IN `APEMAT` VARCHAR(100), IN `CODIGO` CHAR(15), IN `SEXO` VARCHAR(20), IN `MOVIL` CHAR(9), IN `DIRECCION` VARCHAR(255), IN `EMAPER` VARCHAR(255), IN `EMAINSTI` VARCHAR(255), IN `FECHAMATRI` DATE, IN `FECHAEGRE` DATE, IN `OBERSER` VARCHAR(255), IN `CED` INT, IN `IDESCUE` INT, IN `TITU` VARCHAR(255), IN `MODA` VARCHAR(255), IN `IDAUTO` INT, IN `FECHA` DATETIME, IN `ACTOACA` VARCHAR(255), IN `ACUER` VARCHAR(255), IN `RESOL` VARCHAR(255), IN `EXPE` VARCHAR(255), IN `LIB` VARCHAR(255), IN `FOLI` VARCHAR(255), IN `REGIS` VARCHAR(255), IN `RUTA` VARCHAR(255), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
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

		INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA','NO');
	SELECT 1;
	ELSE
	INSERT INTO estudiante(tipo_documento,Dni,Codigo,Nombres,Apellido_paterno,Apellido_materno,Sexo,Celular,Direccion,Fecha_matricula,Fecha_egreso,correo_personal,correo_institucional,Observaciones,Años_transcurridos,Meses_transcurridos,Dias_transcurridos,id_usuario,created_at,updated_at)VALUES(TIPODOC,NDOCUMENTO,CODIGO,NOMBRE,APEPAT,APEMAT,SEXO,MOVIL,DIRECCION,FECHAMATRI,FECHAEGRE,EMAPER,EMAINSTI,OBERSER,@AÑO,@MES,@DIA,USU,CURDATE(),'');
	INSERT INTO expediente(Id_expediente,Id_cede,Dni,Id_escuela,Titulo_de,Grado_bachiller_de,Modalidad,Acto_academico,Acuerdo,Resolucion_rectoral_N,Expedicion,Libro,Folio,Registro,Archivo,Id_usuario,estado,created_at,updated_at,id_autoridad,doc_ncorrelativo) VALUES(@cod,CED,NDOCUMENTO,IDESCUE,TITU,'',MODA,ACTOACA,ACUER,RESOL,EXPE,LIB,FOLI,REGIS,RUTA,USU,'PENDIENTE',FECHA,'',IDAUTO,(@cantidad+1));

	INSERT INTO modalidad(Modo_obtencion,Abreviatura_modo_estudio,Modo_estudio,Trabajo_investigacion,Turnitin,Porcentaje,Centro_investigacion,Reglamento_metadado,Proce_bachiller,Proce_insti_origen,Proce_titulo_peda,Fecha_matricula_modalidad,Fecha_inicio_modalidad,Fecha_fin_modalidad,Modo_sustentacion,Id_usuario,Id_expediente,created_at,updated_at)VALUES(MODA,'P',MODO_ESTU,TRABA_INV,TURNITIN,PORCENTAJE,CENTRO_INVE,REGLA_META,PRO_BACH,PRO_INST,PRO_TITU,FECHA_MATRI_MOD,FECHA_INIC_MOD,FECHA_FIN_MOD,MODO_SUSTE,USU,@cod,NOW(),'');
	SET @ulti:=(SELECT MAX(Id_modalidad) AS id FROM modalidad);
SET @ULID:=(SELECT MAX(colacion.id_colacion) FROM colacion);

		INSERT INTO diploma(fecha_consejo_uni,fecha_firma,Resolucion_numero,fecha_resolucion,Diploma_numero,Registro_numero,Registro_libro,Registro_folio,Diploma_tipo_emitido,Fecha_inicio_tramite,Fecha_finalizacion_tramite,años_trans,mes_trans,dia_trand,Nro_creditos,Nro_oficio,fecha_secreatria_general,id_usuario,id_modalidad,id_colacion,created_at,updated_at,estado,estado_diploma_escaneo) VALUES('','','','','','','','','','','','','','','','','',USU,@ulti,@ULID,NOW(),NOW(),'SIN DIPLOMA','NO');
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUBIR_DIPLOMA_ESCANEADO` (IN `ID` INT, IN `ARCHIVO` VARCHAR(255))   UPDATE diploma
SET
diploma.diploma_escaneado=ARCHIVO,
diploma.estado_diploma_escaneo='SI',
diploma.updated_at=NOW()
WHERE diploma.Id_Diploma=ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUBIR_DIPLOMA_ESCANEADO_POSGRADO` (IN `ID` INT, IN `ARCHIVO` VARCHAR(255))   UPDATE diploma_posgrado
SET
diploma_posgrado.diploma_escaneado=ARCHIVO,
diploma_posgrado.estado_diploma_escaneo='SI',
diploma_posgrado.updated_at=NOW()
WHERE diploma_posgrado.Id_Diploma=ID$$

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
  `area_nombre` varchar(50) NOT NULL COMMENT 'nombre del area',
  `area_fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'fecha del registro del movimiento',
  `area_estado` enum('ACTIVO','INACTIVO') NOT NULL COMMENT 'estado del area',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Entidad Area' ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`area_cod`, `area_nombre`, `area_fecha_registro`, `area_estado`, `created_at`, `updated_at`) VALUES
(2, 'SISTEMA WEB', '2023-08-25 14:08:07', 'INACTIVO', NULL, NULL),
(3, 'GRADOS Y TÍTULOS', '2024-11-18 17:43:55', 'ACTIVO', NULL, NULL),
(4, 'RESPONSABLE GRADOS Y TÍTULOS ANDAHUAYLAS', '2024-11-18 17:44:09', 'ACTIVO', NULL, NULL),
(5, 'RESPONSABLE GRADOS Y TÍTULOS CUSCO', '2024-11-18 17:44:16', 'ACTIVO', NULL, NULL),
(6, 'REPOSITORIO BIBLIOTECA', '2024-11-18 17:44:24', 'ACTIVO', NULL, NULL);

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
(2, 'DR. ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'MG. JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'MG. BONIFACIO ROBLES AGUIRRE', 'DECANO', '2024-05-30 21:55:20', '2024-06-02 10:40:51', 2, 'ACTIVO'),
(3, 'DR. ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'MG. JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'MG. GILDA LUCY LOAYZA ROJAS ', 'DECANO', '2024-05-30 21:56:25', '2024-06-15 09:08:06', 2, 'ACTIVO'),
(9, 'DR. ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'ABOG. JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'MAG. ALFREDO MARISCAL ZÚNIGA', 'DIRECTOR', '2024-09-17 19:42:24', '2024-09-17 14:42:42', 2, 'ACTIVO');

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
(3, 2024, '13 DE SETIEMBRE 2024', '2024-09-13', '2024-08-29', '2024-08-29', '2024-08-28', '6966', 'PASADO', '2024-08-11', '0000-00-00 00:00:00'),
(4, 2024, '25 DE SETIEMBRE DEL 2024', '2024-09-25', '2024-09-25', '2024-09-20', '2024-09-20', '565', 'PASADO', '2024-09-17', '0000-00-00 00:00:00'),
(5, 2024, '03 DE OCTUBRE DE 2024', '2024-10-03', '2024-09-29', '2024-09-29', '2024-09-29', '122', 'PASADO', '2024-09-29', '0000-00-00 00:00:00'),
(6, 2024, '10 DE OCTUBRE', '2024-10-10', '2024-10-05', '2024-10-05', '2024-10-05', '6166', 'PASADO', '2024-10-05', '0000-00-00 00:00:00'),
(7, 2024, 'PRUEBA', '2024-10-17', '2024-10-17', '2024-10-17', '2024-10-17', '23', 'PASADO', '2024-10-17', '0000-00-00 00:00:00'),
(8, 2024, 'PRUEBA 2', '2024-10-30', '2024-10-30', '2024-10-30', '2024-10-30', '213', 'PASADO', '2024-10-30', '0000-00-00 00:00:00'),
(9, 2024, '9 DE NOVIEMBRE', '2024-11-05', '2024-11-05', '2024-11-05', '2024-11-05', '121', 'PASADO', '2024-11-05', '2024-11-17 17:44:15'),
(10, 2024, 'MHFX', '2024-11-17', '2024-11-17', '2024-11-17', '2024-11-17', '2153', 'VIGENTE', '2024-11-17', '0000-00-00 00:00:00');

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
(3, 2024, '30 DE AGOSTO DE 2024', '2024-08-31', '2024-08-20', '2024-08-20', '2024-08-20', '2444', 'PASADO', '2024-08-11', '2024-08-11 15:56:10'),
(4, 2024, '03 DE OCTUBRE DE 2024', '2024-10-03', '2024-09-29', '2024-09-29', '2024-09-29', '6226', 'PASADO', '2024-09-29', '0000-00-00 00:00:00'),
(5, 2024, '23', '2024-11-17', '2024-11-17', '2024-11-17', '2024-11-17', '12', 'PASADO', '2024-11-17', '0000-00-00 00:00:00'),
(6, 2024, 'COLACION HOY', '2024-11-23', '2024-11-23', '2024-11-23', '2024-11-23', '213', 'VIGENTE', '2024-11-23', '0000-00-00 00:00:00');

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
  `Registro_folio` mediumtext NOT NULL,
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
  `estado` enum('SIN DIPLOMA','CON DIPLOMA') DEFAULT NULL,
  `estado_diploma_escaneo` enum('NO','SI') DEFAULT NULL,
  `diploma_escaneado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diploma`
--

INSERT INTO `diploma` (`Id_Diploma`, `fecha_consejo_uni`, `fecha_firma`, `Resolucion_numero`, `fecha_resolucion`, `Diploma_numero`, `Registro_numero`, `Registro_libro`, `Registro_folio`, `Diploma_tipo_emitido`, `Fecha_inicio_tramite`, `Fecha_finalizacion_tramite`, `años_trans`, `mes_trans`, `dia_trand`, `Nro_creditos`, `Nro_oficio`, `fecha_secreatria_general`, `id_usuario`, `id_modalidad`, `id_colacion`, `created_at`, `updated_at`, `estado`, `estado_diploma_escaneo`, `diploma_escaneado`) VALUES
(3, '2024-09-25', '2024-09-20', 1349, '2024-09-20', 14463, 31755, 321, '310', 'O', '2024-09-29', '2024-09-29', 0, 0, 0, 220, '555', '2024-09-25', 2, 3, 4, '2024-09-29', '2024-09-29 15:34:53', 'CON DIPLOMA', 'NO', NULL),
(4, '2024-09-25', '2024-09-20', 1350, '2024-09-20', 14464, 31756, 322, '310', 'O', '2024-09-29', '2024-09-29', 0, 0, 0, 220, '599', '2024-09-25', 2, 4, 4, '2024-09-29', '2024-09-29 15:37:37', 'CON DIPLOMA', 'NO', NULL),
(5, '2024-09-29', '2024-09-29', 1351, '2024-09-29', 14465, 31757, 323, '310 -311', 'O', '2024-09-29', '2024-09-29', 0, 0, 0, 220, '122', '2024-10-03', 2, 5, 5, '2024-09-29', '2024-09-29 16:14:02', 'CON DIPLOMA', 'SI', 'controller/diplomas/documentos/EXPE-[object HTMLInputElement]-23-11-2024-10-40-6.pdf'),
(6, '2024-09-29', '0000-00-00', 0, '2024-09-29', 0, 0, 0, '0', '', '0000-00-00', '2024-09-29', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 6, 10, '2024-09-29', '2024-09-29 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(7, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 7, 10, '2024-09-29', '2024-09-29 16:42:05', 'SIN DIPLOMA', 'NO', NULL),
(41, '2024-10-17', '0000-00-00', 0, '2024-10-17', 0, 0, 0, '0', '', '0000-00-00', '2024-10-24', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 41, 10, '2024-10-22', '2024-10-24 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(42, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 42, 10, '2024-10-22', '2024-10-22 14:37:36', 'SIN DIPLOMA', 'NO', NULL),
(44, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 44, 10, '2024-10-24', '2024-10-24 16:19:18', 'SIN DIPLOMA', 'NO', NULL),
(45, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 45, 10, '2024-10-24', '2024-10-24 16:21:19', 'SIN DIPLOMA', 'NO', NULL),
(46, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 46, 10, '2024-10-24', '2024-10-24 16:26:23', 'SIN DIPLOMA', 'NO', NULL),
(47, '2024-11-05', '2024-11-05', 1355, '2024-11-05', 14469, 31761, 327, '310', 'O', '2024-11-05', '2024-11-20', 0, 0, 15, 220, '121', '2024-11-05', 7, 47, 9, '2024-10-24', '2024-11-23 11:04:07', 'CON DIPLOMA', 'SI', 'controller/diplomas/documentos/EXPE-[object HTMLInputElement]-23-11-2024-11-4-7.pdf'),
(48, '2024-11-05', '2024-11-05', 1354, '2024-11-05', 14468, 31760, 326, '310 -311', 'O', '2024-11-05', '2024-11-05', 0, 0, 0, 220, '121', '2024-11-05', 9, 48, 9, '2024-10-24', '2024-11-05 16:44:08', 'CON DIPLOMA', 'NO', NULL),
(49, '2024-10-30', '2024-10-30', 1353, '2024-10-30', 14467, 31759, 325, '310 -311', 'O', '2024-11-05', '2024-11-05', 0, 0, 0, 220, '213', '2024-10-30', 9, 49, 9, '2024-10-24', '2024-11-05 16:43:42', 'CON DIPLOMA', 'NO', NULL),
(50, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 9, 50, 10, '2024-10-28', '2024-10-28 14:38:43', 'SIN DIPLOMA', 'NO', NULL),
(52, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 9, 52, 10, '2024-11-08', '2024-11-08 14:24:38', 'SIN DIPLOMA', 'NO', NULL),
(53, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 9, 53, 10, '2024-11-08', '2024-11-08 14:26:17', 'SIN DIPLOMA', 'NO', NULL),
(54, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 9, 54, 10, '2024-11-08', '2024-11-08 14:27:30', 'SIN DIPLOMA', 'NO', NULL),
(55, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 55, 10, '2024-11-08', '2024-11-08 14:28:43', 'SIN DIPLOMA', 'NO', NULL),
(56, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 56, 10, '2024-11-08', '2024-11-08 14:36:37', 'SIN DIPLOMA', 'NO', NULL),
(57, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 57, 10, '2024-11-08', '2024-11-08 14:37:19', 'SIN DIPLOMA', 'NO', NULL),
(58, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 8, 58, 10, '2024-11-08', '2024-11-08 14:38:06', 'SIN DIPLOMA', 'NO', NULL),
(61, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 61, 10, '2024-11-12', '2024-11-12 14:44:27', 'SIN DIPLOMA', 'NO', NULL),
(62, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 62, 10, '2024-11-14', '2024-11-14 20:50:54', 'SIN DIPLOMA', 'NO', NULL),
(63, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 63, 10, '2024-11-14', '2024-11-14 20:52:41', 'SIN DIPLOMA', 'NO', NULL),
(64, '0000-00-00', '0000-00-00', 0, '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 3, 64, 10, '2024-11-15', '2024-11-15 19:24:57', 'SIN DIPLOMA', 'NO', NULL),
(67, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-20', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 71, 10, '2024-11-20', '2024-11-20 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(68, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-20', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 72, 10, '2024-11-20', '2024-11-20 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(69, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-20', NULL, NULL, NULL, 0, '', '0000-00-00', 7, 73, 10, '2024-11-20', '2024-11-20 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(70, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-20', NULL, NULL, NULL, 0, '', '0000-00-00', 7, 74, 10, '2024-11-20', '2024-11-20 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(71, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-23', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 75, 10, '2024-11-23', '2024-11-23 00:00:00', 'SIN DIPLOMA', 'NO', NULL),
(72, '2024-11-17', '0000-00-00', 0, '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-23', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 76, 10, '2024-11-23', '2024-11-23 00:00:00', 'SIN DIPLOMA', 'NO', NULL);

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
  `Registro_folio` mediumtext NOT NULL,
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
  `estado` enum('SIN DIPLOMA','CON DIPLOMA') DEFAULT NULL,
  `estado_diploma_escaneo` enum('NO','SI') DEFAULT NULL,
  `diploma_escaneado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diploma_posgrado`
--

INSERT INTO `diploma_posgrado` (`Id_Diploma`, `fecha_consejo_uni`, `fecha_firma`, `Resolucion_numero`, `fecha_resolucion`, `Diploma_numero`, `Registro_numero`, `Registro_libro`, `Registro_folio`, `Diploma_tipo_emitido`, `Fecha_inicio_tramite`, `Fecha_finalizacion_tramite`, `años_trans`, `mes_trans`, `dia_trand`, `Nro_creditos`, `Nro_oficio`, `fecha_secreatria_general`, `id_usuario`, `id_modalidad`, `id_colacion`, `created_at`, `updated_at`, `estado`, `estado_diploma_escaneo`, `diploma_escaneado`) VALUES
(1, '2024-09-29', '2024-09-29', '405', '2024-09-29', 11, 10, 1, '02-03', 'O', '2024-09-29', '2024-09-29', 0, 0, 0, 48, '35', '2024-10-03', 2, 1, 4, '0000-00-00', '2024-11-23 11:41:17', 'CON DIPLOMA', 'SI', 'controller/diploma_posgrado/documentos/EXPE-[object HTMLInputElement]-23-11-2024-11-41-17.pdf'),
(2, '2024-09-29', '2024-09-29', '406', '2024-09-29', 12, 11, 2, '02-03', 'O', '2024-09-29', '2024-09-29', 0, 0, 0, 48, '35', '2024-10-03', 2, 2, 4, '0000-00-00', '2024-11-23 11:41:28', 'CON DIPLOMA', 'SI', 'controller/diploma_posgrado/documentos/EXPE-[object HTMLInputElement]-23-11-2024-11-41-28.pdf'),
(32, '2024-11-17', '0000-00-00', '', '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-19', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 39, 6, '0000-00-00', '2024-11-19 00:00:00', 'SIN DIPLOMA', NULL, NULL),
(33, '2024-11-17', '0000-00-00', '', '2024-11-17', 0, 0, 0, '0', '', '0000-00-00', '2024-11-19', NULL, NULL, NULL, 0, '', '0000-00-00', 2, 40, 6, '0000-00-00', '2024-11-19 00:00:00', 'SIN DIPLOMA', NULL, NULL),
(34, '0000-00-00', '0000-00-00', '', '', 0, 0, 0, '', '', '0000-00-00', '0000-00-00', 0, 0, 0, 0, '', '', 2, 41, 6, '0000-00-00', '2024-11-23 11:20:56', 'SIN DIPLOMA', 'NO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `empleado_id` int(11) NOT NULL,
  `emple_nombre` varchar(150) NOT NULL,
  `emple_apepat` varchar(100) NOT NULL,
  `emple_apemat` varchar(100) DEFAULT NULL,
  `emple_feccreacion` date DEFAULT NULL,
  `emple_fechanacimiento` date DEFAULT NULL,
  `emple_nrodocumento` char(12) DEFAULT NULL,
  `emple_movil` char(9) DEFAULT NULL,
  `empl_modalidad` varchar(255) DEFAULT NULL,
  `emple_email` varchar(250) DEFAULT NULL,
  `emple_estatus` enum('ACTIVO','INACTIVO') DEFAULT NULL,
  `emple_direccion` varchar(255) DEFAULT NULL,
  `empl_fotoperfil` varchar(255) NOT NULL DEFAULT 'Fotos/admin.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`empleado_id`, `emple_nombre`, `emple_apepat`, `emple_apemat`, `emple_feccreacion`, `emple_fechanacimiento`, `emple_nrodocumento`, `emple_movil`, `empl_modalidad`, `emple_email`, `emple_estatus`, `emple_direccion`, `empl_fotoperfil`, `created_at`, `updated_at`) VALUES
(1, 'JERSSON JORGE', 'CORILLA', 'MIRANDA', '2023-03-01', '2023-03-31', '72646121', '918654046', 'Funcionario', 'jersson14071996@gmail.com', 'ACTIVO', 'JR. NICOLAS DE PIEROLA Nº 105', 'controller/empleado/FOTOS/IMG13-6-2024-14-13.jpg', NULL, NULL),
(2, 'FIDEL', 'LIMACHI', 'CABEZAS', '2024-11-18', '1967-06-06', '31129767', '951667981', 'Funcionario', 'flimachic@utea.edu.pe', 'ACTIVO', 'JR. CANADA N° 123', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(3, 'LEONIDAS', 'SORIA', 'SORIA', '2024-11-18', '1985-01-15', '31005012', '936161616', 'Funcionario', 'lsoria@utea.edu.pe', 'ACTIVO', 'JR. CUSCO N° 487', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(4, 'LUI', 'CHONG', 'CHONG', '2024-11-18', '1980-01-12', '41072815', '962662626', 'Funcionario', 'lchong@utea.edu.pe', 'ACTIVO', 'AV. CANADA S/N', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(5, 'JOSE', 'JOSE', 'JOSE', '2024-11-18', '1970-01-25', '40032356', '959955959', 'CAS', 'jose@utea.edu.pe', 'ACTIVO', 'AV. CUSCO N° 212', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(6, 'ABIGAIL', 'ABIGAIL', 'ABIGAIL', '2024-11-18', '1985-01-12', '46669356', '965126611', 'CAS', 'abigail@utea.edu.pe', 'ACTIVO', 'JR. ANDAHUAYLAS N° 211', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(7, 'ANTONIO', 'AVALOS', 'SALINAS', '2024-11-18', '1990-01-15', '61679166', '914057661', 'CAS', 'antonio.avalossalinas@gmail.com', 'ACTIVO', 'AV. PANAMERICA S/N', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(8, 'ERIKA', 'SALAS', 'ARAUJO', '2024-11-18', '1990-01-11', '45740202', '983664538', 'CAS', 'Brityey20a@hotmail.com', 'ACTIVO', 'AV. MARIÑO S/N', 'controller/empleado/FOTOS/usuario.png', NULL, NULL),
(9, 'RUTH', 'VELASQUEZ', 'PAMPAñAUPA', '2024-11-18', '1990-05-12', '42486495', '950719275', 'CAS', 'rvelazquesp@utea.edu.pe', 'ACTIVO', 'AV. CUSCO N° 233', 'controller/empleado/FOTOS/usuario.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `emp_razon` varchar(250) NOT NULL,
  `emp_email` varchar(250) NOT NULL,
  `emp_cod` varchar(10) NOT NULL,
  `emp_telefono` varchar(20) NOT NULL,
  `emp_direccion` varchar(250) NOT NULL,
  `emp_logo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `emp_razon`, `emp_email`, `emp_cod`, `emp_telefono`, `emp_direccion`, `emp_logo`, `created_at`, `updated_at`) VALUES
(2, 'UNIVERSIDAD TECNOLÓGICA DE LOS ANDES', 'UTEA@GMAIL.COM', '40', '(083) 321559', 'AV. PERU Nº 700 ABANCAY, APURíMAC, PERU', 'controller/empresa/FOTOS/IMG23-11-2024-12-56.png', '2024-05-25 21:53:36', NULL);

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
(1, 'EPISI', 'Ingeniería de Sistemas e Informática', 'TITULO', 'T', 'Ingeniero de Sistemas e Informática', 'CICLO REGULAR', 220, 1, '2024-09-17 22:29:15', '2024-09-18 00:42:15', 'ACTIVO'),
(2, 'EPISI', 'Ingeniería de Sistemas', 'BACHILLER', 'B', 'Ingeniería de Sistemas e Informática', 'CICLO REGULAR', 220, 1, '2024-09-17 22:29:47', '2024-09-18 00:42:59', 'ACTIVO'),
(3, 'EPIC', 'Ingeniería Civil', 'TITULO', 'T', 'Ingeniero Civil', 'CICLO REGULAR', 220, 1, '2024-09-17 22:46:28', '2024-09-18 00:42:27', 'ACTIVO'),
(4, 'EPIC', 'Ingeniería Civil', 'BACHILLER', 'B', 'Ingeniería Civil', 'CICLO REGULAR', 220, 1, '2024-09-17 22:46:59', '2024-09-18 00:43:05', 'ACTIVO'),
(5, 'EPA', 'Agronomía', 'TITULO', 'T', 'Ingeniero Agronomo', 'CICLO REGULAR', 220, 1, '2024-09-18 00:13:15', '2024-09-18 00:42:46', 'ACTIVO'),
(6, 'EPA', 'Agronomía', 'BACHILLER', 'B', 'Ciencias Agrarias', 'CICLO REGULAR', 220, 1, '2024-09-18 00:13:31', '2024-09-18 00:45:11', 'ACTIVO'),
(7, 'EPIARN', 'Ingeniería Ambiental y Recursos Naturales', 'TITULO', 'T', 'Ingeniero Ambiental', 'CICLO REGULAR', 220, 1, '2024-09-18 00:14:47', '2024-09-18 00:42:36', 'ACTIVO'),
(8, 'EPIARN', 'Ingeniería Ambiental y Recursos Naturales', 'BACHILLER', 'B', 'Ingeniería Ambiental y Recursos Naturales', 'CICLO REGULAR', 220, 1, '2024-09-18 00:15:16', '2024-09-18 00:43:14', 'ACTIVO'),
(9, 'EPD', 'Derecho', 'TITULO', 'T', 'Abogado', 'CICLO REGULAR', 256, 3, '2024-09-18 00:17:17', '2024-09-18 00:45:19', 'ACTIVO'),
(10, 'EPD', 'Derecho', 'BACHILLER', 'B', 'Derecho', 'CICLO REGULAR', 256, 3, '2024-09-18 00:18:39', '2024-09-18 00:44:21', 'ACTIVO'),
(11, 'EPC', 'Contabilidad', 'BACHILLER', 'B', 'Ciencias Contables y Financieras', 'CICLO REGULAR', 220, 3, '2024-09-18 00:19:31', '2024-09-18 00:44:58', 'ACTIVO'),
(12, 'EPC', 'Contabilidad', 'TITULO', 'T', 'Contador Público', 'CICLO REGULAR', 220, 3, '2024-09-18 00:19:53', '2024-09-18 00:44:33', 'ACTIVO'),
(13, 'EPTHG', 'Turismo, Hotelería y Gastronomía', 'TITULO', 'T', 'Turismo, Hotelería y Gastronomía', 'CICLO REGULAR', 220, 3, '2024-09-18 00:20:54', '2024-09-18 04:01:10', 'ACTIVO'),
(14, 'EPTHG', 'Turismo, Hotelería y Gastronomía', 'BACHILLER', 'B', 'Turismo, Hotelería y Gastronomía', 'CICLO REGULAR', 220, 3, '2024-09-18 00:21:10', '2024-09-18 00:41:35', 'ACTIVO'),
(15, 'EPE', 'Enfermería', 'BACHILLER', 'B', 'Enfermería', 'CICLO REGULAR', 220, 2, '2024-09-18 00:21:45', '2024-09-18 00:43:32', 'ACTIVO'),
(16, 'EPE', 'Enfermería', 'TITULO', 'T', 'Enfermería', 'CICLO REGULAR', 220, 2, '2024-09-18 00:22:04', '2024-09-18 00:43:26', 'ACTIVO'),
(17, 'EPES', 'Estomatología', 'BACHILLER', 'B', 'Estomatología', 'CICLO REGULAR', 220, 2, '2024-09-18 00:22:43', '2024-09-18 21:56:54', 'ACTIVO'),
(18, 'EPES', 'Estomatología', 'TITULO', 'T', 'Cirujano Dentista', 'CICLO REGULAR', 220, 2, '2024-09-18 00:23:02', '2024-09-18 00:44:43', 'ACTIVO'),
(19, 'EPED', 'Educación', 'BACHILLER', 'B', 'Educación', 'CICLO REGULAR', 220, 3, '2024-09-18 00:23:53', '2024-09-18 00:44:14', 'ACTIVO'),
(20, 'EPED', 'Educación - Nivel Inicial', 'TITULO', 'T', 'Educación - Nivel Inicial', 'CICLO REGULAR', 220, 3, '2024-09-18 00:25:25', '2024-09-18 00:43:40', 'ACTIVO'),
(21, 'EPED', 'Educación – Especialidad Lengua Española y Quechua', 'TITULO', 'T', 'Educación – Especialidad Lengua Española y Quechua', 'CICLO REGULAR', 220, 3, '2024-09-18 00:25:42', '2024-09-18 00:44:02', 'ACTIVO'),
(22, 'EPED', 'Educación – Especialidad Matemática e Informática', 'TITULO', 'T', 'Educación – Especialidad Matemática e Informática	', 'CICLO REGULAR', 220, 3, '2024-09-18 00:26:00', '2024-09-18 00:43:52', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `tipo_documento` enum('PASAPORTE','CARNET DE EXTRANJERIA','DNI') DEFAULT NULL,
  `Dni` char(20) NOT NULL,
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

INSERT INTO `estudiante` (`tipo_documento`, `Dni`, `Codigo`, `Nombres`, `Apellido_paterno`, `Apellido_materno`, `Sexo`, `Celular`, `Direccion`, `Fecha_matricula`, `Fecha_egreso`, `correo_personal`, `correo_institucional`, `Observaciones`, `Años_transcurridos`, `Meses_transcurridos`, `Dias_transcurridos`, `id_usuario`, `created_at`, `updated_at`) VALUES
('DNI', '31129767', '201112496H', 'FIDEL', 'LIMACHI', 'CABEZAS', 'F', '951667981', 'ABANCAY 546', '2024-11-08', '2024-11-08', 'yokolibman@hotmail.com', '', '', 0, 0, 0, 3, '2024-11-08 05:00:00', '2024-11-08 00:00:00'),
('DNI', '31178472', '201413458I', 'ROBERTO', 'AVALOS', 'PICHIHUA', 'M', '926164578', 'AV. PANAMERICANA', '2014-10-24', '2024-10-24', 'roberto.avalos@gmail.com', '', '', 10, 0, 0, 3, '2024-10-24 05:00:00', '0000-00-00 00:00:00'),
('DNI', '40032356', '201112496H', 'JESUS', 'CASTANEDA', 'VILLAFUERTE', 'M', '970669439', 'CUSCO 256', '2024-11-08', '2024-11-08', 'jcastanedav@utea.edu.pe', 'fff', '', 0, 0, 0, 3, '2024-11-08 05:00:00', '0000-00-00 00:00:00'),
('DNI', '40551041', '201804486K', 'ESTEFA', 'POMA', 'ATAO', 'F', '954874750', 'JR. AYACUCHO Nº698', '2024-10-24', '2024-10-24', 'estefapomas510@gmail.com', '', '', 0, 0, 0, 3, '2024-10-24 05:00:00', '0000-00-00 00:00:00'),
('DNI', '43418032', '200921335H', 'PATRICIA ELEINE', 'VILCA', 'RODRIGUEZ', 'F', '970669439', 'ABANCAY 546', '2024-11-08', '2024-11-08', 'juan235@gamil.com', '', '', 0, 0, 0, 3, '2024-11-08 05:00:00', '2024-11-08 00:00:00'),
('DNI', '46549475', '201212087-E', 'WILBER', 'PEZUA', 'VIGURIA', 'M', '931832686', 'AV. JOSE MARIA ARGUEDAS S/N', '2024-11-15', '2024-11-15', 'pezua2019@gmail.com', '', '', 0, 0, 0, 8, '2024-11-15 05:00:00', '0000-00-00 00:00:00'),
('DNI', '47780533', '201210363A', 'YOVANA', 'RIVAS', 'TOLEDO', 'F', '916043728', 'S/N', '2024-10-22', '2024-10-22', 'mariaesther@gmail.com', '', '', 0, 0, 0, 8, '2024-10-22 05:00:00', '0000-00-00 00:00:00'),
('DNI', '48075152', '201222207J', 'REBECA', 'LOAYZA', 'LAGO', 'F', '966343297', 'JR. TUPAC AMARU', '2024-10-28', '2024-10-28', 'bequitaloayza52@gmail.com', '', '', 0, 0, 0, 8, '2024-10-28 05:00:00', '0000-00-00 00:00:00'),
('DNI', '48564444', '201165515A', 'KARINA', 'ARREDONDO', 'HUAMAN', 'F', '929629626', 'JR. BENAVIDES N° 232', '2011-04-04', '2017-07-31', 'karina21@gmail.com', '', '', 6, 3, 27, 9, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '48848842', '2015151515FG', 'JOSE DAVID', 'SICCHA', 'RUIZ', 'M', '926262611', 'AV. CANADA N° 323', '2024-11-20', '2024-11-20', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-20 05:00:00', '2024-11-20 00:00:00'),
('DNI', '61679166', '201411493I', 'ANTONIO', 'AVALOS', 'SALINAS', 'M', '914057111', 'AV. PANAMERICANA', '2014-03-24', '2022-10-24', 'antonio.avalossalinas@gmail.com', '', '', 8, 7, 0, 7, '2024-10-24 05:00:00', '2024-11-20 00:00:00'),
('DNI', '70494703', '201322010D', 'LELY MELUSA', 'ALTAMIRANO', 'LLANTOY', 'F', '969721562', 'JR. JUAN ANTONIO TRELLES Nº 267', '2024-11-14', '2024-11-14', 'lelyaltamirano19@gmail.com', '', '', 0, 0, 0, 8, '2024-11-14 05:00:00', '0000-00-00 00:00:00'),
('DNI', '71294246', '2015969595G', 'FRANK', 'LUNA', 'FERRO', 'M', '926626262', 'AV. PUNO N° 322', '2015-04-06', '2023-02-23', 'rosmery12@gmail.com', '', '', 7, 10, 18, 8, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '72246511', '201615866E', 'SANDRA ROCIO', 'QUISPE', 'RUIZ', 'F', '900438654', 'N/S', '2024-10-24', '2024-10-24', 'quisperuizsandrarocio8@gmail.com', '', '', 0, 0, 0, 8, '2024-10-24 05:00:00', '0000-00-00 00:00:00'),
('DNI', '72257013', '201612077E', 'BLANCA MISHELL', 'CORDOVA', 'CARDENAS', 'F', '934125069', 'JR. VICTOR SEGURA Nº132', '2024-11-12', '2024-11-12', 'mishellc887@gmail.com', '', '', 0, 0, 0, 3, '2024-11-12 05:00:00', '0000-00-00 00:00:00'),
('DNI', '72260042', '201612076F', 'JACKELIN MILAGROS', 'CENTENO', 'GONZALES', 'F', '977762791', 'AV. INDUSTRIAL S/N', '2024-11-14', '2024-11-14', 'jackelincenteno11@gmail.com', '', '', 0, 0, 0, 3, '2024-11-14 05:00:00', '0000-00-00 00:00:00'),
('DNI', '72514522', '2013251153T', 'OSCAR ORLANDO', 'QUIROZ', 'CHAVARRY', 'M', '926626262', 'AV. TACNA N° 434', '2024-11-23', '2024-11-23', 'jersson14071996@hotmail.com', '', '', 0, 0, 0, 2, '2024-11-23 05:00:00', '2024-11-23 00:00:00'),
('DNI', '72541155', '2015151551F', 'MARIA DE LOS ANGELES BELEN', 'RICAPA', 'TORRES', 'F', '122255111', 'JR. HUANCA N° 323', '2024-11-20', '2024-11-20', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 7, '2024-11-20 05:00:00', '2024-11-20 00:00:00'),
('DNI', '72615111', '2011118511F', 'LINA JOSELYN', 'RAMOS', 'BOHORQUEZ', 'F', '111111111', 'AV. CANADA N° 323', '2024-11-20', '2024-11-20', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-20 05:00:00', '2024-11-20 00:00:00'),
('DNI', '72615651', '20155511551F', 'WILMER JANDER', 'PONCIANO', 'CONTRERAS', 'M', '926621111', 'JR. CANADA N° 323', '2024-11-20', '2024-11-20', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 7, '2024-11-20 05:00:00', '2024-11-20 00:00:00'),
('DNI', '74310364', '201701192B', 'DEYSI', 'QUISPE', 'URPI', 'F', '986138265', 'JR. LOS CODORNICES Nº220', '2024-10-24', '2024-10-24', 'dey311399@gmail.com', '', '', 0, 0, 0, 3, '2024-10-24 05:00:00', '0000-00-00 00:00:00'),
('DNI', '75863955', '201328529A', 'ROSMERY YASMIN', 'TORRES', 'HURTADO', 'M', '926262626', 'JR. CUSCO N° 232', '2013-04-01', '2021-09-03', 'rosmery12@gmail.com', '', '', 7, 6, 15, 3, '2024-09-29 05:00:00', '2024-09-29 00:00:00'),
('DNI', '76541125', '2015252525F', 'PAUL SHNEIDER', 'GAVE', 'CHAVEZ', 'M', '926626262', 'AV. GUATEMALA N° 233', '2024-11-23', '2024-11-23', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-23 05:00:00', '2024-11-23 00:00:00'),
('DNI', '77343773', '201515515A', 'HENRY', 'JURO', 'CORDOVA', 'M', '926226266', 'AV. HUANCAVELICA N° 144', '2015-09-07', '2023-06-24', 'henry122@gmail.com', '', '', 7, 9, 16, 3, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '77575576', '201701179E', 'KATY MARGOTH', 'MORALES', 'GUIA', 'F', '932978763', 'AV. CONDEBAMBA S/N', '2024-10-22', '2024-10-22', 'berlyflorparedes@gmail.com', 'FHRINZ.DANIEL@GMAIL.COM', '', 0, 0, 0, 3, '2024-10-22 05:00:00', '2024-10-24 00:00:00'),
('DNI', '77694479', '201721511A', 'JHIAMIL', 'VILLASANTE', 'ROSELL', 'M', '929662262', 'AV. CANADA N° 448', '2017-09-01', '2023-12-24', 'jhamil12@gmail.com', '', '', 6, 3, 22, 3, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '80118607', '200921335H', 'YOKO LIBMAN', 'FLOREZ', 'DELGADO', 'F', '951667981', 'ABANCAY 546', '2024-11-08', '2024-11-08', 'patricia@hotmail.com', '', '', 0, 0, 0, 3, '2024-11-08 05:00:00', '2024-11-08 00:00:00'),
('DNI', '95654556', '201411458I', 'EDGAR', 'AVALOS', 'SALINAS', 'M', '984402091', 'AV. PANAMERICANA', '2024-10-24', '2024-10-24', 'edgar.avalos@gmail.com', '', '', 0, 0, 0, 8, '2024-10-24 05:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_posgrado`
--

CREATE TABLE `estudiante_posgrado` (
  `tipo_documento` enum('PASAPORTE','CARNET DE EXTRANJERIA','DNI') DEFAULT NULL,
  `Dni` char(20) NOT NULL,
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

INSERT INTO `estudiante_posgrado` (`tipo_documento`, `Dni`, `Codigo`, `Nombres`, `Apellido_paterno`, `Apellido_materno`, `Sexo`, `Celular`, `Direccion`, `Fecha_matricula`, `Fecha_egreso`, `correo_personal`, `correo_institucional`, `Observaciones`, `Años_transcurridos`, `Meses_transcurridos`, `Dias_transcurridos`, `id_usuario`, `created_at`, `updated_at`) VALUES
('CARNET DE EXTRANJERIA', '15155155151', '20145155115F', 'JHOSEP', 'SANCHEZ', 'PEÑA', 'M', '926262662', 'JR. CUSCO N° 232', '2024-11-19', '2024-11-19', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-19 05:00:00', '2024-11-19 00:00:00'),
('PASAPORTE', '265215151515', '2015151151F', 'JUAN CARLOS', 'CHIPANA', 'PEREZ', 'M', '926626111', 'AV. CANADA N° 32', '2024-11-19', '2024-11-19', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-19 05:00:00', '2024-11-19 00:00:00'),
('DNI', '43559383', '201926226G', 'FREDY', 'ALARCON', 'CONTRERAS', 'M', '926626262', 'JR. CUSCO N° 444', '2019-09-06', '2021-04-14', 'fredy12@gmail.com', '', '', 1, 7, 7, 2, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '70086232', '2019226622A', 'RODRIGO', 'LOAYZA', 'ELGUERA', 'M', '926626262', 'JR. HUANCAVELICA N° 848', '2019-01-25', '2020-03-04', 'rodrigo12@gmail.com', '', '', 1, 1, 8, 2, '2024-09-29 05:00:00', '0000-00-00 00:00:00'),
('DNI', '72451011', '20145115153F', 'ELI VELVER', 'VASQUEZ', 'ACUÑA', 'M', '926622662', 'AV. CHILE N° 322', '2024-11-23', '2024-11-23', 'jersson14071996@gmail.com', '', '', 0, 0, 0, 2, '2024-11-23 05:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente`
--

CREATE TABLE `expediente` (
  `Id_expediente` char(12) NOT NULL,
  `Id_cede` int(11) DEFAULT NULL,
  `Dni` char(20) DEFAULT '',
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
('E0000003', 1, '77343773', 6, '', 'Ciencias Agrarias', 'BACHILLER AUTOMATICO', '', '', '1349', '', '321', '310', '31755', 'controller/registro_general_bachiller/documentos/EXPE-77343773-29-9-2024-10-33-51.pdf', 2, 'COLACION', '2024-09-29 10:31:00', '0000-00-00 00:00:00', 1, 3),
('E0000004', 1, '77694479', 6, '', 'Ciencias Agrarias', 'BACHILLER AUTOMATICO', '', '', '1350', '', '322', '310', '31756', 'controller/registro_general_bachiller/documentos/', 2, 'COLACION', '2024-09-29 10:36:00', '0000-00-00 00:00:00', 1, 4),
('E0000005', 1, '48564444', 3, 'Ingeniera Civil', '', 'TESIS', '', '', '1351', '', '323', '310 -311', '31757', 'controller/registro_general/documentos/EXPE-48564444-29-9-2024-11-11-52.pdf', 2, 'COLACION', '2024-09-29 11:07:00', '0000-00-00 00:00:00', 1, 5),
('E0000006', 1, '75863955', 3, 'Ingeniera Civil', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/EXPE-75863955-29-9-2024-11-22-26.pdf', 2, 'PENDIENTE', '2024-09-29 00:00:00', '2024-09-29 00:00:00', 1, 6),
('E0000007', 1, '71294246', 18, 'Cirujano Dentista', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-09-29 11:40:00', '0000-00-00 00:00:00', 3, 7),
('E0000041', 2, '77575576', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, '', '2024-10-22 09:36:00', '2024-10-24 00:00:00', 3, 41),
('E0000042', 1, '47780533', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-10-22 09:36:00', '0000-00-00 00:00:00', 3, 42),
('E0000043', 2, '40551041', 20, 'Educación - Nivel Inicial', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-10-24 11:16:00', '0000-00-00 00:00:00', 2, 43),
('E0000044', 2, '72246511', 20, 'Educación - Nivel Inicial', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-10-24 11:16:00', '0000-00-00 00:00:00', 2, 44),
('E0000045', 2, '74310364', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-10-24 11:24:00', '0000-00-00 00:00:00', 3, 45),
('E0000046', 1, '61679166', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '1355', '', '327', '310 -311', '31761', 'controller/registro_general_bachiller/documentos/', 7, '', '2024-10-24 12:34:00', '2024-10-24 12:34:00', 1, 46),
('E0000047', 1, '95654556', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '1354', '', '326', '310 -311', '31760', 'controller/registro_general_bachiller/documentos/', 8, 'COLACION', '2024-10-24 12:38:00', '0000-00-00 00:00:00', 1, 47),
('E0000048', 1, '31178472', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '1353', '', '325', '310 -311', '31759', 'controller/registro_general_bachiller/documentos/', 8, 'COLACION', '2024-10-24 12:38:00', '0000-00-00 00:00:00', 1, 48),
('E0000049', 2, '48075152', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-10-28 09:32:00', '0000-00-00 00:00:00', 3, 49),
('E0000050', 3, '31129767', 19, '', 'Educación', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 8, 'PENDIENTE', '2024-11-08 09:22:00', '0000-00-00 00:00:00', 2, 50),
('E0000051', 3, '40032356', 19, '', 'Educación', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 8, 'PENDIENTE', '2024-11-08 09:22:00', '0000-00-00 00:00:00', 2, 51),
('E0000052', 3, '80118607', 19, '', 'Educación', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 9, 'PENDIENTE', '2024-11-08 09:22:00', '0000-00-00 00:00:00', 2, 52),
('E0000053', 3, '43418032', 19, '', 'Educación', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 9, 'PENDIENTE', '2024-11-08 09:22:00', '0000-00-00 00:00:00', 2, 53),
('E0000054', 3, '31129767', 1, 'Ingeniero de Sistemas e Informática', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 9, 'PENDIENTE', '2024-11-08 09:35:00', '0000-00-00 00:00:00', 1, 54),
('E0000055', 3, '80118607', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 9, 'PENDIENTE', '2024-11-08 09:35:00', '0000-00-00 00:00:00', 3, 55),
('E0000056', 3, '43418032', 16, 'Enfermería', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 9, 'PENDIENTE', '2024-11-08 09:35:00', '0000-00-00 00:00:00', 3, 56),
('E0000057', 2, '72257013', 12, 'Contador Público', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 8, 'PENDIENTE', '2024-11-12 09:40:00', '0000-00-00 00:00:00', 2, 57),
('E0000058', 2, '72260042', 12, 'Contador Público', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 8, 'PENDIENTE', '2024-11-14 15:48:00', '0000-00-00 00:00:00', 2, 58),
('E0000059', 2, '70494703', 12, 'Contador Público', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-11-14 15:48:00', '0000-00-00 00:00:00', 2, 59),
('E0000060', 2, '46549475', 7, 'Ingeniero Ambiental', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 3, 'PENDIENTE', '2024-11-15 14:22:00', '0000-00-00 00:00:00', 1, 60),
('E0000061', 1, '48848842', 1, 'Ingeniero de Sistemas e Informática', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 2, '', '2024-11-20 15:41:00', '2024-11-20 15:41:00', 1, 61),
('E0000062', 2, '72615111', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, '', '2024-11-20 15:56:00', '2024-11-20 15:56:00', 1, 62),
('E0000063', 1, '72615651', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 7, '', '2024-11-20 16:28:00', '2024-11-20 16:28:00', 1, 63),
('E0000064', 1, '72541155', 1, 'Ingeniero de Sistemas e Informática', '', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general/documentos/', 7, '', '2024-11-20 16:33:00', '2024-11-20 16:33:00', 1, 64),
('E0000065', 1, '76541125', 2, '', 'Ingeniería de Sistemas e Informática', 'CURSO (TRABAJO DE INVESTIGACIÓN)', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, '', '2024-11-23 12:23:00', '2024-11-23 12:23:00', 1, 65),
('E0000066', 1, '72514522', 2, '', 'Ingeniería de Sistemas e Informática', 'BACHILLER AUTOMATICO', '', '', '', '', '', '', '', 'controller/registro_general_bachiller/documentos/', 2, '', '2024-11-23 12:26:00', '2024-11-23 12:26:00', 1, 66);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_posgrado`
--

CREATE TABLE `expediente_posgrado` (
  `Id_expediente` char(12) NOT NULL,
  `Id_cede` int(11) DEFAULT NULL,
  `Dni` char(20) DEFAULT '',
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
('E0000001', 1, '43559383', 21, 'Maestro en Pedagogía en Educación Superior', 'TESIS', '', '', '405', '', '1', '02-03', '10', 'controller/registro_general_posgrado/documentos/EXPE-43559383-29-9-2024-10-46-42.pdf', 2, 'COLACION', '2024-09-29 10:44:00', '0000-00-00 00:00:00', 9, 1),
('E0000002', 1, '70086232', 21, 'Maestro en Pedagogía en Educación Superior', 'TESIS', '', '', '406', '', '2', '02-03', '11', 'controller/registro_general_posgrado/documentos/EXPE-70086232-29-9-2024-10-50-12.pdf', 2, 'COLACION', '2024-09-29 10:44:00', '0000-00-00 00:00:00', 9, 2),
('E0000003', 1, '15155155151', 22, 'Maestro en Proyectos de Inversión', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general_posgrado/documentos/', 2, 'EN PROCESO', '2024-11-19 00:00:00', '2024-11-19 00:00:00', 9, 3),
('E0000004', 1, '265215151515', 20, 'Maestro en Derecho Ambiental', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general_posgrado/documentos/', 2, 'EN PROCESO', '2024-11-19 00:00:00', '2024-11-19 00:00:00', 9, 4),
('E0000005', 1, '72451011', 20, 'Maestro en Derecho Ambiental', 'TESIS', '', '', '', '', '', '', '', 'controller/registro_general_posgrado/documentos/', 2, 'PENDIENTE', '2024-11-23 11:20:00', '0000-00-00 00:00:00', 9, 5);

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
(1, 'Ingeniería', 1, 'ACTIVO', '2024-09-17 21:58:20', '0000-00-00 00:00:00'),
(2, 'Ciencias de la Salud', 3, 'ACTIVO', '2024-09-17 21:58:42', '0000-00-00 00:00:00'),
(3, 'Ciencias Jurídicas Contables y Sociales', 2, 'ACTIVO', '2024-09-17 21:59:26', '0000-00-00 00:00:00');

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
(1, 888);

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
(1, 777);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `Id_modalidad` int(11) NOT NULL,
  `Modo_obtencion` varchar(50) NOT NULL DEFAULT '',
  `Abreviatura_modo_estudio` varchar(2) DEFAULT NULL,
  `Modo_estudio` varchar(255) NOT NULL,
  `Trabajo_investigacion` text DEFAULT NULL,
  `Turnitin` varchar(20) DEFAULT NULL,
  `Porcentaje` varchar(12) DEFAULT NULL,
  `Centro_investigacion` varchar(250) DEFAULT NULL,
  `Reglamento_metadado` mediumtext DEFAULT NULL,
  `Proce_bachiller` varchar(255) DEFAULT NULL,
  `Proce_insti_origen` varchar(255) DEFAULT NULL,
  `Proce_titulo_peda` varchar(255) DEFAULT NULL,
  `Fecha_matricula_modalidad` date DEFAULT NULL,
  `Fecha_inicio_modalidad` date DEFAULT NULL,
  `Fecha_fin_modalidad` date DEFAULT NULL,
  `Modo_sustentacion` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `Id_expediente` char(12) DEFAULT '',
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lleno` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`Id_modalidad`, `Modo_obtencion`, `Abreviatura_modo_estudio`, `Modo_estudio`, `Trabajo_investigacion`, `Turnitin`, `Porcentaje`, `Centro_investigacion`, `Reglamento_metadado`, `Proce_bachiller`, `Proce_insti_origen`, `Proce_titulo_peda`, `Fecha_matricula_modalidad`, `Fecha_inicio_modalidad`, `Fecha_fin_modalidad`, `Modo_sustentacion`, `Id_usuario`, `Id_expediente`, `created_at`, `updated_at`, `lleno`) VALUES
(3, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000003', '2024-09-29', '0000-00-00 00:00:00', 0),
(4, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000004', '2024-09-29', '0000-00-00 00:00:00', 0),
(5, 'TESIS', 'P', 'PRESENCIAL', 'VARIACIóN DEL COMPORTAMIENTO MECáNICO EN PRISMAS DE ALBAñILERíA TRADICIONAL Y REFORZADAS CON SOGA DRIZA UTILIZANDO BLOQUES HUECOS DE CONCRETO EN LA CIUDAD DE ABANCAY, 2021\r\n', 'SI (TURNITIN)', '16%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE INGENIERíA CIVIL', 'https://repositorio.utea.edu.pe/handle/utea/664\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000005', '2024-09-29', '0000-00-00 00:00:00', 0),
(6, 'TESIS', 'P', 'PRESENCIAL', 'INFLUENCIA DE LA SUSTITUCIóN PARCIAL DEL AGREGADO GRUESO POR LADRILLO TRITURADO HúMEDO PARA LA DISMINUCIóN DE FISURAS Y LA RESISTENCIA A LA COMPRESIóN EN LOSAS ALIGERADAS ABANCAY - 2022', 'SI (TURNITIN)', '19%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE INGENIERíA CIVIL\r\n', 'https://repositorio.utea.edu.pe/handle/utea/659\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000006', '2024-09-29', '2024-09-29 05:00:00', 0),
(7, 'TESIS', 'P', 'PRESENCIAL', 'GRADO DE CONTAMINACIóN EN UNIFORMES DE ESTUDIANTES DEL LABORATORIO ESTOMATOLóGICO CLíNICO DE LA UNIVERSIDAD TECNOLóGICA DE LOS ANDES, ABANCAY, 2022\r\n', 'SI (TURNITIN)', '12%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ESTOMATOLOGíA\r\n', 'https://repositorio.utea.edu.pe/handle/utea/633\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000007', '2024-09-29', '0000-00-00 00:00:00', 0),
(41, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000041', '2024-10-22', '2024-10-24 05:00:00', 0),
(42, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000042', '2024-10-22', '0000-00-00 00:00:00', 0),
(44, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000043', '2024-10-24', '0000-00-00 00:00:00', 0),
(45, 'TESIS', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000044', '2024-10-24', '0000-00-00 00:00:00', 0),
(46, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000045', '2024-10-24', '0000-00-00 00:00:00', 0),
(47, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 7, 'E0000046', '2024-10-24', '2024-11-20 05:00:00', 0),
(48, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 8, 'E0000047', '2024-10-24', '0000-00-00 00:00:00', 0),
(49, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 8, 'E0000048', '2024-10-24', '0000-00-00 00:00:00', 0),
(50, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 8, 'E0000049', '2024-10-28', '0000-00-00 00:00:00', 0),
(52, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000050', '2024-11-08', '0000-00-00 00:00:00', 0),
(53, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000051', '2024-11-08', '0000-00-00 00:00:00', 0),
(54, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000052', '2024-11-08', '0000-00-00 00:00:00', 0),
(55, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000053', '2024-11-08', '0000-00-00 00:00:00', 0),
(56, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000054', '2024-11-08', '0000-00-00 00:00:00', 0),
(57, 'TESIS', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000055', '2024-11-08', '0000-00-00 00:00:00', 0),
(58, 'TESIS', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 9, 'E0000056', '2024-11-08', '0000-00-00 00:00:00', 0),
(61, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000057', '2024-11-12', '0000-00-00 00:00:00', 0),
(62, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000058', '2024-11-14', '0000-00-00 00:00:00', 0),
(63, 'TESIS', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000059', '2024-11-14', '0000-00-00 00:00:00', 0),
(64, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 3, 'E0000060', '2024-11-15', '0000-00-00 00:00:00', 0),
(71, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000061', '2024-11-20', '2024-11-20 05:00:00', 0),
(72, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000062', '2024-11-20', '2024-11-20 05:00:00', 0),
(73, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 7, 'E0000063', '2024-11-20', '2024-11-20 05:00:00', 0),
(74, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 7, 'E0000064', '2024-11-20', '2024-11-20 05:00:00', 0),
(75, 'CURSO (TRABAJO DE INVESTIGACIÓN)', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000065', '2024-11-23', '2024-11-23 05:00:00', 1),
(76, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000066', '2024-11-23', '2024-11-23 05:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad_posgrado`
--

CREATE TABLE `modalidad_posgrado` (
  `Id_modalidad` int(11) NOT NULL,
  `Modo_obtencion` varchar(50) NOT NULL DEFAULT '',
  `Abreviatura_modo_estudio` varchar(2) DEFAULT NULL,
  `Modo_estudio` varchar(255) NOT NULL,
  `Trabajo_investigacion` text DEFAULT NULL,
  `Turnitin` varchar(20) DEFAULT NULL,
  `Porcentaje` varchar(12) DEFAULT NULL,
  `Centro_investigacion` varchar(250) DEFAULT NULL,
  `Reglamento_metadado` mediumtext DEFAULT NULL,
  `Proce_pais_ext` varchar(255) DEFAULT NULL,
  `Proce_univ_ext` varchar(255) DEFAULT NULL,
  `Proce_grado_ext` varchar(255) DEFAULT NULL,
  `Fecha_matricula_modalidad` date DEFAULT NULL,
  `Fecha_inicio_modalidad` date DEFAULT NULL,
  `Fecha_fin_modalidad` date DEFAULT NULL,
  `Modo_sustentacion` enum('PRESENCIAL','VIRTUAL') DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `Id_expediente` char(12) DEFAULT '',
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lleno` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad_posgrado`
--

INSERT INTO `modalidad_posgrado` (`Id_modalidad`, `Modo_obtencion`, `Abreviatura_modo_estudio`, `Modo_estudio`, `Trabajo_investigacion`, `Turnitin`, `Porcentaje`, `Centro_investigacion`, `Reglamento_metadado`, `Proce_pais_ext`, `Proce_univ_ext`, `Proce_grado_ext`, `Fecha_matricula_modalidad`, `Fecha_inicio_modalidad`, `Fecha_fin_modalidad`, `Modo_sustentacion`, `Id_usuario`, `Id_expediente`, `created_at`, `updated_at`, `lleno`) VALUES
(1, 'TESIS', 'P', 'PRESENCIAL', 'LA EDUCACIóN COOPERATIVA Y LA CALIDAD DE LA ADMINISTRACIóN EN LA COOPERATIVA DE AHORRO Y CRéDITO “LOS ANDES” COTARUSI AYMARAES 2021', 'SI (TURNITIN)', '19%', 'SUB DIRECCION  DE INVESTIGACIÓN DE PEDAGOGIA EN EDUCACION SUPERIOR\r\n', 'https://repositorio.utea.edu.pe/handle/utea/622\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000001', '2024-09-29', '0000-00-00 00:00:00', 1),
(2, 'TESIS', 'P', 'PRESENCIAL', 'CONDICIONAMIENTO DE LOS HáBITOS DE ESTUDIO EN EL RENDIMIENTO ACADéMICO DE LOS ESTUDIANTES DE QUINTO SEMESTRE DE LA E.P. INGENIERíA CIVIL DE LA UTEA ABANCAY 2020', 'SI (TURNITIN)', '18%', 'SUB DIRECCION  DE INVESTIGACIÓN DE PEDAGOGIA EN EDUCACION SUPERIOR\r\n', 'https://repositorio.utea.edu.pe/handle/utea/625\r\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000002', '2024-09-29', '0000-00-00 00:00:00', 1),
(39, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000003', '2024-11-19', '2024-11-19 05:00:00', 0),
(40, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000004', '2024-11-19', '2024-11-19 05:00:00', 0),
(41, 'TESIS', 'P', 'PRESENCIAL', '', 'SI (TURNITIN)', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000005', '2024-11-23', '0000-00-00 00:00:00', 0);

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
(20, 'Derecho Ambiental', 'MAESTRIA', 'M', 'Maestro en Derecho Ambiental', 'CICLO REGULAR', 48, 'ACTIVO', 9, '2024-09-20 03:12:23', '2024-09-20 03:14:24'),
(21, 'Pedagogía en Educación Superior', 'MAESTRIA', 'M', 'Maestro en Pedagogía en Educación Superior', 'CICLO REGULAR', 48, 'ACTIVO', 9, '2024-09-20 03:14:50', '0000-00-00 00:00:00'),
(22, 'Proyectos de Inversión', 'MAESTRIA', 'M', 'Maestro en Proyectos de Inversión', 'CICLO REGULAR', 48, 'ACTIVO', 9, '2024-09-20 03:15:08', '0000-00-00 00:00:00'),
(23, 'Salud Pública', 'MAESTRIA', 'M', 'Maestro en Salud Pública', 'CICLO REGULAR', 48, 'ACTIVO', 9, '2024-09-20 03:15:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_usuario` varchar(250) DEFAULT '',
  `usu_contra` varchar(250) DEFAULT NULL,
  `usu_feccreacion` date DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `usu_rol` enum('Secretario (a)','Super Administrador','Repositorio','Administrador') NOT NULL,
  `empresa_id` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_usuario`, `usu_contra`, `usu_feccreacion`, `empleado_id`, `usu_estatus`, `area_id`, `usu_rol`, `empresa_id`, `created_at`, `updated_at`, `id_sede`) VALUES
(2, 'jersson', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', 1, 'ACTIVO', 2, 'Super Administrador', 2, '2024-11-18 17:43:11', '0000-00-00 00:00:00', 1),
(3, 'FIDEL2024', '$2y$12$27pzMibWeLAtadKQVZyXTO50dCrwmwWt3cWsviKCXjK1JFgUCNQQS', '2024-11-18', 2, 'ACTIVO', 3, 'Administrador', 2, '2024-11-18 17:53:18', NULL, 1),
(4, 'ERIKA2024', '$2y$12$PBUlrl6Bu6IAcULKXUpeM.go3l8xeJ/FPR6n1W9e..eobd8tuMqz.', '2024-11-18', 8, 'ACTIVO', 3, 'Super Administrador', 2, '2024-11-18 17:53:36', NULL, 1),
(5, 'ANTONIO2024', '$2y$12$OdEDxZU7gpm/AWYDCaVRl.H9jIRQVIhXQqelV3Mqn7GbjjGucMP7.', '2024-11-18', 8, 'ACTIVO', 3, 'Super Administrador', 2, '2024-11-18 17:53:53', NULL, 1),
(6, 'LEONIDAS2024', '$2y$12$sQPUwAXuEBIf/pfxljKk3uMjipfPt5NGwgjtTHmnUbGRcFC5ZslPe', '2024-11-18', 3, 'ACTIVO', 3, 'Secretario (a)', 2, '2024-11-18 17:54:17', NULL, 1),
(7, 'LUI2024', '$2y$12$2VYzaWyyt.rlkNACU47skOIfczSncpxdd6EQlay4DqkZqnh3JrgkO', '2024-11-18', 4, 'ACTIVO', 3, 'Secretario (a)', 2, '2024-11-18 17:54:38', NULL, 1),
(8, 'abigail_2024', '$2y$12$syENedEv3qc7PA0KKDLz1OrlRalSvSQfx9ADEJ5NMqev3rMMCNFpS', '2024-11-18', 6, 'ACTIVO', 4, 'Secretario (a)', 2, '2024-11-18 17:55:02', NULL, 2),
(9, 'josesu2024', '$2y$12$eJydyF5HG0.eKLJfJi3Ycuio9kv73rwP/XqeGfGQFI5JqJoNOyzKi', '2024-11-18', 6, 'ACTIVO', 5, 'Secretario (a)', 2, '2024-11-18 17:55:19', '2024-11-18 19:38:00', 3),
(10, 'RUTH2024', '$2y$12$WWdLQlUb9an/IZYP1DRnPuVZmVd7BH76bGSSQ/.DrDaL/V.9m8Qhy', '2024-11-18', 9, 'ACTIVO', 6, 'Repositorio', 2, '2024-11-18 17:59:42', NULL, 1);

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
  MODIFY `area_cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del area', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `autoridades`
--
ALTER TABLE `autoridades`
  MODIFY `Cod_autoridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cede`
--
ALTER TABLE `cede`
  MODIFY `Id_cede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `colacion`
--
ALTER TABLE `colacion`
  MODIFY `id_colacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `colacion_posgrado`
--
ALTER TABLE `colacion_posgrado`
  MODIFY `id_colacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `diploma`
--
ALTER TABLE `diploma`
  MODIFY `Id_Diploma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `diploma_posgrado`
--
ALTER TABLE `diploma_posgrado`
  MODIFY `Id_Diploma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `empleado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `escuela_profesional`
--
ALTER TABLE `escuela_profesional`
  MODIFY `Id_escuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `Id_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `modalidad_posgrado`
--
ALTER TABLE `modalidad_posgrado`
  MODIFY `Id_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `programa_posgrado`
--
ALTER TABLE `programa_posgrado`
  MODIFY `Id_programa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  ADD CONSTRAINT `FK_MODA` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad` (`Id_modalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cola` FOREIGN KEY (`id_colacion`) REFERENCES `colacion` (`id_colacion`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `FK_ESTUDI` FOREIGN KEY (`Dni`) REFERENCES `estudiante` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_autopre` FOREIGN KEY (`id_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cede` FOREIGN KEY (`Id_cede`) REFERENCES `cede` (`Id_cede`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_escuelaa` FOREIGN KEY (`Id_escuela`) REFERENCES `escuela_profesional` (`Id_escuela`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario5` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `expediente_posgrado`
--
ALTER TABLE `expediente_posgrado`
  ADD CONSTRAINT `EXPEDIENTE_docu` FOREIGN KEY (`Dni`) REFERENCES `estudiante_posgrado` (`Dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_1` FOREIGN KEY (`Id_cede`) REFERENCES `cede` (`Id_cede`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expediente_posgrado_ibfk_2` FOREIGN KEY (`Id_programa`) REFERENCES `programa_posgrado` (`Id_programa`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `moda_expedd` FOREIGN KEY (`Id_expediente`) REFERENCES `expediente_posgrado` (`Id_expediente`) ON DELETE CASCADE ON UPDATE CASCADE,
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

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `actualizar_estado_colaciones` ON SCHEDULE EVERY 1 DAY STARTS '2024-11-23 11:55:48' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Actualizar el estado de las colaciones a 'PASADO' si la fecha actual es mayor que la fecha de colación
    UPDATE colacion
    SET estado = 'PASADO'
    WHERE fecha_colación < CURDATE() AND estado != 'PASADO';
END$$

CREATE DEFINER=`root`@`localhost` EVENT `actualizar_estado_colaciones_posgrado` ON SCHEDULE EVERY 1 DAY STARTS '2024-11-23 12:00:11' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Actualizar el estado de las colaciones a 'PASADO' si la fecha actual es mayor que la fecha de colación
    UPDATE colacion_posgrado
    SET estado = 'PASADO'
    WHERE fecha_colación < CURDATE() AND estado != 'PASADO';
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
