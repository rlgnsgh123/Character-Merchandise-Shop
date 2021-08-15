package com.itwill.shopping.domain;

import java.util.Date;

/*
 이름           널?       유형           
------------ -------- ------------ 
M_ID         NOT NULL VARCHAR2(10) 
MD_BIRTHDAY           DATE         
MD_GENDER             VARCHAR2(1)  
MD_PHONE              VARCHAR2(20) 
MD_EMAIL              VARCHAR2(50) 
MD_JOIN_DATE          DATE         

 */
public class Member_detail {
	private String m_id;
	private Date md_birthday;
	private String md_gender;
	private String md_phone;
	private String md_email;
	private Date md_join_date;
	
	public Member_detail() {
		// TODO Auto-generated constructor stub
	}

	public Member_detail(String m_id, Date md_birthday, String md_gender, String md_phone, String md_email,
			Date md_join_date) {
		super();
		this.m_id = m_id;
		this.md_birthday = md_birthday;
		this.md_gender = md_gender;
		this.md_phone = md_phone;
		this.md_email = md_email;
		this.md_join_date = md_join_date;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getMd_birthday() {
		return md_birthday;
	}

	public void setMd_birthday(Date md_birthday) {
		this.md_birthday = md_birthday;
	}

	public String getMd_gender() {
		return md_gender;
	}

	public void setMd_gender(String md_gender) {
		this.md_gender = md_gender;
	}

	public String getMd_phone() {
		return md_phone;
	}

	public void setMd_phone(String md_phone) {
		this.md_phone = md_phone;
	}

	public String getMd_email() {
		return md_email;
	}

	public void setMd_email(String md_email) {
		this.md_email = md_email;
	}

	public Date getMd_join_date() {
		return md_join_date;
	}

	public void setMd_join_date(Date md_join_date) {
		this.md_join_date = md_join_date;
	}

	@Override
	public String toString() {
		return "Member_detail [m_id=" + m_id + ", md_birthday=" + md_birthday + ", md_gender=" + md_gender
				+ ", md_phone=" + md_phone + ", md_email=" + md_email + ", md_join_date=" + md_join_date + "]";
	}
	
}
