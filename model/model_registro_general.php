<?php
    require_once 'model_conexion.php';

    class Modelo_Registro_General extends conexionBD{
        

        public function Listar_Registro_General(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL()";
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
          public function Listar_Registro_Alfabeto(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_ALFABETO()";
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
        public function Listar_Registro_General_Secre($sede){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_SECRE(?)";
            $arreglo = array();

            $query  = $c->prepare($sql);
            $query->bindParam(1,$sede);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Ti_Fechas($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_FECHAS(?,?)";
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
         public function Listar_General_Ti_Colacion($fechacol){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_COLA(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechacol);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Listar_General_Ti_Fechas_Secre($fechainicio,$fechafin,$sede){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_FECHAS_SECRE(?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$fechainicio);
            $query->bindParam(2,$fechafin);
            $query->bindParam(3,$sede);

            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach($resultado as $resp){
                $arreglo["data"][]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Registrar_Titulado($tipodoc,$dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$ced,$esc,$titu,$moda,$idauto,$fecha,$acad,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_TITULADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$tipodoc);
            $query ->bindParam(2,$dni);
            $query ->bindParam(3,$nombres);
            $query ->bindParam(4,$apepa);
            $query ->bindParam(5,$apema);
            $query ->bindParam(6,$codigo);
            $query ->bindParam(7,$sexo);
            $query ->bindParam(8,$celular);
            $query ->bindParam(9,$direc);
            $query ->bindParam(10,$emaper);
            $query ->bindParam(11,$emainsti);
            $query ->bindParam(12,$fecha_matr);
            $query ->bindParam(13,$fecha_egre);
            $query ->bindParam(14,$observa);
            $query ->bindParam(15,$ced);
            $query ->bindParam(16,$esc);
            $query ->bindParam(17,$titu);
            $query ->bindParam(18,$moda);
            $query ->bindParam(19,$idauto);
            $query ->bindParam(20,$fecha);
            $query ->bindParam(21,$acad);
            $query ->bindParam(22,$acu);
            $query ->bindParam(23,$res);
            $query ->bindParam(24,$exped);
            $query ->bindParam(25,$lib);
            $query ->bindParam(26,$fol);
            $query ->bindParam(27,$reg);
            $query ->bindParam(28,$ruta);
            $query ->bindParam(29,$mod_estu);
            $query ->bindParam(30,$tra_inv);
            $query ->bindParam(31,$turn);
            $query ->bindParam(32,$porc);
            $query ->bindParam(33,$cent);
            $query ->bindParam(34,$meta);
            $query ->bindParam(35,$proce_bach);
            $query ->bindParam(36,$proce_insti);
            $query ->bindParam(37,$proce_titu);
            $query ->bindParam(38,$fecha_matri);
            $query ->bindParam(39,$fecha_inici);
            $query ->bindParam(40,$fecha_fin);
            $query ->bindParam(41,$mod_sustenta);
            $query ->bindParam(42,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Agregar_diploma($idexpe,$id,$fechacu,$fechafirma,$numreso,$fechareso,$diplonum,$regis,$regilibro,$regisfolio,$tipodiplo,$fechainiciotra,$nrocred,$nrooficio,$fechasecre,$fechamatri,$fechaegre,$ciclo_inves,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_AGREGAR_DIPLOMA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$idexpe);
            $query ->bindParam(2,$id);
            $query ->bindParam(3,$fechacu);
            $query ->bindParam(4,$fechafirma);
            $query ->bindParam(5,$numreso);
            $query ->bindParam(6,$fechareso);
            $query ->bindParam(7,$diplonum);
            $query ->bindParam(8,$regis);
            $query ->bindParam(9,$regilibro);
            $query ->bindParam(10,$regisfolio);
            $query ->bindParam(11,$tipodiplo);
            $query ->bindParam(12,$fechainiciotra);
            $query ->bindParam(13,$nrocred);
            $query ->bindParam(14,$nrooficio);
            $query ->bindParam(15,$fechasecre);
            $query ->bindParam(16,$fechamatri);
            $query ->bindParam(17,$fechaegre);
            $query ->bindParam(18,$ciclo_inves);
            $query ->bindParam(19,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
  public function Agregar_diploma_titulo($idexpe,$id,$fechacu,$fechafirma,$numreso,$fechareso,$diplonum,$regis,$regilibro,$regisfolio,$tipodiplo,$fechainiciotra,$nrocred,$nrooficio,$fechasecre,$fechamatri,$fechaegre,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_AGREGAR_DIPLOMA_TITULO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$idexpe);
            $query ->bindParam(2,$id);
            $query ->bindParam(3,$fechacu);
            $query ->bindParam(4,$fechafirma);
            $query ->bindParam(5,$numreso);
            $query ->bindParam(6,$fechareso);
            $query ->bindParam(7,$diplonum);
            $query ->bindParam(8,$regis);
            $query ->bindParam(9,$regilibro);
            $query ->bindParam(10,$regisfolio);
            $query ->bindParam(11,$tipodiplo);
            $query ->bindParam(12,$fechainiciotra);
            $query ->bindParam(13,$nrocred);
            $query ->bindParam(14,$nrooficio);
            $query ->bindParam(15,$fechasecre);
            $query ->bindParam(16,$fechamatri);
            $query ->bindParam(17,$fechaegre);
            $query ->bindParam(18,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Modificar_Titulado($dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$idexpe,$ced,$esc,$titu,$moda,$idauto,$fecha,$acad,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$idmoda,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$iddiploma,$fechacu,$fechafirma,$resol,$fechareso,$numdiplo,$numregis,$libroregi,$regisfolio,$tipodiplo,$fechaini,$nrocre,$nrooficio,$fechasecre,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_TITULADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$dni);
            $query ->bindParam(2,$nombres);
            $query ->bindParam(3,$apepa);
            $query ->bindParam(4,$apema);
            $query ->bindParam(5,$codigo);
            $query ->bindParam(6,$sexo);
            $query ->bindParam(7,$celular);
            $query ->bindParam(8,$direc);
            $query ->bindParam(9,$emaper);
            $query ->bindParam(10,$emainsti);
            $query ->bindParam(11,$fecha_matr);
            $query ->bindParam(12,$fecha_egre);
            $query ->bindParam(13,$observa);
            $query ->bindParam(14,$idexpe);
            $query ->bindParam(15,$ced);
            $query ->bindParam(16,$esc);
            $query ->bindParam(17,$titu);
            $query ->bindParam(18,$moda);
            $query ->bindParam(19,$idauto);
            $query ->bindParam(20,$fecha);
            $query ->bindParam(21,$acad);
            $query ->bindParam(22,$acu);
            $query ->bindParam(23,$res);
            $query ->bindParam(24,$exped);
            $query ->bindParam(25,$lib);
            $query ->bindParam(26,$fol);
            $query ->bindParam(27,$reg);
            $query ->bindParam(28,$ruta);
            $query ->bindParam(29,$idmoda);
            $query ->bindParam(30,$mod_estu);
            $query ->bindParam(31,$tra_inv);
            $query ->bindParam(32,$turn);
            $query ->bindParam(33,$porc);
            $query ->bindParam(34,$cent);
            $query ->bindParam(35,$meta);
            $query ->bindParam(36,$proce_bach);
            $query ->bindParam(37,$proce_insti);
            $query ->bindParam(38,$proce_titu);
            $query ->bindParam(39,$fecha_matri);
            $query ->bindParam(40,$fecha_inici);
            $query ->bindParam(41,$fecha_fin);
            $query ->bindParam(42,$mod_sustenta);
            $query ->bindParam(43,$iddiploma);
            $query ->bindParam(44,$fechacu);
            $query ->bindParam(45,$fechafirma);

            $query ->bindParam(46,$resol);
            $query ->bindParam(47,$fechareso);
            $query ->bindParam(48,$numdiplo);
            $query ->bindParam(49,$numregis);
            $query ->bindParam(50,$libroregi);
            $query ->bindParam(51,$regisfolio);
            $query ->bindParam(52,$tipodiplo);
            $query ->bindParam(53,$fechaini);
            $query ->bindParam(54,$nrocre);
            $query ->bindParam(55,$nrooficio);
            $query ->bindParam(56,$fechasecre);
            $query ->bindParam(57,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
      
        public function Eliminar_registro_titulo($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_ELIMINAR_REGISTRO_GENERAL(?)";
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
         public function Validar_registro_titulo($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_VALIDAR_REGISTRO_GENERAL(?)";
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
        public function listar_total_diplo_titulo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_DIPLO_TITULO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function listar_total_expe_titulo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_EXPE_TITULO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function listar_total_pregrado(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_PREGRADO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Traernumero(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_NUMERO_GENERAL()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
         public function Traernumero_Titulo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_NUMERO_GENERAL_TITULO()";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
           public function Pasar_bachiller($idexpe,$idautori,$escue,$grado,$moda){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_PASAR_BACHILLER(?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$idexpe);
            $query ->bindParam(2,$idautori);
            $query ->bindParam(3,$escue);
            $query ->bindParam(4,$grado);
            $query ->bindParam(5,$moda);

            $resul = $query->execute();
            if($resul){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar_conexion();
        }
        public function Cargar_Colacion(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_SELECT_COLACION()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
         public function Listar_Auditoria_informe(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_INFORMES_AUDITORIA()";
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
        public function Listar_General_Fechas_informe_auditoria($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_INFORMES_AUDITORIA_FECHAS(?,?)";
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
          public function Buscar_persona_por_documento($numero_documento) {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_BUSCAR_PERSONA_POR_DOCUMENTO(?)";
            $arreglo = array();

            try {
                $query  = $c->prepare($sql);
                $query->bindParam(1, $numero_documento);
                $query->execute();

                $resultado = $query->fetchAll(PDO::FETCH_ASSOC);
                foreach ($resultado as $resp) {
                    $arreglo["data"][] = $resp;
                }

                return $arreglo;
            } catch (Exception $e) {
                return ["error" => true, "message" => $e->getMessage()];
            } finally {
                // Esto garantiza que la conexión se cierre correctamente
                $c = null;
            }
        }

    }

?>