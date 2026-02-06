<?php
    require_once 'model_conexion.php';

    class Modelo_Repositorio extends conexionBD{
        
        // Registrar un nuevo archivo en el repositorio
        public function Registrar_Archivo($id_colacion, $dni, $nombre_original, $ruta_fisica){
            $c = $this->conexionPDO();
            // Usamos consulta directa por ahora o procedure si preferimos. 
            // Para mantener consistencia con models anteriores que usan SP, pero
            // si no tengo acceso a crear SPs facilmente, usaré query directa preparada.
            // Los modelos anteriores usan SP. Intentaré usar SP si es la norma, 
            // pero para desarrollo rápido y sin acceso a terminal SQL directo, QUERY PREPARED es más seguro y rápido de iterar.
            // Si el usuario necesita SP, puedo generarlos luego. Usaré Query Prepared por ahora.
            
            $sql = "INSERT INTO repo_archivos (id_colacion, dni_estudiante, nombre_archivo_original, ruta_fisica, fecha_subida, estado) 
                    VALUES (?, ?, ?, ?, NOW(), 1)";
            
            $query = $c->prepare($sql);
            $query->bindParam(1, $id_colacion);
            $query->bindParam(2, $dni);
            $query->bindParam(3, $nombre_original);
            $query->bindParam(4, $ruta_fisica);
            
            $resultado = $query->execute();
            
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            $this->cerrar_conexion();
        }

        // Listar archivos de una colación específica
        public function Listar_Archivos_x_Colacion($id_colacion){
            $c = $this->conexionPDO();
            $sql = "SELECT * FROM repo_archivos WHERE id_colacion = ? AND estado = 1 ORDER BY fecha_subida DESC";
            $query = $c->prepare($sql);
            $query->bindParam(1, $id_colacion);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            $arreglo = ["data" => []]; // Inicializar para que siempre retorne estructura válida JSON
            foreach($resultado as $resp){
                $arreglo["data"][] = $resp;
            }
            return $arreglo;
            $this->cerrar_conexion();
        }

        // Búsqueda global por DNI
        public function Buscar_Archivo_Global($dni){
            $c = $this->conexionPDO();
            // Hacemos JOIN con colacion para mostrar el nombre de la colación
            // La columna es `fecha_colación` con acento
            $sql = "SELECT r.*, c.nombre_colacion, c.fecha_colación as fechacolacion 
                    FROM repo_archivos r
                    INNER JOIN colacion c ON r.id_colacion = c.id_colacion
                    WHERE r.dni_estudiante = ? AND r.estado = 1";
            
            $query = $c->prepare($sql);
            $query->bindParam(1, $dni);
            $query->execute();
            
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            // Retornamos array simple, la vista manejará si hay multiples
            return $resultado;
            $this->cerrar_conexion();
        }
        
        // Validar si un archivo ya existe para evitar duplicados exactos (opcional)
        public function Verificar_Existencia($id_colacion, $dni){
             $c = $this->conexionPDO();
             $sql = "SELECT count(*) as total FROM repo_archivos WHERE id_colacion = ? AND dni_estudiante = ? AND estado = 1";
             $query = $c->prepare($sql);
             $query->bindParam(1, $id_colacion);
             $query->bindParam(2, $dni);
             $query->execute();
             if($row = $query->fetchColumn()){
                return $row;
             }
             return 0;
             $this->cerrar_conexion();
        }

        public function Eliminar_Archivo($id_archivo){
            $c = $this->conexionPDO();
            $sql = "UPDATE repo_archivos SET estado = 0 WHERE id_archivo = ?";
            $query = $c->prepare($sql);
            $query->bindParam(1, $id_archivo);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            $this->cerrar_conexion();
        }
    }
?>
