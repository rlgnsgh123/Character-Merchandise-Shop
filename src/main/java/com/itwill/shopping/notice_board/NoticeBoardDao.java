package com.itwill.shopping.notice_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;


public class NoticeBoardDao {
	private DataSource dataSource;
	public NoticeBoardDao() throws Exception{
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
	// 게시글 전체보기
	public ArrayList<NoticeBoard> selectAll(int start, int last) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<NoticeBoard> boardList = new ArrayList<NoticeBoard>();
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_SELECTALL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				boardList.add(new NoticeBoard(rs.getInt(2),
												rs.getString(3),
												rs.getString(4),
												rs.getDate(5),
												rs.getInt(6),
												rs.getInt(7),
												rs.getInt(8),
												rs.getInt(9),
												rs.getString(10)));
				
			}
			return boardList;
		}finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
	}
	// 작성자로 게시물 찾기
	public NoticeBoard selectId(String memberId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		NoticeBoard board = null;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_SELECTID);
			pstmt.setString(1, memberId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board= new NoticeBoard(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getDate(4),
										rs.getInt(5),
										rs.getInt(6),
										rs.getInt(7),
										rs.getInt(8),
										rs.getString(9));
				
			}
			return board;
			
		}finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (Exception ex) {
				}
		}
	}
	
	// 총게시물수 찾기
	public int boardCount() throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_TOTALCOUNT);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			return count;
			
		}finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception ex) {
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {	
			}
		}
	}
	
	
	// 게시물 쓰기 
	public int insert(NoticeBoard board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_INSERT);
			pstmt.setString(1, board.getNb_title());
			pstmt.setString(2, board.getNb_content());
			pstmt.setString(3, board.getM_id());
			
			int insertResult = pstmt.executeUpdate();
			
			return insertResult;
		} finally {
			con.close();
		}
		
	}
	// 게스글 삭제
	public int delete(int boardNo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_DELETE);
			pstmt.setInt(1, boardNo);
			count = pstmt.executeUpdate();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	// 게시글 수정
	public int update(NoticeBoard board) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_UPDATE);
			pstmt.setString(1, board.getNb_title());
			pstmt.setString(2, board.getNb_content());
			pstmt.setInt(3, board.getNb_no());
			count = pstmt.executeUpdate();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();;
			} catch (Exception ex) {
			}
		}
		return count;
	}
	// 게시글 조회수 증가
	public int updateViewCount(int no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			
			pstmt = con.prepareStatement(NoticeBoardSQL.NOTICE_BOARD_VCOUNT_UPDATE);
			pstmt.setInt(1, no);
			int updateViewCount=pstmt.executeUpdate();
			
			return updateViewCount;
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception ex) {
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	}
		
	
}
