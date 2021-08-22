<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>제품 상세 페이지</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<!-- Google Font -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <!-- Theme Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>

	<!-- top_bar start -->
	<jsp:include page="common_top.jsp"/>
	<!-- top_bar end -->
	
	<!-- left(nav_bar) start -->
	<jsp:include page="common_left.jsp"/>
 	<!-- left(nav_bar) end -->

    <div class="breadcumbs">

        <div class="container">

            <div class="row">

                <span>Home > </span>

                <span>굿즈 > </span>

                <span>제품명</span>

            </div>

        </div>

    </div>  

    <div class="short-description">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <div class="product-thumbnail">


                        <div class="col-md-10 col-sm-10 col-xs-10">

                            <div class="thumb-main-image"><a href=""><img src="images/single-product-1.jpg" alt=""></a></div>

                        </div>

                    </div>

                    <div class="clearfix"></div>

                </div>

                <div class="col-md-6">

                    <h1 class="product-title"> 제 목 </h1>

                    <div class="product-info">

                        <span class="product-id"><span class="strong-text">제품번호:</span> get번호</span>

                        

                        <span class="product-avilability"><span class="strong-text">구매가능:</span> 재고있음</span>

                    </div>

                    <p class="short-info"> 제 품 설 명  제 품 설 명    제 품 설 명  제 품 설 명 </p>

                    <div class="price">

                        <span>$ 제 품 가 격</span>

                    </div>

                    <form action="" class="purchase-form">

                       <div class="qt-area">

                           <i class="fa fa-minus"></i>

                           <input name="quantity" class="qt" value="1">

                           <i class="fa fa-plus"></i>

                       </div>

                        

                        <button class="btn btn-theme" type="submit">카트에 제품담기</button>

                    </form>

                    <p><span class="strong-text">카테고리 : </span> 카카오 굿즈</p>

                </div>

            </div>

        </div>

    </div> 

    <div class="container">

        <div class="row">

            <div class="single-product-tabs">

                <ul class="nav nav-tabs nav-single-product-tabs">

                    <li class="active"><a href="#description" data-toggle="tab">Description</a></li>

                    <li><a href="#reviews" data-toggle="tab">Reviews</a></li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="description">

                        <div class="product-desc">

                            <h2>또 제품 설명</h2>

                            <p> 제품 설명 어쩌구 </p>

                        </div>

                    </div>

                    <div class="tab-pane" id="reviews">

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="container">

        <div class="row">

            <div class="related-items">

                <ul class="nav nav-tabs nav-single-product-tabs">

                    <li class="active"><a href="#related" data-toggle="tab">Related Products</a></li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane active" id="related">

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-1.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">2번제품 제품명</p>

                                        <p class="price">$ 2번제품 제품가격</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>
											<!-- 이거는 카트에 담기랑 연결 -->

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-2.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">2번제품 제품명</p>

                                        <p class="price">2번제품 제품가격</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>


                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-3.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">2번제품 제품명</p>

                                        <p class="price">$ 2번제품 제품가격</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-4.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title">2번제품 제품명</p>

                                        <p class="price">2번제품 제품가격</p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>

                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
	<!-- common_bottom start -->
	<jsp:include page="common_bottom.jsp"/>
	<!-- common_bottom end -->

	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="js/script.js"></script>

</body>

</html>