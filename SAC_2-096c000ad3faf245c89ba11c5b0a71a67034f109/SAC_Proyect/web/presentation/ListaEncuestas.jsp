<%@page import="sac.Logic.Bancos.Operadora"%>
<%@page import="Conection.DaoOperadora"%>
<%@page import="java.util.List"%>
<%@page import="sac.Logic.Encuesta.Encuesta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Crear Encuesta</title>
        <%@include file="/presentation/Head.jsp"%>


    </head>

    <body>
        <%@ include file="/presentation/Header.jsp" %>
        
        <%@include file="/presentation/popUpCreaEncuesta.jsp" %>
       <%List<Encuesta> list = (List<Encuesta>) request.getAttribute("listaEncuestas");%>      

        <div style=" " style="margin-top:10px">
            <form method="GET" action="buscaBancos" >

          <h1 id="TituloEncuesta" style=" margin-top:0px">Encuestas</h1>
           
            <div class="input-group mb-2" style=" margin-right: 200px; margin-left: 200px">
                
                   <div>
                   
                    <button  data-toggle="modal"  type="button" data-target="#Modall" class="btn btn-default" id="ButtonCrearEncuesta "><img  src="/assets/img/addd.png" style="  margin-left: 120px; width: 40px; height: 40px"></button>
                    
                </div>
               
            </div>
                
            <div class="" style="height: available; position: relative; margin-top: 0px;  margin-left: 30px; margin-right: 30px; margin-bottom: 100px; ">      

                <table class="table table-bordered table-striped mb-0 " id="example"style="">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Muestra</th>
                            <th scope="col">Bancos</th>
                            <th scope="col">Eliminar</th>
                            <th scope="col">Crear Bancos</th>

                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 0;%>

                        <% for (Encuesta e : list) {%>
                        <% i++;%>


                        <tr style="height: 10px">
                            <td> <%= i%>   </td>
                            <td> <%= e.getNombreEncuesta()%> </td>
                            <td><%= e.getMuestra()%> </td>
                            <td><%= e.getListaBancosTelefonicos().size()%> </td>
                            <td>
                                <form method="GET" action="EliminaBancos">
                                     <input type="text" name="DeleteEncuesta"style=" display:none;" value="<%= e.getNombreEncuesta() %>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/delete.png" style=" width: 45px; height: 45px"></button>
                                </form>
                            </td>
                             <td>
                                <form method="GET" action="perfilEncuesta">
                                     <input type="text" name="nomEncu"style=" display:none;" value="<%= e.getNombreEncuesta() %>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/ajuste.png" style=" width: 45px; height: 45px"></button>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                       
                    </tbody>
                </table>
                 
            </div>
            </form>       
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