<?php
class conexionBD{
    private $pdo;

    public function conexionPDO(){
        $host       = "localhost";
        $usuario    = "TU_USUARIO";
        $contrasena = "TU_CONTRASENA";
        $bdName     = "TU_BASE_DE_DATOS";
        $port       = "3306"; // Ajusta el puerto según tu entorno
        try {
            $this->pdo = new PDO("mysql:host=$host;port=$port;dbname=$bdName", $usuario, $contrasena);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo->exec("set names utf8");
            return $this->pdo;
        } catch (PDOException $e) {
            echo 'Falló la conexión: ' . $e->getMessage();
        }
    }

    public function cerrar_conexion(){
        $this->pdo = null;
    }
}
?>
