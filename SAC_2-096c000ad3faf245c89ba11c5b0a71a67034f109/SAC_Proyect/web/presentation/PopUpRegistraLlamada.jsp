    <div class="modal fade" id="exampleModal"   tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Registrar Llamada</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                                        <div class="form-group">
                                                <label for="sel1">Seleccione Estado </label>
                                                <select class="form-control" id="sel1"  name="selectSoli">
                                                  

                                            
                                                <option value="Ocupado">Ocupado </option>
                                                <option value="Finalizado"> Finalizado</option>
                                                <option value="PorVerificar"> Cita</option>


                                                 
                                                </select>
                                            </div>
                            <div class="form-group"><label>Observacion</label>
                            <div class="input-group">
                                <textarea class="form-control" aria-label="With textarea"  name="NombreEncuesta" type="text" style="border-color: #ef384c" id="Observacion"></textarea>
                            </div>
                        </div>
                            
                                         <%@include file="/presentation/DataPicker.jsp" %>

                            
                            <div class="modal-footer">
                                <button type="button" id="Button1" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                <form method="GET" action="eliEncuesPerfil">
                                    <button type="submit" id="Button2" class="btn btn-primary">Guardar</button>
                                </form>
                            </div>
                        </div>
                    </div>
  </div>