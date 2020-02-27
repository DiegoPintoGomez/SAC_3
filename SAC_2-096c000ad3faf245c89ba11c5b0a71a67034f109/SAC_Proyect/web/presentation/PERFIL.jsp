<%-- 
    Document   : BancosEncuestador
    Created on : 14/02/2020, 09:18:46 PM
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

        <body>
            <%@ include file="/presentation/Header.jsp" %>





            <div style=" background-color: #fafafa; margin: 1rem; padding: 1rem; border: 2px; text-align: center;" class="bg-light CuadroPrincipal ">

                <nav>
                    <div class="nav nav-tabs NavsEncabezado" id="nav-tab" role="tablist" style="">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Encuestas Activas</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Mi informacion Personal</a>
                        <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Citas Pendientes: 00</a>
                    </div>
                </nav>
                <div class="tab-content NavsCuerpo " id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                          <table class="table table-bordered   " id=""style=" border: red; height: 10%">
        <tr>
            <td style="width: 50%">
                <button type="button" id="" class="btn " style="margin-right: 80%" data-toggle="modal" data-target="#exampleModal">
                    <img  src="/assets/img/back.png" style=" width: 100%; height: 100%;">  
                </button>
            </td>

            <td style="width: 50%">
                <button type="button" class="btn " data-toggle="modal" style="margin-left: 80%; " data-target="#exampleModal">
                    <img  src="/assets/img/next.png"  style="width: 100%; height: 100%;">
                </button> 
            </td>

        </tr>                      

    </table>
    <table class="table table-bordered table-striped mb-0  stripe hover" id="ContactosdeBancos" style="">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Encuesta</th>
                <th scope="col">Ingresar</th>
       
            </tr>
        </thead>
        <tbody>


            <% for (int i = 1; i <= 2; i++) {%>



            <tr style="height: 10px">
                <td> <%= i%>   </td>
                <td width="200">EJEMPLO </td>
             
                <td style=" ">
                    <form method="GET" action="">
                        <input type="text" name="SeleccionarContac" style=" display:none;" value="">
                        <button type="submit" class="btn btn-default"><img  src="/assets/img/selectContact.png" style=" width: 30%; height: 25%;"></button>
                    </form>
                </td>

               

            </tr>
            <%}%>

        </tbody>
    </table> 


                    </div>

                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <%@ include file="/presentation/BancosUsados.jsp" %>
                    </div>

                    <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                        <%@ include file="/presentation/CitasPendientes.jsp" %>

                    </div>

                </div>





                <%@ include file="/presentation/Footer.jsp" %>
            </div>
        </body>

    </html>
