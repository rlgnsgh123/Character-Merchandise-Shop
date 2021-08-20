<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
QnaBoard board = new QnaBoard();

board.setM_id(request.getParameter("id"));
board.setQb_title(request.getParameter("title"));
board.setQb_content(request.getParameter("content"));

QnaBoardService.getInstance().insert(board);
response.sendRedirect("qna_board_list.jsp");


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