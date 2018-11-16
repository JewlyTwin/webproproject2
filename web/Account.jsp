<%-- 
    Document   : Account.jsp
    Created on : Nov 16, 2018, 1:24:45 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h2>hi, <a href="Account">${cus.username}</a></h2>
    <hr>
    <b>Full Name</b>    ${cus.fname}  ${cus.lname}<br>
    <b>Tel No.</b>  ${cus.telno}<br>
    <b>Address</b>  ${cus.address}<br>
    <b>Date of Birth</b>    ${cus.dob}<br>
    <form action="EditProfile" method="get">
        <br><input type="submit" value="Edit Profile"/><br>
    </form>
    
    <br><a href="Logout">Logout</a>
    
</html>
