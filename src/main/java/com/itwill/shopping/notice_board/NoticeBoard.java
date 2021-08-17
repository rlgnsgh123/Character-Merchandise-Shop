package com.itwill.shopping.notice_board;

import java.util.Date;

/*
NB_NO      NOT NULL NUMBER(10)     
NB_TITLE            VARCHAR2(100)  
NB_CONTENT          VARCHAR2(2000) 
NB_DATE             DATE           
NB_VCOUNT           NUMBER(10)     
NB_GROUPNO NOT NULL NUMBER(10)     
NB_STEP    NOT NULL NUMBER(10)     
NB_DEPTH            NUMBER(10)     
M_ID                VARCHAR2(10)    
 */
public class NoticeBoard {
	private int nb_no;
	private String nb_title;
	private String nb_content;
	private Date nb_date;
	private int nb_vcount;
	private int nb_groupno;
	private int nb_step;
	private int nb_depth;
	private String m_id;
	
	public NoticeBoard() {
		// TODO Auto-generated constructor stub
	}

	public NoticeBoard(int nb_no, String nb_title, String nb_content, Date nb_date, int nb_vcount, int nb_groupno,
			int nb_step, int nb_depth, String m_id) {
		super();
		this.nb_no = nb_no;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_date = nb_date;
		this.nb_vcount = nb_vcount;
		this.nb_groupno = nb_groupno;
		this.nb_step = nb_step;
		this.nb_depth = nb_depth;
		this.m_id = m_id;
	}

	/**
	 * @return the nb_no
	 */
	public int getNb_no() {
		return nb_no;
	}

	/**
	 * @param nb_no the nb_no to set
	 */
	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}

	/**
	 * @return the nb_title
	 */
	public String getNb_title() {
		return nb_title;
	}

	/**
	 * @param nb_title the nb_title to set
	 */
	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	/**
	 * @return the nb_content
	 */
	public String getNb_content() {
		return nb_content;
	}

	/**
	 * @param nb_content the nb_content to set
	 */
	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}

	/**
	 * @return the nb_date
	 */
	public Date getNb_date() {
		return nb_date;
	}

	/**
	 * @param nb_date the nb_date to set
	 */
	public void setNb_date(Date nb_date) {
		this.nb_date = nb_date;
	}

	/**
	 * @return the nb_vcount
	 */
	public int getNb_vcount() {
		return nb_vcount;
	}

	/**
	 * @param nb_vcount the nb_vcount to set
	 */
	public void setNb_vcount(int nb_vcount) {
		this.nb_vcount = nb_vcount;
	}

	/**
	 * @return the nb_groupno
	 */
	public int getNb_groupno() {
		return nb_groupno;
	}

	/**
	 * @param nb_groupno the nb_groupno to set
	 */
	public void setNb_groupno(int nb_groupno) {
		this.nb_groupno = nb_groupno;
	}

	/**
	 * @return the nb_step
	 */
	public int getNb_step() {
		return nb_step;
	}

	/**
	 * @param nb_step the nb_step to set
	 */
	public void setNb_step(int nb_step) {
		this.nb_step = nb_step;
	}

	/**
	 * @return the nb_depth
	 */
	public int getNb_depth() {
		return nb_depth;
	}

	/**
	 * @param nb_depth the nb_depth to set
	 */
	public void setNb_depth(int nb_depth) {
		this.nb_depth = nb_depth;
	}

	/**
	 * @return the m_id
	 */
	public String getM_id() {
		return m_id;
	}

	/**
	 * @param m_id the m_id to set
	 */
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "NoticeBoard [nb_no=" + nb_no + ", nb_title=" + nb_title + ", nb_content=" + nb_content + ", nb_date="
				+ nb_date + ", nb_vcount=" + nb_vcount + ", nb_groupno=" + nb_groupno + ", nb_step=" + nb_step
				+ ", nb_depth=" + nb_depth + ", m_id=" + m_id + "]";
	}
	
}
