<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();
ArrayList<Product> productList = productService.getProductListDesc();
%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 상품 리스트</title>
</head>
<body>
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


</body>
</html>