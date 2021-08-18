package com.itwill.shopping.qna_board;

import java.util.List;

import com.itwill.shopping.qna_board.util.BoardException;
import com.itwill.shopping.qna_board.util.BoardListPageDto;
import com.itwill.shopping.qna_board.util.PageCalculator;
import com.itwill.shopping.qna_board.util.PageInputDto;

public class QnaBoardService {
	private static QnaBoardService _getinstance;
	
	private QnaBoardDao qnaBoardDao;
	public QnaBoardService() throws Exception {
		qnaBoardDao = new QnaBoardDao();
	}
	
	public static QnaBoardService getInstance() throws Exception {
		if(_getinstance==null) {
			_getinstance = new QnaBoardService();
		}
		return _getinstance;
	}

	// 전체 게시물 보기
	public  BoardListPageDto selectAll(PageInputDto pageConfig) throws Exception {
		
		// 총게시물수 
		int totalRecordCount  = qnaBoardDao.boardCount();
		
		BoardListPageDto boardListPageDto = PageCalculator.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()), 
																		pageConfig.getRowCountPerPage(),
																		pageConfig.getPageCountPerPage(), 
																		totalRecordCount);
		List<QnaBoard> boardList=
				qnaBoardDao.selectAll(boardListPageDto.getStartRowNum(),boardListPageDto.getEndRowNum());
									  boardListPageDto.setList(boardList);
		return boardListPageDto;
		
	}
		
	// 게시물 1개 얻기
	public QnaBoard selectBoard (int boardNo) throws Exception {
		QnaBoard board = qnaBoardDao.selectNo(boardNo);
		return board;
		}
	
	// 게시물 쓰기
	public int insert(QnaBoard board) throws Exception {
		return qnaBoardDao.insert(board);
	}
	
	// 답글 쓰기
	public int insertReply(QnaBoard board) throws Exception {
		return qnaBoardDao.insertReply(board);
	}
	
	// 게시글 삭제
	public int delete(int boardno) throws Exception, BoardException {
		QnaBoard tempBoard = qnaBoardDao.selectNo(boardno);
		
		// 답글존재여부
		boolean rExist = qnaBoardDao.countReply(tempBoard);
		System.out.println("답글존재여부"+rExist);
		
		if (qnaBoardDao.countReply(tempBoard)) {
			throw new BoardException("답글이 있는 게시물입니다. 삭제 불가");
		}else {
			return qnaBoardDao.delete(tempBoard.getQb_no());
		}
		
	}
	
	// 게시물 수정
	public int update(QnaBoard board) throws Exception {
		return qnaBoardDao.update(board);
	}
	
	// 조회수 증가
	public int updateViewCount(int boardNo) throws Exception {
		return qnaBoardDao.updateViewCount(boardNo);
	}
	
		
		
}
