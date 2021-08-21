<%@page import="com.itwill.shopping.cartItem.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>

<%
	
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("product_list.jsp");
	return;
}

String c_item_no_Str = request.getParameter("c_item_no");
String c_item_no_qty = request.getParameter("c_item_qty");
CartService cartService = new CartService();
if(c_item_no_qty.equals("0")){
	cartService.deleteCartItem(Integer.parseInt(c_item_no_Str));
} else {
	cartService.updateCart(sM_id, Integer.parseInt(c_item_no_Str), Integer.parseInt(c_item_no_qty));
}
response.sendRedirect("cart_view_update_qty.jsp"); /**/
	%>