/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;
import java.sql.CallableStatement;
import sac.Logic.Bancos.Contacto;
import sac.Logic.Encuesta.Encuesta;
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
import sac.Logic.Bancos.Bancos_Telefonicos;

/**
 *
 * @author diego
 */
public class DaoContacto {
    
    public static Connection connect() throws SQLException{
        return DBConection.mariaDBconn();
    }
    
    public static long  insertaContacto(Contacto conta,Bancos_Telefonicos bt,Encuesta encu, Connection conn) throws SQLException{
        //por el momento estoy dejando que la base se encargue del id
        //luego lo podemos ver estoy en la playa
        String SQL ="CALL insertar_contacto (?,?,?)";
         long id = 0;
        try(PreparedStatement pstmt = conn.prepareStatement(SQL,
                Statement.RETURN_GENERATED_KEYS)){
                pstmt.setString(1, conta.getNumero_Telefono());
                pstmt.setInt(2, encu.getId());
                pstmt.setInt(3, Integer.parseInt(bt.getNombreBanco()));
                
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
         
    public static int getcantidadDeContactos() throws SQLException{
        String SQL = "SELECT COUNT (*)FROM contacto";
        int count =0;
        try (Connection conn = connect(); 
                Statement stmt = conn.createStatement();
                ResultSet rs= stmt.executeQuery(SQL)){
            rs.next();
            count = rs.getInt(1);
        }catch(SQLException ex){
            System.out.print(ex.getMessage());
        }
        return count;
    }
    
    public static Contacto getContacto(ResultSet rs) throws SQLException{
   
            Contacto con = new Contacto();
            con.setEncuesta(Integer.valueOf(rs.getString("encuesta")));
            con.setNumero_Telefono(rs.getString("numero_Telefono"));
            con.setBase(Integer.valueOf( rs.getString("banco")));
            con.setEstado(rs.getString("estado"));
            con.setDate(DaoFecha.getAllFecha_Contacto(con.getNumero_Telefono()));
            con.setCitaTelefonica(null);
            return con;
     
    }
    
    private static void displaycontacto(ResultSet rs) throws SQLException{
        //ensella los contatos desde Sistem.out.print desde consola
        while(rs.next()){
            System.out.println(rs.getString("id_contacto")+"\t"
            + rs.getString("numero_telefono")+"\t"
            + rs.getString("estado")+"\t"
            + rs.getString("base")+"\t"
            );
        }
    }
    
    public static void findByID(int id){
        //busca las operadoras por su id
        String SQL ="SELECT id_contacto, numero_telefono, estado, base"
                + "FROM contacto "
                + "WHERE id_contacto = ?";
                
        try(Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)){
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            //esta parte es la que da el display 
            displaycontacto(rs);
            //si esta enseñando el operador que es 
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
     
    public static int updateContacto(int id,int base,String num,String estado ){
        //esto lo que hace es q le cambia todo al operador con el mismo id 
        //si quieren que solo cmabie un valor de estos solo pongan los mismos valores 
        //despues especificamos como trabajarlo
        //debielve la cantidad de columnas afectadas
        String SQL = "UPDATE contacto"
                + "SET base = ?"
                + "SET estado = ?"
                + "SET numero_telefono = ?"
                + "WHERE Id_contacto = ?";
        int rows =0;
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setString(1, String.valueOf( base));
            pstmt.setString(2, estado);
            pstmt.setString(3, num);
            pstmt.setString(4, String.valueOf(id) );
            
            rows = pstmt.executeUpdate();
    }   catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return rows;
    }
    
    public static void insertaListaContactos(Bancos_Telefonicos BT,Encuesta encu,Connection conn) throws SQLException{
    
         for(Contacto con: BT.getListaContacos() ){
        
            insertaContacto(con,BT,encu,conn);
        } 
        
    }
    
    public static void insertarContactosBancos(Encuesta encu ) throws SQLException{
        ArrayList<Bancos_Telefonicos> Bancos = encu.getListaBancosTelefonicos();
        Connection conn = connect();
               
        for(Bancos_Telefonicos BT: Bancos){
            DaoContacto.insertaListaContactos(BT,encu,conn);
            
        }
        }
        
    public static void deletenumero_emcuesta(Encuesta encu){
        String SQL = "Delete from Contacto where encuesta = ?";
        
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setInt(1, encu.getId());
                pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DaoContacto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static List<Contacto> getAllContacto_Encuesta(int encu){
        
        String SQL= "call selectallcontactos(?)";
        
        List<Contacto> op;
        op = new ArrayList<Contacto>();
        
         try (Connection conn = connect();
                PreparedStatement stmt = conn.prepareStatement(SQL)) {
             stmt.setInt(1, encu);
             
             ResultSet rs = stmt.executeQuery(SQL);
             System.out.print(rs.toString());
             while(rs.next()){
                 op.add(getContacto(rs));
             }
           
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }

        return op;
        
        
    }
    public static List<Contacto> getAllContacto_Base(String banco){
        List<Contacto> op = new Vector<Contacto>();
         
        String sql = "select numero_Telefono,estado,banco,citaTelefonica,encuesta from contacto where banco = ?";
        
        try (Connection conn =connect();
                 PreparedStatement pstmt = conn.prepareStatement(sql)){
                pstmt.setString(1, banco);
                ResultSet rs = pstmt.executeQuery();
             while(rs.next()){
             op.add(getContacto(rs));
             }
         } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
        return op;
    } 
       
       
}
