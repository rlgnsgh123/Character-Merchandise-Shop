<%@page import="com.itwill.shopping.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
OrderService orderService = new OrderService();
	
//int deleteOrder = orderService.delete(1);
//int deleteOrderById = orderService.deleteOrderById("customer2");
ArrayList<Order> orderList = orderService.list("customer1");
Order order1 = orderService.order1(2);
Order orderDetail = orderService.detail("customer1", 1);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderService_test</title>
</head>
<body>
<h1>주문 서비스 테스트</h1>
<ol>
<li>멤버 한 사람의 주문전체목록: <%=orderList %></li>
<li>멤버 한 사람의 주문 1개 보기: <%=order1 %></li>
<li>주문 한 개의 주문상세,제품정보 여러 개 보기: <%=orderDetail %></li>
</ol>
</body>
</html>