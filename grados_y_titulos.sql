-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 20:55:57
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
-- Base de datos: `grados_y_titulos`
--

DELIMITER $$
--
-- Procedimientos
--
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
facultad.Nombre
FROM
facultad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_CEDE` (IN `ID` INT)   DELETE FROM cede WHERE Id_cede=ID$$

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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
WHERE
	Grado_academico = 'BACHILLER'
	ORDER BY created_at desc$$

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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	modalidad
	ON 
		expediente.Id_expediente = modalidad.Id_expediente
WHERE escuela_profesional.Grado_academico='BACHILLER' AND modalidad.created_at BETWEEN FECHAINICIO AND FECHAFIN
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	facultad.Nombre as Facultad
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	modalidad.Proce_bachiller
FROM
	expediente
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	modalidad
	ON 
		expediente.Id_expediente = modalidad.Id_expediente
WHERE
	Grado_academico = 'BACHILLER'
ORDER BY
	modalidad.created_at DESC$$

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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	modalidad
	ON 
		expediente.Id_expediente = modalidad.Id_expediente
WHERE
	Grado_academico = 'TITULO'
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
	expediente.Fecha, 
	expediente.Expedicion, 
	expediente.Libro, 
	expediente.Folio, 
	expediente.Registro, 
	expediente.Archivo, 
	expediente.Id_autoridad, 
	expediente.Id_usuario, 
	expediente.estado, 
	expediente.created_at, 
	date_format(expediente.created_at, "%d-%m-%Y") AS fecha_registro1, 
	expediente.updated_at, 
	expediente.doc_ncorrelativo, 
	autoridades.Cod_autoridad, 
	autoridades.Autoridad_1, 
	autoridades.Autoridad_2, 
	autoridades.Autoridad_3, 
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
	INNER JOIN
	autoridades
	ON 
		expediente.Id_autoridad = autoridades.Cod_autoridad
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
	modalidad
	ON 
		expediente.Id_expediente = modalidad.Id_expediente
WHERE escuela_profesional.Grado_academico='TITULO' AND modalidad.created_at BETWEEN FECHAINICIO AND FECHAFIN
ORDER BY
	modalidad.created_at DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TOTAL_EMPLEADO` ()   select count(empleado_id) as total from empleado$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TRAE_GRADO` (IN `ID` INT)   SELECT
	escuela_profesional.Id_escuela,
		escuela_profesional.`Denominación_grado`, 
	escuela_profesional.Cod_Escuela
FROM
	escuela_profesional
WHERE Id_escuela = ID$$

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
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) AS nempleado, 
	area.area_nombre, 
	area.area_cod
FROM
	usuario
	INNER JOIN
	empleado
	ON 
		usuario.empleado_id = empleado.empleado_id
	INNER JOIN
	area
	ON 
		usuario.area_id = area.area_cod$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_CARRERA` (IN `ID` INT, IN `ESCUE` CHAR(11), IN `NOMBREES` VARCHAR(100), IN `GRADOACA` VARCHAR(100), IN `ABRE` CHAR(2), IN `DENOMI` VARCHAR(100), IN `PROGRAMA` VARCHAR(100), IN `CRED` INT, IN `FACUL` INT, IN `ESTADO` VARCHAR(20))   BEGIN
DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM escuela_profesional WHERE Nombre=NOMBREES AND Grado_academico=GRADOACA AND `Denominación_grado`=DENOMI);
IF @CANTIDAD=0 THEN
	UPDATE escuela_profesional SET
	Nombre=NOMBREES,
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
SET @CANTIDAD:=(SELECT COUNT(*) FROM empleado WHERE emple_nrodocumento=NDOCUMENTO);
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
SET @CANTIDAD:=(SELECT COUNT(*) FROM facultad WHERE Nombre=FACULTAD);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_MODALIDAD_TITULO` (IN `ID_MODA` INT, IN `EXPE_ACT` CHAR(12), IN `EXPE` CHAR(12), IN `MODO_OB` VARCHAR(150), IN `MODO_ESTU` VARCHAR(100), IN `TRABA_INV` VARCHAR(255), IN `TURNITIN` VARCHAR(20), IN `PORCENTAJE` CHAR(3), IN `CENTRO_INVE` VARCHAR(255), IN `REGLA_META` TEXT, IN `PRO_BACH` VARCHAR(255), IN `PRO_INST` VARCHAR(255), IN `PRO_TITU` VARCHAR(255), IN `FECHA_MATRI_MOD` DATE, IN `FECHA_INIC_MOD` DATE, IN `FECHA_FIN_MOD` DATE, IN `MODO_SUSTE` VARCHAR(20), IN `USU` INT)   BEGIN
DECLARE CANTIDAD INT;
IF EXPE_ACT = EXPE THEN
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
	Id_expediente=EXPE,
	updated_at=NOW()
	WHERE Id_modalidad=ID_MODA;
	
	SELECT 1;
ELSE
IF EXPE_ACT <> EXPE THEN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_USUARIO` (IN `ID` VARCHAR(255), IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25))   UPDATE usuario SET
usuario.empleado_id = IDEMPLEADO,
usuario.area_id=IDAREA,
usuario.usu_rol=ROL
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO` (IN `USU` VARCHAR(255), IN `CONTRA` VARCHAR(255), IN `IDEMPLEADO` INT, IN `IDAREA` INT, IN `ROL` VARCHAR(25))   BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usu_usuario=USU);
IF @CANTIDAD=0 THEN
INSERT INTO usuario(usu_usuario,usu_contra,empleado_id,area_id,usu_rol,usu_feccreacion,usu_estatus,empresa_id)VALUES(USU,CONTRA,IDEMPLEADO,IDAREA,ROL,CURDATE(),'ACTIVO',2);
SELECT 1;
ELSE
SELECT 2;
END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO` (IN `USU` VARCHAR(255))   SELECT
	usuario.usu_id, 
	usuario.usu_usuario, 
	usuario.usu_contra, 
	usuario.usu_feccreacion, 
	usuario.usu_fecupdate, 
	usuario.empleado_id, 
	usuario.usu_observacion, 
	usuario.usu_estatus, 
	usuario.area_id, 
	usuario.usu_rol, 
	usuario.empresa_id, 
	area.area_nombre, 
	area.area_cod, 
	empleado.emple_nombre, 
	empleado.emple_apepat, 
	empleado.emple_apemat, 
	CONCAT_WS(' ',empleado.emple_nombre,empleado.emple_apepat,empleado.emple_apemat) AS USUARIO, 
	empleado.empl_fotoperfil, 
	empresa.emp_logo,
	empresa.emp_razon
