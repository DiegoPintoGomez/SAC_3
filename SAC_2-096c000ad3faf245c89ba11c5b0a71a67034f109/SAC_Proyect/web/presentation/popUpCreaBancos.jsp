<%@page import="java.util.List"%>
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
                
                <div class="alert alert-info " style="margin-left: 10px; margin-right: 10px" role="alert">
                    Para agregar, editar o eliminar Operadoras Telefonicas ingrese<a title="Los Tejos" href="/presentation/Operadoras.jsp" style="margin-left: 10px;"   > aqui</a>
                </div>
                <div class="alert  alert-danger" style="margin-left: 10px; margin-right: 10px" role="alert">
                    El tamano predeterminado del Banco telefonico es de 10 numeros, solamente si desea cambiarlo ingrese un numero.
                </div>

                <div class="form-group"><label>Numeros por banco</label><input class="form-control" onkeyUp="return ValNumero(this);" style="border-color: #ef384c"  size="4"name="NumerosPorBanco" type="text" id="NumerosPorBanco" placeholder="Actualmente 10"></div>
            </div>
            <div class="modal-footer">
                <form action="creaBancos" method="post">
        
                    <button class="btn btn-light text-left" onclick="return carga();" style="border-color: #ef384c" type="submit">Generar Bancos</button>
                    <button type="button" class="btn btn-secondary" style="border-color: #ef384c" data-dismiss="modal">Close</button>
                    <div class="spinner-grow text-danger" id="cargando" style="visibility: hidden" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
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
    function carga(){
        control = document.getElementById("cargando");
        control.style = "visibility: visible";
    }
</script>