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
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>orderList</title>
<script type="text/javascript" src="js/order.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<!-- Google Font -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <!-- Theme Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
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
			<div id="content" style="width:60%; margin: 0 auto">
				<table style="width:60%; margin: 0 auto" border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br/>
							<table border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td width=250 height=26 align="center">&nbsp;&nbsp;<h3>주문 목록</h3></td>						
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align="center" width=80% \border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=200 bgcolor="E6ECDE" align=center ><font>주문번호</font></td>
										<td width=150 bgcolor="E6ECDE" align=center ><font>주문날짜</font></td>
										<td width=150 bgcolor="E6ECDE" align=center ><font>제품명</font></td>
										<td width=140 bgcolor="E6ECDE" align=center ><font>주문가격</font></td>
										<td width=100 bgcolor="E6ECDE" align=center ><font>비고</font></td>
									</tr>
								</table>		
							</form>
							<table align="center" width=80% \border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">			
								<!-- order start -->
								<%
								for (Order order : orderList) {
								%>
								<tr>
								<td width=200 height=26 align= "center" bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
								<td width=112 height=26 align="center" bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(order.getO_date())%></td>
								<td width=145 height=26 align="center" bgcolor="ffffff" class=t1><%=order.getO_desc()%></td>								
								<td width=136 height=26 align= "center" bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(order.getO_price())%></td>
								<td width=80 height=26 align="center" bgcolor="ffffff" class=t1>
								<a href="order_detail.jsp?o_no=<%=order.getO_no()%>" class=m1>주문상세</a></td>
								</tr>
								<%
								}
								%>
							<!-- order end -->
							</table>
							<br/><br/>
							<table border="0" cellpadding="0" cellspacing="1" width="700" >
								<tr>
									<td align="center">
									<input type ="button" value="계속 구경하기" onclick ="product_search_action()"> &nbsp;
									<input type ="button" value = "주문전체삭제" onclick="order_delete_all_action()"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div><br/><br/><br/><br/>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<br/><br/><br/><br/><br/><br/><br/><br/>
		<!--wrapper end-->
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>