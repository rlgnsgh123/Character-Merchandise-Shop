<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sM_id=(String)session.getAttribute("sM_id");
%>	
	
	
<script type="text/javascript">
	function login_message() {
		alert('로그인하세요');
		location.href = 'user_login_form.jsp';
	}
</script>
<p>
	<strong>메 뉴</strong>
</p>
<ul>
	<%if(sM_id==null){ %>
		<li><a href="member_login_form.jsp">로그인</a></li>
		<li><a href="member_insert_form.jsp">회원가입</a></li>
		<li><a href=""></a></li>
		<li><a href="javascript:login_message();">장바구니</a></li>
	<%}else{ %>	
		<li><a href="member_myinfo_view.jsp"><%=sM_id%>님</a>&nbsp;<a href="member_logout_action.jsp">로그아웃</a></li>
		<li><a href=""></a></li>
		<li><a href="cart_view.jsp">장바구니</a></li>
		<li><a href="order_list.jsp">주문목록</a></li>
	<%} %>
		<li><a href="product_list.jsp">상품 리스트</a></li>
		<li><a href="qna_board_list.jsp">QnA 게시판리스트</a></li>	
		<li><a href="qna_board_write_form.jsp">QnA 게시판쓰기</a></li>
		<li><a href="notice_board_list.jsp">공지사항</a></li>
		
</ul>