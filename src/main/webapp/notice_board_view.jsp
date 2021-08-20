<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ include file="login_check.jspf" %> 
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
		response.sendRedirect("notice_board_list.jsp?pageno="+pageno);
		return;
	}
	NoticeBoard board=NoticeBoardService.getInstance().selectBoard(boardno);
	// 게시글 없는거 있으면 list로
	if(board==null){
		response.sendRedirect("notice_board_list.jsp?pageno="+pageno);
		return;
	}
	
	NoticeBoardService.getInstance().updateViewCount(boardno);
	
	boolean isEqual = false;
	String userId =(String)session.getAttribute("sM_id");
	if(userId.equals("admin1")) {
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
// 수정 메쏘드
	function qbUpdate() {
		document.b.action = "notice_board_modify.jsp";
		document.b.submit();
	}
	function qbList() {
		b.action = "notice_board_list.jsp?pageno="+<%=pageno%>;
		b.submit();
	}
	function qbRemove() {
		b.action = "notice_board_remove_action.jsp";
		b.submit();
	}
	function qbInsert() {
		
		b.action = "notice_board_reply_write.jsp";
		b.submit();
	}
</script>
<form name="b">
	<!-- 돌아가기 눌렀을때 해당 페이지로 로 돌아가기위해 얻어온다 데이타를 -->
	<input type="hidden" name="boardno" value="<%=board.getNb_no()%>">
	<input type="hidden" name="pageno" value="<%=pageno%>">
<table>
	
	<tr>
		<td>작성자</td>
		<td><%=board.getM_id() %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=board.getNb_date() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=board.getNb_title() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=board.getNb_content()%></td>
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
			<%} %> 
			</td>
		</tr>
	</table>



</body>
</html>