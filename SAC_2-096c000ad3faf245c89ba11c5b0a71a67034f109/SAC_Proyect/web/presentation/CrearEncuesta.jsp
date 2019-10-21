<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
         <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Crear Encuesta</title>
        <%@include file="/presentation/Head.jsp"%>
   

    </head>

    <body>
        <%@ include file="/presentation/Header.jsp" %>
       


        <div>

            <div class="container container-fluid" id="containerCrearEncuesta">

             <--form action="encuesta" method="post"-->
                 <form method="post">

                <div class="row">
                    <div class="col-md-12" id="CrearEncuesta">
                        <h1 class="">Creación de Encuesta</h1>
                            <div class="form-group"><label>Nombre Encuesta</label><input class="form-control" name="NombreEncuesta" type="text" style="border-color: #ef384c" id="PlaceNameEncuesta" placeholder="Ejemplo: Idespo"></div>
                            <div class="form-group"><label>Tamaño Muestra de Encuesta</label><input class="form-control" type="text" name="TamMuestra"style="border-color: #ef384c" id="PlaceMuestra" placeholder="Ejemplo: 2000"></div>
                            <button class="btn btn-primary" data-toggle="modal" id="Button1" type="button" data-target="#Modal">Crear</button>
                            <%@include file="/presentation/popUpCreaEncuesta.jsp" %>
                    </div>
                </div>
              </form>

            </div>

        </div>

        <%@ include file="/presentation/Footer.jsp" %>

    </body>

</html>