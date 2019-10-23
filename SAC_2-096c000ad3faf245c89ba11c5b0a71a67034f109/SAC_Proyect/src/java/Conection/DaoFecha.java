/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author diego
 */
public class DaoFecha {
    
  public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }

  public static void  inserFecha(String contacto,Calendar date) throws SQLException{
        String SQL ="INSERT INTO fecha (fecha,contacto) "
                + "VALUES(?,?)";
        
        try(Connection conn = connect();
               PreparedStatement pstmt = conn.prepareStatement(SQL,
                Statement.RETURN_GENERATED_KEYS)){
            SimpleDateFormat format = new SimpleDateFormat("yyy-MM-dd");
            String dateString =format.format(date.getTime());
            pstmt.setString(1, contacto);
            pstmt.setString(2,dateString);
            pstmt.executeUpdate();
        }
         catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
      }


    
}
