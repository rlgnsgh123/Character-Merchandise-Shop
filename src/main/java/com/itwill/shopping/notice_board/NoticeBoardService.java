package com.itwill.shopping.notice_board;

import java.util.List;

import com.itwill.shopping.notice_board.util.BoardException;
import com.itwill.shopping.notice_board.util.BoardListPageDto;
import com.itwill.shopping.notice_board.util.PageCalculator;
import com.itwill.shopping.notice_board.util.PageInputDto;




;

public class NoticeBoardService {
private static NoticeBoardService _getinstance;
	
	private NoticeBoardDao noticeBoardDao;
	public NoticeBoardService() throws Exception {
		noticeBoardDao = new NoticeBoardDao();
	}
	public static NoticeBoardService getInstance() throws Exception {
		if(_getinstance==null) {
			_getinstance = new NoticeBoardService();
		}
		return _getinstance;
	}
	// 전체 게시물 보기
		public  BoardListPageDto selectAll(PageInputDto pageConfig) throws Exception {
			
			// 총게시물수 
			int totalRecordCount  = noticeBoardDao.boardCount();
			
			BoardListPageDto boardListPageDto = PageCalculator.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()), 
																			pageConfig.getRowCountPerPage(),
																			pageConfig.getPageCountPerPage(), 
																			totalRecordCount);
			List<NoticeBoard> boardList= noticeBoardDao.selectAll(boardListPageDto.getStartRowNum(),
																  boardListPageDto.getEndRowNum());
			boardListPageDto.setList(boardList);
			return boardListPageDto;
			
		}
		// 게시물 1개 얻기
		public NoticeBoard selectBoard (int boardNo) throws Exception {
			NoticeBoard board = noticeBoardDao.selectNo(boardNo);
			return board;
			}
		
		// 게시물 쓰기
		public int insert(NoticeBoard board) throws Exception {
			return noticeBoardDao.insert(board);
		}
		
		// 답글 쓰기
		public int insertReply(NoticeBoard board) throws Exception {
			return noticeBoardDao.insertReply(board);
		}
		
		// 게시글 삭제
		public int delete(int boardno) throws Exception, BoardException {
			NoticeBoard tempBoard = noticeBoardDao.selectNo(boardno);
			
			// 답글존재여부
			boolean rExist = noticeBoardDao.countReply(tempBoard);
			System.out.println("답글존재여부"+rExist);
			
			if (noticeBoardDao.countReply(tempBoard)) {
				throw new BoardException("답글이 있는 게시물입니다. 삭제 불가");
			}else {
				return noticeBoardDao.delete(tempBoard.getNb_no());
			}
			
		}
		
		// 게시물 수정
		public int update(NoticeBoard board) throws Exception {
			return noticeBoardDao.update(board);
		}
		
		// 조회수 증가
		public void updateViewCount(int boardNo) throws Exception {
			noticeBoardDao.updateViewCount(boardNo);
		}
		
		
		

}
