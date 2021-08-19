
<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeBoard board = new NoticeBoard();

board.setM_id(request.getParameter("id"));
board.setNb_title(request.getParameter("title"));
board.setNb_content(request.getParameter("content"));

NoticeBoardService.getInstance().insert(board);


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