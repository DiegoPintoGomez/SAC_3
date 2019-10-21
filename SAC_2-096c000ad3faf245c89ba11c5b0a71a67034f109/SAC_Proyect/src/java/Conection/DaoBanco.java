/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import sac.Logic.Encuesta.Encuesta;
import sac.Logic.Bancos.Bancos_Telefonicos;
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
import sac.Logic.Bancos.Contacto;

/**
 *
 * @author diego
 */
public class DaoBanco {
     
    public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }
     
    public static long  insertBanco(Bancos_Telefonicos BAC,Encuesta encu) throws SQLException{
        //este inserta el operador ya creado 
        String SQL ="INSERT INTO banco (base,encuesta,estado) "
                + "VALUES(?,?,?)";
         long id = 0;
        try(Connection conn = connect();
               PreparedStatement pstmt = conn.prepareStatement(SQL,
                Statement.RETURN_GENERATED_KEYS)){
                pstmt.setString(1, BAC.getBase());
                pstmt.setString(2, encu.getNombreEncuesta());
                pstmt.setString(3,String.valueOf( BAC.isEstado()));
                
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
    
    public static int getNumerosBanco() throws SQLException{//retorna la cantidad de operadoras
    String SQL="SELECT COUNT(*) FROM banco";
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
          
    private static void displayBanco(ResultSet rs) throws SQLException{
        //ensella las operadoras desde Sistem.out.print desde consola
        while(rs.next()){
            System.out.println(rs.getString("Id_Base")+"\t"
            + rs.getString("base")+"\t"
            + rs.getString("estado")+"\t"
            );
        }
    }
      
    public static Bancos_Telefonicos findByID(int id){
        //busca las operadoras por su id
        String SQL ="SELECT  base,encuesta,estado "
                + "FROM banco "
                + "WHERE base = ?";
                
        try(Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)){
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
           if(rs.next()){
               return getBanco(rs);
           }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return new Bancos_Telefonicos();
    }
     
     public static int updateBanco(int id,int base ){
        //esto lo que hace es q le cambia todo al operador con el mismo id 
        //si quieren que solo cmabie un valor de estos solo pongan los mismos valores 
        //despues especificamos como trabajarlo
        //debielve la cantidad de columnas afectadas
        String SQL = "UPDATE Banco"
                + "SET base = ?"
                + "WHERE Id_Base = ?";
        int rows =0;
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setString(1, String.valueOf(base));
            pstmt.setString(4, String.valueOf(id) );
            
            rows = pstmt.executeUpdate();
    }   catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return rows;
    }

    public static Bancos_Telefonicos getBanco(ResultSet rs) {
       
        try{
            Bancos_Telefonicos op = new Bancos_Telefonicos();
           
            op.setNombreBanco(rs.getString("base"));
            op.setEstado(Boolean.getBoolean(rs.getString("estado")));
            op.setEncu(rs.getString("encuesta"));
            List<Contacto> LC = DaoContacto.getAllContacto_Base(rs.getString("base"));
            op.setListaContacos((Vector<Contacto>) LC);
            return op;
        }       catch(SQLException ex){
            return new Bancos_Telefonicos();
        }
    }
    
    public static void insertarLista (Encuesta encu) throws SQLException{
    
        for(Bancos_Telefonicos BT: encu.getListaBancosTelefonicos() ){
        
            insertBanco(BT,encu);
        } 
        
    }
    
    public static void deletebanco_encuesta(Encuesta encu){
        String SQL = "Delete from banco where encuesta = ?";
        
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setString(1, encu.getNombreEncuesta());
                pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DaoContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }   
    
    
       public static List<Bancos_Telefonicos> getAllBanco(String Encuesta){
        List<Bancos_Telefonicos> op = new ArrayList<Bancos_Telefonicos>();
        
         String sql = "select base, encuesta, estado from banco where encuesta = ?";
       
         try (Connection conn =connect();
                PreparedStatement pstmt = conn.prepareStatement(sql)){
              
                pstmt.setString(1, Encuesta);
                ResultSet rs = pstmt.executeQuery();
             while(rs.next()){
             op.add(getBanco(rs));
             }
         } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
         
        return op;
     
    }
   

}
