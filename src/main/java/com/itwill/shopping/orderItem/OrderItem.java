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
	private int p_no;
	private int o_no;
	private Product product;
	
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	public OrderItem(int oi_no, int oi_amount, int p_no, int o_no) {
		super();
		this.oi_no = oi_no;
		this.oi_amount = oi_amount;
		this.p_no = p_no;
		this.o_no = o_no;
	}
	
	

	public OrderItem(int oi_no, int oi_amount, int o_no, Product product) {
		super();
		this.oi_no = oi_no;
		this.oi_amount = oi_amount;
		this.o_no = o_no;
		this.product = product;
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


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}


	public int getO_no() {
		return o_no;
	}


	public void setO_no(int o_no) {
		this.o_no = o_no;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	@Override
	public String toString() {
		return "OrderItem [oi_no=" + oi_no + ", oi_amount=" + oi_amount + ", p_no=" + p_no + ", o_no=" + o_no
				+ ", product=" + product + "]";
	}
	
	
	
	
}
	
	
	
	