<%-- 
    Document   : popUpOperadoras
    Created on : 20/10/2019, 10:10:03 PM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title<%@page import="java.util.List"%>
<%@page import="sac.Logic.Bancos.Operadora"%>
<%@page import="Conection.DaoOperadora"%>
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

                <div class="table-responsive" style=" overflow: auto">
                    <%List<Operadora> lista = (List<Operadora>) DaoOperadora.getAlloperadora();%>
                    <table class="table table-striped table-bordered table-hover" style="border-color: #ef384c">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Rango Menor</th>
                                <th>Rango Mayor</th>


                            </tr>
                        </thead>

                        <tbody>
                            <%if (lista != null) {%>
                            <%for (Operadora s : lista) {%>

                            <tr>
                                <td>  <%= s.getNombre()%>  </td>
                                <td> <%= s.getRangoMenor()%>  </td>
                                <td> <%= s.getRangoMayor()%>  </td>


                            </tr>
                            <% }
                                }%>
                    </table>



                </div>
            </div>
            <div>
                <div class="alert alert-info" style="margin-left: 10px; margin-right: 10px" role="alert">
                    El tamano predeterminado del Banco telefonico es de 10 numeros, solamente si desea cambiarlo ingrese un numero.
                </div>

                <div class="form-group"><label>Numeros por banco</label><input class="form-control" onkeyUp="return ValNumero(this);" style="border-color: #ef384c"  size="4"name="NumerosPorBanco" type="text" id="NumerosPorBanco" placeholder="Actualmente 10"></div>
            </div>
            <div class="modal-footer">
                <form action="creaBancos" method="post">

                    <button type="button" class="btn btn-secondary" style="border-color: #ef384c" data-dismiss="modal">Close</button>

                    <button class="btn btn-light text-left" style="border-color: #ef384c" type="submit">Generar Bancos</button>
                    <input type="text" name="cbe"style=" display:none;" value="">
                </form>

            </div>
        </div>
    </div>

</div>
<script language="javascript" type="text/javascript">
    function Solo_Numerico(variable) {
    Numer = parseInt(variable);
    if (isNaN(Numer)) {
    return "";
    }
    return Numer;
    }
    function ValNumero(Control) {
    Control.value = Solo_Numerico(Control.value);
    Control.placeholder = "Ingrese un numero";
    }
    function validar(e) { // 1
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla === 8)
    return true; // 3
    patron = /[A-Za-z\s]/; // 4
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6
    }
</script>>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<div class="container container-fluid" id="containerCrearEncuesta">
    <form action="encuesta" method="post">
        <div class="modal fade" id="Modall" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Crear Encuesta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="modBody">
                        <div class="form-group"><label>Nombre Encuesta</label><input class="form-control" onkeypress="return validar(event, this);" name="NombreEncuesta" type="text" style="border-color: #ef384c" id="PlaceNameEncuesta" placeholder="Ejemplo: Idespo"></div>
                        <div class="form-group"><label>Tamaño Muestra de Encuesta</label><input class="form-control" onkeyUp="return ValNumero(this);" type="text" name="TamMuestra"style="border-color: #ef384c" id="PlaceMuestra" placeholder="Ejemplo: 2000"></div>
                        <div class="form-group"><label>Tamaño Muestra de Encuesta</label><input class="form-control" onkeyUp="return ValNumero(this);" type="text" name="TamMuestra"style="border-color: #ef384c" id="PlaceMuestra" placeholder="Ejemplo: 2000"></div>

                    </div>
                    <div class="modal-footer">


                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                       

                        <button  class="btn btn-light text-left" id="ButtonCrearEncuesta" type="submit" style="">Crear</button>
                         <input type="text" name="cbe"style=" display:none;" value="">

                    </div>
                </div>
            </div>

        </div>
    </form>
</div>