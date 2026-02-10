-- Add ethnic variables fields to expediente_posgrado table
ALTER TABLE expediente_posgrado 
ADD COLUMN DET_ETNICA VARCHAR(150) NULL AFTER Registro,
ADD COLUMN COD_ETNIA VARCHAR(10) NULL AFTER DET_ETNICA,
ADD COLUMN DET_LENGUA VARCHAR(150) NULL AFTER COD_ETNIA,
ADD COLUMN COD_LENGUA VARCHAR(10) NULL AFTER DET_LENGUA;

-- Update SP_REGISTRAR_POSGRADO to handle new fields
DROP PROCEDURE IF EXISTS SP_REGISTRAR_POSGRADO;
DELIMITER //
CREATE PROCEDURE `SP_REGISTRAR_POSGRADO`(
    IN `TIPODOC` VARCHAR(50),
    IN `NDOCUMENTO` CHAR(20),
    IN `NOMBRE` VARCHAR(150),
    IN `APEPAT` VARCHAR(100),
    IN `APEMAT` VARCHAR(100),
    IN `CODIGO` CHAR(15),
    IN `SEXO` VARCHAR(20),
    IN `MOVIL` CHAR(9),
    IN `DIRECCION` TEXT,
    IN `CORREO_PER` VARCHAR(255),
    IN `CORREO_INST` VARCHAR(255),
    IN `FECHAMATRI` DATE,
    IN `FECHAEGRE` DATE,
    IN `OBSERVA` TEXT,
    IN `CED` INT,
    IN `PRO` VARCHAR(255),
    IN `DEN` VARCHAR(255),
    IN `MODA` VARCHAR(255),
    IN `IDAUTO` INT,
    IN `FECHA` DATE,
    IN `ACAD` VARCHAR(255),
    IN `ACU` VARCHAR(255),
    IN `RES` VARCHAR(255),
    IN `EXPED` VARCHAR(255),
    IN `LIB` VARCHAR(20),
    IN `FOL` VARCHAR(20),
    IN `REG` VARCHAR(50),
    IN `RUTA` VARCHAR(255),
    -- New fields
    IN `V_DET_ETNICA` VARCHAR(150),
    IN `V_COD_ETNIA` VARCHAR(10),
    IN `V_DET_LENGUA` VARCHAR(150),
    IN `V_COD_LENGUA` VARCHAR(10),
    --
    IN `MOD_ESTU` VARCHAR(255),
    IN `TRA_INV` TEXT,
    IN `TURN` VARCHAR(20),
    IN `PORC` VARCHAR(12),
    IN `CENT` VARCHAR(250),
    IN `META` MEDIUMTEXT,
    IN `PROCE_PAIS` VARCHAR(255),
    IN `PROCE_UNIV` VARCHAR(255),
    IN `PROCE_GRADO` VARCHAR(255),
    IN `FECHA_MATRI_MOD` DATE,
    IN `FECHA_INICI_MOD` DATE,
    IN `FECHA_FIN_MOD` DATE,
    IN `MOD_SUSTENTA` ENUM('PRESENCIAL','VIRTUAL'),
    IN `IDUSUARIO` INT
)
BEGIN
    -- Logic to check if student exists and register/update them, then create the expediente
    -- Note: This is an inferred version based on the model calls and usual system patterns
    -- You may need to adjust the internal logic to match the EXACT previous implementation.
    
    DECLARE DNI_COUNT INT;
    SELECT COUNT(*) INTO DNI_COUNT FROM estudiante_posgrado WHERE Dni = NDOCUMENTO;
    
    IF DNI_COUNT = 0 THEN
        INSERT INTO estudiante_posgrado (Dni, Codigo, Nombres, Apellido_paterno, Apellido_materno, Sexo, Celular, Direccion, Fecha_matricula, Fecha_egreso, correo_personal, correo_institucional, id_usuario, created_at)
        VALUES (NDOCUMENTO, CODIGO, NOMBRE, APEPAT, APEMAT, SEXO, MOVIL, DIRECCION, FECHAMATRI, FECHAEGRE, CORREO_PER, CORREO_INST, IDUSUARIO, NOW());
    ELSE
        UPDATE estudiante_posgrado SET
            Codigo = CODIGO,
            Nombres = NOMBRE,
            Apellido_paterno = APEPAT,
            Apellido_materno = APEMAT,
            Sexo = SEXO,
            Celular = MOVIL,
            Direccion = DIRECCION,
            Fecha_matricula = FECHAMATRI,
            Fecha_egreso = FECHAEGRE,
            correo_personal = CORREO_PER,
            correo_institucional = CORREO_INST,
            id_usuario = IDUSUARIO,
            updated_at = NOW()
        WHERE Dni = NDOCUMENTO;
    END IF;

    INSERT INTO expediente_posgrado (
        Id_cede, Dni, Titulo_de, Grado_bachiller_de, Modalidad, Acto_academico, Acuerdo, Resolucion_rectoral_N, 
        Expedicion, Libro, Folio, Registro, Archivo, Id_usuario, estado, created_at, id_autoridad,
        DET_ETNICA, COD_ETNIA, DET_LENGUA, COD_LENGUA
    ) VALUES (
        CED, NDOCUMENTO, PRO, DEN, MODA, ACAD, ACU, RES, FECHA, LIB, FOL, REG, RUTA, IDUSUARIO, 'PENDIENTE', NOW(), IDAUTO,
        V_DET_ETNICA, V_COD_ETNIA, V_DET_LENGUA, V_COD_LENGUA
    );
    
    SET @ID_EXP := LAST_INSERT_ID();
    
    INSERT INTO modalidad_posgrado (
        Modo_estudio, Trabajo_investigacion, Turnitin, Porcentaje, Centro_investigacion, Reglamento_metadado,
        Proce_bachiller, Proce_insti_origen, Proce_titulo_peda, Fecha_matricula_modalidad, Fecha_inicio_modalidad,
        Fecha_fin_modalidad, Modo_sustentacion, Id_usuario, Id_expediente, created_at
    ) VALUES (
        MOD_ESTU, TRA_INV, TURN, PORC, CENT, META, PROCE_PAIS, PROCE_UNIV, PROCE_GRADO, FECHA_MATRI_MOD, FECHA_INICI_MOD,
        FECHA_FIN_MOD, MOD_SUSTENTA, IDUSUARIO, @ID_EXP, NOW()
    );

    SELECT 1;
