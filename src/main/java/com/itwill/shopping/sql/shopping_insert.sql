/****************Member Insert***********************/
---- 고객
insert into member(m_id,m_password,m_name,m_address) values('customer1','1111','김기훈','인천시');
    insert into member_detail(m_id,md_birthday,md_gender,md_phone,md_email,md_join_date) values('customer1','1993/11/12','M','010-0000-0000','k@naver.com',sysdate);
insert into member(m_id,m_password,m_name,m_address) values('customer2','2222','심기훈','서울시');
    insert into member_detail(m_id,md_birthday,md_gender,md_phone,md_email,md_join_date) values('customer2','1990/01/12','F','010-1111-0000','h@naver.com',sysdate);
insert into member(m_id,m_password,m_name,m_address) values('customer3','3333','팀기훈','경기도');
    insert into member_detail(m_id,md_birthday,md_gender,md_phone,md_email,md_join_date) values('customer3','1980/02/20','M','010-0000-2222','k@naver.com',sysdate);
insert into member(m_id,m_password,m_name,m_address) values('customer4','4444','핌기훈','부산시');
    insert into member_detail(m_id,md_birthday,md_gender,md_phone,md_email,md_join_date) values('customer4','2003/11/20','M','010-0000-3333','k@naver.com',sysdate);

----- 관리자
insert into member(m_id,m_password,m_name,m_address) values('admin1','1111','admin','admin');

/****************Product Insert***********************/
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'펭슈',30000,'귀여워요',100,sysdate,'사진1');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'피가츄',35000,'따끔해요',100,sysdate,'사진2');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'가카오',40000,'비싸요',100,sysdate,'사진3');

/****************Bulletin Board Insert***********************/
insert into bulletin_board(bb_no,bb_title,bb_content,bb_date,bb_vcount,m_id) values(qna_board_qb_no_seq.nextval,'타이틀 test','내용 test',sysdate,0,'admin1');


/****************QNA Board Insert***********************/
insert into qna_board(qb_no,qb_title,qb_content,qb_date,qb_vcount,m_id) values(bulletin_board_bb_no_seq.nextval,'타이틀 test','내용 test',sysdate,0,'customer1');

/****************Cart Insert***********************/
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,2,'customer1',2);
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,1,'customer2',1);
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,3,'customer3',1);

/****************Orders Insert***********************/
insert into orders(o_no,o_date,o_desc,o_price,o_method,m_id) values(orders_o_no_seq.nextval,sysdate,'펭슈','30000','카드','customer1');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,1,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,o_method,m_id) values(orders_o_no_seq.nextval,sysdate,'피카츄 외 1종','75000','카드','customer2');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,2,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,o_method,m_id) values(orders_o_no_seq.nextval,sysdate,'가카오','80000','카드','customer3');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,2,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,o_method,m_id) values(orders_o_no_seq.nextval,sysdate,'펭슈 외 2종','105000','카드','customer4');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,1,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,2,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,o_method,m_id) values(orders_o_no_seq.nextval,sysdate-1,'가카오','80000','무통장입금','customer4');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,2,3,ORDERS_O_NO_SEQ.currval);