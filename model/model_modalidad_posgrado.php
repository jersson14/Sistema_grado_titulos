<?php
    require_once 'model_conexion.php';

    class Modelo_Modalidad_Posgrado extends conexionBD{
        

        public function Listar_Vista_Posgrado(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_MODALIDAD_POSGRADO()";
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
        public function Listar_Vista_Posgrado_todo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MOSTRAR_TODOS_MODALIDAD_POSGRADO()";
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
        public function Listar_Modalidad_Posgrado_fecha($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_MODALIDAD_POSGRADO_FECHAS(?,?)";
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
       
        public function Modificar_Modalidad_repo_POSGRA($id,$modo,$mod_estu,$trabaj,$turni,$porce,$centro,$meta,$propais,$pro_unive,$pro_grado,$fechamatrimoda,$fechamodaini,$fechamodafin,$susten,$idusuer){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_MODALIDAD_POSGRADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            $query ->bindParam(9,$propais);
            $query ->bindParam(10,$pro_unive);
            $query ->bindParam(11,$pro_grado);
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