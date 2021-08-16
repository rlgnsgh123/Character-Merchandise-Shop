--아이디 존재 여부
select count(m_id) id_check from member where m_id='customer1';  

--회원 전체 출력
select * from member m join member_detail md on m.m_id=md.m_id;

--회원 한명 출력
select * from member m join member_detail md on m.m_id=md.m_id where m.m_id='customer1';

--회원 정보 수정
update member set m_password='1112', m_name='강필준', m_address='강남' where m_id='customer1';
update member_detail set md_birthday=to_date('1992/09/24','YYYY/MM/DD'), md_gender='m', md_phone='010-1010-2020', md_email='a@naver.com',md_join_date=to_date('2021/08/14','YYYY/MM/DD') where m_id='customer1'; 

--회원 한명 삭제(on delete cacscade)
delete member where m_id='customer1';

