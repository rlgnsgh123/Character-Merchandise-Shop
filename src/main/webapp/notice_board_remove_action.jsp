<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer boardno = null;
	Integer pageno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	NoticeBoardService.getInstance().delete(boardno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>