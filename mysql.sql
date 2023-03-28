--  sql은 대소문자 가리지 않아서 뭘쓰든 상관없음 
-- 주석입니다. (한칸 띄우기 필수)
-- --주석안돼요.

-- 계정 생성
-- 사용자이름: user1, 비밀번호: 1234

create user user1@localhost identified by '1234';
-- @localhost : 사용자도 나고 관리자도 나니깐 pc자체

-- database 생성
create database database1;
-- 권한부여
grant all privileges on database1.* to user1@localhost;
-- 현재 생성된 계정 목록 확인
use mysql;
select user from user;

drop user user1@localhost;
drop user user1@localhost;


-- 계정: user2, 비번: 9999로 계정 만들고
-- database999에 대한 접속 권한 부여하고
-- 해당 계정으로 접속해서 database999 사용되는지 확인하시오

-- 계정 생성
create user user2@localhost identified by '9999';
-- database 생성
create database database999;
-- 권한부여
grant all privileges on database999.* to user2@localhost;

use mysql;
select user from user; 
-- 줄단위로 실행되기 때문에 위에 식을 실행시킬때 새로 만들 필요없이 저 위에 실행문 썼던거에서 컨트롤 엔터해서 다시 실행 해도된다.


