DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE member_detail CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE bulletin_board CASCADE CONSTRAINTS;
DROP TABLE qna_board CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
		m_id                          		VARCHAR2(10)		 NULL ,
		m_password                    		VARCHAR2(16)		 NULL ,
		m_name                        		VARCHAR2(20)		 NULL ,
		m_address                     		VARCHAR2(100)		 NULL 
);


CREATE TABLE qna_board(
		qb_no                         		NUMBER(10)		 NULL ,
		qb_title                      		VARCHAR2(100)		 NULL ,
		qb_content                    		VARCHAR2(2000)		 NULL ,
		qb_date                       		DATE		 DEFAULT sysdate		 NULL ,
		qb_vcount                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE qna_board_qb_no_SEQ;

CREATE SEQUENCE qna_board_qb_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE bulletin_board(
		bb_no                         		NUMBER(10)		 NULL ,
		bb_title                      		VARCHAR2(100)		 NULL ,
		bb_content                    		VARCHAR2(2000)		 NULL ,
		bb_date                       		DATE		 DEFAULT sysdate		 NULL ,
		bb_vcount                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE bulletin_board_bb_no_SEQ;

CREATE SEQUENCE bulletin_board_bb_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(50)		 NULL ,
		p_price                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		p_desc                        		VARCHAR2(256)		 NULL ,
		p_stock                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		p_regdate	                    		DATE		 DEFAULT sysdate		 NULL ,
		p_image                       		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE member_detail(
		m_id                          		VARCHAR2(10)		 NULL ,
		md_birthday                   		DATE		 NULL ,
		md_gender                     		VARCHAR2(1)		 NULL ,
		md_phone                      		VARCHAR2(20)		 NULL ,
		md_email                      		VARCHAR2(50)		 NULL ,
		md_join_date                  		DATE		 DEFAULT sysdate		 NULL 
);


CREATE TABLE cart(
		c_item_no                     		NUMBER(10)		 NULL ,
		c_item_qty                    		NUMBER(10)		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_c_item_no_SEQ;

CREATE SEQUENCE cart_c_item_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_name                        		VARCHAR2(10)		 NULL ,
		o_phone                       		VARCHAR2(20)		 NULL ,
		o_address                     		VARCHAR2(50)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_desc                        		VARCHAR2(100)		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
		o_method                      		VARCHAR2(10)		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_amount                     		NUMBER(5)		 DEFAULT 0		 NULL ,
		p_no                          		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (m_id);

ALTER TABLE qna_board ADD CONSTRAINT IDX_qna_board_PK PRIMARY KEY (qb_no);
ALTER TABLE qna_board ADD CONSTRAINT IDX_qna_board_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE bulletin_board ADD CONSTRAINT IDX_bulletin_board_PK PRIMARY KEY (bb_no);
ALTER TABLE bulletin_board ADD CONSTRAINT IDX_bulletin_board_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE member_detail ADD CONSTRAINT IDX_member_detail_PK PRIMARY KEY (m_id);
ALTER TABLE member_detail ADD CONSTRAINT IDX_member_detail_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_item_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no);

