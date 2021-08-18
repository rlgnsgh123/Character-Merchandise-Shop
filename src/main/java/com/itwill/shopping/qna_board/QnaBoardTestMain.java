package com.itwill.shopping.qna_board;

import com.itwill.shopping.notice_board.NoticeBoard;

public class QnaBoardTestMain {
	public static void main(String[] args) throws Exception{
		
	QnaBoardDao boardDao = new QnaBoardDao();
	/*
	System.out.println("1.---------Insert 게시물------------");
	System.out.println(boardDao.insert(new QnaBoard(0, "Dao테스트으", "Dao테스트으", null, 0, 0, 1, 0, "customer1")));
	*/
	System.out.println("2.---------Insert  답글 게시물------------");
	System.out.println(boardDao.insertReply(new QnaBoard(20, "답글23", "답글내용23", null, 0,13, 0, 0,"admin1")));
	/*
	System.out.println("3.---------Delete 게시물------------");
	System.out.println(boardDao.delete(11));
	*/
	/*
	System.out.println("4.---------Update 게시물------------");
	System.out.println(boardDao.update(new QnaBoard(13, "수정1", "수정2", null, 0, 0, 0, 0, null)));
	*/
	/*
	System.out.println("5.---------update viewcount------------");
	System.out.print(boardDao.updateViewCount(13));
	*/
	/*
	System.out.println("6.---------select all------------");
	System.out.println(boardDao.selectAll(1, 10));
	*/
	/*
	System.out.println("7.---------select no------------");
	System.out.println(boardDao.selectNo(12));
	*/
	
	System.out.println("8.---------select 게시물수------------");
	System.out.println(boardDao.boardCount());
	
	System.out.println("9.----------select 답글 존재여부----------------");
	System.out.println(boardDao.countReply(new QnaBoard(12,null,null,null, 0, 12, 0, 0, "admin1")));
	
	}
}
