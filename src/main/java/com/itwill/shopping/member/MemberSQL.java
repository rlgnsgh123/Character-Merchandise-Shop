package com.itwill.shopping.member;

public class MemberSQL {
	public final static String MEMBER_INSERT=
			"insert into member(m_id,m_password,m_name,m_address,m_phone) values(?,?,?,?,?)";
	public final static String MEMBER_UPDATE=
			"update member set m_password=?, m_name=?, m_address=?, md_phone=? where m_id=?";
			
	public final static String MEMBER_SELECT_BY_ID=
	
	public final static String MEMBER_SELECT_ALL=
	
	public final static String MEMBER_SELECT_BY_ID_COUNT=
}
