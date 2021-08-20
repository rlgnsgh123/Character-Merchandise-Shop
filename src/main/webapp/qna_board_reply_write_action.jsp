<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ include file="login_check.jspf" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
// board 객체생성
QnaBoard board = new QnaBoard();

// 기존글 no 받기 --> groupno 값
board.setQb_no(Integer.parseInt(request.getParameter("boardno")));

// form 으로부터 데이터 받기

board.setM_id(request.getParameter("id"));
board.setQb_title(request.getParameter("title"));
board.setQb_content(request.getParameter("content"));
QnaBoardService.getInstance().insertReply(board);

String pageno =request.getParameter("pageno");
response.sendRedirect(
		String.format("qna_board_list.jsp?pageno=%s",pageno));



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