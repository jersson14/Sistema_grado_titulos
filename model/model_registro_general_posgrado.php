<?php
    require_once 'model_conexion.php';

    class Modelo_Registro_General_Posgrado extends conexionBD{
        

        public function Listar_Registro_General_Posgrado(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_POSGRADO()";
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
        public function Listar_General_Pos_Fechas($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_POSGRADO_FECHAS(?,?)";
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
        public function TraerGrado($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TRAE_GRADO_POS(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
    }
        public function TraerAutoridad($id_auto){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TRAE_AUTORI_POS(?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query->bindParam(1,$id_auto);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
    }
    public function Cargar_Programa(){
        $c = conexionBD::conexionPDO();
        $sql = "CALL SP_CARGAR_SELECT_PROGRAMA()";
        $query  = $c->prepare($sql);
        $query->execute();
        $resultado = $query->fetchAll();
        foreach($resultado as $resp){
            $arreglo[]=$resp;
        }
        return $arreglo;
        conexionBD::cerrar_conexion();
    }
        public function Registrar_Posgrado($tipodoc,$documentoFinal,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$ced,$pro,$den,$moda,$idauto,$fecha,$acad,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_pais,$proce_univ,$proce_grado,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_POSGRADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $arreglo = array();
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$tipodoc);
            $query ->bindParam(2,$documentoFinal);
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
            $query ->bindParam(16,$pro);
            $query ->bindParam(17,$den);
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
            $query ->bindParam(35,$proce_pais);
            $query ->bindParam(36,$proce_univ);
            $query ->bindParam(37,$proce_grado);
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
        public function Agregar_diploma($idexpe,$id,$fechacu,$fechafirma,$numreso,$fechareso,$diplonum,$regis,$regilibro,$regisfolio,$tipodiplo,$fechainiciotra,$nrocred,$nrooficio,$fechasecre,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_AGREGAR_DIPLOMA_POSGRADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            $query ->bindParam(16,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }

        public function Modificar_Posgrado($dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$idexpe,$pro,$den,$moda,$idauto,$fecha,$acad,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$idmoda,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_pais,$proce_univ,$proce_grado,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$iddiploma,$fechacu,$fechafirma,$resol,$fechareso,$numdiplo,$numregis,$libroregi,$regisfolio,$tipodiplo,$fechaini,$nrocre,$nrooficio,$fechasecre,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_POSGRADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            $query ->bindParam(15,$pro);
            $query ->bindParam(16,$den);
            $query ->bindParam(17,$moda);
            $query ->bindParam(18,$idauto);
            $query ->bindParam(19,$fecha);
            $query ->bindParam(20,$acad);
            $query ->bindParam(21,$acu);
            $query ->bindParam(22,$res);
            $query ->bindParam(23,$exped);
            $query ->bindParam(24,$lib);
            $query ->bindParam(25,$fol);
            $query ->bindParam(26,$reg);
            $query ->bindParam(27,$ruta);
            $query ->bindParam(28,$idmoda);
            $query ->bindParam(29,$mod_estu);
            $query ->bindParam(30,$tra_inv);
            $query ->bindParam(31,$turn);
            $query ->bindParam(32,$porc);
            $query ->bindParam(33,$cent);
            $query ->bindParam(34,$meta);
            $query ->bindParam(35,$proce_pais);
            $query ->bindParam(36,$proce_univ);
            $query ->bindParam(37,$proce_grado);
            $query ->bindParam(38,$fecha_matri);
            $query ->bindParam(39,$fecha_inici);
            $query ->bindParam(40,$fecha_fin);
            $query ->bindParam(41,$mod_sustenta);
            $query ->bindParam(42,$iddiploma);
            $query ->bindParam(43,$fechacu);
            $query ->bindParam(44,$fechafirma);

            $query ->bindParam(45,$resol);
            $query ->bindParam(46,$fechareso);
            $query ->bindParam(47,$numdiplo);
            $query ->bindParam(48,$numregis);
            $query ->bindParam(49,$libroregi);
            $query ->bindParam(50,$regisfolio);
            $query ->bindParam(51,$tipodiplo);
            $query ->bindParam(52,$fechaini);
            $query ->bindParam(53,$nrocre);
            $query ->bindParam(54,$nrooficio);
            $query ->bindParam(55,$fechasecre);
            $query ->bindParam(56,$idusuario);
            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
      
        public function Eliminar_registro_posgrado($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_ELIMINAR_REGISTRO_POSGRADO(?)";
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
        public function listar_total_posgrados(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_POSGRADOS()";
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
        public function listar_total_expe_pos(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_EXPE_POS()";
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

        public function listar_total_alumnos(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_ALUMNOS_POS()";
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
            $sql = "CALL SP_CARGAR_NUMERO_GENERAL_POS()";
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
        public function Traer_numero_informe(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_NUMERITO_POS()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
        public function Modificar_informe_num($id,$numero){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_INFORME_POS(?,?)";
            $query  = $c->prepare($sql);
            $query ->bindParam(1,$id);
            $query ->bindParam(2,$numero);
          
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