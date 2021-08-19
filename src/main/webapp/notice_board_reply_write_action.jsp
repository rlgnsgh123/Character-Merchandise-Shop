<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
NoticeBoard board = new NoticeBoard();

board.setNb_no(Integer.parseInt(request.getParameter("no")));
board.setNb_groupno(Integer.parseInt(request.getParameter("groupno")));
board.setM_id(request.getParameter("id"));
board.setNb_title(request.getParameter("title"));
board.setNb_content(request.getParameter("content"));

NoticeBoardService.getInstance().insertReply(board);



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