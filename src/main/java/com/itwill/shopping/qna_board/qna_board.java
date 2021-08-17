package com.itwill.shopping.qna_board;

import java.util.Date;

/*
 이름         널?       유형             
---------- -------- -------------- 
QB_NO      NOT NULL NUMBER(10)     
QB_TITLE            VARCHAR2(100)  
QB_CONTENT          VARCHAR2(2000) 
QB_DATE             DATE           
QB_VCOUNT           NUMBER(10)     
M_ID                VARCHAR2(10)   
 */
public class qna_board {
	private int qb_no;
	private String qb_title;
	private String qb_content;
	private Date qb_date;
	private int qb_vcount;
	private String m_id;
	
	public qna_board() {
		// TODO Auto-generated constructor stub
	}

	public qna_board(int qb_no, String qb_title, String qb_content, Date qb_date, int qb_vcount, String m_id) {
		super();
		this.qb_no = qb_no;
		this.qb_title = qb_title;
		this.qb_content = qb_content;
		this.qb_date = qb_date;
		this.qb_vcount = qb_vcount;
		this.m_id = m_id;
	}

	public int getQb_no() {
		return qb_no;
	}

	public void setQb_no(int qb_no) {
		this.qb_no = qb_no;
	}

	public String getQb_title() {
		return qb_title;
	}

	public void setQb_title(String qb_title) {
		this.qb_title = qb_title;
	}

	public String getQb_content() {
		return qb_content;
	}

	public void setQb_content(String qb_content) {
		this.qb_content = qb_content;
	}

	public Date getQb_date() {
		return qb_date;
	}

	public void setQb_date(Date qb_date) {
		this.qb_date = qb_date;
	}

	public int getQb_vcount() {
		return qb_vcount;
	}

	public void setQb_vcount(int qb_vcount) {
		this.qb_vcount = qb_vcount;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "qna_board [qb_no=" + qb_no + ", qb_title=" + qb_title + ", qb_content=" + qb_content + ", qb_date="
				+ qb_date + ", qb_vcount=" + qb_vcount + ", m_id=" + m_id + "]";
	}
	
}
