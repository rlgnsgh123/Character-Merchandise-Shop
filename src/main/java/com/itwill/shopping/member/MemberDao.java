package com.itwill.shopping.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.member.MemberDao;

public class MemberDao {
	private DataSource dataSource;
	public MemberDao() throws Exception{
		Properties properties=new Properties();
		properties.load(MemberDao.class.getResourceAsStream("jdbc.properties"));
		/*****Apache DataSource[commons-dbcp2]***/
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource=basicDataSource;
	}
	
	public int create(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_INSERT);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_password());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_address());
			pstmt.setString(5, member.getM_phone());
			insertRowCount = pstmt.executeUpdate();
			return insertRowCount;					
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		}				
	}
	
	public int update(Member member) throws Exception {
		return 0;
		
	}
	
	public Member selectById(String m_id) throws Exception {
		return null;
		
	}
	
	public ArrayList<Member> selectAll() throws Exception {
		return null;
		
	}
	
	
	public int delete(String m_id) throws Exception {
		return 0;
	}
	
	
}

















