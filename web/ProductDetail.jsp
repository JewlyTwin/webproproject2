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
                background-color: #F8B2A8;
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
        <h1>Product Detail</h1>

        <%@include file="/include/Header.jsp"%>
        <div class="container">
            <form class="form-inline my-2 my-lg-0" action="Search" method="post">
                <input class="form-control mr-sm-2" type="text" name="search" placeholder="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <div class="col-12 ">
                <div class="row">

                    <div class="col-4">
                        <div class="col-12 my-3">
                            <div class="card">
                                <img class="image" src="image/${pro.producttype}/${pro.productname}.jpg" alt="${pro.productname}" height="200em;">
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
        </div>
    </body>
</html>
