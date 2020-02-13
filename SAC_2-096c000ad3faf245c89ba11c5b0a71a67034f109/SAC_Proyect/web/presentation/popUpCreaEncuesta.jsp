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
                        <div class="form-group"><label>Nombre Encuesta</label>
                            <div class="input-group">
                                <textarea class="form-control" aria-label="With textarea" onkeypress="return validar(event, this);" name="NombreEncuesta" type="text" style="border-color: #ef384c" id="PlaceNameEncuesta" placeholder="Ejemplo: Idespo"></textarea>
                            </div>
                        </div>
                        <div class="form-group"><label>Tamaño Muestra de Encuesta</label><input class="form-control" onkeyUp="return ValNumero(this);" type="text" name="TamMuestra"style="border-color: #ef384c" id="PlaceMuestra" placeholder="Ejemplo: 2000"></div>

                    </div>
                    <div class="modal-footer">
                        <button  class="btn btn-light text-left" id="ButtonCrearEncuesta" onclick="return carga();" type="submit" style="">Crear</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <div id="cargando" style="visibility: hidden" class="spinner-grow text-danger" role="status">
                            <span class="sr-only"></span>
                        </div>
                        <input type="text" name="cbe"style=" display:none;" value="">

                    </div>
                </div>
            </div>

        </div>
    </form>
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
    function validar(e, Control) { // 1
        cambiaHolder(Control);
        tecla = (document.all) ? e.keyCode : e.which; // 2
        if (tecla === 8)
            return true; // 3
        patron = /[A-Za-z\s]/; // 4
        te = String.fromCharCode(tecla); // 5
        return patron.test(te); // 6

    }
    function cambiaHolder(Control) {
        Control.placeholder = "Ingrese Letras";
        //  if (document.Model.encuestaExciste(Control.value.toString())) {
        //      Control.placeholder = "Encuesta ya existe";
        //      Control.value = "";
        //  }
    }
    function carga() {
        control = document.getElementById("cargando");
        control.style = "visibility: visible";
    }
</script>