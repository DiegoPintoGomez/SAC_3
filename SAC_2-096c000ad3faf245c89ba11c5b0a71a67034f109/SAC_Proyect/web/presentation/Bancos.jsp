<%@page import="sac.Logic.Bancos.Contacto"%>
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
<%@page import="java.util.List"%>
<%@page import="Conection.DaoBanco"%>
<%@page import="sac.Logic.Encuesta.Encuesta"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>Bancos Telefonicos</title>
        <%@include file="/presentation/Head.jsp"%>
        <% Encuesta encuesta = (Encuesta) session.getAttribute("encuestaActual");
            List<Contacto> Bancos = Model.Model.instance().getContacto_Encuesta(encuesta.getId());%>  


    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>



        <div class="container container-fluid" id="containerCrearEncuesta" style="height: 500px ">
            <div class="" style="height: available; position: relative; margin-top: 0px;  margin-left: 30px; margin-right: 30px; margin-bottom: 100px; "> 
            <h1 id="TituloEncuesta"> Bancos de <%= encuesta.getNombreEncuesta() %></h1>

            
                <table id="example" class="table table-bordered table-striped mb-0 " style=" ">

                    <thead>
                        <tr>
                            <th>Banco Telefonico</th>
                            <th>Numero Contacto</th>
                            <th>Llamada 1</th>
                            <th>Llamada 2</th>
                            <th>Llamada 3</th>

                            <th>Estado de Llamada</th>
                            <th>Observaciones</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%for (Contacto contacto : Bancos) {%>
                        <tr>
                            <td><%= contacto.getBase()%></td>
                            <td><%= contacto.getNumero_Telefono()%></td>

                            <td>Sin Realizar</td>
                            <td>Sin Realizar</td>
                            <td>Sin Realizar</td>


                            <td><%= contacto.getEstado()%></td>
                            <td><%= contacto.getNota()%> </td>

                        </tr>
                        <%}%>

                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Banco Telefonico</th>
                            <th>Numero de Contacto</th>
                            <th>Llamada 1</th>
                            <th>Llamada 2</th>
                            <th>Llamada 3</th>
                            <th>Estado de Llamada</th>
                            <th>Observaciones</t
                        </tr>
                    </tfoot>
                </table>
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