<?php
    require_once 'model_conexion.php';

    class Modelo_Registro_General_Bachiller extends conexionBD{
        

        public function Listar_Registro_General(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_BACHILLER()";
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
          public function Listar_Registro_Alfabetico(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTA_GENERAL_BACHILLER_ALFABETICO()";
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
            $sql = "CALL SP_LISTA_GENERAL_BACHILLER_SECRE(?)";
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
        public function Listar_General_Ba_Fechas($fechainicio,$fechafin){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_FECHAS_BACHILLER(?,?)";
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
         public function Listar_General_Ba_Colacion($fechacol){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_BACHI_COLA(?)";
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
        public function Listar_General_Ba_Fechas_secre($fechainicio,$fechafin,$sede){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_GENERAL_FECHAS_BACHILLER_SECRE(?,?,?)";
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
public function Registrar_Bachiller($tipodoc,$dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$ced,$esc,$bach,$moda,$idauto,$fecha,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$idusuario, $auto_etnica, $pueblo_indi, $lengua_indi, $lengua_detalle){
    $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_BACHILLER(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";            
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
            $query ->bindParam(17,$bach);
            $query ->bindParam(18,$moda);
            $query ->bindParam(19,$idauto);
            $query ->bindParam(20,$fecha);
            $query ->bindParam(21,$acu);
            $query ->bindParam(22,$res);
            $query ->bindParam(23,$exped);
            $query ->bindParam(24,$lib);
            $query ->bindParam(25,$fol);
            $query ->bindParam(26,$reg);
            $query ->bindParam(27,$ruta);
            $query ->bindParam(28,$mod_estu);
            $query ->bindParam(29,$tra_inv);
            $query ->bindParam(30,$turn);
            $query ->bindParam(31,$porc);
            $query ->bindParam(32,$cent);
            $query ->bindParam(33,$meta);
            $query ->bindParam(34,$proce_bach);
            $query ->bindParam(35,$proce_insti);
            $query ->bindParam(36,$proce_titu);
            $query ->bindParam(37,$fecha_matri);
            $query ->bindParam(38,$fecha_inici);
            $query ->bindParam(39,$fecha_fin);
            $query ->bindParam(40,$mod_sustenta);
            $query ->bindParam(41,$idusuario);
            $query ->bindParam(42,$auto_etnica);
            $query ->bindParam(43,$pueblo_indi);
            $query ->bindParam(44,$lengua_indi);
            $query ->bindParam(45,$lengua_detalle);

            $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar_conexion();
        }
        public function Agregar_diploma($idexpe,$id,$fechacu,$fechafirma,$numreso,$fechareso,$diplonum,$regis,$regilibro,$regisfolio,$tipodiplo,$fechainiciotra,$nrocred,$nrooficio,$fechasecre,$idusuario){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_AGREGAR_DIPLOMA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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

       public function Modificar_Bachiller($dni,$nombres,$apepa,$apema,$codigo,$sexo,$celular,$direc,$emaper,$emainsti,$fecha_matr,$fecha_egre,$observa,$idexpe,$ced,$esc,$bach,$moda,$idauto,$fecha,$acu,$res,$exped,$lib,$fol,$reg,$ruta,$idmoda,$mod_estu,$tra_inv,$turn,$porc,$cent,$meta,$proce_bach,$proce_insti,$proce_titu,$fecha_matri,$fecha_inici,$fecha_fin,$mod_sustenta,$iddiploma,$fechacu,$fechafirma,$resol,$fechareso,$numdiplo,$numregis,$libroregi,$regisfolio,$tipodiplo,$fechaini,$nrocre,$nrooficio,$fechasecre,$ciclo_tra,$idusuario, $auto_etnica, $pueblo_indi, $lengua_indi, $lengua_detalle){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_MODIFICAR_BACHILLER(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            $query ->bindParam(17,$bach);
            $query ->bindParam(18,$moda);
            $query ->bindParam(19,$idauto);
            $query ->bindParam(20,$fecha);
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
            $query ->bindParam(35,$proce_bach);
            $query ->bindParam(36,$proce_insti);
            $query ->bindParam(37,$proce_titu);
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
            $query ->bindParam(56,$ciclo_tra);
            $query ->bindParam(57,$idusuario);
            $query ->bindParam(58,$auto_etnica);
            $query ->bindParam(59,$pueblo_indi);
            $query ->bindParam(60,$lengua_indi);
            $query ->bindParam(61,$lengua_detalle);

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
        public function Registrar_informe($numero, $grado1, $program, $fedes1, $fehas1, $ruta_pdf) {
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_REGISTRAR_INFORME(?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1, $numero);
            $query->bindParam(2, $grado1);
            $query->bindParam(3, $program);
            $query->bindParam(4, $fedes1);
            $query->bindParam(5, $fehas1);
            $query->bindParam(6, $ruta_pdf);
        
            // Ejecutar el procedimiento almacenado
            $query->execute();
        
            // Capturar el valor de retorno (1 o 2)
            $result = $query->fetchColumn();
            
            // Retornar el resultado (1 o 2)
            return $result;
        }
        public function listar_total_diplo_bachiller(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_DIPLO_BACHILLER()";
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
        public function listar_total_expe_bachiller(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_LISTAR_TOTAL_EXPE_BACHILLER()";
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
        public function Cargar_Numerito(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_CARGAR_NUMERITO()";
            $query  = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll();
            foreach($resultado as $resp){
                $arreglo[]=$resp;
            }
            return $arreglo;
            conexionBD::cerrar_conexion();
        }
         public function Pasar_titulado($idexpe,$idautori,$escue,$grado,$moda){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SP_PASAR_TITULADO(?,?,?,?,?)";
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
        
        public function Obtener_Id_Escuela_Por_Expediente($id_expediente){
            $c = conexionBD::conexionPDO();
            $sql = "SELECT Id_escuela FROM expediente WHERE Id_expediente = ?";
            $query = $c->prepare($sql);
            $query->bindParam(1, $id_expediente);
            $query->execute();
            $resultado = $query->fetchColumn();
            conexionBD::cerrar_conexion();
            return $resultado;
        }
    }

?>