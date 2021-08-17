package com.itwill.shopping.notice_board;

import java.util.Date;

/*
 이름         널?       유형             
---------- -------- -------------- 
nb_NO      NOT NULL NUMBER(10)     
nb_TITLE            VARCHAR2(100)  
nb_CONTENT          VARCHAR2(2000) 
nb_DATE             DATE           
nb_VCOUNT           NUMBER(10)     
M_ID                VARCHAR2(10)  
 */
public class NoticeBoard {
	private int nb_no;
	private String nb_title;
	private String nb_content;
	private Date nb_date;
	private int nb_vcount;
	private String m_id;
	
	public NoticeBoard() {
		// TODO Auto-generated constructor stub
	}

	public NoticeBoard(int nb_no, String nb_title, String nb_content, Date nb_date, int nb_vcount, String m_id) {
		super();
		this.nb_no = nb_no;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_date = nb_date;
		this.nb_vcount = nb_vcount;
		this.m_id = m_id;
	}

	public int getnb_no() {
		return nb_no;
	}

	public void setnb_no(int nb_no) {
		this.nb_no = nb_no;
	}

	public String getnb_title() {
		return nb_title;
	}

	public void setnb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	public String getnb_content() {
		return nb_content;
	}

	public void setnb_content(String nb_content) {
		this.nb_content = nb_content;
	}

	public Date getnb_date() {
		return nb_date;
	}

	public void setnb_date(Date nb_date) {
		this.nb_date = nb_date;
	}

	public int getnb_vcount() {
		return nb_vcount;
	}

	public void setnb_vcount(int nb_vcount) {
		this.nb_vcount = nb_vcount;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Bulletin_board [nb_no=" + nb_no + ", nb_title=" + nb_title + ", nb_content=" + nb_content + ", nb_date="
				+ nb_date + ", nb_vcount=" + nb_vcount + ", m_id=" + m_id + "]";
	}
	
}
