package com.itwill.shopping.member;

import java.util.ArrayList;

import com.itwill.shopping.member.MemberDao;

public class MemberService {
	private MemberDao memberDao;	
	public MemberService() throws Exception {
		memberDao = new MemberDao();
	}
	/*
	 * 회원가입(아이디 중복 체크)
	 */
	public int create(Member member) throws Exception {
		if(memberDao.idCheckCount(member.getM_id())==true) {
			//이미 존재하는 아이디입니다.
		}
		return memberDao.create(member);	
	}
	
	/*
	 * 로그인(아이디 존재 여부, 패스워드 일치 여부)
	 */
	public Member login(String m_id,String m_password) throws Exception {
		Member member = memberDao.selectById(m_id);
		if(member==null) {
			//존재하지 않는 아이디입니다.
		}
		if(!member.getM_password().equals(m_password)) {
			//패스워드가 일치하지 않습니다.
		}
		return member;
	}
	
	/*
	 * 회원전체리스트
	 */
	public ArrayList<Member> findMemberList() throws Exception {
		return memberDao.selectAll();
	}
	
	/*
	 * 회원 한명 보기
	 */
	public Member findMember(String m_id) throws Exception {
		return memberDao.selectById(m_id);
	}
	
	/*
	 * 정보 수정
	 */
	public int updateMember(Member member) throws Exception {
		return memberDao.update(member);
	}
	
	/*
	 * 회원탈퇴
	 */
	public int delete(String m_id) throws Exception {
		return memberDao.deleteById(m_id);
	}
	
}
