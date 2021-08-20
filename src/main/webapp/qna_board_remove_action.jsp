<%@page import="com.itwill.shopping.qna_board.util.BoardException"%>
<%@page import="com.itwill.shopping.qna_board.QnaBoardService"%>
<%@ include file="login_check.jspf" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	
	request.setCharacterEncoding("UTF-8");
	
	
	Integer boardno = null;
	Integer pageno = null;
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	boolean result=true;
	
	String msg="";
	if(boardno==null){
		result=false;
		msg="삭제실패";
	}else{
		try{
			QnaBoardService.getInstance().delete(boardno);
			result=true;
			msg="삭제성공";
		}catch(BoardException e){
			result=false;
			msg="삭제실패: "+e.getMessage();
			
		}
	}
	%>
<script type="text/javascript">
	<%if(result){ %>
		alert('<%=msg %>');
		location.href='qna_board_list.jsp?pageno=<%=pageno%>';
	<%}else{%>
		alert('<%=msg %>');
		location.href='qna_board_list.jsp?pageno=<%=pageno%>';
	<%} %>
</script>
