<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.cartItem.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
	CartService cartService = new CartService();
	ArrayList<CartItem> cartList = cartService.getCartList(sM_id);

%>
<!DOCTYPE HTML>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>장바구니 목록</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- Google Font -->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
	    <!-- Theme Stylesheet -->
	    <link rel="stylesheet" href="css/style.css">
	    <link rel="stylesheet" href="css/responsive.css">
		</head>
	<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
		<form name="cart_view_form">
			<input type="hidden" name="buyType">
			</form>
		<div id="container"> <!-- div id check! :: view_*는 body onload=~ -->
			<div id="header">
				<jsp:include page="common_top.jsp"/>
				</div>		
			<div id="navigation">
				<jsp:include page="common_left.jsp"/>
				</div>			
			
			<div id = "content">
				<table border = 0 cellpadding = 0 cellspacing = 0 style="margin: 0 auto">
					<tr>
						<td><br/>
							
							<table stype="padding-left:10px" border = 0 cellpadding = 0 cellspacing = 0>
								<tr>
									<td height = "20">&nbsp;&nbsp;<b>쇼핑몰 - 장바구니 보기</b></td>
									</tr>
								</table>
							
							<div id ='f'>
								<table align = center width = 80% border = 0 cellpadding = 0 cellspacing = 1 bgcorlor = "BBBBBB">
									<tr>
										<td width=60 height=25  align="center" bgcolor="E6ECDE" class=t1><font>선택</font></td>
										<td width=40 height=25 align="center" bgcolor="E6ECDE" class=t1><font>이미지</font></td>
										<td width=210 height=25 align="center" bgcolor="E6ECDE" class=t1><font>이름</font></td>
										<td width=112 height=25 align="center" bgcolor="E6ECDE" class=t1><font>수 량</font></td>
										<td width=146 height=25 align="center" bgcolor="E6ECDE" class=t1><font>가 격</font></td>
										<td width=50 height=25 align="center" bgcolor="E6ECDE" class=t1><font>비 고</font></td>
										</tr>
									
									<%
									int priceSum = 0;
									for (CartItem cartItem : cartList){
										priceSum += cartItem.getProduct().getP_price()*cartItem.getC_item_qty();
									
									%>
									
									<tr>
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='images/<%=cartItem.getProduct().getP_image()%>' width="300" height="100"/></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a href='product_detail.jsp?p_no=<%=cartItem.getProduct().getP_no()%>'><%=cartItem.getProduct().getP_name()%></a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cartItem.getC_item_qty()%></td>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,##0").format(cartItem.getProduct().getP_price()*cartItem.getC_item_qty())%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="POST">
												<input type="hidden" name="c_item_no" value="<%=cartItem.getC_item_no()%>">
												<input type="submit" value="삭제">
												<!-- ★★★★★ :: 삭제 버튼 안 됨 (404) -->
											</form>
										</td>
									</tr>
									
									<% } %>
									
									<tr>
										<td width=640 colspan=6 height=26 class=t1 bgcolor="ffffff">
											<p align=right>
												<br/>
												<font color=#FF0000>총 금액 : <%=new DecimalFormat("#,##0").format(priceSum) %> 원
											</font>
											</p>
										</td>
									</tr>
									
									</table>
								</div>
								<br/>
								
								<table style="padding-left: 10px" border="0" cellpadding="0" cellspacing="1" width="590">
									<tr>
										<td align=center>&nbsp;&nbsp;
											<a href="product_list.jsp" class=m1>계속 구경하기</a>&nbsp;&nbsp;
											<%if(cartList.size()>=1){ %>
											<a href="javascript:cart_view_form_order_submit();" class=m1>총 <span style="font-weight: bold;" id="cart_item_select_count"><%=cartList.size() %></span>개 주문하기[주문폼]</a>
											<a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
											<!-- ★★★★★ :: 장바구니 비우기 안 됨(아예 답이 없음...) -->
											<% } %>
											</td>
										</tr>
									</table>
							
							</td>
						</tr>
					</table>
				</div>
			
			<div id="footer">
				<jsp:include page="common_bottom.jsp"/>
				</div>
			</div> <!-- Container end -->
			
			<script src="js/cart.js"></script>
			
		</body>
	</html>