<%-- 
    Document   : Account.jsp
    Created on : Nov 16, 2018, 1:24:45 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

    <h2>hi, <a href="Account">${cus.username}</a></h2>
    <hr>
    <b>Full Name</b>    ${cus.fname}  ${cus.lname}<br>
    <b>Tel No.</b>  ${cus.telno}<br>
    <b>Address</b>  ${cus.address}<br>
    <b>Date of Birth</b>    ${cus.dob}<br>
    <form action="EditProfile" method="get">
        <br><input type="submit" value="Edit Profile"/><br>
    </form>

</body>


</html>
