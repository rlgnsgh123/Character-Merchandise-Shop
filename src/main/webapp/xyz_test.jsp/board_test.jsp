<%@page import="com.itwill.shopping.qna_board.QnaBoard"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
QnaBoardService qnaService = new QnaBoardService();
//QnaBoard board = new QnaBoard(0,"jsp테스","jsp제목",null,0,0,1,0,"customer1");
//QnaBoard board = new QnaBoard(13,"jsp테스트 답글","jsp제목답글",null,0,13,0,0,"admin1");
//QnaBoard board = new QnaBoard(13,"jsp테스트 수정","jsp제목답글 슈종",null,0,0,0,0,null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ol>
 
<!-- <li>qnaService.insertReply(board)</li>-->
<li>대입완료</li>
<li>답글 대입완료</li>
<li>리스트 no 확인</li>
<li>강사님 템플리으로 전체리스트, 답글depth, 페이징 확인</li>
<li>삭제완료</li>
<li>수정완료</li>
<li>조회수 증가완료</li>
<li><%=qnaService.updateViewCount(13) %>
</ol>

</body>
</html>