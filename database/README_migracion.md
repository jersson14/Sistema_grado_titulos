# Resumen de Cambios en Base de Datos

## Campos Agregados a Tabla `estudiante`

| Campo | Tipo | NULL | Descripción | Ejemplo |
|-------|------|------|-------------|---------|
| `foto_pasaporte` | VARCHAR(255) | Sí | Ruta de la foto | `uploads/fotos_pasaporte/12345678_foto.jpg` |
| `declaracion_etnica_pdf` | VARCHAR(255) | Sí | Ruta del PDF generado | `uploads/declaraciones_etnicas/12345678_declaracion.pdf` |
| `autoidentificacion_etnica` | VARCHAR(100) | Sí | Opción seleccionada | `"Pueblo indígena u originario"` |
| `nombre_etnia` | VARCHAR(100) | Sí | Nombre de la etnia | `"Ashaninka"`, `"Quechua"` |
| `lengua_indigena` | VARCHAR(100) | Sí | Opción de lengua | `"Sí"`, `"No"`, `"No sabe"` |
| `nombre_lengua` | VARCHAR(100) | Sí | Nombre de la lengua | `"Quechua"`, `"Aimara"` |
| `fecha_declaracion_etnica` | DATETIME | Sí | Timestamp de registro | `2026-02-05 14:30:00` |

## Valores Posibles

### autoidentificacion_etnica
- `"Pueblo indígena u originario"` → Requiere llenar `nombre_etnia`
- `"Población afroperuana"`
- `"No"`
- `"No sabe / No responde"`

### lengua_indigena
- `"Sí"` → Requiere llenar `nombre_lengua`
- `"No"`
- `"No sabe / No responde"`

## Stored Procedure Creado

**`SP_PUEDE_ACTUALIZAR_ESTUDIANTE(dni)`**
- Retorna `1` si puede actualizar (no tiene diploma)
- Retorna `0` si NO puede actualizar (ya tiene diploma registrado)

## Ejemplo de Uso

```sql
-- Verificar si estudiante puede actualizar
CALL SP_PUEDE_ACTUALIZAR_ESTUDIANTE('12345678');

-- Insertar nuevo estudiante con declaración étnica
INSERT INTO estudiante (
    tipo_documento, Dni, Nombres, Apellido_paterno, Apellido_materno,
    Sexo, Codigo, autoidentificacion_etnica, nombre_etnia,
    lengua_indigena, nombre_lengua, fecha_declaracion_etnica
) VALUES (
    'DNI', '12345678', 'JUAN', 'PEREZ', 'GARCIA',
    'M', '2020001234', 'Pueblo indígena u originario', 'Quechua',
    'Sí', 'Quechua', NOW()
);

-- Actualizar estudiante existente
UPDATE estudiante SET
    foto_pasaporte = 'uploads/fotos_pasaporte/12345678_foto.jpg',
    declaracion_etnica_pdf = 'uploads/declaraciones_etnicas/12345678_declaracion.pdf',
    autoidentificacion_etnica = 'Pueblo indígena u originario',
    nombre_etnia = 'Ashaninka',
    lengua_indigena = 'Sí',
    nombre_lengua = 'Ashaninka',
    fecha_declaracion_etnica = NOW(),
    updated_at = NOW()
WHERE Dni = '12345678';
```

## Siguiente Paso

Ejecutar el script SQL:
```bash
mysql -u root -p u486624649_grados_titulos < database/migration_declaracion_etnica.sql
```

O desde phpMyAdmin:
1. Abrir phpMyAdmin
2. Seleccionar base de datos `u486624649_grados_titulos`
3. Ir a pestaña "SQL"
4. Copiar y pegar el contenido de `migration_declaracion_etnica.sql`
5. Ejecutar
