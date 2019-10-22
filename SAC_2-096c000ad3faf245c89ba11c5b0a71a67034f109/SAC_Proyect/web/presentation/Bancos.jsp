<%@page import="sac.Logic.Bancos.Contacto"%>
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
<%@page import="java.util.List"%>
<%@page import="Conection.DaoBanco"%>
<%@page import="sac.Logic.Encuesta.Encuesta"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title></title>
            <%@include file="/presentation/Head.jsp"%>
            <% Encuesta encuesta = (Encuesta) session.getAttribute("encuestaActual"); List<Contacto> Bancos= Model.Model.instance().getContacto_Encuesta(encuesta.getNombreEncuesta()); %>  


    </head>
    <body>
               <%@ include file="/presentation/Header.jsp" %>
 
        
        
                    <div class="container container-fluid" id="containerCrearEncuesta" style="height: 300px ">
                    <h1 id="TituloEncuesta"> Bancos de <%= encuesta.getNombreEncuesta() %></h1>


        <table id="example" class="table table-striped table-bordered" style="width:100%">
            
        <thead>
            <tr>
                <th>Banco Telefonico</th>
                <th>Contacto</th>
                <th>Intentos</th>
                <th>Estado de Llamada</th>
                <th>Observaciones</th>
                
            </tr>
        </thead>
        <tbody>
            <%for(Contacto banco: Bancos){  %>
            <tr>
                <td><%= banco.getBase()%></td>
                <td><%= banco.getNumero_Telefono() %></td>
                <td>0</td>
                <td><%= banco.getEstado() %></td>
                <td> </td>
              
            </tr>
                                      <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Banco Telefonico</th>
                <th><%= banco.getNumero_Telefono() %></th>
                <th>Hora Inicio Pausa</th>
                <th>Hora Fin Pausa</th>
                <th>Hora Final</th>
              
            </tr>
        </tfoot>
    </table>

                    </div>
    </body>
</html>

<script>
$(document).ready(function() {
    $('#example').DataTable({
        pageLength: 10,
       pageLength: 20,
         lengthMenu: [[10,50,100,-1],["10","50","100","Todos"]],
        
        
    });
} );
</script>