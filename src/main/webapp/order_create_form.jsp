<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.cartItem.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@page import="com.itwill.shopping.cartItem.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
//주문생성 - 카트에서 주문, 카트에서 선택 주문, 상품에서 주문
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
}
String buyType = request.getParameter("buyType");
String p_noStr = request.getParameter("p_no");
String p_qtyStr = request.getParameter("p_qty");
String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");
if (buyType == null)
	buyType = "";
if (p_noStr == null)
	p_noStr = "";
if (p_qtyStr == null)
	p_qtyStr = "";
if (cart_item_noStr_array == null)
	cart_item_noStr_array = new String[]{};
CartService cartService = new CartService();
MemberService memberService = new MemberService();
ProductService productService = new ProductService();
ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
Member member = memberService.findMember(sM_id);
if (buyType.equals("cart")) {
	cartItemList = cartService.getCartList(sM_id);
} else if (buyType.equals("cart_select")) {
	for (String cart_item_noStr : cart_item_noStr_array) {
		cartItemList.add(cartService.getCartListItem(Integer.parseInt(cart_item_noStr)));
	}
} else if (buyType.equals("direct")) {
	Product product = productService.getProduct(Integer.parseInt(p_noStr));
	cartItemList.add(new CartItem(0, Integer.parseInt(p_qtyStr), member, product));
}
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>orderList</title>
<script type="text/javascript">
	function order_create_form_submit() {
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'order_create_action.jsp';
		document.order_create_form.submit();
	}
</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="common_left.jsp" />
		</div>
		<%--여기에 작업 하시면 됩니다. --%>
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content" style="width: 60%; margin: 0 auto">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
					<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
							<td width=250 height=26 align="center">&nbsp;&nbsp;<h3>주문/결제폼</h3>
								</tr>
							</table> <!--form-->
							<form name="order_create_form" method="post">
								<input type="hidden" name="buyType" value="<%=buyType%>">
								<input type="hidden" name="p_no" value="<%=p_noStr%>"> 
								<input type="hidden" name="p_qty" value="<%=p_qtyStr%>">
								<%
								for (String cart_item_noStr : cart_item_noStr_array) {
								%>
								<input type="hidden" name="cart_item_no"
									value="<%=cart_item_noStr%>">
								<%
								}
								%>
								
								<table align="center" width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">구매자정보</caption>
									<tr>
										<td width=290 height=25 align="center" bgcolor="E6ECDE"
											class=t1>아이디</td>
										<td width=130 height=25 align="center" bgcolor="E6ECDE" class=t1>이름</td>
										<td width=180 height=25 align="center" bgcolor="E6ECDE" class=t1>연락처</td>
										<td width=170 height=25 align="center" bgcolor="E6ECDE" class=t1>주소</td>
										<td width=50 height=25 align="center" bgcolor="E6ECDE" class=t1>비고</td>
									</tr>
									<tr>
										<td width=290 height=26 align="center" bgcolor="ffffff" class=t1><%=member.getM_id()%></td>
										<td width=130 height=26 align="center" bgcolor="ffffff" class=t1><%=member.getM_name()%></td>
										<td width=180 height=26 align="center" bgcolor="ffffff" class=t1><%=member.getM_phone()%></td>
										<td width=170 height=26 align="center" bgcolor="ffffff" class=t1><%=member.getM_address()%></td>
										<td width=50 height=26 align="center" bgcolor="ffffff" class=t1></td>
									</tr>
								</table>

								<br />

								<table align="center" width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">주문제품목록</caption>
									<tr>
										<td width=290 height=25 bgcolor="E6ECDE" align="center" class=t1>제품명</td>
										<td width=112 height=25 bgcolor="E6ECDE" align="center" class=t1>수량</td>
										<td width=166 height=25 bgcolor="E6ECDE" align="center" class=t1>가격</td>
										<td width=50 height=25 bgcolor="E6ECDE" align="center" class=t1>비고</td>
									</tr>
									<%
									int tot_price = 0;
									for (CartItem cart : cartItemList) {
										tot_price += cart.getC_item_qty() * cart.getProduct().getP_price();
									%>
									<!-- cart item start -->
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align="center" bgcolor="ffffff" class=t1><%=cart.getC_item_qty()%></td>
										<td width=166 height=26 align="center" bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(cart.getC_item_qty() * cart.getProduct().getP_price())%>
										</td>
										<td width=50 height=26 align="center" bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- cart item end -->
									<%}%>					
									<tr>
										<td width=640 colspan=4 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 : <%=new DecimalFormat("#,###").format(tot_price)%>원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form> <br/><br/><br/>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp; <a
										href="javascript:order_create_form_submit();" class=m1>구매/결제하기</a>
										&nbsp;&nbsp;<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<br />
			<br />
			<br />
			<br />
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<jsp:include page="common_bottom.jsp" />
		</div>
	</div>
</body>
</html>