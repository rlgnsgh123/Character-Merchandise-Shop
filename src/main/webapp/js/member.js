function memberInsert() {
	f.action = "member_insert_form.jsp"
	f.submit();
}

function login() {
	if(f.id.value==""){
		alert("아이디를 입력하세요.");
		f.id.focus();
		return false;
	}
	if(f.password.value==""){
		alert("비밀번호를 입력하세요.");
		f.password.focus();
		return false;
	}

	f.action = "member_login_action.jsp"
	f.submit();
}