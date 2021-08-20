<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
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
		response.sendRedirect("notice_board_list.jsp");
		return;
	}
	NoticeBoard board = NoticeBoardService.getInstance().selectBoard(boardno);
	if (board == null) {
		response.sendRedirect("notice_board_list.jsp");
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
<script type="text/javascript" src="js/notice.js"></script>

</head>
<body>
<h1>게시판 수정</h1>

<form name="b" action='notice_board_modify_action.jsp'>
	<input type="hidden" name="pageno" value="<%=pageno%>" /> 
	<input type="hidden" name="boardno" value="<%=board.getNb_no()%>" />
	<table>
		<tr>
			<td>작성자 :</td>
			<td><%=board.getM_id()%></td>
		</tr>
		<tr>
			<td>제목:</td>
			<td>
				<input type="text" name="title" value="<%=board.getNb_title()%>">
			</td>
		</tr>
		<tr>
			<td>내용:</td>
			<td>
				<input type="text" name="content" value="<%=board.getNb_content()%>"><br>
			</td>
	</table>
		<table>
			<tr>
				<td>
					<input type="button" value="목록" onclick="nbList()">
					<input type="button" value="수정" onclick="nbModify()">
				</td>
			</tr>
		
		</table>
	
	
</form>
</body>
</html>