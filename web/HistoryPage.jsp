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
    </head>
    <body>
        <h1>History</h1>
        
        <c:forEach items="${pay}" var="p">
            
            <hr>
            PaymentID: ${p.paymentid}<br>
            OrderID: ${p.orderid.orderid}<br>
            Paid Date: ${p.paydate}<br>
            <hr>  
        </c:forEach>
                
    </body>
</html>
