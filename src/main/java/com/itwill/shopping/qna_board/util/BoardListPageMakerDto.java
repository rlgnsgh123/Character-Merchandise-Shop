package com.itwill.shopping.qna_board.util;

import java.util.*;

import com.itwill.shopping.qna_board.QnaBoard;

// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징 처리에 필요한 정보빈
public class BoardListPageMakerDto {
	public List<QnaBoard> itemList; 		// 리스트 데이터 콜렉션
	public PageMaker pageMaker;
	public int totRecordCount;
}
