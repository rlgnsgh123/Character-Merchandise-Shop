<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %> 
<%
	MemberService memberService=new MemberService();
	Member member = memberService.findMember(sM_id);
%>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>내 정보</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<!-- Google Font -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">
    <!-- Theme Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp"/>
		</div>	
		
		<div id="navigation">
				<jsp:include page="common_left.jsp"/>
		</div>	
		<br/><br/><br/><br/><br/>
		<div id="wrapper">
			<div id="content" style="width:60%; margin: 0 auto" >		
				<form name="f" method="post" width="300"  >				
					<table width="200" border="3"  bgcolor="BBBBBB" style="margin: 0 auto">
					<tr>
						<td bgcolor="f4f4f4" height="22" align="center"><b>내 정보</b></td>
					</tr>
					</table>
					<table width="300" border="5"  bgcolor="BBBBBB" style="margin: 0 auto">
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
							<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_address()%></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
							<td width=300 bgcolor="ffffff" style="padding-left: 10"><%=member.getM_phone()%></td>
						</tr>
					</table>		
				</form><br/>
				<table width=400 style="margin: 0 auto" cellpadding=5 cellspacing=5>
					<tr>
						<td align="center">
							<input type="button" value="정보 수정" onclick="memberModify()">&nbsp;&nbsp;
							<input type="button" value="탈퇴" onclick="memberDelete()">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="Home" onclick="shopping_main()">
						</td> 
					</tr>
				</table>
			</div>
		</div>	
		<br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
	<script src="js/member.js"></script>
</body>
</html>