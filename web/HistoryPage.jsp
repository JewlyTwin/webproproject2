<%-- 
    Document   : HistoryPage
    Created on : Nov 20, 2018, 4:43:09 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <style>
            .bg{
                background-image: url("image/img9.jpg");
                background-position: center;
                /*                background-repeat: repeat-x;
                */                background-attachment: fixed;

            }
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
                background-color: whitesmoke;
            }
            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column; 
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
            }

            #formContent {
                -webkit-border-radius: 20px 20px 20px 20px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 100%;
                max-width: 550px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
            }

            .card{
                -webkit-border-radius: 10px 10px 10px 10px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 90%;
                max-width: 500px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
            }

            .test2 {
                -webkit-border-radius: 10px 10px 10px 10px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 90%;
                max-width: 500px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
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
        <h1>History</h1>
        <div class="bg">

            <c:forEach items="${pay}" var="p" varStatus="i">
                Payment No.: ${i.count}<br>
                Detail: <a href="ViewDetail?orderid=${p.orderid.orderid}"h><button id="myBtn">View</button></a><br>
                Paid Date: ${p.paydate}<br>
                <hr>  
            </c:forEach>

    </body>
</html>
