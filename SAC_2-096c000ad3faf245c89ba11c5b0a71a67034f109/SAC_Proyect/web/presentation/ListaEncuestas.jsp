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
        <title>Encuestas</title>
        <%@include file="/presentation/Head.jsp"%>


    </head>

    <body>
        <%@ include file="/presentation/Header.jsp" %>
        
        <%@include file="/presentation/popUpCreaEncuesta.jsp" %>
       <%List<Encuesta> list = (List<Encuesta>) request.getAttribute("listaEncuestas");%>      

        <div style=" " style="margin-top:10px">
            <form method="GET" action="buscaBancos" >

          <h1 id="TituloEncuesta" style=" margin-top:0px">Encuestas</h1>
          <div style="text-align: left; margin-left: 110px;  margin-top: 20px" >
                                  <button type="button" class="btn btn-secondary" style="border-color: #ef384c" data-dismiss="modal">Close</button>

                             <button  title="Agregar Encuesta" data-toggle="modal"  type="button" data-target="#Modall" class="btn btn-default" id="ButtonCrearEncuesta "><img  src="/assets/img/addd.png" style=" width: 40px; height: 40px"></button>

          </div>
            <div class="" style="height: available; position: relative; margin-top: 20px;  margin-left: 30px; margin-right: 30px; margin-bottom: 100px; ">      

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
                            <td  style=""><%= e.getListaBancosTelefonicos().size()%> </td>
                            <td>
                                <form method="GET" action="EliminaBancos">
                                     <input type="text" name="DeleteEncuesta"style=" display:none;" value="<%= e.getNombreEncuesta() %>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/trash3.png" style=" width: 53px; height: 53px"></button>
                                </form>
                            </td>
                             <td>
                                <form method="GET" action="perfilEncuesta">
                                     <input type="text" name="nomEncu"style=" display:none;" value="<%= e.getNombreEncuesta() %>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/pencil7.png" style=" width: 50px; height: 50px;"></button>
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
} );
</script>