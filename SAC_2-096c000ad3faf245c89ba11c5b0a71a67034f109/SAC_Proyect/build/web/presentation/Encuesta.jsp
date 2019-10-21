
<%@page import="sac.Logic.Bancos.Bancos_Telefonicos"%>
<%@page import="sac.Logic.Encuesta.Encuesta"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Idespo_copy </title>
        <%@include file="/presentation/Head.jsp"%>
    </head>

    <body>
        <% Encuesta encuesta = (Encuesta) session.getAttribute("encuestaActual");%>  
        <%@ include file="/presentation/Header.jsp" %>
        <div class="  container-fluid" id="DivEncuesta">
            <div class="container" id="ContanerTituloEncuesta">
                <h1 id="TituloEncuesta"><%=encuesta.getNombreEncuesta()%></h1>
            </div>
            <div class="row space-rows" id="RowCards">
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card" style=""><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card" >Muestra</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text sub-text-color"><%=encuesta.getMuestra()%></p>
                            <p class="card-text cardbody-sub-text" id="muestra"></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="slide-right" data-aos-duration="950">
                        <div class="card-header" id="Card"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card">Total Bancos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text sub-text-color"></p>
                            <p class="card-text cardbody-sub-text" id="totalBancos"><%=encuesta.getListaBancosTelefonicos().size()%></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-up" data-aos-duration="950">
                        <div class="card-header cards-header-hover"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card">Bancos Activos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text sub-text-color"></p>
                            <p class="card-text cardbody-sub-text" id="bancosActivos"><%=BancosActivos(encuesta)%></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card">Bancos Inactivos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text sub-text-color"></p>
                            <p class="card-text cardbody-sub-text" id="bancosInactivos"><%=BancosInactivos(encuesta)%></p>
                        </div>
                    </div>
                </div>
                <div class="col" id="columna">
                    <div class="card cards-shadown cards-hover" data-aos="flip-left" data-aos-duration="950">
                        <div class="card-header" id="Card"><span class="space"><a href="#"></a></span>
                            <div class="cardheader-text">
                                <h4 id="heading-card" style="font-size: 45px;">Turnos</h4>
                                <p id="cardheader-subtext"></p>
                            </div>
                        </div>
                        <div class="card-body">
                            <p class="card-text sub-text-color"></p>
                            <p class="card-text cardbody-sub-text" id="turnos"></p>
                        </div>
                    </div>

                </div>

            </div>


            <div class="container " id="ContanerButtonsEncuesta">
                <button class="btn btn-primary" data-toggle="modal" id="Button1" type="button" onclick="list(encuesta)" data-target="#Modal">Generar Numeros Telefonicos</button>
                <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalLabel">Operadoras Actuales</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" id="modBody">
                                <form id="rowOperadora">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Nombre: </label>
                                        <input required type=text id="nombreOperadora" class="form-control"maxlength="9"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Rango Menor: </label>
                                        <input required type=text id="rMenor" class="form-control"maxlength="9"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Rango Mayor: </label>
                                        <input required type=text id="rMayor" class="form-control"maxlength="9"/>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" id="Button2" type="button">Eliminar Encuesta</button>
            </div>
        </div>

        <%@ include file="/presentation/Footer.jsp" %>


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

%>
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
</script>