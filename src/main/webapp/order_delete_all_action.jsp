<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>   
<%

//멤버 한 사람의 주문 내역 전체 삭제 

if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("order_list.jsp");
	return;
}
OrderService orderService = new OrderService();
orderService.deleteOrderById(sM_id);
response.sendRedirect("order_list.jsp");



%>