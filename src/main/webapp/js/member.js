// login , memberInsertPage , memberInsert , shopping_main , memberModify , memberDelete

function login() {
	if(f.m_id.value==""){
		alert("아이디를 입력하세요.");
		f.m_id.focus();
		return false;
	}
	if(f.m_password.value==""){
		alert("비밀번호를 입력하세요.");
		f.m_password.focus();
		return false;
	}

	f.action = "member_login_action.jsp"
	f.submit();
}

function memberInsertPage() {
	f.action = "member_insert_form.jsp"
	f.submit();
}

function memberInsert() {
	if (f.m_id.value == "") {
		alert("사용자 아이디를 입력하세요.");
		f.m_id.focus();
		return false;
	}
	if (f.m_password.value == "") {
		alert("비밀번호를 입력하세요.");
		f.m_password.focus();
		return false;
	}
	if (f.m_password2.value == "") {
		alert("비밀번호확인을 입력하세요.");
		f.m_password2.focus();
		return false;
	}
	if (f.m_name.value == "") {
		alert("이름을 입력하세요.");
		f.m_name.focus();
		return false;
	}
	if (f.m_address.value == "") {
		alert("주소를 입력하세요.");
		f.m_address.focus();
		return false;
	}
	if (f.m_phone.value == ""){
		alert("전화번호를 입력하세요.");
		f.m_phone.focus();
	}
	if (f.m_password.value != f.m_password2.value) {
		alert("비밀번호와 비밀번호확인은 일치해야 합니다.");
		f.m_password.focus();
		f.m_password.select();
		return false;
	}
	f.action = "member_insert_action.jsp";
	f.method='POST';
	f.submit();
}
	
function shopping_main() {
	f.action = "shopping_main.jsp"
	f.submit();
}
function member_myinfo_view() {
	f.action = "member_myinfo_view.jsp"
	f.submit();
}

function memberModify() {
	f.action = "member_modify_form.jsp"
	f.method = "POST";
	f.submit();
}

function memberDelete() {
	if(confirm("정말 탈퇴 하시겠습니까?")){
		f.action = "member_delete_action.jsp";
		f.method = "POST";
		f.submit();
	}
}

function memberModifyAction() {
	if (f.m_password.value == "") {
		alert("비밀번호를 입력하세요.");
		f.m_password.focus();
		return false;
	}
	if (f.m_password2.value == "") {
		alert("비밀번호확인을 입력하세요.");
		f.m_password2.focus();
		return false;
	}
	if (f.m_name.value == "") {
		alert("이름을 입력하세요.");
		f.m_name.focus();
		return false;
	}
	if (f.m_address.value == "") {
		alert("주소를 입력하세요.");
		f.m_address.focus();
		return false;
	}
	if (f.m_phone.value == ""){
		alert("전화번호를 입력하세요.");
		f.m_phone.focus();
	}
	if (f.m_password.value != f.m_password2.value) {
		alert("비밀번호와 비밀번호확인은 일치해야 합니다.");
		f.m_password.focus();
		f.m_password.select();
		return false;
	}
	document.f.action = "member_modify_action.jsp";
	document.f.method='POST';
	document.f.submit();
}