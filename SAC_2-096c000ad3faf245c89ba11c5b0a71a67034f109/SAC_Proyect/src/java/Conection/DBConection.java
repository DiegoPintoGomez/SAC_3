/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author diego
 */
public class DBConection {
   
    
    public static Connection mariaDBconn() {
         Connection Conn=null;
         try{
            Class.forName("org.mariadb.jdbc.Driver");
            Conn = DriverManager.getConnection("jdbc:mariadb://localhost:9999/inge?user=root&password=root");
            return Conn;    
        } 
        catch (Exception x) {
            Logger.getLogger(DBConection.class.getName()).log(Level.SEVERE, null, x);
            return null;
        }
        
    }
    
    
}
