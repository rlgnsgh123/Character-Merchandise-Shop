<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Integer boardno=null;
	int pageno=1;
	// boardNo 받기
	try{
		boardno=Integer.parseInt(request.getParameter("boardno"));
		pageno=Integer.parseInt(request.getParameter("pageno"));
	}catch(Exception e){
		
	}
	// 번호 없으면 list로
	if(boardno==null){
		response.sendRedirect("qna_board_list.jsp?pageno="+pageno);
		return;
	}
	QnaBoard board=QnaBoardService.getInstance().selectBoard(boardno);
	// 게시글 없는거 있으면 list로
	if(board==null){
		response.sendRedirect("qna_board_list.jsp?pageno="+pageno);
		return;
	}
	QnaBoardService.getInstance().updateViewCount(boardno);
	
	boolean isEqual = false;
	String userId =(String)session.getAttribute("sM_id");
	if(userId.equals(board.getM_id())||userId.equals("admin1")) {
		isEqual = true;
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
//수정 메쏘드
	function qbUpdate() {
		document.b.action = "qna_board_modify.jsp";
		document.b.submit();
	}
	function qbList() {
		b.action = "qna_board_list.jsp?pageno="+<%=pageno%>;
		b.submit();
	}
	function qbRemove() {
		b.action = "qna_board_remove_action.jsp";
		b.submit();
	}
	function qbInsert() {
		
		b.action = "qna_board_reply_write.jsp";
		b.submit();
	}
</script>
<form name="b">
	<!-- 돌아가기 눌렀을때 해당 페이지로 로 돌아가기위해 얻어온다 데이타를 -->
	<input type="hidden" name="boardno" value="<%=board.getQb_no()%>">
	<input type="hidden" name="pageno" value="<%=pageno%>">
<table>
	
	<tr>
		<td>작성자</td>
		<td><%=board.getM_id() %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=board.getQb_date() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=board.getQb_title() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=board.getQb_content()%></td>
	</tr>
</table>
</form>
	<table>
		<tr>
			<td>
			<%if(isEqual) { %>
			<input type="button"  value="수정" onclick= "qbUpdate()">
			<input type="button"  value="삭제" onclick= "qbRemove()"> 
			<input type="button"  value="목록" onclick= "qbList()"> 
			<input type="button"  value="답장" onclick="qbInsert()">
			<% }else{ %>
			<input type="button"  value="목록" onclick= "qbList()"> 
			<input type="button"  value="답장" onclick="qbInsert()">
			<%} %> 
			</td>
		</tr>
	</table>



</body>
</html>