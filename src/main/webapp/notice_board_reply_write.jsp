<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='notice_board_reply_write_action.jsp'>
	<!-- 아이디는 나중에 session 이용해서 가져오기 -->
	NO:<input type="text" name="no" value="10"><br>
	GuopNO:<input type="text" name="groupno" value="10"><br>
	아이디:<input type="text" name="id" value="admin1"><br>
	제목:<input type="text" name="title" value="[RE]jsp테스트"><br>
	내용:<input type="text" name="content" value="비밀"><br>
	<input type="submit" value="글쓰기">
</form>

</body>