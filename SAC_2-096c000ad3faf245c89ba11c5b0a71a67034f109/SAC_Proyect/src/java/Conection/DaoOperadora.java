/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;
import sac.Logic.Bancos.Operadora;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author diego
 */
public class DaoOperadora {
   
    public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }
    
    public static long  insertOperadora(Operadora Ope) throws SQLException{
        //este inserta el operador ya creado 
        String SQL ="INSERT INTO OPERADORA (NOMBRE, RANGOMAYOR, RANGOMENOR ) "
                + "VALUES(?,?,?)";
         long id = 0;
        try(Connection conn = connect();
               PreparedStatement pstmt = conn.prepareStatement(SQL,
                Statement.RETURN_GENERATED_KEYS)){
                pstmt.setString(1, Ope.getNombre());
                pstmt.setString(2, Ope.getRangoMayor());
                pstmt.setString(3, Ope.getRangoMenor());
        
              int affectedRows = pstmt.executeUpdate();
              
             if (affectedRows > 0) {
                // get the ID back
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = rs.getLong(1);
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;
        }
         
    public static int getOperadoraCount() throws SQLException{//retorna la cantidad de operadoras
    String SQL="SELECT COUNT(*) FROM OPERADORA";
    int count =0;
    
    try(Connection con = connect();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SQL)){
        rs.next();
        count = rs.getInt(1);
    } catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
        return count;
    }
    
    public static Operadora getOperadora(ResultSet rs){
        try{
            Operadora op = new Operadora();
            op.setId(Integer.valueOf(rs.getString("Id_Operador")));
            op.setNombre(rs.getString("nombre"));
            op.setRangoMayor(rs.getString("rangoMayor"));
            op.setRangoMenor(rs.getString("rangoMenor"));
            return op;
        }       catch(SQLException ex){
            return new Operadora();
        }
    }
    
    public static Operadora findByID(int id){
        //busca las operadoras por su id
        String SQL ="SELECT id_operador,nombre,rangoMenor,rangoMayor   "
                + "FROM operadora "
                + "WHERE id_operador = ?";
                
        try(Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)){
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
           return getOperadora(rs);
            }   
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }       
        return new Operadora();
    }
    
    public static int updateOperadora(int id,String nombre,String menor,String mayor ){
        //esto lo que hace es q le cambia todo al operador con el mismo id 
        //si quieren que solo cmabie un valor de estos solo pongan los mismos valores 
        //despues especificamos como trabajarlo
        //debielve la cantidad de columnas afectadas
        String SQL = "UPDATE operadoras"
                + "SET nombre = ?"
                + "SET rangoMenor = ?"
                + "SET rangoMayor = ?"
                + "WHERE Id_operador = ?";
        int rows =0;
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setString(1, nombre);
            pstmt.setString(2, menor);
            pstmt.setString(3, mayor);
            pstmt.setString(4, String.valueOf(id) );
            
            rows = pstmt.executeUpdate();
    }   catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return rows;
    }
 
    public static List<Operadora> getAlloperadora(){
        List<Operadora> op = new ArrayList<Operadora>();
        
         String sql = "select Id_Operador,nombre, rangoMenor, rangoMayor from operadora";
       
         try (Connection conn =connect();
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)){
             while(rs.next()){
             op.add(getOperadora(rs));
             }
         } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return op;
     
    } 
  
    public static void deleteOperadora(Operadora op){
        String SQL = "Delete from operadora where nombre = ?";
        
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setString(1, String.valueOf(op.getNombre()));
                pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DaoContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