FROM
	usuario
	INNER JOIN
	area
	ON 
		usuario.area_id = area.area_cod
	INNER JOIN
	empleado
	ON 
		usuario.empleado_id = empleado.empleado_id
	INNER JOIN
	empresa
	ON 
		usuario.empresa_id = empresa.empresa_id
	where usuario.usu_usuario = BINARY USU$$

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
(11, 'PLANEAMIENTO', '2024-03-19 21:34:33', 'ACTIVO', NULL, NULL);

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
(1, 'ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'JUAN ALARCON CAMACHO', 'DECANO', '2024-05-25 22:19:18', '2024-06-09 19:23:09', 2, 'ACTIVO'),
(2, 'ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'BONIFACIO ROBLES AGUIRRE', 'DECANO', '2024-05-30 21:55:20', '2024-06-02 10:40:51', 2, 'ACTIVO'),
(3, 'ZENON HUMBERTO AREVALO MEZARINA', 'RECTOR', 'JIOVANNA ARCE DEL CASTILLO', 'SECRETARIA GENERAL', 'GILDA LUCY LOAYZA ROJAS ', 'DECANO', '2024-05-30 21:56:25', '2024-06-15 09:08:06', 2, 'ACTIVO'),
(6, 'DR. ZENóN HUMBERTO ARéVALO MEZARINA', 'RECTOR', 'MAG. ALFREDO MARISCAL ZúNIGA', 'SECRETARIA GENERAL', 'MAG. ALFREDO MARISCAL ZúNIGA', 'DIRECTOR', '2024-06-22 20:39:26', '0000-00-00 00:00:00', 2, 'ACTIVO');

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
(1, 'CEDE CENTRAL', 'ES LA CEDE PRINCIPAL', 'ACTIVO', '2024-06-18 15:12:11', '0000-00-00 00:00:00'),
(2, 'ANDAHUAYLAS ', 'CEDE QUE SE ENCUENTRA EN ANADAHUAYLAS CON 7 CARRERAS', 'ACTIVO', '2024-06-18 15:18:29', '2024-06-18 15:36:34'),
(3, 'CUSCO', 'CEDE EN LA CIUDAD IMPERIAL CONSTA DE 6 CARRERAS PROFESIONALES', 'ACTIVO', '2024-06-18 15:18:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diploma`
--

CREATE TABLE `diploma` (
  `Id_Diploma` int(11) NOT NULL,
  `Diploma_numero` int(11) NOT NULL,
  `Registro_numero` int(11) DEFAULT NULL,
  `Resolucion_numero` varchar(30) NOT NULL,
  `Resolucion_fecha` date NOT NULL,
  `Fecha_diploma` date NOT NULL,
  `Diploma_tipo_emitido` char(1) NOT NULL,
  `Registro_libro` int(11) NOT NULL,
  `Registro_folio` text NOT NULL,
  `Foto` binary(100) DEFAULT NULL,
  `Fecha_inicio_tramite` date DEFAULT NULL,
  `Fecha_finalizaciòn_tramite` date DEFAULT NULL,
  `Tiempo_transcurrido` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_modalidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, 'UNIVERSIDAD TECNOLÓGICA DE LOS ANDES', 'UTEA@GMAIL.COM', '40', '(083) 321559', 'AV. PERU Nº 700 ABANCAY, APURíMAC, PERU', 'controller/empresa/FOTOS/IMG14-6-2024-15-492.png', '2024-05-25 21:53:36', NULL);

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
(2, 'EPIC', 'INGENIERÍA CIVIL', 'TITULO', 'T', 'INGENIERO CIVIL', 'CICLO REGULAR', 225, 1, '2024-06-01 21:25:37', '2024-06-15 14:12:15', 'ACTIVO'),
(3, 'EPIA', 'INGENIERÍA AMBIENTAL Y RECURSOS NATURALES', 'TITULO', 'T', 'INGENIERO AMBIENTAL', 'CICLO REGULAR', 220, 1, '2024-06-01 21:29:01', '2024-06-15 14:12:27', 'ACTIVO'),
(4, 'EPA', 'AGRONOMIA', 'TITULO', 'T', 'INGENIERO AGRONOMO', 'CICLO REGULAR', 220, 1, '2024-06-01 21:31:24', '2024-06-15 14:12:33', 'ACTIVO'),
(5, 'EPISEI', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'BACHILLER', 'B', 'BACHILLER EN INGENIERIA DE SISTEMAS E INFORMATICA', 'CICLO REGULAR', 220, 1, '2024-06-01 22:09:51', '0000-00-00 00:00:00', 'ACTIVO'),
(6, 'EPIC', 'INGENIERIA CIVIL', 'BACHILLER', 'B', 'BACHILLER EN INGENIERIA CIVIL', 'CICLO REGULAR', 220, 1, '2024-06-01 22:19:51', '2024-06-15 14:12:45', 'ACTIVO'),
(7, 'EPCO', 'CONTABILIDAD', 'BACHILLER', 'B', 'CIENCIAS CONTABLES Y FINANCIERAS', 'CICLO REGULAR', 220, 3, '2024-06-08 21:24:17', '2024-06-15 14:12:54', 'ACTIVO'),
(8, 'EPES', 'ESTOMATOLOGIA', 'BACHILLER', 'B', 'ESTOMATOLOGIA', 'CICLO REGULAR', 220, 2, '2024-06-08 23:29:50', '2024-06-15 14:13:01', 'ACTIVO'),
(9, 'EPD', 'DERECHO', 'BACHILLER', 'B', 'DERECHO', 'CICLO REGULAR', 260, 3, '2024-06-10 01:27:50', '2024-06-15 14:13:07', 'ACTIVO'),
(10, 'EPCO', 'CONTABILIDAD', 'TITULO', 'T', 'CONTADOR PUBLICO', 'CICLO REGULAR', 220, 3, '2024-06-15 20:57:49', '0000-00-00 00:00:00', 'ACTIVO'),
(11, 'EPDE', 'DERECHO', 'TITULO', 'T', 'ABOGADO', 'CICLO REGULAR', 260, 3, '2024-06-15 21:01:25', '0000-00-00 00:00:00', 'ACTIVO'),
(12, 'EPEDU', 'EDUCACION', 'TITULO', 'T', 'EDUCACION', 'CICLO REGULAR', 220, 3, '2024-06-15 21:03:00', '0000-00-00 00:00:00', 'ACTIVO'),
(13, 'EPTHG', 'TURISMO HOTELERIA Y GASTRONOMIA', 'TITULO', 'T', 'LICENCIA EN TURISMO HOTELERIA Y GASTRONOMIA', 'CICLO REGULAR', 220, 3, '2024-06-15 21:04:43', '0000-00-00 00:00:00', 'ACTIVO'),
(14, 'EPEN', 'ENFERMERIA', 'TITULO', 'T', 'LICENCIANDO EN ENFERMERIA', 'CICLO REGULAR', 220, 2, '2024-06-15 21:05:23', '0000-00-00 00:00:00', 'ACTIVO'),
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

INSERT INTO `estudiante` (`Dni`, `Codigo`, `Nombres`, `Apellido_paterno`, `Apellido_materno`, `Sexo`, `Celular`, `Direccion`, `Fecha_matricula`, `Fecha_egreso`, `Años_transcurridos`, `Meses_transcurridos`, `Dias_transcurridos`, `id_usuario`, `created_at`, `updated_at`) VALUES
('12354847', '201548485K', 'JOAQUIN', 'SALDIVAR', 'PANIURA', 'M', '924414541', 'AV. CIRCUNVALACIÓN Nº 584', '2015-04-12', '2022-07-20', 7, 3, 8, 2, '2024-06-01 14:52:57', '0000-00-00 00:00:00'),
('23245145', '201648484G', 'JOSE', 'SANCHEZ', 'JIMNEZ', 'M', '958585214', 'Av. Canada Nº 588', '2016-03-01', '2022-12-12', 6, 9, 11, 3, '2024-05-31 23:26:30', '0000-00-00 00:00:00'),
('25414521', '201354487U', 'KAREN', 'PATIÑO', 'ROBLES', 'F', '954145487', 'AV. AVIACION N° 541', '2013-03-13', '2019-12-28', 6, 9, 15, 2, '2024-06-02 16:55:51', '2024-06-02 11:58:00'),
('51541458', '201341788L', 'ADRIANA', 'SANCHEZ', 'PADILLA', 'F', '925414147', 'JR. CUSCO N° 587', '2013-04-12', '2019-12-20', 6, 8, 8, 2, '2024-06-01 14:58:32', '0000-00-00 00:00:00'),
('52554477', '201211551Q', 'ALBERTO', 'SANCHEZ', 'PANIURA', 'M', '952478478', 'JR. CANADA N° 110', '2012-01-14', '2018-12-25', 6, 11, 11, 2, '2024-06-01 16:11:39', '2024-06-01 11:36:47'),
('54548484', '201648882A', 'ANAHID', 'SANCHEZ', 'WILLAX', 'F', '95600666', 'AV. DIAZ BARCENAS N° 577', '2016-07-12', '2022-01-07', 5, 6, 4, 2, '2024-06-01 16:12:59', '2024-06-01 11:36:30'),
('55444848', '201454784S', 'JOSEP JUAN', 'CHAVEZ', 'SANCHEZ', 'M', '954944945', 'JR. CANADA N° 785', '2017-03-14', '2023-12-12', 6, 8, 29, 2, '2024-06-13 05:00:00', '2024-06-13 00:00:00'),
('55484847', '201024848Q', 'HECTOR', 'MIRANDA', 'TAIPE', 'M', '925414548', 'AV. GARCILAZO N° 201', '2010-04-10', '2016-01-12', 5, 9, 2, 2, '2024-06-01 14:59:41', '0000-00-00 00:00:00'),
('55959595', '201555875C', 'SHANERY', 'MEDRANO', 'PERALTA', 'F', '912516915', 'AV. ABANCAY N° 444', '2012-03-24', '2018-12-28', 6, 9, 4, 2, '2024-06-04 21:28:40', '2024-06-04 16:33:03'),
('56587474', '201658488P', 'DANIELA', 'CHIPANA', 'JIMENES', 'F', '954145786', 'AV. ABANCAY Nº 512', '2016-04-13', '2022-12-26', 6, 8, 13, 2, '2024-06-01 14:50:46', '2024-06-01 11:37:39'),
('59858747', '201628848B', 'LUCIO', 'HUAYLLA', 'QUISPE', 'M', '985478747', 'AV. HUASCAR Nº 558', '2016-04-12', '2022-12-28', 6, 8, 16, 2, '2024-06-02 16:53:37', '0000-00-00 00:00:00'),
('74290930', '201711457H', 'MARIMAR', 'PEREYRA', ' HUAMAN', 'F', '989595959', 'AV. DIAZ BARCENAS N° 887', '2017-09-01', '2023-11-28', 6, 2, 26, 2, '2024-06-22 05:00:00', '0000-00-00 00:00:00');

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
  `Fecha` date DEFAULT NULL,
  `Expedicion` varchar(255) DEFAULT NULL,
  `Libro` varchar(255) DEFAULT NULL,
  `Folio` varchar(255) DEFAULT NULL,
  `Registro` varchar(255) DEFAULT NULL,
  `Archivo` varchar(255) DEFAULT NULL,
  `Id_autoridad` int(11) DEFAULT NULL,
  `Id_usuario` int(11) DEFAULT NULL,
  `estado` enum('PENDIENTE','EN PROCESO','COLACION') DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `doc_ncorrelativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `expediente`
--

INSERT INTO `expediente` (`Id_expediente`, `Id_cede`, `Dni`, `Id_escuela`, `Titulo_de`, `Grado_bachiller_de`, `Modalidad`, `Acto_academico`, `Acuerdo`, `Resolucion_rectoral_N`, `Fecha`, `Expedicion`, `Libro`, `Folio`, `Registro`, `Archivo`, `Id_autoridad`, `Id_usuario`, `estado`, `created_at`, `updated_at`, `doc_ncorrelativo`) VALUES
('E0000001', 1, '55444848', 5, '', 'BACHILLER EN INGENIERIA DE SISTEMAS E INFORMATICA', '', '', '', '', '0000-00-00', '', '', '', '', 'controller/expediente_bachiller/documentos/EXPE-55444848-15-6-2024-17-29-29.PDF', 1, 2, 'PENDIENTE', '2024-06-15', '2024-06-22 09:05:24', 1),
('E0000002', 1, '55959595', 8, '', 'ESTOMATOLOGIA', '', '', '', '', '0000-00-00', '', '', '', '', 'controller/expediente_bachiller/documentos/EXPE-55959595-15-6-2024-17-29-11.PDF', 3, 2, 'EN PROCESO', '2024-06-15', '2024-06-21 18:45:23', 2),
('E0000003', 1, '25414521', 6, '', 'BACHILLER EN INGENIERIA CIVIL', '', '', '1', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_BACHILLER/DOCUMENTOS/EXPE-25414521-15-6-2024-17-26-46.PDF', 2, 2, 'EN PROCESO', '2024-06-15', '2024-06-22 11:24:04', 3),
('E0000004', 1, '56587474', 15, 'CIRUJANO DENTISTA', '', 'TESIS', '', '', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_TITULADO/DOCUMENTOS/EXPE-56587474-15-6-2024-17-28-43.PDF', 1, 2, 'PENDIENTE', '2024-06-15', '2024-06-22 13:22:48', 4),
('E0000005', 1, '25414521', 1, 'INGENIERO DE SISTEMAS E INFORMATICO', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_TITULADO/DOCUMENTOS/EXPE-25414521-15-6-2024-17-27-55.PDF', 3, 2, 'PENDIENTE', '2024-06-15', '2024-06-19 16:35:28', 5),
('E0000006', 2, '12354847', 14, 'LICENCIANDO EN ENFERMERIA', '', 'SUFICIENCIA PROFESIONAL', '', '', '', '0000-00-00', '', '', '', '', '', 1, 2, 'PENDIENTE', '2024-06-15', '2024-06-22 15:21:23', 6),
('E0000007', 2, '12354847', 5, '', 'BACHILLER EN INGENIERIA DE SISTEMAS E INFORMATICA', '', '', '', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_BACHILLER/DOCUMENTOS/EXPE-56587474-18-6-2024-16-26-52.PDF', 2, 2, 'EN PROCESO', '2024-06-18', '2024-06-21 18:03:16', 7),
('E0000008', 3, '56587474', 2, 'INGENIERO CIVIL', 'INGENIERIA DE SISTEMAS E INFORMATICA', 'SUFICIENCIA PROFESIONAL', '', '', '', '0000-00-00', '', '', '', '', '', 3, 2, 'EN PROCESO', '2024-06-19', '2024-06-22 13:25:16', 8),
('E0000009', 3, '55959595', 5, '', 'BACHILLER EN INGENIERIA DE SISTEMAS E INFORMATICA', '', '', '', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_BACHILLER/DOCUMENTOS/EXPE-55959595-19-6-2024-15-54-39.PDF', 1, 2, 'PENDIENTE', '2024-06-19', '2024-06-21 18:03:09', 9),
('E0000010', 3, '55484847', 13, 'LICENCIA EN TURISMO HOTELERIA Y GASTRONOMIA', '', 'TESIS', '', '', '', '0000-00-00', '', '', '', '', 'CONTROLLER/EXPEDIENTE_TITULADO/DOCUMENTOS/EXPE-51541458-19-6-2024-16-0-40.PDF', 2, 2, 'EN PROCESO', '2024-06-19', '2024-06-22 16:23:13', 10),
('E0000011', 1, '74290930', 7, '', 'CIENCIAS CONTABLES Y FINANCIERAS', '', '', '', '', '0000-00-00', '', '', '', '', 'controller/expediente_bachiller/documentos/EXPE-74290930-22-6-2024-17-6-49.PDF', 2, 2, 'EN PROCESO', '2024-06-22', '2024-06-22 17:09:32', 11);

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
(1, 'INGENIERIA', 1, 'ACTIVO', '2024-06-01 18:19:41', '2024-06-10 00:11:06'),
(2, 'CIENCIAS DE LA SALUD', 3, 'ACTIVO', '2024-06-01 18:20:04', '2024-06-08 23:27:03'),
(3, 'CIENCIAS JURÍDICAS, CONTABLES Y SOCIALES', 2, 'ACTIVO', '2024-06-01 18:20:25', '2024-06-08 23:27:26'),
(5, 'DIRECCIÓN POSGRADO', 6, 'ACTIVO', '2024-06-22 21:20:54', '0000-00-00 00:00:00'),
(6, 'INGENIERIA', 2, 'ACTIVO', '2024-06-22 21:59:27', '0000-00-00 00:00:00');

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
  `Porcentaje` char(3) DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`Id_modalidad`, `Modo_obtencion`, `Abreviatura_modo_estudio`, `Modo_estudio`, `Trabajo_investigacion`, `Turnitin`, `Porcentaje`, `Centro_investigacion`, `Reglamento_metadado`, `Proce_bachiller`, `Proce_insti_origen`, `Proce_titulo_peda`, `Fecha_matricula_modalidad`, `Fecha_inicio_modalidad`, `Fecha_fin_modalidad`, `Modo_sustentacion`, `Id_usuario`, `Id_expediente`, `created_at`, `updated_at`) VALUES
(1, 'BACHILLER AUTOMATICO', 'P', 'VIRTUAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', 2, 'E0000007', '2024-06-21', '2024-06-22 16:21:25'),
(2, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', 2, 'E0000002', '2024-06-22', '2024-06-22 16:23:15'),
(3, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', 2, 'E0000003', '2024-06-22', '0000-00-00 00:00:00'),
(8, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', '', '', '', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE ENFERMERIA', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000006', '2024-06-22', '0000-00-00 00:00:00'),
(9, 'SUFICIENCIA PROFESIONAL', 'P', 'PRESENCIAL', 'CENTRO DE INVESTIGACIÓN DE LA ESCUELA PROFESIONAL DE INGENIERIA CIVIL', 'SI(TURNITIN)', '15%', 'CLIMA ORGANIZACIONAL Y CUMPLIMIENTO DE FUNCIONES SECUNDARIAS DE LA ATENCIóN PRIMARIA, EN PROFESIONALES DEL CENTRO DE SALUD PUEBLO JOVEN CENTENARIO, ABANCAY, 2021\n', 'https://repositorio.utea.edu.pe/handle/utea/590\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000008', '2024-06-22', '2024-06-22 21:09:28'),
(10, 'TESIS', 'P', 'PRESENCIAL', 'FACTORES SOCIALES Y NUTRICIONALES QUE INFLUYEN AL DESARROLLO DE LA ANEMIA FERROPéNICA EN NIñOS DE 6 A 36 MESES DE EDAD ATENDIDOS EN LA IPRESS SAYLLA – 2023\n', 'SI(TURNITIN)', '24%', 'CENTRO DE INVESTIGACIÓN DE LA CARRERA PROFESIONAL DE TURISMO HOTELERIA Y GASTRONOMIA\n', 'https://repositorio.utea.edu.pe/handle/utea/660\n', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', 'PRESENCIAL', 2, 'E0000010', '2024-06-22', '2024-06-22 21:24:19'),
(11, 'BACHILLER AUTOMATICO', 'P', 'PRESENCIAL', '', '', '', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', 2, 'E0000011', '2024-06-22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_usuario` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT '',
  `usu_contra` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_feccreacion` date DEFAULT NULL,
  `usu_fecupdate` date DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `usu_observacion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `usu_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `usu_rol` enum('Secretario (a)','Administrador') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `empresa_id` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_usuario`, `usu_contra`, `usu_feccreacion`, `usu_fecupdate`, `empleado_id`, `usu_observacion`, `usu_estatus`, `area_id`, `usu_rol`, `empresa_id`, `created_at`, `updated_at`) VALUES
(2, 'jersson', '$2y$12$OFdwUIOo./CC.vnSX.73LeKctoIi.kB632x0q42O9cB.gJMdFu5iC', '2023-08-25', NULL, 1, NULL, 'ACTIVO', 2, 'Administrador', 2, NULL, NULL),
(3, 'JOSE', '$2y$12$lvoj5Xdta18f0FvBD/Kv/OKNzoNwgi4EyWFt3cnIp4pH7YEv9uk6G', '2023-08-25', NULL, 2, NULL, 'ACTIVO', 1, 'Secretario (a)', 2, NULL, NULL),
(4, 'ANDREA', '$2y$12$J3VwFNFSAjqdo0yuYdWL6e.kDmetlR9QVjCf5EtKuIzIRM/aDdmFC', '2023-08-25', NULL, 3, NULL, 'ACTIVO', 3, 'Secretario (a)', 2, NULL, NULL),
(5, 'LUIS', '$2y$12$p.qLHsx8sRemyzO..tXey..eEIQcprHXlhjHtYgtHDBzEj2QDF232', '2023-08-25', NULL, 4, NULL, 'ACTIVO', 5, 'Secretario (a)', 2, NULL, NULL),
(6, 'JUAN', '$2y$12$arbO9/L.m8Z.TnXdFsfdDOaTVGSVGb/P/FUVMLCciB5t0WdKQF7tG', '2023-08-27', NULL, 5, NULL, 'ACTIVO', 4, 'Secretario (a)', 2, NULL, NULL),
(7, 'WILLY', '$2y$12$KX8EUu4Qz0a7lsUclaT4IOZr9dNR/QV3nKUyOq2tx.LcJne1G2Hba', '2023-09-07', NULL, 7, NULL, 'ACTIVO', 4, 'Administrador', 2, NULL, NULL),
(8, 'eliascar', '$2y$12$wdPTnurFDab5l.0lT7VTg.unBYNeYT/3DXkzbGNX2GENiSvAuJ3F2', '2023-09-10', NULL, 8, NULL, 'ACTIVO', 6, 'Secretario (a)', 2, NULL, NULL),
(9, 'jose123', '$2y$12$wwmyjKhHZq.i.r7Nw8vmE.WJKc3D0UD6bZdEufl4MRmzmcJkouaAG', '2024-02-11', NULL, 10, NULL, 'ACTIVO', 7, 'Secretario (a)', 2, NULL, NULL);

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
-- Indices de la tabla `diploma`
--
ALTER TABLE `diploma`
  ADD PRIMARY KEY (`Id_Diploma`),
  ADD KEY `fk_usuario2` (`id_usuario`),
  ADD KEY `fk_modalidad` (`id_modalidad`);

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
-- Indices de la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD PRIMARY KEY (`Id_expediente`),
  ADD KEY `fk_estudiante6` (`Dni`),
  ADD KEY `fk_escuelaa` (`Id_escuela`),
  ADD KEY `fk_auto` (`Id_autoridad`),
  ADD KEY `fk_usuario5` (`Id_usuario`),
  ADD KEY `fk_cede` (`Id_cede`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD KEY `fk_autoridad` (`Cod_autoridad`),
  ADD KEY `Cod_facultad` (`Cod_facultad`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`Id_modalidad`),
  ADD KEY `fk_user` (`Id_usuario`),
  ADD KEY `fk_expediente` (`Id_expediente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`) USING BTREE,
  ADD KEY `empleado_id` (`empleado_id`) USING BTREE,
  ADD KEY `area_id` (`area_id`) USING BTREE,
  ADD KEY `empresa_id` (`empresa_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `area_cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo auto-incrementado del movimiento del area', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `autoridades`
--
ALTER TABLE `autoridades`
  MODIFY `Cod_autoridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cede`
--
ALTER TABLE `cede`
  MODIFY `Id_cede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `diploma`
--
ALTER TABLE `diploma`
  MODIFY `Id_Diploma` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `Id_modalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `fk_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad` (`Id_modalidad`),
  ADD CONSTRAINT `fk_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usu_id`);

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
-- Filtros para la tabla `expediente`
--
ALTER TABLE `expediente`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`Id_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`),
  ADD CONSTRAINT `fk_cede` FOREIGN KEY (`Id_cede`) REFERENCES `cede` (`Id_cede`),
  ADD CONSTRAINT `fk_escuelaa` FOREIGN KEY (`Id_escuela`) REFERENCES `escuela_profesional` (`Id_escuela`),
  ADD CONSTRAINT `fk_estudiante6` FOREIGN KEY (`Dni`) REFERENCES `estudiante` (`Dni`),
  ADD CONSTRAINT `fk_usuario5` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`);

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `fk_autoridad` FOREIGN KEY (`Cod_autoridad`) REFERENCES `autoridades` (`Cod_autoridad`);

--
-- Filtros para la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD CONSTRAINT `fk_expe` FOREIGN KEY (`Id_expediente`) REFERENCES `expediente` (`Id_expediente`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_cod`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`empresa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
