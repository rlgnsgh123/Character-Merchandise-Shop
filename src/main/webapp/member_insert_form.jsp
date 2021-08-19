<%@page import="com.itwill.shopping.member.Member"%>
<%@page import="com.itwill.shopping.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member=(Member)request.getAttribute("member");
	if(member==null){
		member=new Member("","","","","");
	}
	String msg=(String)request.getAttribute("msg");
	if(msg==null) msg="";
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="js/member.js"></script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="common_top.jsp"/>
		</div>	
		
		<div id="navigation">
				<jsp:include page="common_left.jsp"/>
		</div>	
		<div id="wrapper">
			<div id="content">
				<table width=000 border=000 cellpadding=0 cellspacing=0>
					<form name="f" method="post">
						아이디 : <input type="text" name="m_id" value="<%=member.getM_id() %>"><br>
						비밀번호 : <input type="password" name="m_password" value="<%=member.getM_password() %>"><br>
						비밀번호 확인 : <input type="password" name="m_password2" value="<%=member.getM_password() %>"><br>
						이름 : <input type="text" name="m_name" value="<%=member.getM_name() %>"><br>
						주소 : <input type="text" name="m_address" value="<%=member.getM_address() %>"><br>
						전화번호 : <input type="text" name="m_phone" value="<%=member.getM_phone() %>"><br>
					</form><br>
					<table border=0 cellpadding=0 cellspacing=1>
						<tr>
							<td align=center>
							<input type="button" value="회원 가입" onclick="memberInsert()"> &nbsp; 
							<input type="button" value="메인 화면" onClick="shopping_main()"></td>
						</tr>
					</table>	
				</table>
			</div>	
		</div>
		<div id="footer">
			<jsp:include page="common_bottom.jsp"/>
		</div>
	</div>
</body>
</html>