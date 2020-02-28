<%@page import="java.util.List"%>
<%@page import="Conection.DaoOperadora"%>
<%@page import="sac.Logic.Bancos.Operadora"%>
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
<%@page import="sac.Logic.Encuesta.Encuesta"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <% Encuesta encuesta = (Encuesta) session.getAttribute("encuestaActual");%>  
        <title><%= encuesta.getNombreEncuesta()%> </title>
        <%@include file="/presentation/Head.jsp"%>

    </head>

    <body>

        <%@ include file="/presentation/Header.jsp" %>
        <%@include file="/presentation/popUpCreaBancos.jsp" %>


        <div class="  container-fluid">  

            <div class="container" id="ContanerTituloEncuesta">
                <h1 id="TituloEncuesta"><%=encuesta.getNombreEncuesta()%></h1>
            </div>
            <div class="row space-rows" id="RowCards">
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card" style="background-color: #293352;" ><span class="space"> <a href=""></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card" >Muestra</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div align-content: center class="card-body">
                            <p style="color: black;" class="card-text sub-text-color"><%=encuesta.getMuestra()%></p>
                            <p class="card-text cardbody-sub-text" id="muestra"></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="slide-right" data-aos-duration="950">
                        <div class="card-header" id="Card" style="background-color: #293352;">
                            <div class="cardheader-text">

                                <h4 id="heading-card">Total Bancos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>

                        <div class="card-body">
                            <p style="color: black;" class="card-text sub-text-color"><%=encuesta.getListaBancosTelefonicos().size()%></p>
                            <p class="card-text cardbody-sub-text" id="totalBancos"></p>

                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-up" data-aos-duration="950">
                        <div class="card-header cards-header-hover" style="background-color: #293352;"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card">Bancos Activos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p style="color: black;" class="card-text sub-text-color"><%=BancosActivos(encuesta)%></p>
                            <p class="card-text cardbody-sub-text" id="bancosActivos"></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card" style="background-color: #293352;"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card">Bancos  Inactivos  </h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p style="color: black;" class="card-text sub-text-color"><%=BancosInactivos(encuesta)%></p>
                            <p class="card-text cardbody-sub-text" id="bancosInactivos"></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card" style="background-color: #293352;"><span class="space"><a href="/presentation/Bancos.jsp"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card" style="font-size: 45px;">Turnos</h4>
                                <p id="cardheader-subtext"></p>

                            </div>
                        </div>
                        <div class="card-body">
                            <p style="color: black;" class="card-text sub-text-color">???</p>
                            <p class="card-text cardbody-sub-text" id="turnos"></p>
                        </div>
                    </div>

                </div>

            </div>


            <div class="container " id="ContanerButtonsEncuesta">

                <% if (encuesta.getListaBancosTelefonicos().isEmpty()) { %>
                <button class="btn btn-primary" data-toggle="modal" id="Button1" type="button" data-target="#Modal">Generar Numeros Telefonicos</button>
                <%} else { %>
                <button class="btn btn-primary" data-toggle="modal" disabled="true"  id="Button1" type="button" data-target="#Modal">Generar Numeros Telefonicos</button>
                <%}%>

                <button type="button" id="Button2" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Eliminar Encuesta
                </button>
                <%if (habilitar(encuesta) == "true"){%>
                <form id="Button2" method="GET" action="/presentation/Bancos.jsp">
                    <button disabled="true" type="submit" id="Button2" class="btn btn-primary">Ver Bancos Telefonicos</button>
                </form>
                <%} else {%>
                <form id="Button2" method="GET" action="/presentation/Bancos.jsp">
                    <button  type="submit" id="Button2" class="btn btn-primary">Ver Bancos Telefonicos</button>
                </form>
                <%}%>

            </div>
            <div class="modal fade" id="exampleModal"   tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Atención</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Desea eliminar la encuesta ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="Button1" class="btn btn-secondary" data-dismiss="modal">NO</button>
                            <form method="GET" action="eliEncuesPerfil">
                                <button type="submit" id="Button2" class="btn btn-primary">Sí</button>
                            </form>
                        </div>
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

    private int BancosInactivos(Encuesta encuesta) {
        int cantidad = 0;
        for (Bancos_Telefonicos e : encuesta.getListaBancosTelefonicos()) {
            if (e.isEstado() == false) {
                cantidad++;
            }
        }

        return cantidad;

    }

    String habilitar(Encuesta encuesta) {
        if (encuesta.getListaBancosTelefonicos().isEmpty()) {
            return "true";
        } else {
            return "false";
        }
    }


%>
<%--
<script>
    function encuestaValores(en) {
    if (en !== null) {
    var auxiliar = document.getElementById('muestra');
    auxiliar.value = en.getMuestra();
    var auxiliar = document.getElementById('TituloEncuesta');
    auxiliar.value = en.getNombreEncuesta();

    }
    }
    function list(encuesta) {
    var listado = document.getElementById("modBody");
    listado.innerHTML = "";
    Random r = new Random();
    r.setListaOperadoras((ArrayList<Operadora>) DaoOperadora.getAlloperadora());
    r.getListaOperadoras.forEach((p) =  > {
    row(listado, p);
    });
    }

    function row(listado, operadora) {
    var tr = document.createElement("tr");
    tr.setAttribute("rowOperadora", operadora.getId());
    tr.setAttribute("nombreOperadora", operadora.getNombre());
    tr.setAttribute("rMenor", operadora.getRangoMenor());
    tr.setAttribute("rMayor", operadora.getRangoMayor());
    tr.innerHTML = "<td>" + cliente.operadora.getNombre() + "</td>" +
    "<td>" + cliente.getRangoMenor() + "</td>" +
    "<td>" + cliente.operadora.getRangoMayor() + "</td>" +
    listado.appendChild(tr);
    }
</script> --%>
