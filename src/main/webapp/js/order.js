/**
 * 
 */
//order_list
	function order_delete_all_action(){
		f.action = 'order_delete_all_action.jsp';
		f.submit();
	}
	

	function product_search_action(){
		f.action='product_list.jsp';
		f.submit();
	}
	
/*order_create_form
   function order_create_form_submit() {
      document.order_create_form.method = 'POST';
      document.order_create_form.action = 'order_create_action.jsp';
      document.order_create_form.submit();
   }

*/