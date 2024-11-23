<?php
    require_once 'model_conexion.php';

    class Modelo_Diplomas_Titulo extends conexionBD{
        

        public function Listar_Diploma_Titulo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_DIPLOMA_TITULO()";
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
        public function Listar_Diploma_fechas($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_DIPLOMA_FECHAS(?,?)";
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

        public function Subir_diploma($iddiploma,$ruta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_SUBIR_DIPLOMA_ESCANEADO(?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$iddiploma);
            $query ->bindParam(2,$ruta);
          
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