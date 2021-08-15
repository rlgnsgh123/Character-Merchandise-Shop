package com.itwill.shopping.domain;

import java.util.Date;

/*
 이름         널?       유형             
---------- -------- -------------- 
BB_NO      NOT NULL NUMBER(10)     
BB_TITLE            VARCHAR2(100)  
BB_CONTENT          VARCHAR2(2000) 
BB_DATE             DATE           
BB_VCOUNT           NUMBER(10)     
M_ID                VARCHAR2(10)  
 */
public class Bulletin_board {
	private int bb_no;
	private String bb_title;
	private String bb_content;
	private Date bb_date;
	private int bb_vcount;
	private String m_id;
	
	public Bulletin_board() {
		// TODO Auto-generated constructor stub
	}

	public Bulletin_board(int bb_no, String bb_title, String bb_content, Date bb_date, int bb_vcount, String m_id) {
		super();
		this.bb_no = bb_no;
		this.bb_title = bb_title;
		this.bb_content = bb_content;
		this.bb_date = bb_date;
		this.bb_vcount = bb_vcount;
		this.m_id = m_id;
	}

	public int getBb_no() {
		return bb_no;
	}

	public void setBb_no(int bb_no) {
		this.bb_no = bb_no;
	}

	public String getBb_title() {
		return bb_title;
	}

	public void setBb_title(String bb_title) {
		this.bb_title = bb_title;
	}

	public String getBb_content() {
		return bb_content;
	}

	public void setBb_content(String bb_content) {
		this.bb_content = bb_content;
	}

	public Date getBb_date() {
		return bb_date;
	}

	public void setBb_date(Date bb_date) {
		this.bb_date = bb_date;
	}

	public int getBb_vcount() {
		return bb_vcount;
	}

	public void setBb_vcount(int bb_vcount) {
		this.bb_vcount = bb_vcount;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Bulletin_board [bb_no=" + bb_no + ", bb_title=" + bb_title + ", bb_content=" + bb_content + ", bb_date="
				+ bb_date + ", bb_vcount=" + bb_vcount + ", m_id=" + m_id + "]";
	}
	
}
