//list
function listWrite() {
		location.href = "notice_board_write.jsp";
	}
//modify
	function nbList() {
		b.action = "notice_board_list.jsp";
		b.submit();	
	}
	function nbModify() {
		if (b.title.value=="") {
			alert("제목을 입력하세요")
			b.title.focus();
			
		}
		if (b.content.value=="") {
			alert("내용을 입력하세요")
			b.title.focus();
		}
		
		b.action = "notice_board_modify_action.jsp";
		b.submit();
	}

// reply

function replyCreate() {
		if (b.title.value=="") {
			alert("제목을 입력하세요.");
			b.title.focus();
			return false;
		}
		if (b.content.value=="") {
			alert("내용을 입력하세요.");
			b.content.focus();
			return false;
		}
		b.action = "notice_board_reply_write_action.jsp";
		b.method='POST';
		b.submit();
	}

//write

	function writeCreate() {
		if (b.title.value=="") {
			alert("제목을 입력하지 않으셨습니다.");
			b.title.focus();
			return false;
		}
		if (b.content.value=="") {
			alert("내용을 입력하지 않으셨습니다.");
			b.content.focus();
			return false;
		}
		b.action = "notice_board_write_action.jsp";
		b.method='POST';
		b.submit();
	}
	function writeList() {
		b.action = "notice_board_list.jsp";
		b.submit();
	}
// view
function viewUpdate() {
		document.b.action = "notice_board_modify.jsp";
		document.b.submit();
	}
function viewRemove() {
		b.action = "notice_board_remove_action.jsp";
		b.submit();
	}
function viewInsert() {
		
		b.action = "notice_board_reply_write.jsp";
		b.submit();
	}

	



