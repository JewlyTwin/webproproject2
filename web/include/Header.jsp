<%-- 
    Document   : Header
    Created on : Nov 8, 2018, 3:09:15 PM
    Author     : JewlyTwin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <title>JSP Page</title>
        <style>
          small {
            font-size: 12px;
            color: rgba(0, 0, 0, 0.4);
          }

          .center {
            text-align: center;
          }
          /* NAVIGATION */
          nav {
            width: 100%;
            margin: 0 auto;
            background: #fff;
            border-top: #dedede solid ; 
            border-bottom: #dedede solid ;
          }
          nav ul {
            list-style: none;
            text-align: center;
            margin-bottom: 0px;
          }
          nav ul li {
            display: inline-block;
          }
          nav ul li a {
            display: block;
            padding: 15px;
            text-decoration: none;
            color: #aaa;
            font-weight: 800;
            text-transform: uppercase;
          }
          nav ul li a,
          nav ul li a:after,
          nav ul li a:before {
            transition: all .5s;
          }
          nav ul li a:hover {
            color: #555;
          }
          

          /* SHIFT */
          nav.shift ul li a {
            position:relative;
            z-index: 1;
          }
          nav.shift ul li a:hover {
            color: #91640F;
          }
          nav.shift ul li a:after {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            width: 100%;
            height: 1px;
            content: '.';
            color: transparent;
            background: #F1C40F;
            visibility: none;
            opacity: 0;
            z-index: -1;
          }
          nav.shift ul li a:hover:after {
            opacity: 1;
            visibility: visible;
            height: 80%;
          }
          .font{
                font-family: 'Rubik', sans-serif;
          }
        </style>
    </head>
    <body class="font">
        <nav class="shift">
            <ul>
                <li><a href="listitem">Home</a></li>
                <!--<li><a href="#">About us</a></li>-->
                <li>
                    <c:if test="${cart!=null}">
                        <a href="CheckCart">Your Cart:(${cart.totalQuantity})</a>
                    </c:if>
                </li>
                <c:choose>
                    <c:when test="${cus != null}">
                        <li><a href="Favorite">Favorite</a></li>
                        <li><a href="Account">${cus.username}</a></li>
                        <li><a href="Logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="nav-link" href="Login">Login</a></li>
                        <li><a class="nav-link" href="Register">Register</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>

    </body>
</html>
