<%-- 
    Document   : PaySucess.jsp
    Created on : Nov 22, 2018, 10:15:40 PM
    Author     : Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
         .mydiv {
                position:absolute;
                top: 50%;
                left: 50%;
                width:26em;
                height:19em;
                margin-top: -9.5em;
                margin-left: -13em;
                border: 1px solid #ccc;
                background-color: #f3f3f3;
            }
/*            .bg {
                margin-top: 22em;
                height: 100%; 
                background-repeat: no-repeat;
                background-size: cover;
                background-image: url("./image/bgindex.jpg");

            }*/
            .image {
                background-image: url("image/bgindex.jpg"); 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
                                background-size: cover;

            }
            .bg-image {
                background-image: url("image/bgindex.jpg"); 
                filter: blur(2px);
                height: 100%; 
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .bg-text {
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0, 0.4); /* Black w/opacity/see-through */
                color: white;
                font-weight: bold;
                border: 3px solid #f1f1f1;
                position: absolute;
                left: 50%;
                transform: translate(-50%, -155%);
                z-index: 2;
                width: 80%;
                padding: 20px;
                text-align: center;
            }
            .test {
                height: 20em;
            }
            .bgcolor {
                background-color: whitesmoke;
            }
        </style>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body class="image">
        <div class="test">
                
                 <div class="bg-image"></div>
                 <br><br>
            <div class="bg-text">
                <h1 style="font-size: 50px;">Thank you!</h1>
            </div>
        </div>
    </body>
</html>

