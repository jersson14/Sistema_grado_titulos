<?php
    require_once 'model_conexion.php';

    class Modelo_Autoridad extends conexionBD{
        

        public function Listar_Autoridad(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_AUTORIDAD()";
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
        public function Registrar_Autoridad($autoridad1,$cargo1,$autoridad2,$cargo2,$autoridad3,$cargo3){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_AUTORIDAD(?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$autoridad1);
            $query ->bindParam(2,$cargo1);
            $query ->bindParam(3,$autoridad2);
            $query ->bindParam(4,$cargo2);
            $query ->bindParam(5,$autoridad3);
            $query ->bindParam(6,$cargo3);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Autoridad($id,$autoridad1,$cargo1,$autoridad2,$cargo2,$autoridad3,$cargo3,$esta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_AUTORIDAD(?,?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$autoridad1);
            $query ->bindParam(3,$cargo1);
            $query ->bindParam(4,$autoridad2);
            $query ->bindParam(5,$cargo2);
            $query ->bindParam(6,$autoridad3);
            $query ->bindParam(7,$cargo3);
            $query ->bindParam(8,$esta);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        
    }




?>