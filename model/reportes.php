<?php
    require_once 'model_conexion.php';

    class Modelo_Reportes extends conexionBD{
        

        public function Listar_Registro_General_Posgrado(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_POSGRADO_SNEDU()";
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
        public function Listar_General_Pos_Fechas_pregrado_sunedu($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_PREGRADO_SNEDU(?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_repo($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_SUNEDU(?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
         public function Listar_General_Pre_colacion($fechacol){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_PREGRADO_COLACION(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechacol);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_cede($fechainicio,$fechafin,$cede){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_CEDE(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$cede);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_cede_bachi($fechainicio,$fechafin,$cede){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_BACHI_FECHAS_CEDE(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$cede);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_facu($fechainicio,$fechafin,$facu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_FACU(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$facu);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_facu_bachi($fechainicio,$fechafin,$facu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_FACU_BACHI(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$facu);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_escuela($fechainicio,$fechafin,$escu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_ESCU(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$escu);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Pos_Fechas_escuela_bach($fechainicio,$fechafin,$escu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS_ESCU_BACH(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$escu);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Escuelas(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_ESCUELA_TITU()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Escuela_bach(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_ESCUELA_BACH()";
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