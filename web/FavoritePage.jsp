<%-- 
    Document   : FavoritePage
    Created on : Nov 20, 2018, 11:54:07 AM
    Author     : Computer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <a href="ProductList.jsp"></a>
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

        <%@include file="/include/Header.jsp"%>
        <h1>Favorite</h1>
        Username: ${cus.username}<br>
        ${unfavcom}
        
        <c:forEach items="${fav}" var="f" >
                        <div class="col-4">
                            <div class="col-12 my-3">
                                <div class="card">
                                    <img class="image" src="image/${f.productid.producttype}/${f.productid.productname}.jpg" alt="${f.productid.productname}" height="200em;">
                                    <div class="card-body">
                                        <h5 class="card-title"><a href="ProductDetail?productid=${f.productid.productid}"><p>${f.productid.productname}</p></a></h5>
                                        <p class="card-text">${f.productid.detail}</p>
                                    </div>
                                    <div class="card-body">
                                        <a href="AddItemToCart?productid=${f.productid.productid}}" class="card-link">Add to cart</a>
                                        <a href="EditFav?favid=${f.favid}" class="card-link" >Unfavorite</a>
                                        <a href="ProductDetail?productid=${f.productid.productid}" class="card-link">Detail</a><br>
                                
                                    </div>
                                </div>
                            </div>
                        </div>
        </c:forEach>
                        
                   
   
        
    </body>
</html>
