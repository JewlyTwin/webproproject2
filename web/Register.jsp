<%-- 
    Document   : Register
    Created on : Nov 15, 2018, 5:44:24 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register ::</h1>
        <form action="Register" method="post">
            Username <input type="text" name="username" required/><br>
            Password <input type="text" name="pass" required/><br>
            First name <input type="text" name="fname" required><br>
            Last name <input type="text" name="lname" required><br>
            Telephone number <input type="text" name="tel" required><br>
            Address <input type="text" name="address" required><br>
            Date of Birth <input type="date" name="dob" required><br>
            <input type="submit" value="Register">
            
        </form>
    </body>
</html>
