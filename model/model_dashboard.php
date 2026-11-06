<?php
    require_once 'model_conexion.php';

    class Modelo_Dashboard extends conexionBD{

        // Consulta directa porque es solo lectura y no requiere procedimientos nuevos en la BD
        private function consultar($c,$sql){
            $query = $c->prepare($sql);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

        public function Resumen(){
            $c = conexionBD::conexionPDO();

            $pregrado = "SELECT x.Id_expediente, x.Id_cede, x.Dni, e.Grado_academico, e.Id_facultad, d.estado
                FROM expediente x
                INNER JOIN escuela_profesional e ON x.Id_escuela = e.Id_escuela
                LEFT JOIN modalidad m ON m.Id_expediente = x.Id_expediente
                LEFT JOIN diploma d ON d.id_modalidad = m.Id_modalidad";
            $posgrado = "SELECT x.Id_expediente, x.Id_cede, x.Dni, d.estado
                FROM expediente_posgrado x
                LEFT JOIN modalidad_posgrado m ON m.Id_expediente = x.Id_expediente
                LEFT JOIN diploma_posgrado d ON d.id_modalidad = m.Id_modalidad";
            // Cuenta expedientes, no filas, por si un expediente tuviera más de un diploma
            $conteo = "COUNT(DISTINCT t.Id_expediente) AS expedientes,
                COUNT(DISTINCT CASE WHEN t.estado = 'CON DIPLOMA' THEN t.Id_expediente END) AS con_diploma";

            $niveles = $this->consultar($c,"SELECT t.Grado_academico AS nivel, $conteo FROM ($pregrado) t GROUP BY t.Grado_academico");
            $nivel_pos = $this->consultar($c,"SELECT $conteo FROM ($posgrado) t");

            $personas_pre = $this->consultar($c,"SELECT COUNT(DISTINCT t.Dni) AS n FROM ($pregrado) t WHERE t.estado = 'CON DIPLOMA'");
            $personas_pos = $this->consultar($c,"SELECT COUNT(DISTINCT t.Dni) AS n FROM ($posgrado) t WHERE t.estado = 'CON DIPLOMA'");

            $sedes = $this->consultar($c,"SELECT IFNULL(s.cede_nombre,'Sin sede') AS nombre,
                    SUM(r.expedientes) AS expedientes, SUM(r.con_diploma) AS con_diploma
                FROM (
                    SELECT t.Id_cede, $conteo FROM ($pregrado) t GROUP BY t.Id_cede
                    UNION ALL
                    SELECT t.Id_cede, $conteo FROM ($posgrado) t GROUP BY t.Id_cede
                ) r
                LEFT JOIN cede s ON r.Id_cede = s.Id_cede
                GROUP BY s.Id_cede, s.cede_nombre
                ORDER BY expedientes DESC");

            $facultades = $this->consultar($c,"SELECT IFNULL(f.Nombre,'Sin facultad') AS nombre, r.expedientes, r.con_diploma
                FROM (SELECT t.Id_facultad, $conteo FROM ($pregrado) t GROUP BY t.Id_facultad) r
                LEFT JOIN facultad f ON r.Id_facultad = f.Cod_facultad
                ORDER BY r.expedientes DESC");

            $catalogos = $this->consultar($c,"SELECT
                (SELECT COUNT(*) FROM facultad WHERE estado = 'ACTIVO') AS facultades,
                (SELECT COUNT(*) FROM escuela_profesional WHERE Estado = 'ACTIVO' AND Grado_academico = 'BACHILLER') AS programas_bachiller,
                (SELECT COUNT(*) FROM escuela_profesional WHERE Estado = 'ACTIVO' AND Grado_academico = 'TITULO') AS programas_titulo,
                (SELECT COUNT(*) FROM programa_posgrado WHERE Estado = 'ACTIVO') AS programas_posgrado,
                (SELECT COUNT(*) FROM autoridades WHERE estado = 'ACTIVO') AS autoridades");

            conexionBD::cerrar_conexion();

            return array(
                "niveles" => $niveles,
                "posgrado" => $nivel_pos[0],
                "personas_pregrado" => $personas_pre[0]["n"],
                "personas_posgrado" => $personas_pos[0]["n"],
                "sedes" => $sedes,
                "facultades" => $facultades,
                "catalogos" => $catalogos[0]
            );
        }
    }
?>
