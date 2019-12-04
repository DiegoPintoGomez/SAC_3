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
        <a href="ListaEncuestas.jsp"></a>
        <%@include file="/presentation/popUpCreaEncuesta.jsp" %>
        <%List<Encuesta> list = (List<Encuesta>) request.getAttribute("listaEncuestas");%>      

        <div style=" " style="margin-top:10px">
            <form method="GET" action="buscaBancos" >

                <h1 id="TituloEncuesta" style=" margin-top:0px">Encuestas</h1>
                <div style="text-align: left; margin-left: 125px;  margin-top: 20px" >


                    <button  title="Agregar Encuesta" data-toggle="modal"  class="btn btn-light text-left" type="button" style=" background: #5fbaa7" data-target="#Modall" class="btn btn-default" id="ButtonCrearEncuesta ">Crear Nueva Encuesta</button>

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
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Desea eliminar la  encuesta?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" id="Button1" class="btn btn-secondary" data-dismiss="modal">NO</button>
                                                    <form method="GET" action="EliminaBancos">
                                                        <button type="submit" id="Button2" class="btn btn-primary">Sí</button>
                                                        
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="text" name="DeleteEncuesta"style=" display:none;" value="<%= e.getNombreEncuesta()%>">

                                    <button type="button" id="Button2" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><img  src="/assets/img/trash3.png" style=" width: 53px; height: 53px"></button>
                                </td>
                                <td>

                                    <form method="GET" action="perfilEncuesta">
                                        <input type="text" name="nomEncu"style=" display:none;" value="<%= e.getNombreEncuesta()%>">

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
    $(document).ready(function () {
        $('#example').DataTable({
            pageLength: 10,
            responsive: true,
            lengthMenu: [[10, 20, 100, -1], ["10", "20", "100", "Todos"]],
            language: {

                search: "Buscar: ",
                lengthMenu: "Elementos _MENU_  por pagina",

                info: "Mostrando  _START_  a _END_ de _TOTAL_ elementos",

                loadingRecords: "Cargando Elementos...",
                zeroRecords: "No se encontraron elementos que coincidan con los parametros de busqueda",
                emptyTable: "No hay elementos disponibles",
                paginate: {
                    first: "Primer",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Ultimo"
                },

            }



        });
    });
</script>