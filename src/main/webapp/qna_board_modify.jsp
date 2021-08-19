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
	//글번호가 없다면
	if (boardno == null) {
		//목록으로 이동
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
</head>
<body>
<h1>게시판 수정</h1>

<form action='qna_board_modify_action.jsp'>
	<input type="hidden" name="pageno" value="<%=pageno%>" /> 
	<input type="hidden" name="boardno" value="<%=board.getQb_no()%>" />
	제목:<input type="text" name="title" value="<%=board.getQb_title()%>"><br>
	내용:<input type="text" name="content" value="<%=board.getQb_content()%>"><br>
	<input type="submit" value="글쓰기">
</form>
</body>
</html>