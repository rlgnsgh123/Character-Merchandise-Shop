package com.itwill.shopping.qna_board;

public class QnaBoardSQL {
	// 게시글 쓰기
	public final static String QNA_BOARD_INSERT ="insert into qna_board"
																	+ "	(qb_no,qb_title,qb_content,qb_groupno,qb_step,m_id)"
																	+ "	values(qna_board_qb_no_seq.nextval,?,?,qna_board_qb_no_seq.currval,1,?)";
	// 답글 쓰기
	public final static String QNA_BOARD_REPLY_INSERT ="insert into qna_board "
																	+ "	(qb_no, qb_title, qb_content, qb_vcount, qb_groupno, qb_step,qb_depth,m_id) "
																	+ "values(QNA_BOARD_QB_NO_SEQ.nextval, ?, ?,0,QNA_BOARD_QB_NO_SEQ.currval,?,?,?)";
	// 게시글 수정
	public final static String QNA_BOARD_UPDATE ="update qna_board set qb_title = ?, qb_content = ? where qb_no = ?";
	// 답글 step 수정
	public final static String QNA_BOARD_STEP_UPDATE ="update qna_board set qb_step = qb_step + 1 where qb_step > ? and qb_groupno = ?";
	// 게시글 조회수 수정
	public final static String QNA_BOARD_VCOUNT_UPDATE ="update qna_board set qb_vcount = qb_vcount + 1 where qb_no=?";
	// 게시글 삭제
	public final static String QNA_BOARD_DELETE ="delete from qna_board where qb_no=?";
	// 게시글 전체보기
	public final static String QNA_BOARD_SELECTALL ="select * from "
																+ "( select rownum idx, s.* from "
																+ "( select * from qna_board order by qb_groupno DESC, qb_step ASC ) s )"
																+ " where idx >= ? AND idx <= ?";
	//게시글 번호로 찾기
	public final static String QNA_BOARD_SELECTNO ="select qb_no,qb_title,qb_content,qb_date,qb_vcount,qb_groupno,qb_step,qb_depth,m_id "
			+ "											from qna_board "
			+ "											where qb_no = ?";
	// 게시물 총수 
	public final static String QNA_BOARD_TOTALCOUNT ="select count(*) from qna_board";
	// 답글 존재여부 확인
	public final static String QNA_BOARD_COUNTREPLY ="select count(*) cnt from qna_board where qb_groupno = ?  and qb_step >= ? order by qb_step,qb_depth asc";

}
