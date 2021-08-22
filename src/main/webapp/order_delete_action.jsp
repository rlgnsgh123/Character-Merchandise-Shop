<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>       
<%

	//주문 1개 삭제 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("order_list.jsp");
		return;
	}
	String j_noStr=request.getParameter("o_no");
	OrderService orderService=new OrderService();
	orderService.delete(Integer.parseInt(j_noStr));
	response.sendRedirect("order_list.jsp");
%>