package com.itwill.shopping.domain;
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
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_password, String m_name, String m_address) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_address = m_address;
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

	@Override
	public String toString() {
		return "MemberDao [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_address="
				+ m_address + "]";
	}
	
}
