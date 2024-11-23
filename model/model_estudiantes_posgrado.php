<?php
    require_once 'model_conexion.php';

    class Modelo_Estudiantes_Posgrado extends conexionBD{
        

        public function Listar_Estudiantes_Posg(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_ESTUDIANTES_POS()";
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
       
        public function Modificar_Estudiantes_Pos($dni,$codigo,$nombres,$apepa,$apema,$sexo,$celular,$direc,$fecha_matr,$fecha_egre,$id_usuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_ESTUDIANTE_POS(?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$dni);
            $query ->bindParam(2,$codigo);
            $query ->bindParam(3,$nombres);
            $query ->bindParam(4,$apepa);
            $query ->bindParam(5,$apema);
            $query ->bindParam(6,$sexo);
            $query ->bindParam(7,$celular);
            $query ->bindParam(8,$direc);
            $query ->bindParam(9,$fecha_matr);
            $query ->bindParam(10,$fecha_egre);
            $query ->bindParam(11,$id_usuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
       
    }




?>