package com.itwill.shopping.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.member.MemberDao;

public class MemberDao {
	private DataSource dataSource;
	public MemberDao() throws Exception{
		Properties properties=new Properties();
		properties.load(this.getClass().getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
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
							
		} finally {
			if(pstmt!=null) 
				pstmt.close();			
			if(con!=null) 
				con.close();			
		}	
		return insertRowCount;	
	}
	
	public int update(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_UPDATE);
			pstmt.setString(1, member.getM_password());
			pstmt.setString(2, member.getM_name());
			pstmt.setString(3, member.getM_address());
			pstmt.setString(4, member.getM_phone());
			pstmt.setString(5, member.getM_id());
			updateRowCount = pstmt.executeUpdate();
				
		} finally {
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}
		return updateRowCount;
		
	}
	
	public Member selectById(String m_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_BY_ID);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getString("m_id"),
						    		rs.getString("m_password"),
						    		rs.getString("m_name"),
						    		rs.getString("m_address"),
						    		rs.getString("m_phone"));
			}
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}
		return member;
		
	}
	
	public ArrayList<Member> selectAll() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> selectAll = new ArrayList<Member>();
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				selectAll.add(new Member(rs.getString("m_id"),
										 rs.getString("m_password"),
										 rs.getString("m_name"),
										 rs.getString("m_address"),
										 rs.getString("m_phone")));
			}
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}
		return selectAll;
		
	}
	
	public boolean idCheckCount(String m_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean idCheck = false;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_ID_CHECK_COUNT);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			if(count==1) 
				idCheck = true; //아이디 중복 -> 에러메시지
			
		} finally {
			if(rs!=null)
				rs.close();
			if(pstmt!=null) 
				pstmt.close();
			if(con!=null)
				con.close();
		}		
		return idCheck;		
	}
	
	public int deleteById(String m_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int deleteRowCount = 0;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(MemberSQL.MEMBER_DLELTE);
			pstmt.setString(1, m_id);
			deleteRowCount = pstmt.executeUpdate();			
		} finally {
			if(pstmt!=null) 
				pstmt.close();
			if(con!=null)
				con.close();
		}
		return deleteRowCount;
	}
	
}