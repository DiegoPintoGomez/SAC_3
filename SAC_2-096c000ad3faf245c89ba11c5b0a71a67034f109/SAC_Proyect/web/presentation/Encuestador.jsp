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
              <%@include file="/presentation/BancoActualEncuestador.jsp" %>

     
</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">22</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">65</div>
</div>





        <%@ include file="/presentation/Footer.jsp" %>
        </div>
    </body>

</html>
