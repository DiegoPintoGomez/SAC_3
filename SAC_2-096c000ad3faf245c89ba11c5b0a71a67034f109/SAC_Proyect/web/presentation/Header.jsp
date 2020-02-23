<%-- 
    Document   : Header
    Created on : 24/09/2019, 03:34:26 AM
    Author     : Chris
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav class="navbar navbar-light navbar-expand-md sticky-top navigation-clean navbar-inverse navbar-fixed-top" id="" style="background-color: #ffffff; padding-right: auto;padding-left: auto; ">
    <div class="container">
        <div>
            <a class="navbar-brand" style="" href="/presentation/Principal.jsp"> 
                <img id="LogoIdespo" src="/assets/img/logo.jpg" style="">
            </a>
            <button data-toggle="collapse"class="navbar-toggler" data-target="#navcol-1">
                <span class="navbar-toggler-icon"></span></button>
        </div>

        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="nav navbar-nav ml-auto" style="">
                <li class="nav-item" role="presentation">
                    <div class="dropdown" style="margin-right:15px">
                        <button class="btn btn-secondary dropdown-toggle" style="background-color: #ef384c;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Navegacion 
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                           <a class="dropdown-item" href="inicio" style="color:#ef384c" uk-scroll="offset:50">Encuestas</a>
                           <a class="dropdown-item" href="/presentation/BarraLateral.jsp" style="color:#ef384c" uk-scroll="offset:50">Barra Lateral</a></form>
                           <a class="dropdown-item" href="/presentation/Operadoras.jsp" style="color:#ef384c" uk-scroll="offset:50">Operadoras Telefonicas</a></form>
                           <a class="dropdown-item" href="/presentation/Bancos.jsp" style="color:#ef384c" uk-scroll="offset:50">Bancos  </a></form>
                           <a class="dropdown-item" href="/presentation/Encuestador.jsp" style="color:#ef384c" uk-scroll="offset:50">Encuestador  </a></form>


                        </div>
                    </div>
                    
                </li>
                
                
                 <li class="nav-item" role="presentation">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" style="background-color: #ef384c;" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Usuario
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                           <a class="dropdown-item" href="inicio" style="color:#ef384c" uk-scroll="offset:50">LogOut</a> <!-- R1 -->
                          
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
