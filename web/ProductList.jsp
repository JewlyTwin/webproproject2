<%-- 
    Document   : ProductList
    Created on : Nov 15, 2018, 1:37:44 PM
    Author     : JewlyTwin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wonder Fruit</title>
         <a href="ProductList.jsp"></a>
        <style>
             .bg{
                background-image: url("image/Backgroud-img.jpg");
                background-size: contain;
            }
            .search{
                padding-left: 50em;
                margin-top: 20px;
                margin-bottom: 5px;
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
                background-color: white;
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

            
        </style>
    </head>
    <body class="bgcolor font">
        <div class="test">
            <div class="bg-image"></div>
            <div class="bg-text">
                <h1 style="font-size:50px">Wonder Fruit</h1>
                <h3>Shopping Fruit Online</h3>
            </div>
        </div>

        <%@include file="/include/Header.jsp"%>
        <div class="bgcolor">
            <div class="container">
                <div class="col-12">
                    <form class="form-inline mt-3 mb-1" action="Search" method="post">
                        <div class="col-2 text-center">
                            <input class="form-check-input" type="radio" name="type" value="Dried">
                            Dried fruit
                        </div>
                        <div class="col-2 text-center">
                            <input class="form-check-input" type="radio" name="type" value="Jam">
                            Jam fruit
                        </div>
                        <div class="col-2 text-center">
                            <input class="form-check-input" type="radio" name="type" value="Pickled">
                            Pickled fruit
                        </div>
                        <div class="col-6 text-center">
                            <span class="">
                                <input class="form-control mr-sm-2" type="text" name="nameproduct" placeholder="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>            
                            </span>
                        </div>
                    </form>
                    <div class="row">
                        <c:forEach items="${products}" var="p" varStatus="i">
                            <div class="col-4">
                                <div class="col-12 my-3">
                                    <div class="card">
                                        <img class="image" src="image/${p.producttype}/${p.productname}.jpg" alt="${p.productname}" height="200em;">
                                        <div class="card-body">
                                            <h5 class="card-title"><p>${p.productname}</p></h5>
                                            <p class="card-text">${p.detail}</p>
                                        </div>
                                        <div class="card-body">
                                            <a href="AddItemToCart?productid=${p.productid}" class="card-link">Add to cart</a>
                                            <a href="AddFav?productid=${p.productid}" class="card-link" >Favorite</a>
                                            <a href="ProductDetail?productid=${p.productid}" class="card-link">Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>  
            </div>
        </div>
    </body>
</html>
