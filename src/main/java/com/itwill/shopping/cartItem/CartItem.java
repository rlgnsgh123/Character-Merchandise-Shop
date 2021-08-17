package com.itwill.shopping.cartItem;

import com.itwill.shopping.member.Member;
import com.itwill.shopping.product.Product;

/*
 이름         널?       유형           
---------- -------- ------------ 
C_ITEM_NO  NOT NULL NUMBER(10)   
C_ITEM_QTY          NUMBER(10)   
M_ID                VARCHAR2(10) 
P_NO                NUMBER(10)   
 */
public class CartItem {
	private int c_item_no;
	private int c_item_qty;
	private Member member;
	private Product product;
	
	public CartItem() {
		// TODO Auto-generated constructor stub
	}

	public CartItem(int c_item_no, int c_item_qty, Member member, Product product) {
		super();
		this.c_item_no = c_item_no;
		this.c_item_qty = c_item_qty;
		this.member = member;
		this.product = product;
	}

	public int getC_item_no() {
		return c_item_no;
	}

	public void setC_item_no(int c_item_no) {
		this.c_item_no = c_item_no;
	}

	public int getC_item_qty() {
		return c_item_qty;
	}

	public void setC_item_qty(int c_item_qty) {
		this.c_item_qty = c_item_qty;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "CartItem [c_item_no=" + c_item_no + ", c_item_qty=" + c_item_qty + ", member=" + member + ", product="
				+ product + "]";
	}
	
	
}
