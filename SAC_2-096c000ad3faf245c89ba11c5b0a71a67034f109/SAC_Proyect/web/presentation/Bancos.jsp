<%@page import="java.util.Vector"%>
<%@page import="sac.Logic.Bancos.Contacto"%>
<%@page import="Conection.DaoBanco"%>
<%@page import="java.util.List"%>
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title></title>
            <%@include file="/presentation/Head.jsp"%>

    </head>
    <body>
    <%@ include file="/presentation/Header.jsp" %>
        
        <%@include file="/presentation/popUpCreaEncuesta.jsp" %>
        <%List<Bancos_Telefonicos> list = (List<Bancos_Telefonicos>) DaoBanco.getAllBanco("OO"); %>      
        <%Vector<Contacto> c= list.get(0).getListaContacos();%>      

        

        <div style=" " style="margin-top:0px; overflow-y:  ">
         <form method="GET" action="buscaBancos">

          <h1 id="TituloEncuesta" style=" margin-top:0px">Banco:  <%= list.get(0).getNombreBanco() %> </h1>
           
            <div class="input-group mb-2" style="margin-right: 200px; margin-left: 200px">
                <div>

                <input type="text" size="40" name="buscador" maxhigth="3" id="" style="align-content: center; margin-left: 350px; margin-right: 50px; border-color:#ef384c"  placeholder="Nombre Encuesta">
                <button type="submit" class="btn btn-default" id="ButtonCrearEncuesta"> Buscar</button>
                </div>
                
               
            </div>
                
            <div class="table-wrapper-scroll-y my-custom-scrollbar" style=" margin-top: 0px;  margin-left: 30px; margin-right: 30px; ">

               
                               

                <table class="table table-bordered table-striped mb-0 " id="e" style=" ">
                    <thead>
                        <tr>
                             <th scope="col">#</th>
                            <th scope="col">Telefono Movil</th>
                            <th scope="col">Intentos de Llamada</th>
                            <th scope="col">Estado de Llamada</th>
                            <th scope="col">Observaciones</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 0;%>

                        <%   for(Contacto contacto: c){ %>
                        <% i++;%>


                        <tr>
                            <td> <%= i%></td>
                            <td> <%= contacto.getNumero_Telefono() %> </td>
                            <td>0</td>
                            <td><%= contacto.getEstado() %> </td>
                             <td>0</td>

                        </tr>
                        <%}%>
                       
                    </tbody>
                </table>
                   
                
                 
            </div>
                                <div class="col text-center">
           <button  class="btn btn-light text-left" id="ButtonCrearEncuesta" type="submit" style="">Anterior</button>
            <button  class="btn btn-light text-left" id="ButtonCrearEncuesta" type="submit" style="">Siguiente</button>

                      </div> 
            </form>       
        </div>



        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>

<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>