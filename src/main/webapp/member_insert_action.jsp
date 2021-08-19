<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("member_insert_form");
		return;
	}
	request.setCharacterEncoding("UTF-8");

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	Member member = null;
	try{
		member=new Member(id,password,name,address,phone);
		MemberService memberService=new MemberService();
		int insertRowCount = memberService.create(member);
		response.sendRedirect("shopping_main.jsp");
	} catch(Exception e){
		response.sendRedirect("member_insert_form.jsp?msg="+URLEncoder.encode(e.getMessage(),"UTF-8"));
		//e.printStackTrace();
		//response.sendRedirect("member_error.jsp");
	}
%>