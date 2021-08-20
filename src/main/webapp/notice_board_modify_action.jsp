<%@page import="com.itwill.shopping.notice_board.NoticeBoardService"%>
<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeBoard board = new NoticeBoard();
board.setNb_no(Integer.parseInt(request.getParameter("boardno")));
board.setNb_title(request.getParameter("title"));
board.setNb_content(request.getParameter("content"));

//2. 데이터베이스에 변경된 내용 적용
NoticeBoardService.getInstance().update(board);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. boardview.jsp로 이동
response.sendRedirect(
	String.format("notice_board_view.jsp?boardno=%d&pageno=%s",board.getNb_no(), pageno));

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