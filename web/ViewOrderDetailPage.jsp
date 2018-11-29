<%-- 
    Document   : ViewOrderDetailPage
    Created on : Nov 29, 2018, 10:03:06 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="bgcolor font">
        <%@include file="/include/Header.jsp"%>
        <c:forEach items="${orderdelist}" var="d" varStatus="i">
            <div class="container col-9 my-3">
                <div class="card flex-row flex-wrap">
                    <div class="card-block px-2 mx-4 my-4">
                        <h4>No.${i.count}</h4>
                            Product Name: ${d.productid.productname}<br>
            Quantity: ${d.quantity}<br>
            Price:${d.totalprice}<br>
                    </div>
                    <div class="w-100"></div>
                </div>
                <br>
            </div>
        </c:forEach>
        
        
    </body>
    
</html>
