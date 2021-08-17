--아이디 존재 여부
select count(m_id) id_check from member where m_id='customer1';  

--회원 전체 출력
select * from member;

--회원 한명 출력
select * from member where m_id='customer1';

--회원 정보 수정
update member set m_password='1112', m_name='강필준', m_address='강남',md_phone='010-1010-2020' where m_id='customer1';

--회원 한명 삭제(on delete cacscade)
delete member where m_id='customer1';

