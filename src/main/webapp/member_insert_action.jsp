<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩 설정, GET인지 POST인지
	request.setCharacterEncoding("UTF-8");
	if(request.getMethod().equals("GET")){
		response.sendRedirect("member_insert_form");
		return;
	}
	//파라메타받기 (form의 name)
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	//메서드 테스트
	Member member=new Member(id,password,name,address,phone);
	MemberService memberService=new MemberService();
	memberService.create(member);
%>