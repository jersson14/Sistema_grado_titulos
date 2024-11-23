<?php
    require_once 'model_conexion.php';

    class Modelo_Cede extends conexionBD{
        

        public function Listar_Cede(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_CEDES()";
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
        public function Registrar_Cede($cede,$descrip){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_CEDES(?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$cede);
            $query ->bindParam(2,$descrip);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Cede($id,$cede,$descrip,$esta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_CEDE(?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$cede);
            $query ->bindParam(3,$descrip);
            $query ->bindParam(4,$esta);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Eliminar_Cede($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_ELIMINAR_CEDE(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
    
            $resul = $query->execute();
            if($resul){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar_conexion();
        }
    }




?>