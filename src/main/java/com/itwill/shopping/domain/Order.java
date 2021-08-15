package com.itwill.shopping.domain;

import java.util.ArrayList;
import java.util.Date;

/*
 이름        널?       유형            
--------- -------- ------------- 
O_NO      NOT NULL NUMBER(10)    
O_NAME             VARCHAR2(10)  
O_PHONE            VARCHAR2(20)  
O_ADDRESS          VARCHAR2(50)  
O_DATE             DATE          
O_DESC             VARCHAR2(100) 
O_PRICE            NUMBER(10)    
O_METHOD           VARCHAR2(10)  
M_ID               VARCHAR2(10)  
 */
public class Order {
	private int o_no;
	private Date o_date;
	private String o_desc;
	private int o_price;
	private String o_method;
	private Member member;
	private ArrayList<OrderItem> orderItemList;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int o_no, Date o_date, String o_desc, int o_price, String o_method, Member member,
			ArrayList<OrderItem> orderItemList) {
		super();
		this.o_no = o_no;
		this.o_date = o_date;
		this.o_desc = o_desc;
		this.o_price = o_price;
		this.o_method = o_method;
		this.member = member;
		this.orderItemList = orderItemList;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getO_desc() {
		return o_desc;
	}

	public void setO_desc(String o_desc) {
		this.o_desc = o_desc;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public String getO_method() {
		return o_method;
	}

	public void setO_method(String o_method) {
		this.o_method = o_method;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public ArrayList<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(ArrayList<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_date=" + o_date + ", o_desc=" + o_desc + ", o_price=" + o_price
				+ ", o_method=" + o_method + ", member=" + member + ", orderItemList=" + orderItemList + "]";
	}
	
}
