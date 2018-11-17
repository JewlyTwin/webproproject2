<%-- 
    Document   : Register
    Created on : Nov 15, 2018, 5:44:24 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <a href="ProductList.jsp"></a>
        <style>
            .image {
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
            }
            .bg-image {
                background-image: url("image/bgindex.jpg"); 
                filter: blur(2px);
                height: 100%; 
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
              }
              .bg-text {
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
                color: white;
                font-weight: bold;
                border: 3px solid #f1f1f1;
                position: absolute;
                left: 50%;
                transform: translate(-50%, -155%);
                z-index: 2;
                width: 80%;
                padding: 20px;
                text-align: center;
            }
            .test {
                height: 20em;
            }
            .bgcolor {
                background-color: #F8B2A8;
            }
            
            
        </style>
    </head>
    <body class="bgcolor">
        
        <div class="test">
            <div class="bg-image"></div>
            <div class="bg-text">
                <h1 style="font-size:50px">Wonder Fruit</h1>
                <h3>Shopping Fruit Online</h3>
            </div>
        </div>

        <%@include file="/include/Header.jsp"%>
        
        <h1>Register ::</h1>
        <form action="Register" method="post">
            Username <input type="text" name="username" required/><br><br>
            Password <input type="password" name="pass" required/><br><br>
            First name <input type="text" name="fname" required><br><br>
            Last name <input type="text" name="lname" required><br><br>
            Telephone number <input type="text" name="tel" required><br><br>
            Address <input type="text" name="address" required><br><br>
            Date of Birth <input type="date" name="dob" placeholder="YYYY-MM-DD"><br><br>
            <input type="submit" value="Register">
        </form>
        <a href="Login">Login</a><br>
    </body>
</html>
