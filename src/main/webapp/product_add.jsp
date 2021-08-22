<%@page import="com.itwill.shopping.product.Product"%>
<%@page import="com.itwill.shopping.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%ProductService productService = new ProductService();
	productService.insertProduct(new Product(0, "침침", 10000,"설명명",5,null,null));
//											번호,이름,  가격, 설명, 재고,날짜,이미지	

// 새로운 product 입력하려면 6번째줄에 원하는 값 넣고 실행하면 된다/
%>
