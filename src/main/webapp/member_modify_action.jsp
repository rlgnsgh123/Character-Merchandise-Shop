<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shopping_main.jsp");
		return;
	}
	try {
		request.setCharacterEncoding("UTF-8");
		String m_password=request.getParameter("m_password");
		String m_name=request.getParameter("m_name");
		String m_address=request.getParameter("m_address");
		String m_phone=request.getParameter("m_phone");
		Member member=new Member(sM_id,m_password,m_name,m_address,m_phone);
		MemberService memberService=new MemberService();
		memberService.updateMember(member);
		
		response.sendRedirect("member_myinfo_view.jsp");	
	} catch(Exception e){
		response.sendRedirect("member_insert_form.jsp?msg="+URLEncoder.encode(e.getMessage(),"UTF-8"));
		//e.printStackTrace();
		//response.sendRedirect("member_error.jsp");
	}
%> 