<?php
class ConexionBD {
    private $pdo;

    public function conexionPDO() {
        $host       = "localhost";
        $usuario    = "u486624649_jerzito";
        $contrasena = "k?5X;&3D";
        $bdName     = "u486624649_tramite_prue";

        try {
            $this->pdo = new PDO("mysql:host=$host;dbname=$bdName", $usuario, $contrasena);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->exec("set names utf8");
            $this->pdo->exec("SET time_zone = '-05:00';"); // ✅ Establecer zona horaria UTC-5 (Perú)
            return $this->pdo;
        } catch (PDOException $e) {
            echo 'Falló la conexión: ' . $e->getMessage();
            return null; // Retornar null en caso de error
        }
    }

    public function cerrar_conexion() {
        $this->pdo = null; // ✅ Corrección: eliminar la conexión correctamente
    }
}
?>
