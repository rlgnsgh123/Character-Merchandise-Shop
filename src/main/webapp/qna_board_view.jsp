<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
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
	
	
	// 권한을 주기위해 접속한사람과 작성자 찾기위한작업
	boolean isEqual = false;
	String userId =(String)session.getAttribute("sM_id");
	if(userId.equals(board.getM_id())||userId.equals("admin1")) {
		isEqual = true;
	}

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판 상세보기</title>

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
<script type="text/javascript" >	
	function viewList() {
		b.action = "qna_board_list.jsp?pageno="+<%=pageno%>;
		b.submit();
	}
</script>
<script type="text/javascript" src="js/qna.js"></script>	
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

                    <li><a href="#" data-toggle="tab">게시글 보기</a></li>

                    

                    <li class=""><a href=""> <i class=""></i></a></li>

                </ul>
				</div>
			</div> 	
</div>
<body>
<div id =contetnt style="width:75%; margin: 0 auto">
	<form name="b">
		<!-- 돌아가기 눌렀을때 해당 페이지로 로 돌아가기위해 얻어온다 데이타를 -->
		<input type="hidden" name="boardno" value="<%=board.getQb_no()%>">
		<input type="hidden" name="pageno" value="<%=pageno%>">
	<table border="0" cellpadding="0" cellspacing="1" width="690" bgcolor="ffffff">
		
		<tr>
			<td width=50 align=center bgcolor="E6ECDE" height="22">작성자</td>
			<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=board.getM_id() %></td>
		</tr>
		<tr>
			<td width=50 align=center bgcolor="E6ECDE" height="22">작성일</td>
			<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=board.getQb_date() %></td>
		</tr>
		<tr>
			<td width=50 align=center bgcolor="E6ECDE" height="22">제목</td>
			<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=board.getQb_title() %></td>
		</tr>
		<tr>
			<td width=50 align=center bgcolor="E6ECDE" height="22">내용</td>
			<td width=490 bgcolor="ffffff" height="180px" style="padding-left: 10px" align="left"><%=board.getQb_content()%></td>
		</tr>
	</table>
	</form>
</div><br>
<div>
	<table>
		<tr>
		
			<!-- 작성자와 관리자는 수정,삭제,목록,답장 가능 -->
			<td>
			<%if(isEqual) { %>
			<input type="button"  value="수정" onclick= "viewUpdate()">
			<input type="button"  value="삭제" onclick= "viewRemove()"> 
			<input type="button"  value="목록" onclick= "viewList()"> 
			<input type="button"  value="답장" onclick="viewInsert()">
			<% }else{ %>
			<!-- 읽는사람은 목록 답장만 -->
			<input type="button"  value="목록" onclick= "viewList()"> 
			<input type="button"  value="답장" onclick="viewInsert()">
			<%} %> 
			</td>
		</tr>
	</table>
</div><br><br><br><br>
</body>
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


</body>
</html>