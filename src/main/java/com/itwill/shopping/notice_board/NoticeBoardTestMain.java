package com.itwill.shopping.notice_board;

/*
NB_NO      NOT NULL NUMBER(10)     
NB_TITLE            VARCHAR2(100)  
NB_CONTENT          VARCHAR2(2000) 
NB_DATE             DATE           
NB_VCOUNT           NUMBER(10)     
NB_GROUPNO NOT NULL NUMBER(10)     
NB_STEP    NOT NULL NUMBER(10)     
NB_DEPTH            NUMBER(10)     
M_ID                VARCHAR2(10)    
 */
public class NoticeBoardTestMain {
	public static void main(String[] args) throws Exception {
		NoticeBoardDao boardDao = new NoticeBoardDao();
		/*
		System.out.println("1.---------Insert 게시물------------");
		System.out.println(boardDao.insert(new NoticeBoard(0, 
				"DAO테스트1", "DAO테스트2", null, 0, 0,1, 0, "customer3")));
		*/
		
		System.out.println("2.---------Insert  답글 게시물------------");
		System.out.println(boardDao.insertReply(new NoticeBoard(16, "답글", "답글내용", null, 0,16, 1, 0,"admin1")));
		
		/*
		System.out.println("3.---------Delete 게시물------------");
		System.out.println(boardDao.delete(11));
		*/
		/*
		System.out.println("4.---------Update 게시물------------");
		System.out.println(boardDao.update(new NoticeBoard(12, "수정1", "수정2", null, 0, 0, 0, 0, null)));
		*/
		/*
		System.out.println("5.---------update viewcount------------");
		System.out.print(boardDao.updateViewCount(12));
		*/
		/*
		System.out.println("6.---------select all------------");
		System.out.println(boardDao.selectAll(1, 10));
		*/
		/*
		System.out.println("7.---------select id------------");
		System.out.println(boardDao.selectId("admin1"));
		*/
		/*
		System.out.println("8.---------select No------------");
		System.out.println(boardDao.selectNo(15));
		*/
		/*
		System.out.println("9.---------select 게시물수------------");
		System.out.println(boardDao.boardCount());
		*/
		System.out.println("10.----------select 답글 존재여부----------------");
		System.out.println(boardDao.countReply(new NoticeBoard(12,null,null,null, 0, 12, 0, 0, "admin1")));
	}

}
