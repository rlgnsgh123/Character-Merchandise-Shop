<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer boardno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
	} catch (Exception ex) {
	}
	if (boardno == null) {
		response.sendRedirect("qna_board_list.jsp");
		return;
	}
	QnaBoard board = QnaBoardService.getInstance().selectBoard(boardno);
	if (board == null) {
		response.sendRedirect("qna_board_list.jsp");
		return;
	}
	String pageno = "1";
	if (request.getParameter("pageno") != null) {
		pageno = request.getParameter("pageno");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function qbList() {
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


</script>

</head>
<body>
<h1>게시판 수정</h1>

<form name="b" action='qna_board_modify_action.jsp'>
	<input type="hidden" name="pageno" value="<%=pageno%>" /> 
	<input type="hidden" name="boardno" value="<%=board.getQb_no()%>" />
	<table>
		<tr>
			<td>작성자 :</td>
			<td><%=board.getM_id()%></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td>
				<input type="text" name="title" value="<%=board.getQb_title()%>">
			</td>
		</tr>
		<tr>
			<td>내용:</td>
			<td>
				<input type="text" name="content" value="<%=board.getQb_content()%>"><br>
			</td>
	</table>
		<table>
			<tr>
				<td>
					<input type="button" value="목록" onclick="qbList()">
					<input type="button" value="수정" onclick="qbModify()">
				</td>
			</tr>
		
		</table>
	
	
</form>
</body>
</html>