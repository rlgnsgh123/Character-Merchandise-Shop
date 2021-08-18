<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
ProductService productService = new ProductService();
int num = productService.getProductCount();
ArrayList<Product> asc = productService.getProductListAsc();
ArrayList<Product> desc = productService.getProductListDesc();

Product product = productService.getProduct(1);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol>
<li><%= num %></li>
<li> <%= asc %></li> 
<li> <%= desc %></li> 
<li> <%= productService.insertProduct(new Product(0, "dd", 333, "qwer", 3, null, "aaaa")) %></li> 
<li><%= product %></li>


</ol>
</body>
</html>