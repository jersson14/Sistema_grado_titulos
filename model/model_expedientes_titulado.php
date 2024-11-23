<?php
    require_once 'model_conexion.php';

    class Modelo_Expedientes_Titulado extends conexionBD{
        

        public function Listar_Expedientes_Titulado(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_TITULADO()";
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
        public function Listar_Expedientes_Titulado2(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_TITULO2()";
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
        public function Listar_Expediente_Titu_Fecha_Area($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_EXPEDIENTE_TITULADO_FECHAS(?,?)";
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
            $sql = "CALL SP_CARGAR_SELECT_ESCUELAS_TITU(?)";
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
            $sql = "CALL SP_LISTAR_TRAE_GRADO_TITU(?)";
            
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
        public function TraerAutoridad($id_auto){
                $c = conexionBD::conexionPDO();
                $sql = "CALL SP_LISTAR_TRAE_AUTORI(?)";
                $arreglo = array();
                $query  = $c->prepare($sql);
                $query->bindParam(1,$id_auto);
                $query->execute();
                $resultado = $query->fetchAll();
                foreach($resultado as $resp){
                    $arreglo[]=$resp;
                }
                return $arreglo;
                conexionBD::cerrar_conexion();
        }
        public function Registrar_Expediente_Ti($ced,$est,$esc,$titu,$moda,$acad,$acu,$res,$fecha,$exped,$lib,$fol,$reg,$ruta,$idre,$idusu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_EXPEDIENTE_TI(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$ced);
            $query ->bindParam(2,$est);
            $query ->bindParam(3,$esc);
            $query ->bindParam(4,$titu);
            $query ->bindParam(5,$moda);
            $query ->bindParam(6,$acad);
            $query ->bindParam(7,$acu);
            $query ->bindParam(8,$res);
            $query ->bindParam(9,$fecha);
            $query ->bindParam(10,$exped);
            $query ->bindParam(11,$lib);
            $query ->bindParam(12,$fol);
            $query ->bindParam(13,$reg);
            $query ->bindParam(14,$ruta);
            $query ->bindParam(15,$idre);
            $query ->bindParam(16,$idusu);
            $query ->execute();
            if($row=$query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
       
        public function Modificar_Expediente_titu($id,$ced,$est,$esc,$titu,$moda,$acad,$acu,$res,$fecha,$exped,$lib,$fol,$reg,$ruta,$idre,$idusu){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_EXPEDIENTE_TI(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$ced);
            $query ->bindParam(3,$est);
            $query ->bindParam(4,$esc);
            $query ->bindParam(5,$titu);
            $query ->bindParam(6,$moda);
            $query ->bindParam(7,$acad);
            $query ->bindParam(8,$acu);
            $query ->bindParam(9,$res);
            $query ->bindParam(10,$fecha);
            $query ->bindParam(11,$exped);
            $query ->bindParam(12,$lib);
            $query ->bindParam(13,$fol);
            $query ->bindParam(14,$reg);
            $query ->bindParam(15,$ruta);
            $query ->bindParam(16,$idre);
            $query ->bindParam(17,$idusu);

            $resul = $query->execute();
            if($resul){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar_conexion();
        }

        public function Cargar_CarreraSolo_Ti(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_CARRERASOLO_TI()";
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
            $sql = "CALL SP_CARGAR_SELECT_CEDES_TI()";
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