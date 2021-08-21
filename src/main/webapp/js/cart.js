// <script src="js/cart.js"></script>
/* 
	<< cart_view.jsp >> function
*/
function cart_delete(){ // duplicate fin
				document.cart_view_form.method='POST';
				document.cart_view_form.action='cart_delete_action.jsp';
				document.cart_view_form.submit();
			}
			
function cart_view_form_order_submit(){ // duplicate fin
				document.cart_view_form.method='POST';
				document.cart_view_form.buyType.value='cart';
				document.cart_view_form.action='order_create_form.jsp';
				document.cart_view_form.submit();
				}

/*
	<< cart_view_update_qty.jsp
*/
function changeNumber(desc, formId) { // duplicate fin
			console.log(formId);
			var form = document.getElementById(formId);
			if (desc == '+') {
				form.cart_qty.value = parseInt(form.cart_qty.value) + 1;
			} else if (desc == '-') {
				if (form.cart_qty.value - 1 >= 0) {
					form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
				}
			}
			form.method = 'POST';
			form.action = 'cart_update_item_action.jsp';
			form.submit();
		}
/*
function cart_delete() {
			document.cart_view_form.method = 'POST';
			document.cart_view_form.action = 'cart_delete_action.jsp';
			document.cart_view_form.submit();
		}
*/

/*
function cart_view_form_order_submit() {
			document.cart_view_form.method = 'POST';
			document.cart_view_form.buyType.value = 'cart';
			document.cart_view_form.action = 'order_create_form.jsp';
			document.cart_view_form.submit();
		}
*/

function cart_view_form_select_order_submit() { // duplicate fin
			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
			var isChecked = false;
			for (var i = 0; i < cart_item_no_check_list.length; i++){
				if (cart_item_no_check_list.item(i).checked === true) {
					document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='"
							+ cart_item_no_check_list.item(i).value + "'>"
					isChecked = true;
				}
			}
			if (!isChecked) {
				alert('제품을 선택해주세요.');
				return;
			}
			document.cart_view_form.buyType.value = 'cart_select';
			document.cart_view_form.method = 'POST';
			document.cart_view_form.action = 'order_create_form.jsp';
			document.cart_view_form.submit();
		}

function cart_item_select_count(){ // duplicate fin
			
			var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
			var cart_item_check_selected_count = 0;
			for (var i = 0; i < cart_item_no_check_list.length; i++) {
				if (cart_item_no_check_list.item(i).checked === true) {
					cart_item_check_selected_count++;
				}
			}
			
			document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
		}


/*
	<< cart_view_select.jsp >>
*/
/*
function cart_delete(){
				document.cart_view_form.method = "jsp";
				document.cart_view_form.action = "cart_delete_action.jsp";
				document.cart_view_form.submit();
			}
*/

/*
function cart_view_form_order_submit(){
				document.cart_view_form.method='POST';
				document.cart_view_form.buyType.value='cart';
				document.cart_view_form.action='order_create_form.jsp';
				document.cart_view_form.submit();
			}
*/

/*
function cart_view_form_select_order_submit() {
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var isChecked = false;
				for (var i = 0; i < cart_item_no_check_list.length; i++) {
					if (cart_item_no_check_list.item(i).checked === true){
						document.cart_view_form.innerHTML += "<input type ='hidden' name = 'cart_item_no' values= '"+cart_item_no_check_list.item(i).value+"'>"
						isChecked = true;
					} // for - if end
				} // for end
				if (!isChecked){
					alert('제품을 선택해주세요.');
					return;
				} // if end
				document.cart_view_form.buyType.value = 'cart_select';
				document.cart_view_form.method='POST';
				document.cart_view_form.action='order_create_form.jsp';
				document.cart_view_form.submit();
			} // function cart_view_form_select_order_submit() end
*/

/*
function cart_item_select_count(){
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var cart_item_check_selected_count = 0;
				for (var i = 0 ; i < cart_item_no_check_list.length; i++){
					if (cart_item_no_check_list.item(i).checked === true){
						cart_item_check_selected_count++;
					} // for - if end
				} // for end
				document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			}// function cart_item_selected_count() end
/*

/*
	<< cart_view_icon.jsp >>
*/
/*
function changeNumber(desc, formId){
				console.log(formId);
				var form = document.getElementById(formId);
				if (desc == '+') {
					form.cart_qty.value = parseInt(form.cart_qty.value) + 1;
				} else if (desc == '-') {
					if (form.cart_qty.value - 1 >= 0) {
						form.cart_qty.value = parseInt(form.cart_qty.value) - 1;
					}
				}
				form.method = 'POST';
				form.action = 'cart_update_item_action.jsp';
				form.submit();
			}
*/

function cart_delete_item_action(formId){ // fin
				if(window.confirm('해당 상품을 장바구니에서 삭제하시겠습니까?')){
					var form = document.getElementById(formId);
					form.method = 'POST';
					form.action = 'cart_delete_item_action.jsp';
					form.submit();
				}
			}
/*
function cart_delete(){
				document.cart_view_form.method='POST';
				document.cart_view_form.action='cart_delete_action.jsp';
				document.cart_view_form.submit();
			}
*/

function cart_view_form_submit(){ // fin
				document.cart_view_form.method = 'POST';
				document.cart_view_form.buyType.value = 'cart';
				document.cart_view_form.action = 'order_create_form.jsp';
				document.cart_view_form.submit();
			}

function cart_view_form_select_submit() { // fin
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var isChecked = false;
				for (var i = 0; i < cart_item_no_check_list.length; i++) {
					if (cart_item_no_check_list.item(i).checked === true ) {
						document.cart_view_form.innerHTML += "<input type='hidden' name='cart_item_no' value='" + cart_item_no_check_list.item(i).value + "'>"
							isChecked = true;
					}
				}
				if (!isChecked){
					alert('제품을 선택해주세요.');
					return;
				}
				document.cart_view_form.buyType.value = 'cart_select';
				document.cart_view_form.method = 'POST';
				document.cart_view_form.action = 'order_create_form.jsp';
				document.cart_view_form.submit();
			}

/*
function cart_item_select_count(){
				var cart_item_no_check_list = document.getElementsByName("cart_item_no_check");
				var cart_item_check_selected_count = 0;
				for (var i = 0; i < cart_item_no_check_list.length; i++) {
					if (cart_item_no_check_list.item(i).checked === true) {
						cart_item_check_selected_count++;
					}
				}
				document.getElementById('cart_item_select_count').innerHTML = cart_item_check_selected_count;
			}
*/


