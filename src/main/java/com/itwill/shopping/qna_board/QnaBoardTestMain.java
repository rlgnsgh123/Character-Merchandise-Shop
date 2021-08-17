package com.itwill.shopping.qna_board;

public class QnaBoardTestMain {
	public static void main(String[] args) throws Exception{
		
	QnaBoardDao boardDao = new QnaBoardDao();
	/*
	System.out.println("1.---------Insert 게시물------------");
	System.out.println(boardDao.insert(new QnaBoard(0, "Dao테스트으", "Dao테스트으", null, 0, 0, 1, 0, "customer1")));
	*/
	/*
	System.out.println("2.---------Delete 게시물------------");
	System.out.println(boardDao.delete(11));
	*/
	/*
	System.out.println("3.---------Update 게시물------------");
	System.out.println(boardDao.update(new QnaBoard(13, "수정1", "수정2", null, 0, 0, 0, 0, null)));
	*/
	/*
	System.out.println("4.---------update viewcount------------");
	System.out.print(boardDao.updateViewCount(13));
	*/
	/*
	System.out.println("5.---------select all------------");
	System.out.println(boardDao.selectAll(1, 10));
	*/
	/*
	System.out.println("6.---------select no------------");
	System.out.println(boardDao.selectNo(12));
	*/
	
	System.out.println("6.---------select 게시물수------------");
	System.out.println(boardDao.boardCount());
	
	}
}
