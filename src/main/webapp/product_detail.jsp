<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String p_no = request.getParameter("p_no");
if(p_no ==null || p_no.equals("")){
	response.sendRedirect("product_list.jsp");
	return;
}

boolean login = false;
if(session.getAttribute("sUserId") != null){
	login = true;
}

ProductService productService = new ProductService();
Product product = productService.getProduct(Integer.parseInt(p_no));





%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
</head>
<body>

<jsp:include page="common_top.jsp" />
<jsp:include page="common_left.jsp" />
<jsp:include page="common_bottom.jsp" />
dfffffffffffffff
</body>
</html>