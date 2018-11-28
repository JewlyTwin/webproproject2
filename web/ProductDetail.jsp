<%-- 
    Document   : ProductDetail
    Created on : Nov 18, 2018, 4:29:55 PM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <style>
            .bg{
                background-image: url("image/Backgroud-img.jpg");
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .image {
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center;
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
            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column; 
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
            }

            #formContent {
                -webkit-border-radius: 20px 20px 20px 20px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 100%;
                max-width: 550px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: center;
            }
            
            .card{
               -webkit-border-radius: 10px 10px 10px 10px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 90%;
                max-width: 500px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
            }
            
            .test2 {
                -webkit-border-radius: 10px 10px 10px 10px;
                border-radius: 20px 20px 20px 20px;
                background: #fff;
                padding: 30px;
                width: 90%;
                max-width: 500px;
                position: relative;
                padding: 0px;
                -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
                text-align: left;
            }
            /* Simple CSS3 Fade-in-down Animation */
            .fadeInDown {
                -webkit-animation-name: fadeInDown;
                animation-name: fadeInDown;
                -webkit-animation-duration: 1s;
                animation-duration: 1s;
                -webkit-animation-fill-mode: both;
                animation-fill-mode: both;
            }

            @-webkit-keyframes fadeInDown {
                0% {
                    opacity: 0;
                    -webkit-transform: translate3d(0, -100%, 0);
                    transform: translate3d(0, -100%, 0);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: none;
                    transform: none;
                }
            }

            @keyframes fadeInDown {
                0% {
                    opacity: 0;
                    -webkit-transform: translate3d(0, -100%, 0);
                    transform: translate3d(0, -100%, 0);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: none;
                    transform: none;
                }
            }

            /* Simple CSS3 Fade-in Animation */
            @-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
            @-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
            @keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

            .fadeIn {
                opacity:0;
                -webkit-animation:fadeIn ease-in 1;
                -moz-animation:fadeIn ease-in 1;
                animation:fadeIn ease-in 1;

                -webkit-animation-fill-mode:forwards;
                -moz-animation-fill-mode:forwards;
                animation-fill-mode:forwards;

                -webkit-animation-duration:1s;
                -moz-animation-duration:1s;
                animation-duration:1s;
            }

            .fadeIn.first {
                -webkit-animation-delay: 0.4s;
                -moz-animation-delay: 0.4s;
                animation-delay: 0.4s;
            }

            .fadeIn.second {
                -webkit-animation-delay: 0.6s;
                -moz-animation-delay: 0.6s;
                animation-delay: 0.6s;
            }

            .fadeIn.third {
                -webkit-animation-delay: 0.8s;
                -moz-animation-delay: 0.8s;
                animation-delay: 0.8s;
            }

            .fadeIn.fourth {
                -webkit-animation-delay: 1s;
                -moz-animation-delay: 1s;
                animation-delay: 1s;
            }

            /* Simple CSS3 Fade-in Animation */
            .underlineHover:after {
                display: block;
                left: 0;
                bottom: -10px;
                width: 0;
                height: 2px;
                background-color: #56baed;
                content: "";
                transition: width 0.2s;
            }

            .underlineHover:hover {
                color: #0d0d0d;
            }

            .underlineHover:hover:after{
                width: 100%;
            }

            h1{
                color:white;
            }

            /* OTHERS */

            *:focus {
                outline: none;
            } 

            #icon {
                width:30%;
            }
            .search{
                padding-left: 15em;
            }
            
        </style>
    </head>
    <body class="bgcolor">
        <div class="test">
            <div class="bg-image"></div>
            <div class="bg-text">
                <h1 style="font-size:50px">Wonder Fruit</h1>
                <h3>Shopping Fruit Online</h3>
            </div>
        </div>
       
        
        <%@include file="/include/Header.jsp"%> 
        <form class="form-inline my-2 my-lg-0" style="text-align: right;" action="Search" method="post">
            <h1>Product Detail <span class="search"><input class="form-control mr-sm-2  " type="text" name="search" placeholder="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button></span></h1>
            
                
            </form>
        <div class="bg">
        <div class="container ">
            
            <div class="wrapper fadeIn">
                 <div class="formContent">
                     
                     <div class="card" style="width: 350px; ">
                         <img class="image" src="image/${pro.producttype}/${pro.productname}.jpg" alt="${pro.productname} " height="200em;">
                        <div class="card-body">
                            <h5 class="card-title"><p>${pro.productname}</p></h5>
                            <p class="card-text">Type        : ${pro.producttype}</p>
                            <p class="card-text">Price       : ${pro.unitprice}</p>
                            <p class="card-text">Weight      : ${pro.weight}</p>
                            <p class="card-text">Storability : ${pro.storability}</p>
                            <b>Detail</b><p class="card-text">${pro.detail}</p>
                        </div>
                        <div class="card-body">
                            <a href="AddItemToCart?productid=${pro.productid}}" class="card-link">Add to cart</a>
                            <a href="Favorite?productid=${pro.productid}" class="card-link" >Favorite</a>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
        </div>
    </body>
</html>
