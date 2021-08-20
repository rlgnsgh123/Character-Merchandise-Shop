<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId =(String)session.getAttribute("sM_id");
	
if(request.getParameter("boardno")==null){
	response.sendRedirect("qna_board_list.jsp");
	return;
	}

int boardno = Integer.parseInt(request.getParameter("boardno"));
QnaBoard board=QnaBoardService.getInstance().selectBoard(boardno);

if(board==null){
	response.sendRedirect("qna_board_list.jsp");
	return;
}

String pageno="1";
if(request.getParameter("pageno")!=null){
	pageno = request.getParameter("pageno");
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function qbCreate() {
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
	function qbList() {
		b.action = "qna_board_list.jsp";
		b.submit();
	}

</script>
</head>
<body>
<form name="b" method="post">
	<input type="hidden" name="pageno"  value="<%=pageno%>" />
	<input type="hidden" name="boardno" value="<%=board.getQb_no()%>"/>
	<input type="hidden" name="id" value="<%=userId%>"/>
	<table>
	<tr>
		<td>아이디 : </td>
		<td><%=userId %>
	</tr>
	<tr>
		<td>제목 : </td>
		<td><input type="text" name="title" value="RE:<%=board.getQb_title()%>"></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td>
		<textarea name="content" class="textarea" style="width: 500px" rows="20">[원글] <%=board.getQb_content().replace("\n","[원글] : ").trim()%></textarea>
		</td>
	</tr>
	</table>
</form>
<table>
	<tr>
		<td>
			<input type="button" value="답장" onclick= "qbCreate()">
			<input type="button" value="목록" onclick="qbList()">
		</td>
	</tr>
</table>

</body>