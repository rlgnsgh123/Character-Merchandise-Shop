<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("shopping_main.jsp");
	return;
}
MemberService memberService = new MemberService();
Member member = memberService.findMember(sM_id);
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>내 정보 수정</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- Google Font -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
<!-- Theme Stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="common_left.jsp" />
		</div>
		<br/><br/><br/><br/>
		<div id="wrapper">
			<div id="content" style="width: 60%; margin: 0 auto">
				<form name="f" method="post" width="300">
					<table width="200" border="3" style="margin: 0 auto" >
						<tr>
							<td bgcolor="f4f4f4" height="22" align="center"><b>정보 수정</b></td>
						</tr>
					</table>
					<table width="300" border="5" style="margin: 0 auto"
						cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
						<tr>
							<td width=900 align=center bgcolor="E6ECDE" height="22">아이디</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><%=member.getM_id()%></td>
						</tr>
						<tr>
							<td width=150 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><input type="password" style="width: 150px"
								name="m_password" value="<%=member.getM_password()%>"></td>
						</tr>
						<tr>
							<td width=150 align=center bgcolor="E6ECDE" height="22">비밀번호 확인</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><input type="password" style="width: 150px"
								name="m_password2" value="<%=member.getM_password()%>"></td>
						</tr>
						<tr>
							<td width=150 align=center bgcolor="E6ECDE" height="22">이름</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><input type="text" style="width: 150px"
								name="m_name" value="<%=member.getM_name()%>"></td>
						</tr>
						<tr>
							<td width=150 align=center bgcolor="E6ECDE" height="22">주소</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><input type="text" style="width: 150px"
								name="m_address" value="<%=member.getM_address()%>"></td>
						</tr>
						<tr>
							<td width=150 align=center bgcolor="E6ECDE" height="22">전화번호</td>
							<td width=600 bgcolor="ffffff" style="padding-left: 10px"
								align="left"><input type="text" style="width: 150px"
								name="m_phone" value="<%=member.getM_phone()%>"></td>
						</tr>
					</table>
				</form>
				<br>
				<table width=200 border=5 style="margin: 0 auto" cellpadding=5
					cellspacing=5>
					<tr>
						<td align=center><input type="button" value="수정 완료"
							onClick="memberModifyAction()"></td>
						<td align=center><input type="button" value="이전으로"
							onclick="member_myinfo_view()"></td>
					</tr>
				</table>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/>
		<div id="footer">
			<jsp:include page="common_bottom.jsp" />
		</div>
	</div>
	<script src="js/member.js"></script>
</body>
</html>