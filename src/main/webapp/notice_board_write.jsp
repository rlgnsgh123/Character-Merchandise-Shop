<%@page import="com.itwill.shopping.notice_board.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
NoticeBoard board = new NoticeBoard();
String userId =(String)session.getAttribute("sM_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/notice.js"></script>

</head>
<body>
<table>
	<tr>
		<td>게시판 작성</td>
	</tr>
</table>
<form name="b" method="post" >
	<input type="hidden" name="id" value="<%=userId%>">
	<table>
		<tr>
			<td>작성자</td>
			<td><%=userId%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td width="500" style="padding-left">
				<input type="text" name="title">	
		</tr>
		<tr>
			<td>내용</td>
			<td width="500" style="padding-left">
				<input type="text" name="content">	
		</tr>
	</table>
</form>
<table>
	<tr>
		<td>
			<input type="button" value="글쓰기" onclick= "writeCreate()">
			<input type="button" value="목록" onclick="writeList()">
		</td>
	</tr>
</table>

</body>
</html>