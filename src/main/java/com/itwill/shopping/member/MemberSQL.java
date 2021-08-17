package com.itwill.shopping.member;

public class MemberSQL {
	public final static String MEMBER_INSERT=
			"insert into member(m_id,m_password,m_name,m_address,m_phone) values(?,?,?,?,?)";
	public final static String MEMBER_UPDATE=
			"update member set m_password=?,m_name=?,m_address=?,m_phone=? where m_id=?";
	public final static String MEMBER_SELECT_BY_ID=
			"select m_id,m_password,m_name,m_address,m_phone from member where m_id=?";
	public final static String MEMBER_SELECT_ALL=
			"select m_id,m_password,m_name,m_address,m_phone from member";
	public final static String MEMBER_ID_CHECK_COUNT= 
			"select count(*) cnt from member where m_id=?";
	public final static String MEMBER_DLELTE=
			"delete member where m_id=?";
}
