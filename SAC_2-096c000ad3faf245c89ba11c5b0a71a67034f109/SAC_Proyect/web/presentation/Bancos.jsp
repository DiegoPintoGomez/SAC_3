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
 
        
        
                    <div class="container container-fluid" id="containerCrearEncuesta" style="height: 500px ">
                    <h1 id="TituloEncuesta"> Bancos de <%= encuesta.getNombreEncuesta() %></h1>


        <table id="example" class="table table-bordered table-striped  " style="width:400; margin-top: 0px;  margin-left: 0px; margin-right: 0px;">
           
        <thead>
            <tr>
                <th>Banco Telefonico</th>
                <th>Numero Contacto</th>
                <th>Llamada 1</th>
                <th>Llamada 2</th>
                <th>Llamada 3</th>

                <th>Estado de Llamada</th>
                <th>Observaciones</th>
                
            </tr>
        </thead>
        <tbody>
            <%for(Contacto contacto: Bancos){  %>
            <tr>
                <td><%= contacto.getBase()%></td>
                <td><%= contacto.getNumero_Telefono() %></td>
                
                 <td> Sin Realizar</td>
                 <td>Sin Realizar </td>

                 <td>Sin Realizar</td>

    
                <td><%= contacto.getEstado() %></td>
                <td><%= contacto.getBase()%> </td>
              
            </tr>
                                      <%}%>

        </tbody>
        <tfoot>
            <tr>
                <th>Banco Telefonico</th>
                <th>Numero de Contacto</th>
                 <th>Llamada 1</th>
                <th>Llamada 2</th>
                <th>Llamada 3</th>
                <th>Estado de Llamada</th>
                <th>Observaciones</t
            </tr>
        </tfoot>
    </table>

                    </div>
               
                                  <%@ include file="/presentation/Footer.jsp" %>

    </body>
    
</html>

<script>
$(document).ready(function() {
    $('#example').DataTable({
        pageLength: 10,
      responsive: true,
      lengthMenu: [[10,20,100,-1],["10","20","100","Todos"]],
        
        
    });
} );
</script>