<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_insert_form.jsp");
		return;
	}
	request.setCharacterEncoding("UTF-8");

	String m_id = request.getParameter("m_id");
	String m_password = request.getParameter("m_password");
	String m_name = request.getParameter("m_name");
	String m_address = request.getParameter("m_address");
	String m_phone = request.getParameter("m_phone");
	Member newMember = null;
	try{
		newMember=new Member(m_id,m_password,m_name,m_address,m_phone);
		MemberService memberService=new MemberService();
		memberService.create(newMember);
		response.sendRedirect("shopping_main.jsp");
	} catch(Exception e){
		response.sendRedirect("member_insert_form.jsp?msg="+URLEncoder.encode(e.getMessage(),"UTF-8"));
		//e.printStackTrace();
		//response.sendRedirect("member_error.jsp");
	}
%>