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
                        <% int i = 0;

                            for (Operadora e : list) {
                                i++;%>


                        <tr>
                            <td> <%= i%>   </td>
                            <td> <%= e.getNombre()%> </td>
                            <td><%= e.getRangoMenor()%> </td>
                            <td><%= e.getRangoMayor()%> </td>
                            <td>
                                <button type="button" onclick="enviar(<%=i%>)" data-toggle="modal" data-target="#Modall2" class="btn btn-default"><img  src="/assets/img/trash3.png" style=" width: 53px; height: 53px"></button>
                                <input type="text" id="oper<%=i%>" style=" display:none;" value="<%= e.getNombre()%>">

                            </td>

                        </tr>
                        <%}%>

                    </tbody>
                </table>

            </div>

        </div>
        <div class="modal fade" id="Modall2"   tabindex="-1" role="dialog" aria-labelledby="Modall2" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Desea eliminar la operadora?
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="Button1" class="btn btn-secondary" data-dismiss="modal">NO</button>
                        <form method="GET" action="elimnaOperadora">
                            <input type="text" id="valorOperadoraBorrar" name="DeleteOperadora" style=" display:none;">
                            <button type="button" onclick="eliminar();" id="Button2" class="btn btn-primary">Sí</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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

    function eliminar() {
        console.log("Confirmado el borrado...");
        var formulario = event.target.parentElement;
        var llave = localStorage.getItem("operadora_borrar_llave");
        console.log(llave);
        insertar = document.getElementById("valorOperadoraBorrar");
        insertar.value = llave;
        formulario.submit();
    }
    function enviar(nombre) {
        console.log("Enviando solicitud al servlet...");
        formulario = document.getElementById("oper" + nombre);
        llave = formulario.value;
        console.log(llave);
        localStorage.setItem("operadora_borrar_llave", llave);
        //formulario.submit();
    }


</script>