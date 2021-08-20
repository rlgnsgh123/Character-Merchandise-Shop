//list
	function listWrite() {
		location.href = "qna_board_write.jsp";
	}
//modify
function modifyList() {
		b.action = "qna_board_list.jsp";
		b.submit();	
	}
	function qbModify() {
		if (b.title.value=="") {
			alert("제목을 입력하세요")
			b.title.focus();
			
		}
		if (b.content.value=="") {
			alert("내용을 입력하세요")
			b.title.focus();
		}
		
		b.action = "qna_board_modify_action.jsp";
		b.submit();
	}
// reply
function replyCreate() {
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
		b.action = "qna_board_reply_write_action.jsp";
		b.method='POST';
		b.submit();
	}
	function replyList() {
		b.action = "qna_board_list.jsp";
		b.submit();
	}
//view
	function viewRemove() {
		b.action = "qna_board_remove_action.jsp";
		b.submit();
	}
	function viewInsert() {
		
		b.action = "qna_board_reply_write.jsp";
		b.submit();
	}
	function viewUpdate() {
		document.b.action = "qna_board_modify.jsp";
		document.b.submit();
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
		b.action = "qna_board_write_action.jsp";
		b.method='POST';
		b.submit();
	}
	function writeList() {
		b.action = "qna_board_list.jsp";
		b.submit();
	}


