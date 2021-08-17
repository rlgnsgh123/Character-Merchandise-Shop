package com.itwill.shopping.member.test;

import com.itwill.shopping.member.MemberDao;

public class MemberDaoTestMain {

	public static void main(String[] args) throws Exception{
		MemberDao memberDao = new MemberDao();
		
		//System.out.println(memberDao.selectAll());
		
		System.out.println(memberDao.selectById("customer1"));
		

	}

}
