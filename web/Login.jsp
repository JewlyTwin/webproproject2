<%-- 
    Document   : Login
    Created on : Nov 15, 2018, 5:28:55 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login ::</h1>
        
        <form action="Login" method="post">
            Username <input type="text" name="username" required/><br>
            Password <input type="text" name="pass" required/><br>
            <span style="color: red"/>${wrong} <br>
            <input type="submit" value="Login"/><br>
            
        </form>
            
            <a href="ForgetPass">Forget your password? </a><br>
            <a href="Register">Register</a><br>
    </body>
</html>
