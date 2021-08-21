<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String p_no = request.getParameter("p_no");
if (p_no == null || p_no.equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}
boolean login = false;
if (session.getAttribute("sM_id") != null) {
	login = true;
}
ProductService productService = new ProductService();
Product product = productService.getProduct(Integer.parseInt(p_no));
Product product2 = productService.getProduct(Integer.parseInt(p_no)+1);
Product product3 = productService.getProduct(Integer.parseInt(p_no)+2);
Product product4 = productService.getProduct(Integer.parseInt(p_no)+3);
Product product5 = productService.getProduct(Integer.parseInt(p_no)+4);

if (product == null) {
	out.println("<script>");
	out.println("alert('매진된 상품입니다')");
	out.println("location.href='product_list.jsp'");
	out.println("</script>");
	return;
}

%>   
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>제품 상세 페이지</title>
	
	<script type="text/javascript">
		function addCart() {
			if (<%=!login%>) {
				alert('로그인후 이용가능합니다');
				location.href = 'member_login_form.jsp';
			}else{
				var win = window.open('cart_add_pop.jsp','popup','width=300,height=150,top=150,left=150 ')
				document.add_cart_form.action = 'cart_add_pop.jsp';
				document.add_cart_form.target = 'popup';
				document.add_cart_form.method = 'POST';
				document.add_cart_form.submit();
			}
		}
		
		function buyNow() {
			if(<%= !login %>){
				alert('로그인후 이용가능합니다');
				location.href = "member_login_form.jsp"
			}else{
				document.product_detail_form.method = 'POST';
				document.product_detail_form.action = 'order_create_form.jsp';
				document.product_detail_form.submit();
			}
		}
		function goList(){
			location.href="product_list.jsp";
		}
	</script>
	
	
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

                    <h1 class="product-title"> <%=product.getP_name()%> </h1>
                    <br>

                    <div class="product-info">

                        <span class="product-id"><span class="strong-text">제품번호:</span> <%=product.getP_no()%></span>

                        

                        <span class="product-avilability"><span class="strong-text">구매가능:</span> 재고있음</span>

                    </div>

                    <p class="short-info"> 제품 상세정보 : <%=product.getP_desc()%> </p>

                    <div class="price">

                        <span> 제 품 가 격 : <%=product.getP_price()%>원</span>

                    </div>


                    <form name="add_cart_form" method="post" action="cart_add_pop.jsp">
					<h3>수량 :</h3>
					<select name="cart_qty" style="WIDTH: 40pt; HEIGHT: 90t">
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
					</select> 개 주문<br>
					(1인당 최대 5개 주문가능)<br>
					<br> <input type=button  style="background-color:blue; color:white;WIDTH: 200pt; HEIGHT: 50t" onclick="addCart();" value="장바구니에담기" /> 
						<input type="hidden" name=p_no value="<%=product.getP_no()%>">
						
				</form>
				<br>
				
<% 
int buyNum;
String buyNo = request.getParameter("cart_qty");
if(buyNo != null){
buyNum = Integer.parseInt(buyNo);
}else{
	buyNum = 1;
}
%>

	<form name="product_detail_form">
		<input type="hidden" name="p_no" value="<%=product.getP_no()%>" >
		<input type="hidden" name="p_qty" value="<%=buyNum%>" >   
	</form>

	<tr>
	<td align=center><input type="button" value="즉시 구매하기" onclick="buyNow();" style="background-color:#329632; color:white; WIDTH: 100pt; HEIGHT: 50t" >
					<input type="button" value="다른상품 둘러보기" onclick="goList();" style="background-color:#329632; color:white; WIDTH: 100pt; HEIGHT: 50t">
	</tr>


				
				<br>
				<br>

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

                            <h2> 제품 상세 설명</h2>

                            <p> <%=product.getP_desc()%> </p>

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

                    <li class="active"><a href="#related" data-toggle="tab">관 련 상 품</a></li>

                </ul>


                <div class="tab-content">

                    <div class="tab-pane active" id="related">
<%if(product2 != null ){
	
int moveNo = product2.getP_no();	
%>
                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-1.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title"><a href="single-product.jsp?p_no=<%=moveNo%>"><%=product2.getP_name() %></a></p>

                                        <p class="price">$ <%=product2.getP_price() %></p>

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
                        <%} %>
                        
<%if(product3 != null ){
int moveNo = product3.getP_no();
%>
                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-2.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title"><a href="single-product.jsp?p_no=<%=moveNo%>"><%=product3.getP_name() %></a></p>

                                        <p class="price"><%=product3.getP_price() %></p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>


                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

<%} %>
<%if(product4 != null ){
int moveNo = product4.getP_no();
%>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-2.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title"><a href="single-product.jsp?p_no=<%=moveNo%>"><%=product4.getP_name() %></a></p>

                                        <p class="price"><%=product4.getP_price() %></p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>


                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

<%} %>
<%if(product5 != null ){
int moveNo = product5.getP_no();
%>

                        <div class="col-md-3 col-sm-4">

                            <div class="single-product">

                                <div class="product-block">

                                    <img src="images/product-2.jpg" alt="" class="thumbnail">

                                    <div class="product-description text-center">

                                        <p class="title"><a href="single-product.jsp?p_no=<%=moveNo%>"><%=product5.getP_name() %></a></p>

                                        <p class="price"><%=product5.getP_price() %></p>

                                    </div>

                                    <div class="product-hover">

                                        <ul>

                                            <li><a href=""><i class="fa fa-cart-arrow-down"></i></a></li>


                                        </ul>

                                    </div>

                                </div>

                            </div>

                        </div>

<%} %>
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