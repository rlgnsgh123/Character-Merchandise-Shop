package com.itwill.shopping.notice_board;

public class NoticeBoardSQL {
	// 게시글 쓰기 (완료)
	public final static String NOTICE_BOARD_INSERT ="insert into notice_board"
																	+ "	(nb_no,nb_title,nb_content,nb_groupno,nb_step,m_id)"
																	+ "	values(notice_board_nb_no_seq.nextval,?,?,notice_board_nb_no_seq.currval,1,?)";
	// 답글 쓰기
	public final static String NOTICE_BOARD_REPLY_INSERT ="insert into notice_board "
																	+ "	(nb_no, nb_title, nb_content, nb_vcount, nb_groupno, nb_step,nb_depth,m_id) "
																	+ "values(NOTICE_BOARD_NB_NO_SEQ.nextval, ?, ?,0,NOTICE_BOARD_NB_NO_SEQ.currval,?,?,?)";
	// 게시글 수정 (완료)
	public final static String NOTICE_BOARD_UPDATE ="update notice_board set nb_title = ?, nb_content = ? where nb_no = ?";
	// 답글 step 수정 
	public final static String NOTICE_BOARD_STEP_UPDATE ="update notice_board set nb_step = nb_step + 1 where nb_step > ? and nb_groupno = ?";
	// 게시글 조회수 1증가 (완료)
	public final static String NOTICE_BOARD_VCOUNT_UPDATE ="update notice_board set nb_vcount = nb_vcount + 1 where nb_no=?";
	// 게시글 삭제 (완료)
	public final static String NOTICE_BOARD_DELETE ="delete notice_board where nb_no=?";
	// 게시글 전체보기 (완료)
	public final static String NOTICE_BOARD_SELECTALL ="select * from "
																+ "( select rownum idx, s.* from "
																+ "( select * from notice_board order by nb_groupno DESC, nb_step ASC ) s )"
																+ " where idx >= ? AND idx <= ?";
	//게시글 아이디로 찾기 (완료)
	public final static String NOTICE_BOARD_SELECTID ="select nb_no,nb_title,nb_content,nb_date,nb_vcount,nb_groupno,nb_step,nb_depth,m_id "
			+ "											from notice_board "
			+ "											where m_id = ?";
	// 게시물 총수 (완료)
	public final static String NOTICE_BOARD_TOTALCOUNT ="select count(*) from notice_board";
	// 답글 존재여부 확인
	public final static String NOTICE_BOARD_COUNTREPLY ="select count(*) cnt from notice_board where nb_groupno = ?  and nb_step >= ? order by nb_step,nb_depth asc";



}
