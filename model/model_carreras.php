<?php
    require_once 'model_conexion.php';

    class Modelo_Carreras extends conexionBD{
        

        public function Listar_Carreras(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_CARRERAS()";
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
        public function Registrar_Carreras($codesc,$nombre,$gradoaca,$abrevi,$deno,$progra,$cred,$facul){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_CARRERAS(?,?,?,?,?,?,?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$codesc);
            $query ->bindParam(2,$nombre);
            $query ->bindParam(3,$gradoaca);
            $query ->bindParam(4,$abrevi);
            $query ->bindParam(5,$deno);
            $query ->bindParam(6,$progra);
            $query ->bindParam(7,$cred);
            $query ->bindParam(8,$facul);

            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Carreras($id,$codesc,$nombre,$gradoaca,$abrevi,$deno,$progra,$cred,$facul,$estado){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_CARRERA(?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$codesc);
            $query ->bindParam(3,$nombre);
            $query ->bindParam(4,$gradoaca);
            $query ->bindParam(5,$abrevi);
            $query ->bindParam(6,$deno);
            $query ->bindParam(7,$progra);
            $query ->bindParam(8,$cred);
            $query ->bindParam(9,$facul);
            $query ->bindParam(10,$estado);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Facultades(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_FACULTAD()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            $arreglo = array(); // Initialize array
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }

        public function Cargar_Escuelas_Por_Facultad($id_facultad){
            $c = conexionBD::conexionPDO();
            try {
                // Use GROUP BY to avoid duplicate names (e.g., if there are records for BACHILLER and TITULO)
                $sql = "SELECT MIN(Id_escuela) as Id_escuela, Nombre FROM escuela_profesional WHERE Id_facultad = ? AND Estado = 'ACTIVO' GROUP BY Nombre ORDER BY Nombre ASC";
                $query = $c->prepare($sql);
                $query->bindParam(1, $id_facultad);
                $query->execute();
                $resultado = $query->fetchAll(PDO::FETCH_NUM); // Use FETCH_NUM to keep indices 0 and 1 consistent with JS
                $arreglo = array();
                foreach($resultado as $resp){
                    $arreglo[]=$resp;
                }
                return $arreglo;
            } catch (PDOException $e) {
                // Loguear error SQL en la misma carpeta del modelo 
                file_put_contents(__DIR__ . '/debug_sql_error.log', date('[Y-m-d H:i:s] ') . "Error SQL Cargar Escuelas: " . $e->getMessage() . PHP_EOL, FILE_APPEND);
                return []; // Retornar array vacío en caso de error
            } finally {
                conexionBD::cerrar_conexion();
            }
        }
    }




?>