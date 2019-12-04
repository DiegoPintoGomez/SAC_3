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
        <title>Operadoras</title>
        <%@include file="/presentation/Head.jsp"%>
    </head>

    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <%@include file="/presentation/popUpCreaOperadoras.jsp" %>


        <div style=" ">

            <h1 id="TituloEncuesta" style=" margin-top:10px">Operadoras</h1> 




            <div style="text-align: left; margin-left: 125px;  margin-top: 20px" >
                <button title="Agregar Encuesta" data-toggle="modal"  class="btn btn-light text-left" type="button" style=" background: #5fbaa7" data-target="#ModalOperadora" class="btn btn-default" id="ButtonCrearEncuesta ">Crear Nueva Operadora</button>
            </div>

<div class="" style="height: available; position: relative; margin-top: 20px;  margin-left: 30px; margin-right: 30px; margin-bottom: 100px; ">      




                <%List<Operadora> list = (List<Operadora>) Model.Model.instance().getAllOperadora();%>
                  
                <table class="table table-bordered table-striped mb-0 " id="example"style="">
                    <thead>
                        <tr style="">
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Rango Menor</th>
                            <th scope="col">Rango Mayor</th>
                            <th scope="col">Eliminar</th>



                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 0;%>

                        <% for (Operadora e : list) {%>
                        <% i++;%>


                        <tr>
                            <td> <%= i%>   </td>
                            <td> <%= e.getNombre()%> </td>
                            <td><%= e.getRangoMenor()%> </td>
                            <td><%= e.getRangoMayor()%> </td>
                            <td>
                                <form method="GET" action="elimnaOperadora">
                                    <input type="text" name="DeleteOperadora"style=" display:none;" value="<%= e.getNombre()%>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/trash3.png" style=" width: 53px; height: 53px"></button>
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
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            pageLength: 10,
            responsive: true,
            lengthMenu: [[10, 20, 100, -1], ["10", "20", "100", "Todos"]],
  language: {

        search:         "Buscar: ",
        lengthMenu:    "Elementos _MENU_  por pagina",

        info:           "Mostrando  _START_  a _END_ de _TOTAL_ elementos",
  
        loadingRecords: "Cargando Elementos...",
        zeroRecords:    "No se encontraron elementos que coincidan con los parametros de busqueda",
        emptyTable:     "No hay elementos disponibles",
        paginate: {
            first:      "Primer",
            previous:   "Anterior",
            next:       "Siguiente",
            last:       "Ultimo"
        },
        
    }
        });
    });



</script>