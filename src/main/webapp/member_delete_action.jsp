<%@page import="org.apache.catalina.tribes.group.RpcCallback"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shopping_main.jsp");
	return;
}
try{
	MemberService memberService=new MemberService();
	memberService.delete(sM_id);
	response.sendRedirect("member_logout_action.jsp");
} catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("user_error.jsp");
}
%>