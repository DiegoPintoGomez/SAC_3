<%-- 
    Document   : Header
    Created on : 24/09/2019, 03:34:26 AM
    Author     : Chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-light navbar-expand-md sticky-top navigation-clean navbar-inverse navbar-fixed-top" id="topnav-a" style="background-color: #ffffff;">
    <div class="container">
        <div>
            <a class="navbar-brand" style="" href="#"> 
                <img id="LogoIdespo" src="/assets/img/logo.jpg" style="">
            </a>
            <button data-toggle="collapse"class="navbar-toggler" data-target="#navcol-1">
                <span class="navbar-toggler-icon"></span></button>
        </div>

        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav ml-auto" style="">
                <li class="nav-item" role="presentation">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" style="background-color: #ef384c;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Navegacion
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <form action="/presentation/ListaEncuestas.jsp"><button  class="dropdown-item" type="submit" style="color:#ef384c" uk-scroll="offset:50">Lista Encuestas</button></form>
                            <form action="/presentation/BarraLateral.jsp"><button class="dropdown-item" type="submit"style="color:#ef384c" uk-scroll="offset:50" >Barra Lateral</button></form>
                                <form action="/presentation/Operadoras.jsp"><button class="dropdown-item" type="submit"style="color:#ef384c" uk-scroll="offset:50" href="/presentation/Operadoras.jsp">Operadoras</button></form>
                        </div>
                    </div>
                </li>
                <%--li class="nav-item" role="presentation"><a class="nav-link" style="color:#ef384c" uk-scroll="offset:100" stile="fomt" href="/presentation/ListaEncuestas.jsp">Lista Encuestas</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" style="color:#ef384c" uk-scroll="offset:50" href="/presentation/BarraLateral.jsp">Barra Lateral</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" style="color:#ef384c" uk-scroll="offset:50" href="/presentation/Operadoras.jsp">Operadoras</a></li--%>

            </ul>
        </div>
    </div>
</nav>
