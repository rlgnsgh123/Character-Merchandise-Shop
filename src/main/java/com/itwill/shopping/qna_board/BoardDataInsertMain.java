package com.itwill.shopping.qna_board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class BoardDataInsertMain {
	public static void main(String[] args) throws Exception{
		Connection con = null;
		Statement stmt = null;
		try {
			Properties properties = new Properties();
			properties.load(BoardDataInsertMain.class.getResourceAsStream("/com/itwill/shopping/jdbc.properties"));
			/*** Apache DataSource ***/
			BasicDataSource basicDataSource = new BasicDataSource();
			basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
			basicDataSource.setUrl(properties.getProperty("url"));
			basicDataSource.setUsername(properties.getProperty("username"));
			basicDataSource.setPassword(properties.getProperty("password"));
			
			DataSource dataSource = basicDataSource;
			con = dataSource.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			con.setAutoCommit(false);
			for (int i = 1; i <= 120; i++) {
				
				stmt.addBatch("INSERT INTO qna_board (qb_no, qb_title, qb_content, qb_groupno, qb_step, m_id)" + " VALUES ("
						+ "QNA_BOARD_QB_NO_SEQ.nextval," + "'문의드립니다.'||QNA_BOARD_QB_NO_SEQ.currval ,"
						 + "'배송은 얼마나 걸리나요?'||QNA_BOARD_QB_NO_SEQ.currval,"+ "QNA_BOARD_QB_NO_SEQ.currval,"+ "1,"
						 + "'customer1')");
						 
				
				 stmt.addBatch("INSERT INTO notice_board (nb_no, nb_title, nb_content, nb_groupno, nb_step, m_id)" + " VALUES ("
						+ "NOTICE_BOARD_NB_NO_SEQ.nextval," + "'공지합니다.'||NOTICE_BOARD_NB_NO_SEQ.currval ,"
						 + "'배송사 사정에 따라 다르지만 배송은 대략 2~3일 정도 소요됩니다.'||NOTICE_BOARD_NB_NO_SEQ.currval,"+ "NOTICE_BOARD_NB_NO_SEQ.currval,"+ "1,"
						 + "'admin1')");
				

			}
			int[] updateCounts = stmt.executeBatch();
			System.out.println("query 수:" + updateCounts.length);
			con.commit();
			System.out.println("success commit!!!!");
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
				System.out.println("rollback !!!");
			} catch (SQLException e1) {
				System.out.println("rollback fail!!!");
			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("close 시 에러발생");
			}
		}

	}
}
