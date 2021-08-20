<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sM_id=(String)session.getAttribute("sM_id");
%>	
	
<script type="text/javascript">
	function login_message() {
		alert('로그인하세요');
		location.href = 'member_login_form.jsp';
	}
</script>
	 <div class="navigation">
        <nav class="navbar navbar-theme">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
         
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar">
              <ul class="nav navbar-nav navbar-right">
              	<li><a href="product_list.jsp"> 상품리스트</a></li>
              	<li><a href="notice_board_list.jsp"> 게시판</a></li>
              	<li><a href="qna_board_list.jsp"> 공지사항</a></li>
             	<li><a href="cart_view.jsp"> 장바구니</a></li>
             	
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
    </div>
