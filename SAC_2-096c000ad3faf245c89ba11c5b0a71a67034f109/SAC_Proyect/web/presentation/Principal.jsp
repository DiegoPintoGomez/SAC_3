<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Principal</title>
        <%@include file="/presentation/Head.jsp"%>
    </head>
    <body>
        
        <%@include file="/presentation/Header.jsp"%>
        <div class="row">
            <div class="col-md-12" id="CrearEncuesta">
                <div class="login-dark" >
                    <form method="post" >
                        <h2 class="sr-only" style=" " >LoginForm</h2>
                        <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
                        <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email"></div>
                        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
                        <div class="form-group"><a class="btn btn-primary btn-block" style="background-color: #ef384c" href="inicio">Log In</a></div><a class="forgot" href="#">Forgot your email or password?</a></form>
                </div>
            </div>
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <%@ include file="/presentation/Footer.jsp" %>
    </body> 

</html>
     

            
<%@ include file="/presentation/Footer.jsp" %>
    </body>

</html>
