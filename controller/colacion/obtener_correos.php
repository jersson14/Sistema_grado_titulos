<?php
require_once '../../model/model_conexion.php';

$conexion = new conexionBD();
$pdo = $conexion->conexionPDO();

// Verificar que la conexión se haya establecido correctamente
if (!$pdo) {
    echo json_encode(['status' => 'error', 'message' => 'Error de conexión a la base de datos']);
    exit;
}

// Obtener los valores de los parámetros GET
$sede = $_GET['sede'];  // Obtener el valor de "sede"
$fecha1 = $_GET['fecha1'];  // Obtener el valor de "fecha1"

// Consultar los correos electrónicos de la base de datos
$query = "SELECT correo_personal, correo_institucional 
          FROM expediente
          INNER JOIN escuela_profesional ON expediente.Id_escuela = escuela_profesional.Id_escuela
          INNER JOIN estudiante ON expediente.Dni = estudiante.Dni
          INNER JOIN cede ON expediente.Id_cede = cede.Id_cede
          INNER JOIN facultad ON escuela_profesional.Id_facultad = facultad.Cod_facultad
          INNER JOIN modalidad ON expediente.Id_expediente = modalidad.Id_expediente
          INNER JOIN diploma ON modalidad.Id_modalidad = diploma.id_modalidad
          INNER JOIN autoridades ON facultad.Cod_autoridad = autoridades.Cod_autoridad
          INNER JOIN colacion ON diploma.id_colacion = colacion.id_colacion
          INNER JOIN informe
          INNER JOIN empresa ON autoridades.Id_empresa = empresa.empresa_id
          WHERE cede.Id_cede = :sede AND colacion.fecha_colación = :fecha1";  // Incluir :fecha1 en la consulta

$stmt = $pdo->prepare($query);

// Pasar los valores de los parámetros
$stmt->bindParam(':sede', $sede, PDO::PARAM_INT);
$stmt->bindParam(':fecha1', $fecha1, PDO::PARAM_STR);  // Asegurarse de pasar correctamente fecha1

$stmt->execute();

// Recoger los correos electrónicos
$emails = [];
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    // Validar y agregar los correos electrónicos
    if (!empty($row['correo_personal'])) {
        $emails[] = $row['correo_personal'];
    }
}

echo json_encode($emails); // Devolver los correos como JSON
exit;  // Asegurarse de que no se envíe nada más después de la respuesta JSON
?>
