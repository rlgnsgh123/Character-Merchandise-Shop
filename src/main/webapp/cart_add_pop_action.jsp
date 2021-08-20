<%@page import="com.itwill.shopping.cartItem.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="login_check.jspf"%> <!-- sM_id 로그인 한 대상의 카트에만 추가할 수 잇게,, -->
<%	
// GET 방식 차단
	if (request.getMethod().equalsIgnoreCase("GET")) {
		response.sendRedirect("product_list.jsp");
		return;
	}
	
// 파라미터 받기...
	String p_no = request.getParameter("p_no");
	String cart_qty = request.getParameter("c_item_qty");
	CartService cartService = new CartService();
	cartService.addCart(sM_id, Integer.parseInt(p_no), Integer.parseInt(cart_qty));
%>
<!DOCTYPE html>	
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 확인</title>
		</head>
	<body>
		
		<button onclick="window.close();opener.location.reload();">쇼핑 계속하기</button>
		<button onclick="window.close();opener.location.href='cart_view.jsp';">장바구니로 이동하기</button>
		</body>
	</html>