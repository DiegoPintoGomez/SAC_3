/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import Users.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import sac.Logic.Bancos.Bancos_Telefonicos;
import sac.Logic.Encuesta.Encuesta;

/**
 *
 * @author diego
 */
public class DaoRelacion_Usuario_Banco {
    
     public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }
     
     public static boolean setBancoAUsuario(Encuesta encu, Usuario Usu){
  
         String SQL = "Select * from banco";
         
        // SQL = String.format(SQL,Integer.valueOf(encu.getId()));
         
         System.out.print(SQL);
         try (Connection conn =connect();
                 PreparedStatement pstmt = conn.prepareStatement(SQL)){
             
         ResultSet rs = pstmt.executeQuery(SQL);
         
         Usu.getLabor().add(getBanco(rs));
         
         return false;
         
     }   catch (SQLException ex) {
             Logger.getLogger(DaoRelacion_Usuario_Banco.class.getName()).log(Level.SEVERE, null, ex);
         }
         return false;
     }
     
     public static Bancos_Telefonicos getBanco(ResultSet rs) throws SQLException{
         Bancos_Telefonicos BT = new Bancos_Telefonicos();
         BT.setEncu(rs.getString("encuesta"));
         BT.setEstado(true);
         BT.setNombreBanco(rs.getString("base"));
         return BT;
     }

    public static void UpdateBancoActivo(Bancos_Telefonicos bt ){
         String SQL="update banco set estado = true" 
                    +"where encuesta = '%1$s' && base = '%2$s' ";
         
         SQL = String.format(SQL,bt.getEncu(),bt.getBase());
         
         try (Connection conn =connect();
                 PreparedStatement pstmt = conn.prepareStatement(SQL)){
         
                 ResultSet rs = pstmt.executeQuery(SQL);
         
    }    catch (SQLException ex) {
             Logger.getLogger(DaoRelacion_Usuario_Banco.class.getName()).log(Level.SEVERE, null, ex);
         }
} 
    
    public static void darlebancoAUsuario(Encuesta encu,Bancos_Telefonicos banco,Usuario usuario ){
    
    
        
        
    }

}