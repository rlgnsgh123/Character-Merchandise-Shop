<%@page import="com.itwill.shopping.cartItem.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "login_check.jspf" %>

<%
// GET ignore
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}
// Action
	String c_item_no_Str = request.getParameter("c_item_no");
	CartService cartService = new CartService();
	cartService.deleteCartItem(Integer.parseInt(c_item_no_Str));
	
	response.sendRedirect("cart_view.jsp");
%> 