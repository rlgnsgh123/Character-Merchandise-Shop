<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg1 = request.getParameter("msg1");
	String msg2 = request.getParameter("msg2");
	if(msg1==null) msg1="";
	if(msg2==null) msg2="";
%>    
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>shopping</title>
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
			<form name="f" method="post">
				<table>
					<tr>
						<td width="100" height="25" align="center">아이디</td>
						<td width="500" align="left" bgcolor='ffffff'>
						<input type="text" name="m_id" value=""><%=msg1 %></td>
					</tr>	
					<tr>
						<td width="100" height="25" align="center">비밀번호</td>
						<td width="500" align="left" >
						<input type="password" name="m_password" value=""><%=msg2 %></td>	
					</tr>	
				</table><br/>
				<table>
					<tr>
						<td align="center">
						<input type="button" value="로그인" onclick="login();">
						<input type="button" value="회원가입" onclick="memberInsertPage();">
						</td>
					</tr>
				</table>
			
			</form>
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
	<script src="js/member.js"></script>
</body>
</html>