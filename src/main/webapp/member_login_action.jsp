<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
	String m_id = null;
	String m_password = null;
	try{
		m_id = request.getParameter("m_id");
		m_password = request.getParameter("m_password");
		MemberService memberService=new MemberService();
		Member loginMember = memberService.login(m_id, m_password);
		session.setAttribute("sM_id", m_id);
		session.setAttribute("sMember", loginMember);
		response.sendRedirect("shopping_main.jsp");
	} catch(Exception e){
		response.sendRedirect("member_login_form.jsp?msg1="+URLEncoder.encode(e.getMessage(),"UTF-8"));
	}
%>