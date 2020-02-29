<%-- 
    Document   : BancosUsados
    Created on : 22/02/2020, 02:25:07 AM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encuestas</title>


    </head>
           

    <body>
        
           <table class="table table-bordered   " id=""style=" border: red">
          <tr>
              <td style="width: 33.3%" >
                 <div class="form-group" style="text-align: center; margin-top: 15%"><label class="reloj">Telefono Actual: <label>
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
        <table class="table table-bordered table-striped mb-0 " id="CitasTable"style="">
                   <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Banco Telefonico</th>
                           <th scope="col">Numero Celular</th>
                            <th scope="col">Intento</th>
                            <th scope="col">Fecha de Cita</th>
                            <th scope="col">Observacion</th>
                            <th scope="col">Seleccionar</th>

                            

                        </tr>
                    </thead>
                    <tbody>
                      

                        <% for (int i=1; i<=10;i++) {%>
                       


                        <tr style="height: 10px">
                            <td> <%= i%>   </td>
                            <td width="200">88888 </td>
                           <td width="200">88 88 8000 </td>

                            <td style=" ">2</td>
                            <td style=" ">23/04/200 12:00p.m</td>
                            <td style=" ">
                            <form method="GET" action="">
                                    <input type="text" name="Observacion"style=" display:none;" value="">

                                    <button type="submit" class="btn btn-default"><img  src="/assets/img/Notes.png" style=" width: 30%; height: 25%;"></button>
                                </form>
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
    </body>
</html>
<script>
    $(document).ready(function () {
        $('#CitasTable').DataTable({
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
    </script>