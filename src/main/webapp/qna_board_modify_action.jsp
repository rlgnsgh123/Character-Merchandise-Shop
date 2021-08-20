<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@ include file="login_check.jspf" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

QnaBoard board = new QnaBoard();
board.setQb_no(Integer.parseInt(request.getParameter("boardno")));
board.setQb_title(request.getParameter("title"));
board.setQb_content(request.getParameter("content"));

//2. 데이터베이스에 변경된 내용 적용
QnaBoardService.getInstance().update(board);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp로 이동
response.sendRedirect(
	String.format("qna_board_view.jsp?boardno=%d&pageno=%s",board.getQb_no(), pageno));

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