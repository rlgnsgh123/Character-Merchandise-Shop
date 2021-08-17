package com.itwill.shopping.member;

import java.util.ArrayList;

import com.itwill.shopping.cartItem.CartItem;
import com.itwill.shopping.order.Order;

/*
이름         널?       유형            
---------- -------- ------------- 
M_ID       NOT NULL VARCHAR2(10)  
M_PASSWORD          VARCHAR2(16)  
M_NAME              VARCHAR2(20)  
M_ADDRESS           VARCHAR2(100)
M_PHONE             VARCHAR2(20)   
*/
public class Member {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_address;
	private String m_phone;

	
	public Member() {
		// TODO Auto-generated constructor stub
	}


	public Member(String m_id, String m_password, String m_name, String m_address, String m_phone) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
		this.m_phone = m_phone;
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


	public String getM_phone() {
		return m_phone;
	}


	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}


	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_address=" + m_address
				+ ", m_phone=" + m_phone + "]";
	}
	
	
}
