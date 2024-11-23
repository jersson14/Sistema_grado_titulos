<?php
    require_once 'model_conexion.php';

    class Modelo_Expedientes extends conexionBD{
        

        public function Listar_Expedientes_Bachiller(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_BACHILLER()";
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
        public function Listar_Expedientes_Bachiller2(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_BACHILLER2()";
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
        public function Listar_Expediente_Ba_Fecha_Area($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_BACHILLER_FECHAS(?,?)";
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
        public function Cargar_Estudiantes(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_ESTUDIANTES()";
            $arreglo = array();

            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Escuelas($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_ESCUELAS(?)";
            $arreglo = array();

            $query  = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function TraerGrado($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TRAE_GRADO(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
    }
        public function Registrar_Expediente_Ba($exp,$est,$esc,$den,$acu,$res,$fecha,$exped,$lib,$fol,$reg,$ruta,$idre,$idusu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_EXPEDIENTE_BA(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$exp);
            $query ->bindParam(2,$est);
            $query ->bindParam(3,$esc);
            $query ->bindParam(4,$den);
            $query ->bindParam(5,$acu);
            $query ->bindParam(6,$res);
            $query ->bindParam(7,$fecha);
            $query ->bindParam(8,$exped);
            $query ->bindParam(9,$lib);
            $query ->bindParam(10,$fol);
            $query ->bindParam(11,$reg);
            $query ->bindParam(12,$ruta);
            $query ->bindParam(13,$idre);
            $query ->bindParam(14,$idusu);
            $query ->execute();
            if($row=$query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
       
        public function Modificar_Expediente_bach($id,$ced,$est,$esc,$den,$acu,$res,$fecha,$exped,$lib,$fol,$reg,$ruta,$idre,$idusu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_EXPEDIENTE_BA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$ced);
            $query ->bindParam(3,$est);
            $query ->bindParam(4,$esc);
            $query ->bindParam(5,$den);
            $query ->bindParam(6,$acu);
            $query ->bindParam(7,$res);
            $query ->bindParam(8,$fecha);
            $query ->bindParam(9,$exped);
            $query ->bindParam(10,$lib);
            $query ->bindParam(11,$fol);
            $query ->bindParam(12,$reg);
            $query ->bindParam(13,$ruta);
            $query ->bindParam(14,$idre);
            $query ->bindParam(15,$idusu);

            $resul = $query->execute();
            if($resul){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Select_Area(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_AREA()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        } 
        public function Cargar_CarreraSolo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_CARRERASOLO()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Cedes(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_CEDES()";
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