<%@page import="com.itwill.shopping.notice_board.util.BoardListPageDto"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.util.PageInputDto"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	// 로그인 체그를 위한 session 객체 사용
 	String id = (String)session.getAttribute("sM_id");
 %>
 <% 
 	// 비로그인 접근시 "로그인하세요" 안내문 출력
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
			title.append("\t\t\t");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
}
%>  
<%
	
	// 게시물 페이징을 위한 작업
	// 강사님 코드 참고
	String pageno = request.getParameter("pageno");
	if(pageno==null || pageno.equals("")){
		pageno="1";
	}
	int rowCountPerPage = 10;
	int pageCountPerPage = 10;
	
	PageInputDto pageInputDto = new PageInputDto(rowCountPerPage,pageCountPerPage,pageno,"","");

%>	

	
<% 
// 게시물 출력을 위한 메쏘드
	NoticeBoardService noticeBoardService = NoticeBoardService.getInstance();
	BoardListPageDto boardListPage = noticeBoardService.selectAll(pageInputDto);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판 리스트</title>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<!-- Google Font -->

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" type="text/css">

    <!-- Theme Stylesheet -->

    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/responsive.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript" src="js/notice.js"></script>
</head>
<body>
<!-- top_bar start -->
	<jsp:include page="common_top.jsp"/>
	<!-- top_bar end -->

    <!-- left(nav_bar) start -->
	<jsp:include page="common_left.jsp"/>
 	<!-- left(nav_bar) end -->
<div class="shopping-process text-center">
   		<div class="container">

            <div class="row">

                <ul class="nav nav-tabs nav-product-tabs">

                    <li class="active"><a href="" data-toggle="tab">커뮤니티</a></li>

                    <li><a href="#" data-toggle="tab">공지사항</a></li>

                    

                    <li class=""><a href=""> <i class=""></i></a></li>

                </ul>
				</div>
			</div> 	
</div>

<div id="content"style="width:74%; margin: 0 auto">
	<table border=0 cellpadding=20 cellspacing="0" >
		<tr>
			<td><br />
				<table style="padding-left: 10px" border=0 cellpadding=0						cellspacing=0>
					<tr bgcolor="#FFFFFF">
						<td  class="t1" align="right" valign="bottom">전체페이지 
					<font color="#FF0000"><%=boardListPage.getTotalRecordCount()%></font>
					개 | 현재페이지 ( 
					<font color="#FF0000"><%=boardListPage.getSelectPageNo()%></font>
					/ 
					<font color="#0000FF"><%=boardListPage.getTotalPageCount()%></font > )   
					</td>
				</tr>
			</table> 
	</table> <br />
	<form name="b" method="post" action="">
	<table border="0" cellpadding="0" cellspacing="10" width="1150"
	bgcolor="BBBBBB">
		<tr>
			<td width=100 align=center bgcolor="E6ECDE">No</td>
			<td width=500 align=center bgcolor="E6ECDE">제목</td>
			<td width=200 align=center bgcolor="E6ECDE">작성자ID</td>
			<td width=200 align=center bgcolor="E6ECDE">작성일</td>
			<td width=150 align=center bgcolor="E6ECDE">조회수</td>
		</tr>
			<%
			for (NoticeBoard board : boardListPage.getList()) {
			%>
			<tr>
				<td width=100 align=center bgcolor="ffffff"><%=board.getNb_no() %></td>				
				<td width=500 bgcolor="ffffff" style="padding-left: 20px" align="left">
					<a href='notice_board_view.jsp?boardno=<%=board.getNb_no()%>&pageno=<%=boardListPage.getSelectPageNo()%>'>
					<%=this.getTitleString(board)%></a>
				</td>
				<td width=200 align=center bgcolor="ffffff"><%=board.getM_id()%></td>
				<td width=200 align=center bgcolor="ffffff"><%=board.getNb_date().toString().substring(0, 10)%></td>
				<td width=150 align=center bgcolor="ffffff"><%=board.getNb_vcount()%></td>
			</tr>
			<%
			}
			%>
	</table>
	</form> <br>
	<div id="content"style="width:74%; margin: 0 auto">
		<table border="0" cellpadding="0" cellspacing="1" width="590">
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
	</div>
		<table border="0" cellpadding="0" cellspacing="1" width="1100">
			<tr>
				<td align ="right"><input type="button" value="글쓰기" onclick="listWrite();"/> </td>
			</tr>
		</table>
	
	
	
</div><br />






    	<!-- common_bottom start -->
	<jsp:include page="common_bottom.jsp"/>
	<!-- common_bottom end -->

	<!-- jQuery Library -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<!-- Latest compiled and minified JavaScript -->

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<!-- Script -->

	<script src="js/script.js"></script>							

</body>
</html>