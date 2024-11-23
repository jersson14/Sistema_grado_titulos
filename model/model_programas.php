<?php
    require_once 'model_conexion.php';

    class Modelo_Programas extends conexionBD{
        

        public function Listar_Programas(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_PROGRAMAS()";
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
        public function Cargar_Autoridad_pos(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_AUTORIDAD_POS()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Registrar_Programas($pro,$grado,$abre,$deno,$estu,$cred,$dire){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_PROGRAMA(?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$pro);
            $query ->bindParam(2,$grado);
            $query ->bindParam(3,$abre);
            $query ->bindParam(4,$deno);
            $query ->bindParam(5,$estu);
            $query ->bindParam(6,$cred);
            $query ->bindParam(7,$dire);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Programas($id,$pro,$grado,$abre,$deno,$estu,$cred,$dire,$esta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_PROGRAMA(?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$pro);
            $query ->bindParam(3,$grado);
            $query ->bindParam(4,$abre);
            $query ->bindParam(5,$deno);
            $query ->bindParam(6,$estu);
            $query ->bindParam(7,$cred);
            $query ->bindParam(8,$dire);
            $query ->bindParam(9,$esta);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
    }




?>