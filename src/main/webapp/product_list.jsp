<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();
ArrayList<Product> productList = productService.getProductListDesc();
ArrayList<Product> productList2 = productService.getProductListDesc();
%>
 
    
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>shopping</title>
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


<%--   
상품 리스트<br>
<%
for(Product product : productList){
%>
<a href="product_detail.jsp?p_no=<%=product.getP_no()%>"><%=product.getP_name() %></a>
<%}%>
<br>
<%
for(Product product : productList){
%>
<a href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img src="image/<%=product.getP_image()%>" border="0"></a>
<%}%>
<br>
<%
for(Product product : productList){
%>
<%= product.getP_price() %>
<%}%>

--%>
	<jsp:include page="common_top.jsp"/>
	<jsp:include page="common_left.jsp"/>
	
								<div id ='f' style="width: :60%; margin: 0 auto;">
									<table align = center border = 0 cellpadding = 0 cellspacing = 1 bgcorlor = "BBBBBB">
										<tr>
											<td width=250 height=25 align="center" bgcolor="E6ECDE" class=t1><font>이미지</font></td>
											<td width=250 height=25 align="center" bgcolor="E6ECDE" class=t1><font>상품명</font></td>
											<td width=250 height=25 align="center" bgcolor="E6ECDE" class=t1><font>가 격</font></td>
										</tr>				
										<%
										int priceSum = 0;
										for (Product product2 : productList2){						
										%>					
										<tr>
											<td align=center bgcolor="ffffff" class=t1><a href='product_detail.jsp?p_no=<%=product2.getP_no()%>'><img src='images/<%=product2.getP_image()%>' width="150" height="150"/></a></td>
											<td align=center bgcolor="ffffff" class=t1><a href='product_detail.jsp?p_no=<%=product2.getP_no()%>'><%=product2.getP_name()%></a></td>
											<td align=center bgcolor="ffffff" class=t1><%=product2.getP_price()%></td>		
										</tr>
										
										<% } %>
									</table>		
								</div><br/><br/>
		
	<jsp:include page="common_bottom.jsp" />
</body>
</html>