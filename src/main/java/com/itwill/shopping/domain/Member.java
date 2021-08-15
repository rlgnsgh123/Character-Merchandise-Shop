package com.itwill.shopping.domain;

import java.util.ArrayList;

import com.itwill.shopping.domain.CartItem;
import com.itwill.shopping.domain.Order;

/*
이름         널?       유형            
---------- -------- ------------- 
M_ID       NOT NULL VARCHAR2(10)  
M_PASSWORD          VARCHAR2(16)  
M_NAME              VARCHAR2(20)  
M_ADDRESS           VARCHAR2(100) 
*/
public class Member {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_address;
	private ArrayList<Order> orderList;
	private ArrayList<CartItem> cartItemList;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_password, String m_name, String m_address, ArrayList<Order> orderList,
			ArrayList<CartItem> cartItemList) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
		this.orderList = orderList;
		this.cartItemList = cartItemList;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public ArrayList<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(ArrayList<Order> orderList) {
		this.orderList = orderList;
	}

	public ArrayList<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(ArrayList<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_address=" + m_address
				+ ", orderList=" + orderList + ", cartItemList=" + cartItemList + "]";
	}
	
}
