DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE notice_board CASCADE CONSTRAINTS;
DROP TABLE qna_board CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
		m_id                          		VARCHAR2(10)		 NULL ,
		m_password                    		VARCHAR2(16)		 NULL ,
		m_name                        		VARCHAR2(20)		 NULL ,
		m_address                     		VARCHAR2(100)		 NULL ,
		m_phone                       		VARCHAR2(20)		 NULL 
);


CREATE TABLE qna_board(
		qb_no                         		NUMBER(10)		 NULL ,
		qb_title                      		VARCHAR2(100)		 NULL ,
		qb_content                    		VARCHAR2(2000)		 NULL ,
		qb_date                       		DATE		 DEFAULT sysdate		 NULL ,
		qb_vcount                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		qb_groupno                    		NUMBER(10)		 NOT NULL,
		qb_step                       		NUMBER(10)		 NOT NULL,
		qb_depth                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE qna_board_qb_no_SEQ;

CREATE SEQUENCE qna_board_qb_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE notice_board(
		nb_no                         		NUMBER(10)		 NULL ,
		nb_title                      		VARCHAR2(100)		 NULL ,
		nb_content                    		VARCHAR2(2000)		 NULL ,
		nb_date                       		DATE		 DEFAULT sysdate		 NULL ,
		nb_vcount                     		NUMBER(10)		 DEFAULT 0		 NULL ,
		nb_groupno                    		NUMBER(10)		 NOT NULL,
		nb_step                       		NUMBER(10)		 NOT NULL,
		nb_depth                      		NUMBER(10)		 DEFAULT 0		 NULL ,
		m_id                          		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE notice_board_nb_no_SEQ;

CREATE SEQUENCE notice_board_nb_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


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
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_desc                        		VARCHAR2(100)		 NULL ,
		o_price                       		NUMBER(10)		 NULL ,
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

ALTER TABLE notice_board ADD CONSTRAINT IDX_notice_board_PK PRIMARY KEY (nb_no);
ALTER TABLE notice_board ADD CONSTRAINT IDX_notice_board_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_item_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (p_no) REFERENCES product (p_no) ON DELETE NO ACTION;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (m_id) REFERENCES member (m_id);

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no) ON DELETE CASCADE;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) ON DELETE CASCADE;