<?php
    require_once 'model_conexion.php';

    class Modelo_Colacion extends conexionBD{
        

        public function Listar_Colaciones(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_COLACION()";
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
        public function Registrar_Colacion($cola,$fecha_cola,$fecha_cola_cusco,$fecha_cola_andahuylas,$fecha_conse,$fecha_firma,$fecha_resol,$oficio){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_COLACION(?,?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$cola);
            $query ->bindParam(2,$fecha_cola);
            $query ->bindParam(3,$fecha_cola_cusco);
            $query ->bindParam(4,$fecha_cola_andahuylas);
            $query ->bindParam(5,$fecha_conse);
            $query ->bindParam(6,$fecha_firma);
            $query ->bindParam(7,$fecha_resol);
            $query ->bindParam(8,$oficio);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Colacion($id,$cola,$fecha_cola,$fecha_cola_cusco,$fecha_cola_andahuylas,$fecha_conse,$fecha_firma,$fecha_resol,$oficio){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_COLACION(?,?,?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$cola);
            $query ->bindParam(3,$fecha_cola);
            $query ->bindParam(4,$fecha_cola_cusco);
            $query ->bindParam(5,$fecha_cola_andahuylas);
            $query ->bindParam(6,$fecha_conse);
            $query ->bindParam(7,$fecha_firma);
            $query ->bindParam(8,$fecha_resol);
            $query ->bindParam(9,$oficio);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Eliminar_Colacion($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_ELIMINAR_COLACION(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
    
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