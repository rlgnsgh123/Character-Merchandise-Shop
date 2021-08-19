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
<script type="text/javascript">
	function memberInsert() {
		if (f.id.value == "") {
			alert("사용자 아이디를 입력하세요.");
			f.userId.focus();
			return false;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
		}
		if (f.password2.value == "") {
			alert("비밀번호확인을 입력하세요.");
			f.password2.focus();
			return false;
		}
		if (f.name.value == "") {
			alert("이름을 입력하세요.");
			f.name.focus();
			return false;
		}
		if (f.address.value == "") {
			alert("주소를 입력하세요.");
			f.address.focus();
			return false;
		}
		if (f.phone.value == ""){
			alert("전화번호를 입력하세요.");
			f.phone.focus();
		}
		if (f.password.value != f.password2.value) {
			alert("비밀번호와 비밀번호확인은 일치해야 합니다.");
			f.password.focus();
			f.password.select();
			return false;
		}
		f.action = "member_login_form.jsp";
		f.method='POST';
		f.submit();
	}
	
	function shopping_main(){
		f.action = "shopping_main.jsp"
		f.submit();
	}
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
		<div id="wrapper">
			<div id="content">
				<table width=000 border=000 cellpadding=0 cellspacing=0>
					<form name="f" action="member_insert_action.jsp">
						아이디 : <input type="text" name="id" value="<%=member.getM_id() %>"><br>
						비밀번호 : <input type="password" name="password" value="<%=member.getM_password() %>"><br>
						비밀번호 확인 : <input type="password" name="password2" value="<%=member.getM_password() %>"><br>
						이름 : <input type="text" name="name" value="<%=member.getM_name() %>"><br>
						주소 : <input type="text" name="address" value="<%=member.getM_address() %>"><br>
						전화번호 : <input type="text" name="phone" value="<%=member.getM_phone() %>"><br>
					</form><br>
					<table border=0 cellpadding=0 cellspacing=1>
						<tr>
							<td align=center>
							<input type="button" value="회원 가입" onclick="memberInsert();"> &nbsp; 
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