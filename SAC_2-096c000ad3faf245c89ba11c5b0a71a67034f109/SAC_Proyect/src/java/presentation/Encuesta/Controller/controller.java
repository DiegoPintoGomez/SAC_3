/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation.Encuesta.Controller;
import sac.Logic.Bancos.Random;
import sac.Logic.Bancos.Operadora;





import Conection.DaoEncuesta;
import Conection.DaoOperadora;
import sac.Logic.Encuesta.Encuesta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sac.Logic.Bancos.Contacto;

/**
 *
 * @author Chris
 */
@WebServlet(name = "controller", urlPatterns = {"/controller", "/inicio", "/encuesta", "/creaBancos", "/EliminaBancos", "/perfilEncuesta","/eliEncuesPeril" , "/buscaBancos"})
public class controller extends HttpServlet {

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

        if (request.getServletPath().equals("/inicio")) {
            System.out.println("Llega al controller Encuesta");
         this.listadoEncuestas(request, response);
            
        }
        
       
         if (request.getServletPath().equals("/creaBancos")) {
            System.out.println("Llega al controller Encuesta");
            this.GenerarBancos(request, response);
        request.getRequestDispatcher("/presentation/Principal.jsp").forward(request, response);


        }
        
        
        
        if (request.getServletPath().equals("/encuesta")) {
            System.out.println("Llega al controller Encuesta");
            this.creaEncuesta(request, response);

        }
          if (request.getServletPath().equals("/buscaBancos")) {
            System.out.println("Llega al controller Encuesta");
            this.buscaEncuesta(request, response);


        }
         
          if (request.getServletPath().equals("/EliminaBancos")) {
            System.out.println("Llega al controller Encuesta");
            this.eliminaEncuesta(request, response);

        }
          if (request.getServletPath().equals("/perfilEncuesta")) {
            System.out.println("Llega al controller  PerfilEncuesta");
            this.PerfilEncuesta(request, response);

        }
          
         
         if (request.getServletPath().equals("/eliEncuesPeril")) {
            System.out.println("Llega al controller  PerfilEncuesta");
            this.PerfilEncuesta(request, response);

        } 
          

    }
    
    
     protected void eliEncuesPeril(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            System.out.print("Elimina   Encuesta");
            Encuesta encuesta= (Encuesta) request.getSession(true).getAttribute("encuestaActual");
 
            Model.Model.instance().deleteAllEncuesta(encuesta);
            request.getRequestDispatcher("/presentation/ListaEncuestas.jsp").forward(request, response);
    }

    
    
    protected void buscaEncuesta(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
     
        String s=request.getParameter("buscador");
          if(request.getParameter("buscador")==""){
          this.listadoEncuestas(request, response);
          }
          else{
           request.setAttribute("listaEncuestas", Model.Model.instance().FiltroBusquedaEncuesta(request.getParameter("buscador")));
           request.getRequestDispatcher("/presentation/ListaEncuestas.jsp").forward(request, response);

          
          }
 
           
    }

    
     protected void listadoEncuestas(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         
          
           request.setAttribute("listaEncuestas", Model.Model.instance().getAllEncuesta());
            request.getRequestDispatcher("/presentation/ListaEncuestas.jsp").forward(request, response);
    }

    
    
    
    
    
    
    protected void PerfilEncuesta(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            Encuesta encuesta= Model.Model.instance().getEncuesta(request.getParameter("nomEncu"));

             request.getSession(true).setAttribute("encuestaActual", encuesta);

            
            request.getRequestDispatcher("/presentation/Encuesta.jsp").forward(request, response);
 }
    
    
    
protected void eliminaEncuesta(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            System.out.print("Elimina Encuesta");
            Encuesta encuesta= Model.Model.instance().getEncuesta(request.getParameter("DeleteEncuesta"));
            Model.Model.instance().deleteAllEncuesta(encuesta);
           this.listadoEncuestas(request, response);
 }

    protected void creaEncuesta(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        System.out.print("Entra al Metodo crearEncuesta");
         
        String nombre = (String) request.getParameter("NombreEncuesta");
        if(!Model.Model.instance().encuestaExciste(nombre)){
        System.out.print("Nombre Encuesta" + nombre);

        String muestra = (String) request.getParameter("TamMuestra");
        System.out.print("Tamano Muestra" + muestra);

        Encuesta encuesta = new Encuesta(nombre, Integer.parseInt(muestra));
        request.setAttribute("encuestaActual", encuesta);
         request.getSession(true).setAttribute("encuestaActual", encuesta);
        DaoEncuesta.insertEncuesta(encuesta);
        System.out.print("Nueva Encuesta");
        
        }
                  this.listadoEncuestas(request, response);

    }
    
    void GenerarBancos(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {


        Random r = new Random();
        Encuesta encuesta= (Encuesta)request.getSession(true).getAttribute("encuestaActual");// seteaa encuesta en sesion
         int numeroBancos=0;
         String n=request.getParameter("NumerosPorBanco");
         if(n!=null){
         numeroBancos= Integer.parseInt(request.getParameter("NumerosPorBanco"));
         }
         else numeroBancos=10;

        r.setListaOperadoras((ArrayList<Operadora>) DaoOperadora.getAlloperadora());
        r.GeneraListaBancos(encuesta, numeroBancos);
        System.out.print("se crean los bancos");

       request.getSession(true).setAttribute("encuestaActual", encuesta);// seteaa encuesta en sesion
      
        Model.Model.instance().insertarMuestra(encuesta);
       
        request.getRequestDispatcher("/presentation/Encuesta.jsp").forward(request, response);

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
            Logger.getLogger(controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controller.class.getName()).log(Level.SEVERE, null, ex);
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
