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

             

       
        
        

        <div style=" ">
       
                <h1 id="TituloEncuesta" style=" margin-top:0px">Encuestas</h1>
           
            <div class="input-group mb-2" style="margin-right: 200px; margin-left: 200px">

                <input type="text" size="40" maxhigth="3" id="" style="align-content: center; margin-left: 350px; margin-right: 50px; border-color:#ef384c"  placeholder="Nombre Encuesta">
                <div>
                <form method="GET" action="eliminaBancos">
                    <button type="submit" class="btn btn-default" id="ButtonCrearEncuesta"> Buscar</button>
                </form>
                </div>
                
                   <div>
                   
                    <button  data-toggle="modal"  type="button" data-target="#Modall" class="btn btn-default" id="ButtonCrearEncuesta "><img  src="/assets/img/addd.png" style="  margin-left: 120px; width: 40px; height: 40px"></button>
                    
                </div>
               
            </div>
                
            <div class="table-wrapper-scroll-y my-custom-scrollbar" style=" margin-top: 0px;  margin-left: 30px; margin-right: 30px; ">

                <%List<Encuesta> list = (List<Encuesta>) Model.Model.instance().getAllEncuesta();%>
                               

                <table class="table table-bordered table-striped mb-0 " style=" ">
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


                        <tr>
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
                      
        </div>



        <%@ include file="/presentation/Footer.jsp" %>

    </body>

</html>