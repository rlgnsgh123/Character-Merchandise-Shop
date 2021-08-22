<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %> 
<%
	session.invalidate(); //세션 무효(로그아웃)
	response.sendRedirect("shopping_main.jsp");
%>