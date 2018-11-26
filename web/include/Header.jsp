<%-- 
    Document   : Header
    Created on : Nov 8, 2018, 3:09:15 PM
    Author     : JewlyTwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="listitem">Wonder fruit</a>
<!--            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>-->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Favorite">Favorite</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About us</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${cart!=null}">
                            <a class="nav-link" href="CheckCart">Your Cart:(${cart.totalQuantity})</a>
                        </c:if>
                    </li>
                    <c:choose>
                        <c:when test="${cus != null}">
                            <li class="nav-item">
                                <span class="nav-link">Hello, <a href="Account">${cus.username}</a></span> 
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Logout">Logout</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            Hello, &nbsp;<a href="Login">Guest</a>
                            &nbsp; &nbsp; &nbsp;<a href="Login">Login</a>
                            &nbsp; &nbsp; &nbsp;<a href="Register">Register</a>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>
    </body>
</html>
