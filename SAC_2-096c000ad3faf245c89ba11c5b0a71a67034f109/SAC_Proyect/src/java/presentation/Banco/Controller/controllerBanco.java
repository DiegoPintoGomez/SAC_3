/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.Banco.Controller;

import Conection.DaoBanco;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sac.Logic.Bancos.Bancos_Telefonicos;
import sac.Logic.Encuesta.Encuesta;

/**
 *
 * @author Chris
 */
@WebServlet(name = "controllerBanco", urlPatterns = {"/controllerBanco", "/Banco", "/SiguientePagina", "/Anterior"})
public class controllerBanco extends HttpServlet {

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
      
         if (request.getServletPath().equals("/Banco")) {
            System.out.println("Llega al controller Encuesta");
             this.Bancos(request, response);
            
        }
    }
    
         protected void Bancos(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
             int i=0;
           request.setAttribute("Pagina", i);

            Encuesta encuesta= (Encuesta) request.getSession(true).getAttribute("encuestaActual");

           
            
            List<Bancos_Telefonicos> lista= DaoBanco.getAllBanco(encuesta.getNombreEncuesta());
          request.setAttribute("listaBancos", lista);

            request.setAttribute("BancoActual", lista.get(0));
           
            request.getRequestDispatcher("/presentation/Bancos.jsp").forward(request, response);
    }
         
         
          protected void Anterior(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
             
              
             List<Bancos_Telefonicos> lista= (List<Bancos_Telefonicos>) request.getAttribute("listaBancos");
          
             int i = (int) request.getAttribute("Pagina");
                  i--;
              request.setAttribute("BancoActual", lista.get(i));
              request.setAttribute("pagina", i);
           
            request.getRequestDispatcher("/presentation/Bancos.jsp").forward(request, response);
    }
          
           
          protected void Siguiente(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
             
              
             List<Bancos_Telefonicos> lista= (List<Bancos_Telefonicos>) request.getAttribute("listaBancos");
           int i = (int) request.getAttribute("Pagina");
                  i++;
              request.setAttribute("BancoActual", lista.get(i));
              request.setAttribute("pagina", i);
           
            request.getRequestDispatcher("/presentation/Bancos.jsp").forward(request, response);
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
            Logger.getLogger(controllerBanco.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controllerBanco.class.getName()).log(Level.SEVERE, null, ex);
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
