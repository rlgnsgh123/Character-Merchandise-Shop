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
QB_GROUPNO NOT NULL NUMBER(10)     
QB_STEP    NOT NULL NUMBER(10)     
QB_DEPTH            NUMBER(10)     
M_ID                VARCHAR2(10) 
 */
public class QnaBoard {
	private int qb_no;
	private String qb_title;
	private String qb_content;
	private Date qb_date;
	private int qb_vcount;
	private int qb_groupno;
	private int qb_step;
	private int qb_depth;
	private String m_id;
	
	public QnaBoard() {
		// TODO Auto-generated constructor stub
	}

	public QnaBoard(int qb_no, String qb_title, String qb_content, Date qb_date, int qb_vcount, int qb_groupno,
			int qb_step, int qb_depth, String m_id) {
		super();
		this.qb_no = qb_no;
		this.qb_title = qb_title;
		this.qb_content = qb_content;
		this.qb_date = qb_date;
		this.qb_vcount = qb_vcount;
		this.qb_groupno = qb_groupno;
		this.qb_step = qb_step;
		this.qb_depth = qb_depth;
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

	public int getQb_groupno() {
		return qb_groupno;
	}

	public void setQb_groupno(int qb_groupno) {
		this.qb_groupno = qb_groupno;
	}

	public int getQb_step() {
		return qb_step;
	}

	public void setQb_step(int qb_step) {
		this.qb_step = qb_step;
	}

	public int getQb_depth() {
		return qb_depth;
	}

	public void setQb_depth(int qb_depth) {
		this.qb_depth = qb_depth;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "QnaBoard [qb_no=" + qb_no + ", qb_title=" + qb_title + ", qb_content=" + qb_content + ", qb_date="
				+ qb_date + ", qb_vcount=" + qb_vcount + ", qb_groupno=" + qb_groupno + ", qb_step=" + qb_step
				+ ", qb_depth=" + qb_depth + ", m_id=" + m_id + "]";
	}
	
}