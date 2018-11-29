<%-- 
    Document   : ShowCart
    Created on : Nov 27, 2018, 6:27:49 PM
    Author     : JewlyTwin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Cart</title>
        <style>
            .bg{
                background-image: url("image/img7.jpg");
                background-position: center;
                background-attachment: fixed;
            }
            .font{
                font-family: 'Rubik', sans-serif;
            }
            .card{

                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
            }

        </style>
    </head>
    <body class="bgcolor font">
        <%@include file="/include/Header.jsp"%>
        <c:forEach items="${cart.itemsInCart}" var="line" varStatus="vs">
            <div class="container col-9 my-3">
                <div class="card flex-row flex-wrap">
                    <div class="card-header border-0">
                        <img src="image/${line.product.producttype}/${line.product.productname}.jpg" alt="" width="200px" height="200px">
                    </div>
                    <div class="card-block px-2 mx-4 my-4">
                        <h4>${line.product.productname}</h4>
                            <span><p>Price : ${line.salePrice}</p><p>Total : ${line.totalPrice}</p></span>
                            <span>
                                <a href="PlusAndMinus?quantity=minus&productid=${line.product.productid}"><button type="button" class="mx-3 btn btn-danger">-</button></a>
                                Quantity : ${line.quantity}
                                <a href="PlusAndMinus?quantity=plus&productid=${line.product.productid}"><button type="button" class="mx-3 btn btn-success">+</button></a>
                            </span>
                    </div>
                    <div class="w-100"></div>
                </div>
                <br>
            </div>
        </c:forEach>
        <div class="container">
            <div class="col-10 row my-3 align-items-center offset-1">
                <h1>Total Price  :  ${cart.totalPrice}</h1>
                <div class="ml-auto">
                    <a href="Order"><button type="button" class="mx-3 btn btn-primary">Check Out</button></a>
                </div>
            </div>
        </div>
        
    </body>
    
</html>
