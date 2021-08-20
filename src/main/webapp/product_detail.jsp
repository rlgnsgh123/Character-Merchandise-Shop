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
	//sUserId인 이유??
	login = true;
}

ProductService productService = new ProductService();
Product product = productService.getProduct(Integer.parseInt(p_no));
if (product == null) {
	out.println("<script>");
	out.println("alert('매진된 상품입니다')");
	out.println("location.href='product_list.jsp'");
	out.println("</script>");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
</head>
<body>
	<jsp:include page="common_top.jsp" />
	<jsp:include page="common_left.jsp" />
	<script type="text/javascript">
		function addCart() {
			if (
	<%=!login%>
		) {
				alert('로그인후 이용가능합니다');
				location.href = 'member_login_form.jsp';
			}else{
				var win = window.open('cart_add_pop_action.jsp','popup','width=300,height=150,top=150,left=150 ')
				document.add_cart_form.method = 'POST';
				document.add_cart_form.action = 'cart_add_pop_action.jsp';
				document.add_cart_form.target = 'popup';
				document.add_cart_form.submit();
			}
		}
	</script>

	<div>제품상세보기</div>
	<table style="margin-left: 10px" border=0 width=80% height=376
		align=center>
		<tr valign=bottom>
			<td width=30% align=center class=t1><font size=3 color=black><b>주문하기</b></font></td>
			<td width=40% align=center class=t1><font size=3 color=black><b>제품명</b></font></td>
			<td width=30% align=center class=t1><font size=3 color=black><b>제품 상세정보</b></font></td>
		</tr>
		<tr width=100%>
			<td colspan=3 height=5><hr color=red></td>
		</tr>
		<tr width=100%>
			<td width=30% height=200 align=center class=t1>
				<form name="add_cart_form" method="post" action="cart_add_pop_action.jsp">
					수량 :
					<select name="cart_qty">
						<option value="1">1
						<option value="2">2
						<option value="3">3
						<option value="4">4
						<option value="5">5
					</select> 개 주문<br>
					(1인당 최대 5개 주문가능)<br>
					<br> 
					<br> <input type=button onclick="addCart();" value="장바구니에담기[계속쇼핑팝업]" /> 
						<input type="hidden" name=p_no value="<%=product.getP_no()%>">
						
				</form>
			</td>
			<td width=40% height=200 align=center><img border=0
				src='image/<%=product.getP_image()%>' width=120 height=200></td>
			<td width=90% height=200 class=t1>
				<ol type="disc">
					<li><b>제품명 : <%=product.getP_name()%>
					</b></li>
					<li><font color=blue>가격 : <%=product.getP_price()%>&nbsp;&nbsp;&nbsp;
					</font></li>
					<li><font color=black>제품 상세정보 : <%=product.getP_desc()%></font></li>
				</ol>
			</td>
		</tr>
		<tr>
			<td colSpan=3 height=21><hr color=red></td>
		</tr>
	</table>







	<jsp:include page="common_bottom.jsp" />
</body>
</html>