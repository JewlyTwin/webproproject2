<%-- 
    Document   : EditProfile
    Created on : Nov 16, 2018, 1:50:43 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
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
        <h1>Edit Profile ::</h1>
        <form action="EditProfile" method="post">
            Username <input type="text" name="username" value="${cus.username}" disabled/><br>
            Password <input type="password" name="pass" value="${cus.password}"/><br>
            First name <input type="text" name="fname" value="${cus.fname}"><br>
            Last name <input type="text" name="lname" value="${cus.lname}"><br>
            Telephone number <input type="text" name="tel" value="${cus.telno}"><br>
            Address <input type="text" name="address" value="${cus.address}"><br>
            Date of Birth <input type="date" name="dob" value="${cus.dob}"><br>
            <input type="submit" value="Edit">
        </form>
    </body>
</html>
