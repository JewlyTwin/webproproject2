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
        <title>Wonder Fruit</title>
        <a href="ProductList.jsp"></a>
        <style>
            .bg{
                background-image: url("image/Backgroud-img3.jpg");
                background-position: right;
                background-repeat: no-repeat;
                background-attachment: fixed;

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
/*            .wrapper {
                display: flex;
                align-items: center;
                flex-direction: column; 
                justify-content: center;
                width: 100%;
                min-height: 100%;
                padding: 20px;
            }*/

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
                text-align: left;
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
            <h1>Favorite</h1>
        
        ${unfavcom}
        <div class="bg">
        <div class="container ">
            <div class="fadeIn">
                <div class="formContent">
                    <div class="col-12 ">
                        <div class="row">
                            <c:forEach items="${fav}" var="f" >
                                <div class="col-4">
                                    <div class="col-12 my-3">
                                        <div class="card" style="width: 290px;">
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
                        </div>
                    </div>
                </div>
           </div>
        </div>
        </div>
   
        
    </body>
</html>
