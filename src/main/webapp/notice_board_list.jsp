<%@page import="com.itwill.shopping.notice_board.util.BoardListPageDto"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.util.PageInputDto"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	String id = (String)session.getAttribute("sM_id");
 %>
 <% 
 		if(id==null) {
 		out.println("<script>");
 		out.println("alert('로그인하세요');");
 		out.println("location.href='member_login_form.jsp';");
 		out.println("</script>");
 		return;
 		
 		}
 %>
 

 
 
 <%!
// 답글공백 및 그림 추가
public String getTitleString(NoticeBoard board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getNb_title();
		if (t.length() > 15) {
			t = String.format("%s...", t.substring(0, 15));
		}
		
		for (int i = 0; i < board.getNb_depth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (board.getNb_depth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
}
%>  
<%
	
	
	String pageno = request.getParameter("pageno");
	if(pageno==null || pageno.equals("")){
		pageno="1";
	}
	int rowCountPerPage = 10;
	int pageCountPerPage = 10;
	
	PageInputDto pageInputDto = new PageInputDto(rowCountPerPage,pageCountPerPage,pageno,"","");

%>	

	
<% 
	NoticeBoardService noticeBoardService = NoticeBoardService.getInstance();
	BoardListPageDto boardListPage = noticeBoardService.selectAll(pageInputDto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
	function nbWrite() {
		location.href = "notice_board_write.jsp";
	}
</script>
</head>
<body>
<ol>
<li>총게시물수<%=boardListPage.getTotalRecordCount() %></li>
<li>현재페이지<%=boardListPage.getSelectPageNo() %></li>
<li>총페이지수<%=boardListPage.getTotalPageCount() %></li>
</ol>

<table  width="600">

<tr>
	<td >No</td>
	<td >제목</td>
	<td >글쓴이</td>
	<td >글쓴날</td>
	<td >본횟수</td>
</tr>
<%
for (NoticeBoard board : boardListPage.getList()) {
%>
<tr>
	<td><%=board.getNb_no() %></td>
	<td>
	<a href='notice_board_view.jsp?boardno=<%=board.getNb_no()%>&pageno=<%=boardListPage.getSelectPageNo()%>'>
	<%=this.getTitleString(board)%></a>
	</td>
	<td><%=board.getM_id()%></td>
	<td><%=board.getNb_date().toString().substring(0, 10)%></td>
	<td><%=board.getNb_vcount()%></td>
</tr>
<%
}
%>
</table>

<!-- 페이지처리 강사님꺼 복사 붙여넣기 -->
<ol>
<li>페이징처리</li>
</ol>

<table>
<tr>
	<td align="center">
	<%if (boardListPage.isShowFirst()) {%> 
	<a href="./notice_board_list.jsp?pageno=1">◀◀</a>&nbsp; 
	<%}%> 
		<%if (boardListPage.isShowPreviousGroup()) {%>
		<a href="./notice_board_list.jsp?pageno=<%=boardListPage.getPreviousGroupStartPageNo()%>">◀</a>&nbsp;&nbsp;
		<%}%>
		<%for (int i = boardListPage.getStartPageNo(); i <= boardListPage.getEndPageNo(); i++) {
			if (boardListPage.getSelectPageNo() == i) {%>
			<font color='blue'><strong><%=i%></strong></font>&nbsp;
			<%} else {%>
			<a href="./notice_board_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
				<% }
			}%>
		<%if (boardListPage.isShowNextGroup()) {%> 
		<a href="./notice_board_list.jsp?pageno=<%=boardListPage.getNextGroupStartPageNo()%>">▶&nbsp;</a>
		<%}	%>
		 <%if (boardListPage.isShowLast()) {%> 
		 	<a href="./notice_board_list.jsp?pageno=<%=boardListPage.getTotalPageCount()%>">▶▶</a>&nbsp;
			<%}%>
	</td>
</tr>
</table>
<table>
	<tr>
		<td><input type="button" value="글쓰기" onclick="nbWrite();"/> </td>
	</tr>
</table>
							

</body>
</html>