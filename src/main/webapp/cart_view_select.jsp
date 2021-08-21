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

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쇼핑몰 관리</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel=stylesheet href="css/styles.css" type="text/css">
			<link rel=stylesheet href="css/shop.css" type="text/css">
			<link rel=stylesheet href="css/cart.css" type="text/css">
			<style type="text/css" media="screen">
				</style>
		<script type="text/javascript">
		
			// js로 빼기
			function cart_delete(){
				document.cart_view_form.method = "jsp";
				document.cart_view_form.action = "cart_delete_action.jsp";
				document.cart_view_form.submit();
			}
			
			function cart_view_form_order_submit(){
				document.cart_view_form.method='POST';
				document.cart_view_form.buyType.value='cart';
				document.cart_view_form.action='order_create_form.jsp';
				document.cart_view_form.submit();
			}
			
			function cart_view_form_select_order_submit() {
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var isChecked = false;
				for (var i = 0; i < cart_item_no_check_list.length; i++) {
					if (cart_item_no_check_list.item(i).checked === true){
						document.cart_view_form.innerHTML += "<input type ='hidden' name = 'cart_item_no' values= '"+cart_item_no_check_list.item(i).value+"'>"
						isChecked = true;
					} // for - if end
				} // for end
				if (!isChecked){
					alert('제품을 선택해주세요.');
					return;
				} // if end
				document.cart_view_form.buyType.value = 'cart_select';
				document.cart_view_form.method='POST';
				document.cart_view_form.action='order_create_form.jsp';
				document.cart_view_form.submit();
			} // function cart_view_form_select_order_submit() end
			
			function cart_item_select_count(){
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var cart_item_check_selected_count = 0;
				for (var i = 0 ; i < cart_item_no_check_list.length; i++){
					if (cart_item_no_check_list.item(i).checked === true){
						cart_item_check_selected_count++;
					} // for - if end
				} // for end
				document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			}// function cart_item_selected_count() end
			
			</script>
		</head>
		
	<body onload="cart_item_select_count();" bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
		<form name="cart_view_form">
			<input type="hidden" name="buyType">
			</form>
		
		<!-- container Start -->
		<div id="container">
			<div id="header">
				<jsp:include page="common_top.jsp"/>
				</div>
			<div id="navigation">
				<jsp:include page="common_left.jsp"/>
				</div>
			
			<div id="wrapper">
				<div id="content">
					<table border=0 cellpadding=0 cellspacing=0>
						<tr>
							<td><br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td height="22">&nbsp;&nbsp;<b>쇼핑몰 - 장바구니 보기</b></td>
									</tr>
								</table>
							<div id='f'>
								<table align=center width=80% border=0 cellpadding=0 cellspacing=1 bgcolor="BBBBBB">
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
										<td width=60 height=26 align=center bgcolor="ffffff" class=t1><input type="checkbox" name="cart_item_no_check" onchange="cart_item_select_count();" value="<%=cartItem.getC_item_no()%>" checked="checked"></td>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='image/<%=cartItem.getProduct().getP_image()%>' width="34" height="28"/></td>
										<td width=210 height=26 align=center bgcolor="ffffff" class=t1><a href='product_detail.jsp?p_no=<%=cartItem.getProduct().getP_no()%>'><%=cartItem.getProduct().getP_name() %></a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cartItem.getC_item_qty()%></td>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,##0").format(cartItem.getProduct().getP_price()*cartItem.getC_item_qty()) %></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no" value="<%=cartItem.getC_item_no()%>">
												<input type="submit" value="삭제">
											</form>
										</td>
										</tr>
									<% } %>
									<!--  cart item end -->
									
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
								</div><!-- div - wrapper - content - f end -->
								<br/>
								
								<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=1 width=590>
								<tr>
									<td align=center> &nbsp; &nbsp;
									
										<a href="product_list.jsp" class=m1>계속 구경하기</a>&nbsp; &nbsp;
										<%if(cartList.size() >= 1){ %>
										<a href="javascript:cart_view_form_select_order_submit();" class=m1>
											총 <span style="font-weight: bold;" id="cart_item_select_count"></span>개 주문하기[주문폼]
											</a> &nbsp; &nbsp;
										<a href="javascript:cart_delete();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
										<% } %>
										</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>