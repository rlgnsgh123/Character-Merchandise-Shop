<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action='qna_board_write_action.jsp'>
	<!-- 아이디는 나중에 session 이용해서 가져오기 -->
	아이디:<input type="text" name="ID" value="customer1"><br>
	제목:<input type="text" name="title" value="jsp테스트"><br>
	내용:<input type="text" name="content" value="비밀"><br>
	<input type="submit" value="글쓰기">
</form>

</body>
</html>