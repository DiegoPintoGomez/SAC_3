<%-- 
    Document   : BancosEncuestador
    Created on : 14/02/2020, 09:18:46 PM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Encuestador</title>
        <%@include file="/presentation/Head.jsp"%>
    </head>

    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <%@include file="/presentation/PopUpRegistraLlamada.jsp" %>




        <div style=" background-color: #fafafa; margin: 1rem; padding: 1rem; border: 2px; text-align: center;" class="bg-light CuadroPrincipal ">

    <nav>
    <div class="nav nav-tabs NavsEncabezado" id="nav-tab" role="tablist" style="">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">ID Banco: 00000</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Bancos Usados: 00</a>
    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Citas Pendientes: 00</a>
  </div>
</nav>
<div class="tab-content NavsCuerpo " id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
      <h2> Nombre Encuesta</h2>
      <table class="table table-bordered   " id=""style=" border: red">
          <tr>
              <td style="width: 33.3%" >
                 <div class="form-group" style="text-align: center; margin-top: 15%"><label class="reloj">Telefono Actual: <label>
                      <span class="label info "  style="margin-top: 10%" >88 55 33 22</span>      
                  </div>
                 



              </td> 
               <td style="width: 33.3%" >  
                    <div class="form-group" style="text-align: center; margin-top: 14%" ">
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
             <button type="button" id="" class="btn " data-toggle="modal" style="margin-left: 80%" data-target="#exampleModal">
              <img  src="/assets/img/next.png"  style=" width: 100%; height: 100%;">
                </button> 
             </td>
                                     
             </tr>                      
                                     
         </table>
        <table class="table table-bordered table-striped mb-0  stripe hover" id="ContacosdeBancos"style="">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Numero Celular</th>
                            <th scope="col">Intento</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Observacion</th>
                            <th scope="col">Guardar</th>

                            

                        </tr>
                    </thead>
                    <tbody>
                      

                        <% for (int i=1; i<=10;i++) {%>
                       


                        <tr style="height: 10px">
                            <td> <%= i%>   </td>
                            <td width="200">88 88 88 88 </td>
                            <td style=" ">2</td>
                            <td style=" ">OCUPADO</td>
                            <td style=" ">No contesta </td>
                            <td style=" ">Aqui va botton </td>

                        </tr>
                        <%}%>

                    </tbody>
                </table>  
      </iframe>
</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">22</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">65</div>
</div>





        <%@ include file="/presentation/Footer.jsp" %>
        </div>
    </body>

</html>
<script>
    $(document).ready(function () {
        $('#ContacosdeBancos').DataTable({
        
            responsive: true,
            
        
            "info":     false,
          
          
            language: {

                search: "Buscar: " ,
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