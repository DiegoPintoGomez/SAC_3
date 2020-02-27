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

/**
 *
 * @author diego
 */
public class DaoUsuario {
    
    public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }
   
    public static Usuario usuarioGet(String id, String pass) {
            String SQL = "SELECT * FROM usuario WHERE "
                    + "ID_usser = '%1$s' && Password = '%2$s'";
        SQL = String.format(SQL, id, pass);
        
         try (Connection conn =connect();
                 PreparedStatement pstmt = conn.prepareStatement(SQL)){
        
            ResultSet rs = pstmt.executeQuery(SQL);
        
            return crearUsuario(rs);
    }   
         
         catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
         return new Usuario();
    }
         
         public static Usuario crearUsuario(ResultSet rs) throws SQLException{
             Usuario usu = new Usuario();
             usu.setId(rs.getString("ID_usser"));
             usu.setPass(rs.getString("Password"));
             return usu;   
         }
}