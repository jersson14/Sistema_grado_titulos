<?php
class conexionBD{
    private $pdo;

    public function conexionPDO(){
        $host       = "localhost";
        $usuario    = "root";
        $contrasena = "";
        $bdName     = "grados_y_titulo";
        try {
            $this->pdo = new PDO("mysql:host=$host;dbname=$bdName", $usuario, $contrasena);
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
