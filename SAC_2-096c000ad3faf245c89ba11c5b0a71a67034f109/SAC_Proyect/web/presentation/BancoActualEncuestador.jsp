<%-- 
    Document   : BancoActualEncuestador
    Created on : 22/02/2020, 02:15:47 AM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encuestador</title>
        <%@include file="/presentation/Head.jsp"%>
    </head>
    <%@include file="/presentation/PopUpRegistraLlamada.jsp"%>

    <h2> Nombre Encuesta</h2>
    <table class="table table-bordered   " id=""style=" border: red">
        <tr>
            <td style="width: 33.3%" >
                <div class="form-group" style="text-align: center; margin-top: 15%"><label class="reloj">Telefono Actual: </label>
                    <span class="label info "  style="margin-top: 10%" >88 55 33 22</span>      
                </div>




            </td> 
            <td style="width: 33.3%" >  
                <div class="form-group" style="text-align: center; margin-top: 14%" >
                    <button type="button" id="" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Registrar Llamada
                    </button>

                </div>
            </td>
            <td style="width: 33.3%">
                <%@include file="/presentation/Clock.jsp" %>

            </td>
        </tr>


    </table>
    <table class="table table-bordered   " id=""style=" border: red; height: 10%">
        <tr>
            <td style="width: 50%">
                <button type="button" id="" class="btn " style="margin-right: 80%" data-toggle="modal" data-target="#exampleModal">
                    <img  src="/assets/img/back.png" style=" width: 100%; height: 100%;">  
                </button>
            </td>

            <td style="width: 50%">
                <button type="button" id="" class="btn " data-toggle="modal" style="margin-left: 80%; " data-target="#exampleModal">
                    <img  src="/assets/img/next.png"  style="width: 100%; height: 100%;">
                </button> 
            </td>

        </tr>                      

    </table>
    <table class="table table-bordered table-striped mb-0  stripe hover" id="ContactosdeBancos"style="">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Numero Celular</th>
                <th scope="col">Intento</th>
                <th scope="col">Estado</th>
                <th scope="col">Observacion</th>
                <th scope="col">Seleccionar</th>



            </tr>
        </thead>
        <tbody>


            <% for (int i = 1; i <= 10; i++) {%>



            <tr style="height: 10px">
                <td> <%= i%>   </td>
                <td width="200">88 88 88 88 </td>
                <td style=" ">2</td>
                <td style=" ">OCUPADO</td>
                <td style=" ">
                    <button type="button" onclick="enviar(<%=i%>)" data-toggle="modal" data-target="#Modal3"  class="btn btn-default"><img  src="/assets/img/Notes.png" style=" width: 30%; height: 25%;"></button>
                    <input type="text" id="obs<%=i%>" name="Observacion"style=" display:none;" value="observacion<%=i%>">
                </td>
                <td style=" ">
                    <form method="GET" action="">
                        <input type="text" name="SeleccionarContac"style=" display:none;" value="">
                        <button type="submit" class="btn btn-default"><img  src="/assets/img/selectContact.png" style=" width: 30%; height: 25%;"></button>
                    </form>
                </td>

                </td>

            </tr>
            <%}%>

        </tbody>
    </table> 
    <div style="text-align:right;    margin-top: 20px" >
        <form method="GET" action="">
            <input type="text" name="Observacion"style=" display:none;" value="">
            <button  title="Agregar Encuesta"  class="btn btn-light text-left" type="button" class="btn btn-default" id="CrearEncuesta"><h4>Nuevo Banco</h4></button>

        </form>


    </div> 
    <div class="modal fade" id="Modal3"   tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <h3 id="obserbPopText">

                </h3>

            </div>
        </div>
    </div>
</html>
<script>
    $(document).ready(function () {
        $('#ContactosdeBancos').DataTable({
            pageLength: 10,
            responsive: true,
            info: false,
            paginate: false,
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

    function enviar(nombre) {
        console.log("Enviando solicitud al servlet...");
        formulario = document.getElementById("obs" + nombre);
        llave = formulario.value;
        console.log(llave);
        insertar = document.getElementById("obserbPopText");
        insertar.textContent = llave;
        //formulario.submit();
    }

</script>