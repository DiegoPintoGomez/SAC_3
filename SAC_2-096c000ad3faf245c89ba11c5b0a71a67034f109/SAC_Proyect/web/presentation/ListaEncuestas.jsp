
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
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

        <div style="margin-top:10px">


            <h1 id="TituloEncuesta" style=" margin-top:0px">Encuestas</h1>
            <div style="text-align: left; margin-left: 125px;  margin-top: 20px" >


                <button  title="Agregar Encuesta" data-toggle="modal"  class="btn btn-light text-left" type="button" data-target="#Modall" class="btn btn-default" id="CrearEncuesta">Crear Nueva Encuesta</button>

            </div>
            <div class="" style="height: available; position: relative; margin-top: 20px;  margin-left: 40px; margin-right: 40px; margin-bottom: 100px; ">      

                <table class="table table-bordered table-striped mb-0 " id="example" style="">
                    <thead>
                        <tr>
                            <th id="colcorta" scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Muestra</th>
                            <th scope="col">Bancos</th>
                            <th scope="col">Bancos Activos</th>
                            <th scope="col">Eliminar</th>
                            <th scope="col">Crear Bancos</th>
                            <th scope="col"> Activar / Desactivar</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int i = 0;

                            for (Encuesta e : list) {
                                i++;
                        %>


                        <tr style="height: 10px">
                            <td> <%= i%>   </td>
                            <td width="200"> <%= e.getNombreEncuesta()%> </td>
                            <td style=" "><%= e.getMuestra()%> </td>
                            <td style=" "><%= e.getListaBancosTelefonicos().size()%> </td>
                            <td style=" "><%= BancosActivos(e)%> </td>
                            <td >

                                <button  type="button" onclick="enviar(<%=i%>)" data-toggle="modal" data-target="#Modalll" class="btn btn-default"><img  src="/assets/img/trash3.png"  style=" width: 50px; height: 50px;"></button>
                                <input type="text" id="enc<%=i%>" name="DeleteEncuesta" style=" display:none;" value="<%= e.getNombreEncuesta()%>">

                            </td>
                            <td width="200">

                                <form method="GET" action="perfilEncuesta">
                                    <input type="text" name="nomEncu" style=" display:none;" value="<%= e.getNombreEncuesta()%>">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/pencil7.png" style=" width: 50px; height: 50px;"></button>
                                </form>
                            </td>


                            <td width="200">
                                <%if (e.getActivo()) {%>
                                <form method="GET" action="">

                                    <input type="text" name="On/Off" style=" display:none;" value="<%= e.getNombreEncuesta()%>">
                                    <button type="submit" class="btn btn-default"> <img  src="/assets/img/ON.png" style=" width: 50px; height: 50px;"> </button>

                                </form>
                                <%} else {%>
                                <form method="GET" action="">

                                    <input type="text" name="On/Off" style=" display:none;" value="<%= e.getNombreEncuesta()%>">
                                    <button type="submit" class="btn btn-default"> <img  src="/assets/img/OFF.png" style=" width: 50px; height: 50px;"> </button>

                                </form>
                                <%}%>
                            </td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>

            </div>

        </div>


        <div class="modal fade" id="Modalll"   tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Desea eliminar la encuesta?
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="Button1" class="btn btn-secondary" data-dismiss="modal">NO</button>
                        <form method="GET" action="EliminaBancos">
                            <input type="text" id="valorEncuestaBorrar" name="valorEncuestaBorrar" style=" display:none;">
                            <button type="button" onclick="eliminar();" id="Button2" class="btn btn-primary">Sí</button>
                        </form>
                    </div>
                </div>
            </div>
        </div> 

    </body>

</html>
<%!
    private int BancosActivos(Encuesta encuesta) {
        int cantidad = 0;
        for (Bancos_Telefonicos e : encuesta.getListaBancosTelefonicos()) {
            if (e.isEstado() == true) {
                cantidad++;
            }
        }

        return cantidad;

    }

    private void DeleteEncuesta() {

    }
%>

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
        var llave = localStorage.getItem("encuesta_borrar_llave");
        localStorage.setItem("encuesta_borrar_llave", null);
        console.log(llave);
        insertar = document.getElementById("valorEncuestaBorrar");
        insertar.value = llave;
        formulario.submit();
    }
    function enviar(nombre) {
        console.log("Enviando solicitud al servlet...");
        formulario = document.getElementById("enc" + nombre);
        llave = formulario.value;
        console.log(llave);
        localStorage.setItem("encuesta_borrar_llave", llave);
        //formulario.submit();
    }


</script>
