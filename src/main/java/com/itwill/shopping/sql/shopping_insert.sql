/****************Member Insert***********************/
---- 고객
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer1','1111','강필준','인천시','010-1234-5678');
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer2','2222','김기훈','서울시','010-2468-1359');
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer3','3333','김동진','경기도','010-3728-1838');
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer4','4444','김슬기','부산시','010-8192-3911');
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer5','5555','성윤희','제주도','010-5291-8321');
insert into member(m_id,m_password,m_name,m_address,m_phone) values('customer6','6666','전선우','광주시','010-8192-9129');
 

----- 관리자
insert into member(m_id,m_password,m_name,m_address,m_phone) values('admin1','1111','admin','admin','010-1111-1111');

/****************Product Insert***********************/
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'펭슈',30000,'귀여워요',100,sysdate,'사진1');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'피가츄',35000,'따끔해요',100,sysdate,'사진2');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'가카오',40000,'비싸요',100,sysdate,'사진3');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'리틀어피치',7500,'에어팟케이스',100,sysdate,'image1.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'리틀어피치',16000,'에어팟케이스',120,sysdate,'image2.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'라이언',9000,'안전벨트커버',300,sysdate,'image3.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'카카오프렌즈',27550,'블루투스키보드',200,sysdate,'image4.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'죠르디',35000,'미니테이블',220,sysdate,'image5.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'춘식이',15000,'미니페이스쿠션',180,sysdate,'image6.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'라이언과춘식',69000,'무선충전 살균시계',90,sysdate,'image7.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'라이언과춘식',25000,'혼술 맥주잔2P세트',250,sysdate,'image8.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',32000,'아이패드 파우치',1000,sysdate,'001.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',4000,'마우스패드',400,sysdate,'002.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',17000,'핸드폰케이스',500,sysdate,'003.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',14000,'핑크색 핸드폰케이스',500,sysdate,'004.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',26000,'삼색 핸드폰케이스',500,sysdate,'005.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',15000,'검은색 핸드폰케이스',500,sysdate,'006.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',12000,'만년필',300,sysdate,'007.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',45000,'터치 무드등',100,sysdate,'008.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',19900,'스낵에어팟/에어팟프로 케이스',500,sysdate,'009.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',19900,'레시피에어팟/에어팟프로 케이스',500,sysdate,'010.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',24900,'실리콘케이스',500,sysdate,'011.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',31900,'캐릭터 빨강색셀카봉',200,sysdate,'012.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',31900,'캐릭터 핑크색셀카봉',200,sysdate,'013.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',8000,'핸드폰거치대',400,sysdate,'014.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',8500,'청록색카드홀더',500,sysdate,'015.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',8500,'핑크색카드홀더',500,sysdate,'016.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',49800,'노트북파우치',200,sysdate,'017.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'헬로키티',6500,'핸드폰케이스 이지로프',500,sysdate,'018.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',6500,'키링',500,sysdate,'019.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',6500,'키링',500,sysdate,'020.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',29000,'삼색 우드박스 머그컵',100,sysdate,'021.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',6700,'머그컵',100,sysdate,'022.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',12000,'스누피와 친구들머그컵',100,sysdate,'023.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',15000,'스마일 머그컵',100,sysdate,'024.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',7000,'피너츠 손잡이 옥수수컵머그',100,sysdate,'025.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',22000,'빈티지 자수 파우치',100,sysdate,'026.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',18000,'레트로라벨 스타일리시 보틀500ML',500,sysdate,'027.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',11900,'피너츠 필통파우치',300,sysdate,'028.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',9000,'원형페이스 동전지갑',700,sysdate,'029.jpg');
insert into product(p_no,p_name,p_price,p_desc,p_stock,p_regdate,p_image) values(product_p_no_seq.nextval,'스누피',24000,'미니파우치(티슈 파우치)',100,sysdate,'030.jpg');


/****************Notice Board Insert***********************/
insert into notice_board(nb_no,nb_title,nb_content,nb_groupno,nb_step,m_id) values(notice_board_nb_no_seq.nextval,'타이틀 test','내용 test',notice_board_nb_no_seq.currval,1,'admin1');


/****************QNA Board Insert***********************/
insert into qna_board(qb_no,qb_title,qb_content,qb_date,qb_vcount,qb_groupno,qb_step,qb_depth,m_id) values(qna_board_qb_no_seq.nextval,'타이틀 test','내용 test',sysdate,0,qna_board_qb_no_seq.currval,1,null,'customer1');


/****************Cart Insert***********************/
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,2,'customer1',2);
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,1,'customer2',1);
insert into cart(c_item_no,c_item_qty,m_id,p_no) values(CART_C_ITEM_NO_SEQ.nextval,3,'customer3',1);

/****************Orders Insert***********************/
insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,'펭슈','30000','customer1');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,1,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,'피카츄 외 1종','75000','customer2');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,2,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,'가카오','80000','customer3');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,2,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate,'펭슈 외 2종','105000','customer4');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,1,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,2,ORDERS_O_NO_SEQ.currval);
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,1,3,ORDERS_O_NO_SEQ.currval);
insert into orders(o_no,o_date,o_desc,o_price,m_id) values(orders_o_no_seq.nextval,sysdate-1,'가카오','80000','customer4');
    insert into order_item(oi_no,oi_amount,p_no,o_no) values(ORDER_ITEM_OI_NO_SEQ.nextval,2,3,ORDERS_O_NO_SEQ.currval);

commit;    