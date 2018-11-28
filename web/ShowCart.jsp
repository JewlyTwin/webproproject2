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
        <title>JSP Page</title>
        <style>
            
        </style>
    </head>
    <body>
        <%@include file="/include/Header.jsp"%>
        <div class="container">
            <div class="col-8 offset-2">
                <c:forEach items="${cart.itemsInCart}" var="line" varStatus="vs">
                    <div class="row align-items-center justify-content-center my-3">
                        <div class="col-12 col-md-3">
                            <img class="image">
                            <img width="100%"src="image/${line.product.producttype}/${line.product.productname}.jpg">
                        </div>
                        <div class="col-12 col-md-9">
                            <h4>${line.product.productname}</h4>
                            <span><p>Price : ${line.salePrice}</p><p>Total : ${line.totalPrice}</p></span>
                            <span>
                                <a href="PlusAndMinus?quantity=minus&productid=${line.product.productid}"><button type="button" class="mx-3 btn btn-danger">-</button></a>
                                Quantity : ${line.quantity}
                                <a href="PlusAndMinus?quantity=plus&productid=${line.product.productid}"><button type="button" class="mx-3 btn btn-success">+</button></a>
                            </span>
                        </div>
                    </div>
                </c:forEach>
                <div class="row my-3 align-items-center">
                    <h1>Total Price :: ${cart.totalPrice}</h1>
                    <div class="ml-auto">
                        <a href="Order"><button type="button" class="mx-3 btn btn-primary">Check Out</button></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
