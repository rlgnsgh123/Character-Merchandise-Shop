<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberService memberService=new MemberService();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="member_insert_action.jsp">
	아이디<input type="text" name="id" value=""><br>
	비밀번호<input type="text" name="passwordd" value=""><br>
	이름<input type="text" name="name" value=""><br>
	주소<input type="text" name="address" value=""><br>
	전화번호<input type="text" name="phone" value=""><br>
	<input type="submit" value="가입">
</form>
</body>
</html>