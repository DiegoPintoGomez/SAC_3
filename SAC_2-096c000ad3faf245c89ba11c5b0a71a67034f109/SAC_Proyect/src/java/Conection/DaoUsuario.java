/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import Users.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
   /*
    public static Usuario getUsuario(String id){
    
        String SQL="select ID_usser, Password from usuario where ID_usser = ?";
        
        try (Connection conn =connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)){
            
            
            
        } 
        catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
}*/

}