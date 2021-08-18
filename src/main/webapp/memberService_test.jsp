<%@page import="com.itwill.shopping.member.MemberDao"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberService memberService = new MemberService();
	Member member = memberService.findMember("customer1");
	//ArrayList<Member> memberList = memberService.findMemberList();
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>memberService.findMemberList();</h1>
<ol>
	<li><%=member %></li>

	
</ol>
</body>
</html>