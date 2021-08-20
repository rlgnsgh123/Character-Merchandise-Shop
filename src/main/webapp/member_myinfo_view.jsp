<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %> 
<%
	MemberService memberService=new MemberService();
	Member member = memberService.findMember(sM_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp"/>
		</div>	
		
		<div id="navigation">
				<jsp:include page="common_left.jsp"/>
		</div>			
			<form name="f" method="post">
				<table width="300" border="15"  bgcolor="BBBBBB">
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
						<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_id()%></td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
						<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_name()%></td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">주소</td>
						<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_address()%>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
						<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_phone()%>
					</tr>
				</table>		
			</form><br/>
			<table width=300 border="15">
				<tr>
					<td align="center">
						<input type="button" value="정보 수정" onclick="memberModify()">&nbsp;
						<input type="button" value="탈퇴" onclick="memberDelete()">
					</td> 
				</tr>
			</table>
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>