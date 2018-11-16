<%-- 
    Document   : EditProfile
    Created on : Nov 16, 2018, 1:50:43 AM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
    </head>
    <body>
        <h1>Edit Profile ::</h1>
        <form action="EditProfile" method="post">
            Username <input type="text" name="username" required/><br>
            Password <input type="text" name="pass" required/><br>
            First name <input type="text" name="fname" required><br>
            Last name <input type="text" name="lname" required><br>
            Telephone number <input type="text" name="tel" required><br>
            Address <input type="text" name="address" required><br>
            Date of Birth <input type="date" name="dob"><br>
            <input type="submit" value="Edit">
        </form>
    </body>
</html>
