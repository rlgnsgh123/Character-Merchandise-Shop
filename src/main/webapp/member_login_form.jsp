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
	<title>로그인 화면</title>
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
			<form name="f" method="post">
				<table width="300" border="3" style="margin: 0 auto">
					<tr>
						<td width="200" height="25" bgcolor="E6ECDE" align="center">아이디</td>
						<td align="left"><input type="text" name="m_id" value=""><%=msg1 %></td>
					</tr>	
					<tr>
						<td bgcolor="E6ECDE" align="center">비밀번호</td>
						<td align="left"><input type="password" name="m_password" value=""><%=msg2 %></td>						
					</tr>	
				</table><br/>
				<table width="300" style="margin: 0 auto">
					<tr>
						<td align="center">
						<input type="button" value="로그인" onclick="login();">&nbsp;&nbsp;&nbsp;
						<input type="button" value="회원가입" onclick="memberInsertPage();">
						</td>
					</tr>
				</table>
			
			</form>
		</div>
	</div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div id="footer">
		<jsp:include page="common_bottom.jsp"/>
	</div>	
	<script src="js/member.js"></script>
</body>
</html>
