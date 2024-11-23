<?php
    require_once 'model_conexion.php';

    class Modelo_Diplomas_Posgrado extends conexionBD{
        

        public function Subir_diploma($iddiploma,$ruta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_SUBIR_DIPLOMA_ESCANEADO_POSGRADO(?,?)";
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