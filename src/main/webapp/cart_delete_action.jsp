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
CartService cartService = new CartService();

cartService.deleteCartAll(sM_id);

// int c_item_no=(int)session.getAttribute("c_item_no"); // ???
// cartService.deleteCartItem (c_item_no);

response.sendRedirect("cart_view.jsp");
	%>