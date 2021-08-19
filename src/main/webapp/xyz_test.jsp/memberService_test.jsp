<%@page import="com.itwill.shopping.member.MemberDao"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberService memberService = new MemberService();
	
	Member member = memberService.findMember("customer1");	
	ArrayList<Member> memberList = memberService.findMemberList();	
	Member member2 = memberService.login("customer1", "1111");
	int create = memberService.create(new Member("customer1","11","강","서울","010"));
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
	<li>멤버 한명 찾기(ById) : 
	<%=member %>
	</li>	
	
	<li>멤버 전체 리스트 :
	<%for(Member memberAll:memberList) {%>
	<%=memberAll %>
	<%} %>
	</li>
	
	<li>아이디 존재 여부, 패스워드 일치 여부(일치 시 멤버정보 출력) :
	<%=member2 %>
	</li>
	
	<li>회원가입 1 : 성공
	<%=create %></li>
</ol>
</body>
</html>