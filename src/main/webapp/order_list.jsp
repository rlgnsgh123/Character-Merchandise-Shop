<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shopping.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sM_id = (String)session.getAttribute("sM_id");
	OrderService orderService = new OrderService();
	ArrayList<Order> orderList = orderService.list(sM_id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp"/>
		</div>			
		<div id="navigation">
			<jsp:include page="common_left.jsp"/>
		</div>			
		<div id="wrapper">
			<ol>
			<%
			for (Order order : orderList) {
			%>
			<tr>
			<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
			<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(order.getO_date())%></td>
			<td width=145 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_desc()%></td>
			<td width=136 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(order.getO_price())%></td>
			<td width=80 height=26 align=center bgcolor="ffffff" class=t1>
			<a href="order_detail.jsp?o_no=<%=order.getO_no()%>" class=m1>주문상세</a></td>
			</tr>
			<%
			}
			%>
		</ol>
			
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>