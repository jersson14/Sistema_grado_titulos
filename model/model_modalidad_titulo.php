<?php
    require_once 'model_conexion.php';

    class Modelo_Modalidad_Titulo extends conexionBD{
        

        public function Listar_Modalidad_Titulo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_MODALIDAD_TITULO()";
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
        public function Listar_Modalidad_Titulo_todo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MOSTRAR_TODOS_MODALIDAD()";
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
        public function Listar_Modalidad_Ti_Fecha_Area($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_MODALIDAD_TITULO_FECHAS(?,?)";
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
       
        public function Modificar_Modalidad_repo($id,$modo,$mod_estu,$trabaj,$turni,$porce,$centro,$meta,$probach,$pro_ins,$pro_titu,$fechamatrimoda,$fechamodaini,$fechamodafin,$susten,$idusuer){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_MODALIDAD_TITULO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$modo);
            $query ->bindParam(3,$mod_estu);
            $query ->bindParam(4,$trabaj);
            $query ->bindParam(5,$turni);
            $query ->bindParam(6,$porce);
            $query ->bindParam(7,$centro);
            $query ->bindParam(8,$meta);
            $query ->bindParam(9,$probach);
            $query ->bindParam(10,$pro_ins);
            $query ->bindParam(11,$pro_titu);
            $query ->bindParam(12,$fechamatrimoda);
            $query ->bindParam(13,$fechamodaini);
            $query ->bindParam(14,$fechamodafin);
            $query ->bindParam(15,$susten);
            $query ->bindParam(16,$idusuer);
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