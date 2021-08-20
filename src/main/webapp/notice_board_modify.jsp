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

                    <li class="active"><a href="" data-toggle="tab">고객센터</a></li>

                    <li><a href="#" data-toggle="tab">Q&A 수정</a></li>

                    

                    <li class=""><a href=""> <i class=""></i></a></li>

                </ul>
				</div>
			</div> 	
</div>
<body>
<div id =contetnt style="width:45%; margin: 0 auto">
	<form name="b" method="post">
		<input type="hidden" name="pageno" value="<%=pageno%>" /> 
		<input type="hidden" name="boardno" value="<%=board.getNb_no()%>" />
		<table border="0" cellpadding="0" cellspacing="1" width="" bgcolor="BBBBBB">
			<tr>
				<td width=300 align=center bgcolor="E6ECDE" height="22">작성자 </td>
				<td width=600 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=board.getM_id()%></td>
			</tr>
			<tr>
				<td width=300 align=center bgcolor="E6ECDE" height="22">제목</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
					<input type="text" style="width: 150" name="title" value="<%=board.getNb_title()%>"><br>
				</td>
			</tr>
			<tr>
				<td width=300 align=center bgcolor="E6ECDE" height="22">내용:</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"> 
				<textarea name="content" style="width: 535px" rows="20"><%=board.getNb_content().replace("\n", ">>").trim()%>
				</textarea></td>
		</tr>	
		</table>
		</form>
</div><br>
	
	<div style="width:10%; margin: 0 auto">
			<table border="0" cellpadding="0" cellspacing="1" width="100">
			<tr>
				<td>
						<input type="button" value="목록" onclick="nbList()">
						<input type="button" value="수정" onclick="nbModify()">
				</td>
			</tr>
			</table>
		</div ><br><br><br><br><br><br><br>
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