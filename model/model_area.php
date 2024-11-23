<?php
    require_once 'model_conexion.php';

    class Modelo_Area extends conexionBD{
        

        public function Listar_Area() {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_AREA()";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach ($resultado as $resp) {
                $arreglo["data"][] = $resp;
            }
            conexionBD::cerrar_conexion();
            return $arreglo;
        }
        public function Registrar_Area($area) {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_AREA(?)";
            $query = $c->prepare($sql);
            $query->bindParam(1, $area, PDO::PARAM_STR);
            $resultado = $query->execute();
            if ($row = $query->fetchColumn()) {
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Area($id, $area, $esta) {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_AREA(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1, $id, PDO::PARAM_INT);
            $query->bindParam(2, $area, PDO::PARAM_STR);
            $query->bindParam(3, $esta, PDO::PARAM_STR);
            $resultado = $query->execute();
            if ($row = $query->fetchColumn()) {
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Select_Area() {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_AREA()";
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach ($resultado as $resp) {
                $arreglo[] = $resp;
            }
            conexionBD::cerrar_conexion();
            return $arreglo;
        }
    }




?>