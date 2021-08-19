<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg1 = request.getParameter("msg1");
	String msg2 = request.getParameter("msg2");
	if(msg1==null) msg1="";
	if(msg2==null) msg2="";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="js/member.js">
</script>
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
</body>
</html>