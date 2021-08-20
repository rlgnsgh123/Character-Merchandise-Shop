<%@page import="com.itwill.shopping.notice_board.util.BoardException"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@ include file="login_check.jspf" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	Integer boardno = null;
	Integer pageno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result=true;
	
	String msg="";
	if(boardno==null){
		result=false;
		msg="삭제실패";
	}else{
		try{
			NoticeBoardService.getInstance().delete(boardno);
			result=true;
			msg="삭제성공";
		}catch(BoardException e){
			result=false;
			msg="삭제실패: "+e.getMessage();
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	<%if(result){ %>
		alert('<%=msg %>');
		location.href='notice_board_list.jsp?pageno=<%=pageno%>';
	<%}else{%>
		alert('<%=msg %>');
		location.href='notice_board_list.jsp?pageno=<%=pageno%>';
	<%} %>
</script>
</head>
<body>

</body>
</html>