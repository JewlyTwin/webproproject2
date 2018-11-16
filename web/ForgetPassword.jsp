<%-- 
    Document   : ForgetPassword
    Created on : Nov 15, 2018, 11:11:39 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
    </head>
    <body>
        <h1>Find your Password</h1>
        Enter your username.
        <form action="ForgetPass" method="post">
            <input type="text" name="username" required/> <input type="submit" value="Send"/>
        </form>
    </body>
</html>
