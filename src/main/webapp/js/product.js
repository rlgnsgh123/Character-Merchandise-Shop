//boolean isLogin = false;
//if (session.getAttribute("sUserId") != null) {
//	isLogin = true;
//}

	/*
		function addCart() {
			if (<%=!login%>) {
				alert('로그인후 이용가능합니다');
				location.href = 'member_login_form.jsp';
			}else{
				var win = window.open('cart_add_pop.jsp','popup','width=300,height=150,top=150,left=150 ')
				document.add_cart_form.method = 'POST';
				document.add_cart_form.action = 'cart_add_pop.jsp';
				document.add_cart_form.target = 'popup';
				document.add_cart_form.submit();
			}
		}
		*/
		
		function goList(){
			location.href="product_list.jsp";
		}
		
	/*	function buyNow() {
			if(<%= !login %>){
				alert('로그인후 이용가능합니다');
				location.href = "member_login_form.jsp"
			}else{
				document.product_detail_form.method="POST";
				document.product_detail_form.action = 'order_create_form.jsp';
				document.product_detail_form.submit();
			}
		}
		*/