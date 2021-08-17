package com.itwill.shopping.notice_board;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;


public class NoticeBoardDao {
	private DataSource dataSource;
	public NoticeBoardDao() throws Exception{
		Properties properties=new Properties();
		properties.load(NoticeBoardDao.class.getResourceAsStream("jdbc.properties"));
		/*****Apache DataSource[commons-dbcp2]***/
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource=basicDataSource;
	}
	// 게시물 쓰기 
	public int insert(NoticeBoard board) throws Exception {
		
		return 0;
	}
	// 게스글 삭제
	public int delete(int boardNo) throws Exception {
		return 0;
	}
	// 게시글 수정
	public int update(NoticeBoard board) throws Exception {
		return 0;
	}
	// 게시글 조회수 증가
	public void updateViewCount(int vcount) throws Exception {
	
	}
		
	
}
