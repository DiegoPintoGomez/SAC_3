/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conection;

import sac.Logic.Encuesta.Encuesta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import sac.Logic.Bancos.Bancos_Telefonicos;

/**
 *
 * @author diego
 */
public class DaoEncuesta {

    public static Connection connect() throws SQLException {
        return DBConection.mariaDBconn();
    }

    public static long insertEncuesta(Encuesta ENCU) throws SQLException {
        String SQL = "CALL insertar_encuesta(?,?)";
        long id = 0;
        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL,
                        Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, ENCU.getNombreEncuesta());
            pstmt.setString(2, String.valueOf(ENCU.getMuestra()));

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

    public static int getEncuestaCantidad() throws SQLException {
        String SQL = "SELECT COUNT (*)FROM ENCUESTA";
        int count = 0;
        try (Connection conn = connect();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SQL)) {
            rs.next();
            count = rs.getInt(1);
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }
        return count;
    }

    public static Encuesta getEncuesta(ResultSet rs) {
        try {
            Encuesta op = new Encuesta();

            op.setMuestra(Integer.valueOf(rs.getString("muestra")));
            op.setNombreEncuesta(rs.getString("nombreEncuesta"));
            op.setListaBancosTelefonicos((ArrayList<Bancos_Telefonicos>) DaoBanco.getAllBanco(op.getNombreEncuesta()));

            return op;
        } catch (SQLException ex) {
            return new Encuesta();
        }
    }

    private static void displayEncuesta(ResultSet rs) throws SQLException {
        //ensella los contatos desde Sistem.out.print desde consola
        while (rs.next()) {
            System.out.println(rs.getString("IdEncuesta") + "\t"
                    + rs.getString("nombreEncuesta") + "\t"
                    + rs.getString("muestra") + "\t"
            );
        }
    }

    public static Encuesta findByName(String id) {
        //busca las operadoras por su id
        String SQL = "SELECT nombreEncuesta,muestra "
                + "FROM encuesta "
                + "WHERE nombreEncuesta = ?";

        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return getEncuesta(rs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new Encuesta();
    }

    public static void delete_encuesta(Encuesta encu) {
        String SQL = "Delete from encuesta where nombreEncuesta = ?";

        try (Connection conn = connect();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, encu.getNombreEncuesta());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DaoContacto.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static List<Encuesta> getListEncuesta() {
        List<Encuesta> op;
        op = new ArrayList<Encuesta>();

        String sql = "select nombreEncuesta, muestra "
                + "from Encuesta "
                + "ORDER BY nombreEncuesta ASC";

        try (Connection conn = connect();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                op.add(getEncuesta(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }

        return op;
    }

    public static boolean EncuestaExciste(String nom) {
        if (findByName(nom).getMuestra() == 0) {
            return false;
        }
        return true;
    }
    
     public static List<Encuesta> getListEncuesta(String nom) {
        List<Encuesta> op;
        op = new ArrayList<Encuesta>();

        String sql = "select nombreEncuesta, muestra "
                + "from Encuesta " 
                +"where nombreEncuesta like ?"
                + " order by nombreEncuesta ASC";
                
        try (Connection conn = connect();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,"%"+nom+"%");
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                op.add(getEncuesta(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }

        return op;
    }
}
