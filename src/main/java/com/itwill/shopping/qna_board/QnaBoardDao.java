package com.itwill.shopping.qna_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.shopping.notice_board.NoticeBoard;
import com.itwill.shopping.notice_board.NoticeBoardSQL;



public class QnaBoardDao {
	private DataSource dataSource;
	public QnaBoardDao() throws Exception {
		Properties properties=new Properties();
		properties.load(this.getClass().getResourceAsStream("jdbc.properties"));
		/*****Apache DataSource[commons-dbcp2]***/
		BasicDataSource basicDataSource=new BasicDataSource();
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		this.dataSource=basicDataSource;
	}
	// 게시글 전체보기
		public ArrayList<QnaBoard> selectAll(int start, int last) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ArrayList<QnaBoard> boardList = new ArrayList<QnaBoard>();
			
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_SELECTALL);
				pstmt.setInt(1, start);
				pstmt.setInt(2, last);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					boardList.add(new QnaBoard(rs.getInt(2),
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
		public QnaBoard selectNo(int no) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			QnaBoard board = null;
			
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_SELECTNO);
				pstmt.setInt(1, no);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board= new QnaBoard(rs.getInt(1),
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
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_TOTALCOUNT);
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
		public boolean countReply(QnaBoard board) throws SQLException {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Boolean isExist = false;
			int cnt = 0;
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_COUNTREPLY);
				
				pstmt.setInt(1, board.getQb_groupno());
				pstmt.setInt(2, board.getQb_depth());
				pstmt.setInt(3, board.getQb_step());
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					cnt = rs.getInt("cnt");
				}
				if (cnt > 1) {
					isExist = true;
				}	
			} catch (Exception ex) {
				ex.printStackTrace();
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
			return isExist;
		}
		
		
		// 게시물 쓰기 
		public int insert(QnaBoard board) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_INSERT);
				pstmt.setString(1, board.getQb_title());
				pstmt.setString(2, board.getQb_content());
				pstmt.setString(3, board.getM_id());
				
				int insertResult = pstmt.executeUpdate();
				
				return insertResult;
			} finally {
				con.close();
			}
			
		}
		// 답글 게시물 쓰기
		public int insertReply(QnaBoard board) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			int count = 0;
			try {
				QnaBoard temp = this.selectNo(board.getQb_no());
				
				con = dataSource.getConnection();
				// 스텝 기존 스텝에서 1증가
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_STEP_UPDATE);
				pstmt.setInt(1, temp.getQb_step());
				pstmt.setInt(2, temp.getQb_groupno());
				pstmt.executeUpdate();
				pstmt.close();
				// 댓글 쓰기
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_REPLY_INSERT);
				pstmt.setString(1, board.getQb_title());
				pstmt.setString(2, board.getQb_content());
				pstmt.setInt(3, temp.getQb_groupno());
				pstmt.setInt(4, temp.getQb_step() + 1);
				pstmt.setInt(5, temp.getQb_depth() + 1);
				pstmt.setString(6, board.getM_id());

				count = pstmt.executeUpdate();
				
			}finally {
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
			return count;
		}
		// 게스글 삭제
		public int delete(int boardNo) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			int count = 0;
			try {
				con = dataSource.getConnection();

				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_DELETE);
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
		public int update(QnaBoard board) throws Exception {
			Connection con = null;
			PreparedStatement pstmt = null;
			int count = 0;
			try {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_UPDATE);
				pstmt.setString(1, board.getQb_title());
				pstmt.setString(2, board.getQb_content());
				pstmt.setInt(3, board.getQb_no());
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
				
				pstmt = con.prepareStatement(QnaBoardSQL.QNA_BOARD_VCOUNT_UPDATE);
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
