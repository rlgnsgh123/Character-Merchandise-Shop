<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sM_id=(String)session.getAttribute("sM_id");
%>
<div class="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="social pull-left">
                    <ul>
                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="action pull-right">
                    <ul>
                    	<li><a href="shopping_main.jsp"><h3>Home</h3><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<%if(sM_id==null){ %>
                        <li><a href="member_login_form.jsp"><i class="fa fa-user"></i> 로그인</a></li>
                        <li><a href="member_insert_form.jsp"><i class="fa fa-lock"></i> 회원가입</a></li>
                        <%}else{ %>
                        <li><a href="member_myinfo_view.jsp"><%=sM_id%>님</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        	<a href="member_logout_action.jsp">로그아웃</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>