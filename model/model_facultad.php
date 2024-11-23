<?php
    require_once 'model_conexion.php';

    class Modelo_Facultad extends conexionBD{
        

        public function Listar_Facultad(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_FACULTAD()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Registrar_Facultad($facultad,$autoridad){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_FACULTAD(?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$facultad);
            $query ->bindParam(2,$autoridad);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
         public function Modificar_Facultad($id,$facultad,$autoridad,$esta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_FACULTAD(?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$facultad);
            $query ->bindParam(3,$autoridad);
            $query ->bindParam(4,$esta);

            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Autoridad(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_AUTORIDAD()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
    }




?>