package com.itwill.shopping.orderItem;

import com.itwill.shopping.order.Order;
import com.itwill.shopping.product.Product;

/*
 이름        널?       유형         
--------- -------- ---------- 
OI_NO     NOT NULL NUMBER(10) 
OI_AMOUNT          NUMBER(5)  
P_NO               NUMBER(10) 
O_NO               NUMBER(10) 
 */
public class OrderItem {
	private int oi_no;
	private int oi_amount;
	private Product product;
	private Order order;
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	public OrderItem(int oi_no, int oi_amount, Product product, Order order) {
		super();
		this.oi_no = oi_no;
		this.oi_amount = oi_amount;
		this.product = product;
		this.order = order;
	}

	public int getOi_no() {
		return oi_no;
	}

	public void setOi_no(int oi_no) {
		this.oi_no = oi_no;
	}

	public int getOi_amount() {
		return oi_amount;
	}

	public void setOi_amount(int oi_amount) {
		this.oi_amount = oi_amount;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "OrderItem [oi_no=" + oi_no + ", oi_amount=" + oi_amount + ", product=" + product + ", order=" + order
				+ "]";
	}
	
}
