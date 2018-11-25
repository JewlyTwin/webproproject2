<%-- 
    Document   : Payment
    Created on : Nov 20, 2018, 2:25:57 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Payment</h1>
        <form action="Payment" method="post">
            Card ID: <input type="text" name="cardid"/><br>
            Card Owner1: <input type="text" name="owner"/><br>
            EXP. Date: <input type="date" name="exp"/><br>
            CVV: <input type="text" name="cvv"/><br>
            <input type="submit" value="pay"/>
        </form>
    </body>
</html>
