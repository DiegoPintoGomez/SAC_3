/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.Operadora.Controller;

import Conection.DaoOperadora;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sac.Logic.Bancos.Operadora;
import sac.Logic.Encuesta.Encuesta;

/**
 *
 * @author Chris
 */
@WebServlet(name = "controllerOperadora", urlPatterns = {"/controllerOperadora", "/elimnaOperadora", "/addOperadora"})
public class controllerOperadora extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
       if (request.getServletPath().equals("/elimnaOperadora")) {
            System.out.println("Llega al controller elimnar Operadora");
            this.eliOperadora(request, response);

        } 
          if (request.getServletPath().equals("/addOperadora")) {
            System.out.println("Llega al controller  agregar Operadora");
            this.addOperadora(request, response);

        } 
          
          
    }
    
    protected void eliOperadora(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            System.out.print("Elimina Encuesta");
            String s = request.getParameter("DeleteOperadora");
            
            Operadora operadora= new Operadora();
            operadora.setNombre(s);
            DaoOperadora.deleteOperadora(operadora);
            request.getRequestDispatcher("/presentation/Operadoras.jsp").forward(request, response);
    }
    
    
     protected void addOperadora(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            System.out.print("Elimina Encuesta");
            String nomOpe = request.getParameter("NombreOperadora");
            String rMenor = request.getParameter("RangoMenor");
            String rMayor = request.getParameter("RangoMayor");
            Operadora operadora= new Operadora(nomOpe,rMenor,rMayor);
            Model.Model.instance().insertarOperadora(operadora); 
            request.getRequestDispatcher("/presentation/Operadoras.jsp").forward(request, response);
    }
    
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(controllerOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(controllerOperadora.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
