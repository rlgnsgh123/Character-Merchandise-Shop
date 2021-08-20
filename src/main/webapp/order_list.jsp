<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shopping.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>

<%
	
	OrderService orderService = new OrderService();
	ArrayList<Order> orderList = orderService.list(sM_id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/order.js"></script>
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
		<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80% \border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문번호</font></td>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문이름</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문날짜</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문가격</font></td>
										<td width=80 height=25 bgcolor="E6ECDE" align=center class=t1><font></font></td>
									</tr>
		
			<!-- order start -->
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
		<!-- order end -->
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>
									<input type ="button" value="계속 구경하기" onclick ="product_search_action()"> &nbsp;
									<input type ="button" value = "주문전체삭제" onclick="order_delete_all_action()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>