END //
DELIMITER ;

-- Update SP_MODIFICAR_POSGRADO to handle new fields
DROP PROCEDURE IF EXISTS SP_MODIFICAR_POSGRADO;
DELIMITER //
CREATE PROCEDURE `SP_MODIFICAR_POSGRADO`(
    IN `NDOCUMENTO` CHAR(20),
    IN `NOMBRE` VARCHAR(150),
    IN `APEPAT` VARCHAR(100),
    IN `APEMAT` VARCHAR(100),
    IN `CODIGO` CHAR(15),
    IN `SEXO` VARCHAR(20),
    IN `MOVIL` CHAR(9),
    IN `DIRECCION` TEXT,
    IN `CORREO_PER` VARCHAR(255),
    IN `CORREO_INST` VARCHAR(255),
    IN `FECHAMATRI` DATE,
    IN `FECHAEGRE` DATE,
    IN `OBSERVA` TEXT,
    IN `IDEXPE` INT,
    IN `PRO` VARCHAR(255),
    IN `DEN` VARCHAR(255),
    IN `MODA` VARCHAR(255),
    IN `IDAUTO` INT,
    IN `FECHA` DATE,
    IN `ACAD` VARCHAR(255),
    IN `ACU` VARCHAR(255),
    IN `RES` VARCHAR(255),
    IN `EXPED` VARCHAR(255),
    IN `LIB` VARCHAR(20),
    IN `FOL` VARCHAR(20),
    IN `REG` VARCHAR(50),
    IN `RUTA` VARCHAR(255),
    IN `IDMODA` INT,
    IN `MOD_ESTU` VARCHAR(255),
    IN `TRA_INV` TEXT,
    IN `TURN` VARCHAR(20),
    IN `PORC` VARCHAR(12),
    IN `CENT` VARCHAR(250),
    IN `META` MEDIUMTEXT,
    IN `PROCE_PAIS` VARCHAR(255),
    IN `PROCE_UNIV` VARCHAR(255),
    IN `PROCE_GRADO` VARCHAR(255),
    IN `FECHA_MATRI_MOD` DATE,
    IN `FECHA_INICI_MOD` DATE,
    IN `FECHA_FIN_MOD` DATE,
    IN `MOD_SUSTENTA` ENUM('PRESENCIAL','VIRTUAL'),
    -- New fields
    IN `V_DET_ETNICA` VARCHAR(150),
    IN `V_COD_ETNIA` VARCHAR(10),
    IN `V_DET_LENGUA` VARCHAR(150),
    IN `V_COD_LENGUA` VARCHAR(10),
    --
    IN `IDDIPLOMA` INT,
    IN `FECHACU` DATE,
    IN `FECHAFIRMA` DATE,
    IN `RESOL` VARCHAR(255),
    IN `FECHARESO` DATE,
    IN `NUMDIPLO` VARCHAR(50),
    IN `NUMREGIS` VARCHAR(50),
    IN `LIBROREGI` VARCHAR(20),
    IN `REGISFOLIO` VARCHAR(20),
    IN `TIPODIPLO` VARCHAR(50),
    IN `FECHAINI` DATE,
    IN `NROCRE` VARCHAR(10),
    IN `NROOFICIO` VARCHAR(50),
    IN `FECHASECRE` DATE,
    IN `IDUSUARIO` INT
)
BEGIN
    UPDATE estudiante_posgrado SET
        Codigo = CODIGO,
        Nombres = NOMBRE,
        Apellido_paterno = APEPAT,
        Apellido_materno = APEMAT,
        Sexo = SEXO,
        Celular = MOVIL,
        Direccion = DIRECCION,
        Fecha_matricula = FECHAMATRI,
        Fecha_egreso = FECHAEGRE,
        correo_personal = CORREO_PER,
        correo_institucional = CORREO_INST,
        id_usuario = IDUSUARIO,
        updated_at = NOW()
    WHERE Dni = NDOCUMENTO;

    UPDATE expediente_posgrado SET
        Grado_bachiller_de = DEN,
        Modalidad = MODA,
        id_autoridad = IDAUTO,
        Expedicion = FECHA,
        Acto_academico = ACAD,
        Acuerdo = ACU,
        Resolucion_rectoral_N = RES,
        Libro = LIB,
        Folio = FOL,
        Registro = REG,
        Archivo = RUTA,
        DET_ETNICA = V_DET_ETNICA,
        COD_ETNIA = V_COD_ETNIA,
        DET_LENGUA = V_DET_LENGUA,
        COD_LENGUA = V_COD_LENGUA,
        updated_at = NOW()
    WHERE Id_expediente = IDEXPE;

    UPDATE modalidad_posgrado SET
        Modo_estudio = MOD_ESTU,
        Trabajo_investigacion = TRA_INV,
        Turnitin = TURN,
        Porcentaje = PORC,
        Centro_investigacion = CENT,
        Reglamento_metadado = META,
        Proce_bachiller = PROCE_PAIS,
        Proce_insti_origen = PROCE_UNIV,
        Proce_titulo_peda = PROCE_GRADO,
        Fecha_matricula_modalidad = FECHA_MATRI_MOD,
        Fecha_inicio_modalidad = FECHA_INICI_MOD,
        Fecha_fin_modalidad = FECHA_FIN_MOD,
        Modo_sustentacion = MOD_SUSTENTA,
        updated_at = NOW()
    WHERE Id_modalidad = IDMODA;

    -- Note: Diploma update depends on actual schema. Assuming similar logic as others.
    IF IDDIPLOMA > 0 THEN
        UPDATE diploma_posgrado SET
            Fecha_acuerdo = FECHACU,
            Fecha_firma = FECHAFIRMA,
            Nro_resolucion = RESOL,
            Fecha_resolucion = FECHARESO,
            Nro_diploma = NUMDIPLO,
            Nro_registro = NUMREGIS,
            Libro_registro = LIBROREGI,
            Folio_registro = REGISFOLIO,
            Tipo_diploma = TIPODIPLO,
            Fecha_inicio = FECHAINI,
            Nro_creditos = NROCRE,
            Nro_oficio = NROOFICIO,
            Fecha_secretaria = FECHASECRE,
            updated_at = NOW()
        WHERE iddiploma = IDDIPLOMA;
    END IF;

    SELECT 1;
END //
DELIMITER ;
