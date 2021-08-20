<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shopping.orderItem.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.order.Order"%>
<%@page import="com.itwill.shopping.order.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String sM_id = (String)session.getAttribute("sM_id");
	String o_noStr = request.getParameter("o_no");
	if(o_noStr==null|| o_noStr.equals("")){
		response.sendRedirect("order_list.jsp");
		return;
	}
	OrderService orderService = new OrderService();
	Order order = orderService.detail(sM_id, Integer.parseInt(o_noStr));

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
			<%--여기에 작업 하시면 됩니다. --%>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
											주문상세조회</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post" action="order_delete_action.jsp">
								<input type="hidden" name="o_no" value="<%=order.getO_no()%>">
								<table align="center" width="80%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문상세정보</caption>
									<tr>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문번호</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문일</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>주문자</font></td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>
										<font>비 고</font></td>
									</tr>
									
									
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_date()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=order.getM_id()%></td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
												<input type="submit" value="삭제">
										</td>
									</tr>
								</table>
									
								<br/>	
								<table align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 align=center bgcolor="E6ECDE" class=t1>제품명</td>
										<td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>수 량</td>
										<td width=166 height=25  align=center bgcolor="E6ECDE" class=t1>가 격</td>
										<td width=50 height=25  align=center bgcolor="E6ECDE" class=t1>비 고</td>
									</tr>
									
									<!-- order item start -->
									<%
									
									int tot_price=0;
									for(OrderItem orderItem:order.getOrderItemList()) {
									tot_price+=orderItem.getOi_amount()*orderItem.getProduct().getP_price();
										%>
									<tr>
										<td width=290 height=26 align=center  bgcolor="ffffff" class=t1>
										<a href='product_detail.jsp?p_no=<%=orderItem.getProduct().getP_no()%>'>
										<%=orderItem.getProduct().getP_name()%></a>
										</td>
										
										<td width=112 height=26 align=center  bgcolor="ffffff" class=t1>
										<%=orderItem.getOi_amount()%>
										</td>
										
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
										<%=new DecimalFormat("#,###").format(orderItem.getOi_amount()*orderItem.getProduct().getP_price())%>
										</td>
										<td width=50 height=26 align=center class=t1 bgcolor="ffffff"></td>
									</tr>
									
									<%} %>
									<!-- cart item end -->
									<tr>
										<td width=640 colspan=4 height=26  bgcolor="ffffff" class=t1>
										
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 : <%=new DecimalFormat("#,###.0").format(tot_price)%> 원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center> 
										&nbsp;&nbsp;<a href=order_list.jsp
										class=m1>주문목록</a>
										&nbsp;&nbsp;<a href=product_list.jsp
										class=m1>계속 쇼핑하기</a>

									</td>
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