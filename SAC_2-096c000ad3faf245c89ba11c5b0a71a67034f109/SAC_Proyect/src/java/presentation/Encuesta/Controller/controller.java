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
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chris
 */
@WebServlet(name = "controller", urlPatterns = {"/controller", "/inicio", "/encuesta", "/creaBancos", "/EliminaBancos", "/perfilEncuesta","/eliEncuesPeril" })
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
            request.getRequestDispatcher("/presentation/CrearEncuesta.jsp").forward(request, response);

        }
        if (request.getServletPath().equals("/encuesta")) {
            System.out.println("Llega al controller Encuesta");
            this.creaEncuesta(request, response);

        }
          if (request.getServletPath().equals("/creaBancos")) {
            System.out.println("Llega al controller Encuesta");
            this.GenerarBancos(request, response);

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
            request.getRequestDispatcher("/presentation/ListaEncuestas.jsp").forward(request, response);
 }

    protected void creaEncuesta(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        System.out.print("Entra al Metodo crearEncuesta");
         
        String nombre = (String) request.getParameter("NombreEncuesta");
        System.out.print("nombre Encuesta" + nombre);

        String muestra = (String) request.getParameter("TamMuestra");
        System.out.print("Tamanoo Muestra" + muestra);

        Encuesta encuesta = new Encuesta(nombre, Integer.parseInt(muestra));
        request.setAttribute("encuestaActual", encuesta);
         request.getSession(true).setAttribute("encuestaActual", encuesta);
        DaoEncuesta.insertEncuesta(encuesta);
        System.out.print("nueva Encuesta");
        request.getRequestDispatcher("/presentation/ListaEncuestas.jsp").forward(request, response);

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
    
    

//    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        if (this.verificar(request)) {
//            Map<String, String> errors = this.validar(request);
//            if (errors.isEmpty()) {
//                Encuesta model = new Encuesta();
//                updateModel(model, request);
//                System.out.println("Entra model");
//                request.setAttribute("model", model);
//                System.out.println("prueba");
//                Encuesta logged = null;
//                try {
//                    logged = DaoEncuesta.instance().getUsuario(model.getId(), model.getPass());
//                    System.out.println("Entra login");
//                    request.getSession(true).setAttribute("logged", logged);
//                    //request.getRequestDispatcher("/presentation/solicitudes/list").forward(request, response);
//                    if( ModelLogic.instance().getUsuario(model.getId(), model.getPass()).getLabor().getPuesto().getCodgo().equals("5")){
//                    System.out.println("va a RHH");
//                    request.getRequestDispatcher("/prensentation/RHH").forward(request, response);
//                    }
//                    
//                     if( ModelLogic.instance().getUsuario(model.getId(), model.getPass()).getLabor().getPuesto().getCodgo().equals("4")){
//                    System.out.println("va a Jefe OCCB");
//                    request.getRequestDispatcher("/presentation/ConAct").forward(request, response);
//                    }
//                    
//                     if( ModelLogic.instance().getUsuario(model.getId(), model.getPass()).getLabor().getPuesto().getCodgo().equals("3")){
//                    System.out.println("va a Registrador");
//                    request.getRequestDispatcher("/presentation/categorias").forward(request, response);
//                    }
//                    
//                     if( ModelLogic.instance().getUsuario(model.getId(), model.getPass()).getLabor().getPuesto().getCodgo().equals("2")){
//                    System.out.println("va a secretaria");
//                    request.getRequestDispatcher("/presentation/Usuario/Secretaria/Secretaria.jsp").forward(request, response);
//                    }
//                     if( ModelLogic.instance().getUsuario(model.getId(), model.getPass()).getLabor().getPuesto().getCodgo().equals("1")){
//                    System.out.println("va Administrador");
//                    request.getRequestDispatcher("/presentation/list").forward(request, response);
//                    } 
//                    
//                } catch (Exception ex) {
//                    request.getRequestDispatcher("/presentation/Usuario/Login/login.jsp").forward(request, response);
//                }
//            } else {
//                request.setAttribute("errors", errors);
//                request.getRequestDispatcher("/presentation/Usuario/Login/login.jsp").forward(request, response);
//            }
//
//        } else {
//            request.getRequestDispatcher("/presentation/CrearEncuesta.jsp").forward(request, response);
//        }
//    }
//     private void updateModel(Encuesta model, HttpServletRequest request) {
//        model.setNombreEncuesta(request.getParameter("NombreEncuesta"));
//        model.setMuestra( Integer.parseInt(request.getParameter("clave")));
//        System.out.println("obtiene datos de Encuesta");
//       
//    }
//     
//     
//        private boolean verificar(HttpServletRequest request) {
//        if (request.getParameter("NombreEncuesta") == null) {
//            return false;
//        }
//        if (request.getParameter("TamMuestra") == null) {
//            return false;
//        }
//        return true;
//    }
// 
//          private Map<String, String> validar(HttpServletRequest request) {
//        Map<String, String> errores = new HashMap<>();
//        if (request.getParameter("NombreEncuesta").isEmpty()) {
//            errores.put("id", "Id requerido");
//        }
//        if (request.getParameter("clave").isEmpty()) {
//            errores.put("clave", "TamMuestra");
//        }
//        return errores;
//    }
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
