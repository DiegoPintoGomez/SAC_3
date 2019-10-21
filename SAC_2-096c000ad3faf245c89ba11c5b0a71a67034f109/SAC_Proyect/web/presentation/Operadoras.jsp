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

        <div style=" ">
       
                <h1 id="TituloEncuesta" style=" margin-top:0px">Operadoras</h1> 
                <button  data-toggle="modal"  type="button" data-target="#Modall" class="btn btn-default" id="ButtonCrearEncuesta "><img  src="/assets/img/addd.png" style="  margin-left: 120px; width: 40px; height: 40px"></button>
                

           
           
                
            <div class="table-wrapper-scroll-y my-custom-scrollbar" style=" margin-top: 0px;  margin-left: 30px; margin-right: 30px; ">

                <%List<Operadora> list = (List<Operadora>) Model.Model.instance().getAllOperadora();%>
                               

                <table class="table table-bordered table-striped mb-0 " style=" ">
                    <thead>
                        <tr>
                             <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Rango Menor</th>
                            <th scope="col">Rango Mayor</th>
                            <th scope="col">Eliminar</th>

                          

                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 0;%>

                        <% for ( Operadora e: list) {%>
                        <% i++;%>


                        <tr>
                            <td> <%= i%>   </td>
                            <td> <%= e.getId() %> </td>
                            <td><%= e.getRangoMenor() %> </td>
                            <td><%= e.getRangoMayor() %> </td>
                            <td>
                                <form method="GET" action="elimnaOperadora">
                                     <input type="text" name="DeleteOperadora"style=" display:none;" value="<%= e.getNombre() %>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/delete.png" style=" width: 45px; height: 45px"></button>
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