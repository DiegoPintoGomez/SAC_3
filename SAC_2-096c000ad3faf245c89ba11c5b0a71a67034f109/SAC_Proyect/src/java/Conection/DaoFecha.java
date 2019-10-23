/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author diego
 */
public class DaoFecha {
    
  public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }

  public static void  inserFecha(Calendar date, String contacto) throws SQLException{
        String SQL ="INSERT INTO fecha (fecha,contacto) "
                + "VALUES(?,?)";
        
        try(Connection conn = connect();
               PreparedStatement pstmt = conn.prepareStatement(SQL,
                Statement.RETURN_GENERATED_KEYS)){
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            String dateString =format.format(date.getTime());
            pstmt.setString(1, dateString);
            pstmt.setString(2,contacto);
            pstmt.executeUpdate();
        }
         catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
      }

     public static List<Calendar> getAllFecha_Contacto(String Cont){
        ArrayList<Calendar> cal = new ArrayList<Calendar>();
        
         String sql = "select contacto,fecha "
                 + "from fecha where contacto = ?";
       
         try (Connection conn =connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setString(1, Cont);
                ResultSet rs = pstmt.executeQuery();
             while(rs.next()){
                    try {
                        cal.add(getFecha(rs));
                    } catch (ParseException ex) {
                        Logger.getLogger(DaoFecha.class.getName()).log(Level.SEVERE, null, ex);
                    }
             }
         } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cal;
     
    }   

    private static Calendar getFecha(ResultSet rs) throws SQLException, ParseException {
      String date = rs.getString("fecha");
      Date da = new SimpleDateFormat("yyyyMMDD").parse(date);
      Calendar Greg = new GregorianCalendar();
      Greg.setTime(da);
      return Greg;
    }
  
}
