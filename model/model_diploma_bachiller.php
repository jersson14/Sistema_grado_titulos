<?php
    require_once 'model_conexion.php';

    class Modelo_Diplomas_Bachiller extends conexionBD{
        

        public function Listar_Diploma_Bachiller(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_DIPLOMA_BACHILLER()";
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
        public function Listar_Diploma_Bachiller_fechas($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_DIPLOMA_BACHILLER_FECHAS(?,?)";
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

          
   
      
      
    }

?>