<?php
    require_once 'model_conexion.php';

    class Modelo_Carreras extends conexionBD{
        

        public function Listar_Carreras(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_CARRERAS()";
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
        public function Registrar_Carreras($codesc,$nombre,$gradoaca,$abrevi,$deno,$progra,$cred,$facul){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_CARRERAS(?,?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$codesc);
            $query ->bindParam(2,$nombre);
            $query ->bindParam(3,$gradoaca);
            $query ->bindParam(4,$abrevi);
            $query ->bindParam(5,$deno);
            $query ->bindParam(6,$progra);
            $query ->bindParam(7,$cred);
            $query ->bindParam(8,$facul);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Carreras($id,$codesc,$nombre,$gradoaca,$abrevi,$deno,$progra,$cred,$facul,$estado){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_CARRERA(?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$codesc);
            $query ->bindParam(3,$nombre);
            $query ->bindParam(4,$gradoaca);
            $query ->bindParam(5,$abrevi);
            $query ->bindParam(6,$deno);
            $query ->bindParam(7,$progra);
            $query ->bindParam(8,$cred);
            $query ->bindParam(9,$facul);
            $query ->bindParam(10,$estado);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Facultades(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_FACULTAD()";
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