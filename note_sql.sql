use db_dbclass;

-- 학생 테이블 생성
create table student(
	id bigint,
    student_name varchar(5),
    student_mobile varchar(20),
	student_major varchar(30)
    );
-- sql은 세미콜론을 기준으로 구별하기 때문에 테이블 생성에 커서 아무대나 두고 컨트롤엔터 실행을 해도 학생테이블 생성 전체가 실행된다    
    
-- 학생테이블 전체 조회
select * from student;
-- 본인 옆사람들의 정보를 테이블에 저장해 봅시다.
insert into student(id,student_name,student_mobile,student_major)
	values(1, '김유진', '010-1234-1234', '컴퓨터공학과');
insert into student(id,student_name,student_mobile,student_major)
	values(2, '이문정', '010-2525-5252', '컴퓨터공학과');
insert into student(id,student_name,student_mobile,student_major)
	values(2, '이문정', '010-2525-5252', '컴퓨터공학과');
     
-- 테이블 삭제     
drop table student;

create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp ( -- 직원정보를담은 테이블
    empno int, -- 사번
    ename varchar(10), -- 이름
    job varchar(9), -- 직급
    mgr int, -- 자기 상사의 사번(사수)
    hiredate DATE, -- 입사일
    sal int, -- 급여
    comm int, -- 보너스
    deptno int -- 소속번호
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade ( -- 급여수준
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp;  -- 직원 정보
select * from bonus; -- 조회결과 없음
select * from salgrade;  -- 급여수준
select * from dept; -- 회사의데이터베이스개념(부서정보를담은테이블)

-- emp 테이블 전체 조회
select * from emp;
-- emp 테이블의 empno, ename 컬럼만 조회
select empno, ename from emp;
-- emp 테이블의 job컬럼만 조회
select job from emp;
-- 중복값 제외
select distinct job from emp;
-- 사원 이름 조회(오름차순) :정렬 asc
select ename from emp order by ename asc;
-- 이름을 기준으로 모든 값 오름차순 정렬
select * from emp order by ename asc;
-- 사원 이름 조회(내림차순) :정렬 desc
select ename from emp order by ename desc;
-- 이름을 기준으로 모든 값 내림차순 정렬
select * from emp order by ename desc;
-- 급여(sal) 기준으로 오름차순, 내림차순 정렬
select sal from emp order by sal asc;
select * from emp order by sal asc;
select sal from emp order by sal desc;
select * from emp order by sal desc;
-- 입사일(hiredate) 기준으로 오름차순, 내림차순 정렬
select hiredate from emp order by hiredate asc;
select * from emp order by hiredate asc;
select hiredate from emp order by hiredate desc; -- 입사일자가 가장 최근사람부터 정렬됨
select * from emp order by hiredate desc;
-- 정렬은 기본값이 오름차순이라 asc는 생략가능하지만 쓰는걸 습관화하자!

-- 급여기준으로 오름차순 하는데 같은 급여라면 이름을 기준으로 오름차순하고싶다(정렬기준 두개)
select * from emp order by sal asc, ename asc ;

-- where절: 조건을 적용할 때
-- 직급이 salesman인 사원만 조회
select * from emp where job = 'salesman';
-- job라는 컬럼에 들어있는 데이터가 salesman이라는 것만 조회

-- 직급이 manager인 사원만 조회
select * from emp where job = 'manager';
-- 부서번호(deptno)가 10인 사원만 조회
select * from emp where deptno = 10;
-- 이름이 james라는 사원의 정보 조회
select * from emp where ename = 'james';
-- 사번이 7654인 사원의 정보 조회
select * from emp where empno = 7654;
-- 직급이 manager이고 부서번호가 20인 사원 조회
select * from emp where job = 'manager'and deptno = 20 ;
-- 직급이 salesman 이거나 부서번호가 10인 사원 조회
select * from emp where job = 'salesman' or deptno = 10 ;
-- 급여가 3000 이상인 사원 조회
select * from emp where sal >= 3000;
-- 급여가 3000 이상인 사원 조회 결과를 내림차순 정렬
select * from emp where sal >= 3000 order by sal desc; -- 정렬이 마지막에!(순서 바뀌면 안됨)
-- 직급이 salesman이 아닌 사원 조회
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';
-- 급여가 2000 이상 3000 이하인 사원 조회
select * from emp where 2000 <= sal <= 3000; -- 이렇게 하면 안됨
select * from emp where sal >= 2000 and sal <= 3000; -- 맞는 답 
select * from emp where sal between 2000 and 3000; -- 이것도 답  between a and b :  a와b 사이(a,b값도 포함)
select * from emp where sal not between 2000 and 3000; -- 2000미만 이면서 3000초과인 값을 조회함

-- like 연산자 : 검색 기능에서 활용이 많이 된다, %(퍼센트)와 _(언더바)를 사용
-- 언더바 하나가 글자 한개 -> 글자를 지정함 ex 가운데 글자가  '이'로 시작되는 사람 like '_이_'  -> 글자수가 정해져있을때 사용함
-- 퍼센트는 글자수에 제약이 없다 ex '이%' -->  이름이 이로 시작하는데 뒤에 몇글자가 오든 상관이 없다 
-- ~를 포함한 결과를 보고싶을때 사용 
select * from emp where ename like 'm%'; -- m으로 시작하는
select * from emp where ename like '%m'; -- m으로 끝나는
select * from emp where ename like '%m%'; -- m을 포함하는  -->  가장 많이 씀
select * from emp where ename like '_m%'; -- 두번째 글자가 m인
select * from emp where ename like '__m%'; -- 세번쨰 글자가 m인

-- 81년 4월 1일 이후에 입사한 사원 조회
select * from emp where hiredate >= '1981-04-01';
-- 81년 4월 1일 전에 입사한 사원 조회
select * from emp where hiredate < '1981-04-01';
-- str_to_date : 문자열을 날짜 형식으로 변환한다는 뜻 
select * from emp where hiredate > str_to_date('1981-04-01', '%Y-%m-%d');

-- 테이블 구조 확인
-- desc는 설명한다는 뜻 정렬때 내림차순desc랑은 다른것이다 
desc emp;

-- 집계함수
-- sum(), avg(), max(), min(), count()

-- 사원의 급여 총합
select sum(sal) from emp;
select sum(sal) as'급여총합' from emp;
-- as를 쓰면 조회한 결과에 별칭을 지정해줄 수 있음

-- salesman의 급여 총합
select sum(sal) as'salesman \n급여총합' from emp where job = 'salesman';
-- manager의 급여 총합
select sum(sal) as'manager \n급여총합' from emp where job = 'manager';
-- 전체 사원의 평균 급여 조회
select avg(sal) from emp;
-- 구글링으로 평균급여를 소수 둘째짜리까지 표현해봅시다
select truncate (avg(sal) ,2) as 평균급여 from emp;
select round(avg(sal), 2) from emp;
-- 현재 시간을 알려줌 
select sysdate() from dual; -- select를 보고싶을때 사용하는 가상의 테이블dual (별 의미없는 테이블)
-- round(반올림을 할 값, 몇자리까지 표현할거냐)
select round(12.345, 2) from dual; -- 12.35
select round(12.345, 1) from dual; -- 12.3
select round(12.345, 0) from dual; -- 12
-- 가장 높은 급여 값 조회
select max(sal) from emp;
-- 가장 적은 급여 값 조회
select min(sal) from emp;
-- 전체 사원수 조회
select count(*) from emp; -- 몇줄인지 세주는 함수 
-- 부서번호가 20인 사원수 조회
select count(*) from emp where deptno = 20;

-- 그룹화(동일한 데이터끼리 묶는 것,grouping)
-- 조회결과는 그룹핑한 컬럼이름 또는 집계함수 등을 사용함
-- *이 오면 오류가 출력된다!

-- 직급으로 그룹핑
select * from emp group by job; -- 오류가 남 
select job from emp group by job;
-- 직급별 평균 급여
select job, avg(sal) from emp group by job;
-- 부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;
-- 직급별 사원수 조회
select job, count(*) from emp group by job;
-- 직급별 평균 급여, 사원 수 조회
select job,avg(sal), count(*) from emp group by job;
-- 위의 결과에서 직급값을 오름차순으로 정렬
select job,avg(sal), count(*) from emp group by job order by job asc;
-- 위의 결과에서 평균 급여를 소수점 첫쨰자리 까지 조회
select job,round(avg(sal), 1), count(*) from emp group by job order by job asc;
-- 위의 결과에서 job은 직급으로, 급여 평균값은 평균급여로, 사원수 조회값은 사원수로 표현해서 조회
select job as'직급' ,round(avg(sal), 1) as '평균급여', count(*) as'사원수'from emp group by job order by job asc;

-- 20230329
-- 부서별 그룹핑
select deptno from emp group by deptno;
select deptno, avg(sal) from emp group by deptno;
-- 부서별 그룹핑하고 그 안에서 직급별 그룹핑
select deptno, job, avg(sal) from emp group by deptno, job;
select deptno, job, avg(sal) from emp group by job, deptno;
select deptno, job, avg(sal) from emp group by deptno, job order by job asc;
select deptno, job, avg(sal) from emp group by deptno, job order by deptno asc;
-- 그룹핑한 결과에서 조건을 따지고 싶을때는
-- having문법 적용  --> 그룹핑 했을때 적용되는 문법
-- 부서, 직급별로 묶고 그 결과에서 평균급여가 2000 이상인 결과만 조회
select deptno, job, avg(sal) from emp 
						group by deptno, job 
							having avg(sal) >= 2000 
								order by deptno asc;
-- 급여가 3000이하인 사원을 대상으로 위의 그룹핑 수행해서 평균급여가 2000이상인 사원만 조회 
select deptno, job, avg(sal) from emp  
					where sal <= 30000 							-- 순서 중요
						group by deptno, job 
							having avg(sal) >= 2000 
								order by deptno asc;
-- date 타입을 문자로 표현하기: date_format()
-- 해당 데이터의 연도값만 뽑아서 볼수 있음
select date_format(hiredate, '%Y') from emp;
/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
-- 1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
select deptno as '부서번호', round(avg(sal),1) as '평균급여',max(sal) as '최고급여',min(sal) as '최저급여' ,  count(*) as '사원수' from emp group by deptno;
--  2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
select job , count(empno) from emp group by job having count(job) >= 3 ;
-- 3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
select date_format(hiredate, '%Y') as '입사년도' , count(empno) as '사원수' from emp 
												group by date_format(hiredate, '%Y') ;
--  3. 1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
select date_format(hiredate, '%Y') as '입사년도', deptno as '부서번호', count(empno) as '사원수' 	from emp 
												group by date_format(hiredate, '%Y'), deptno;

-- emp테이블이랑 dept 테이블은 deptno라는 컬럼이 둘다 있다 
-- emp 테이블을 조회하는데 20번 부서가 어디 부서인지 같이 보고싶다 
-- > 내부 조인 사용할 수 있다
select * from emp;
select * from dept;
-- 외부조인
-- 의미없는 연결,무의미한 정보 연결
select * from emp, dept; -- 이렇게 하면 x
-- 조인
-- 공통 속성을 파악을해서 조건에 달아준다 
-- 실제 두 테이블이 합쳐진게 아니라 내가 보고싶은 형식으로 보여준것(테이블의 내용이 변경되진 않음)
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e , dept d where e.deptno = d.deptno;
select empno, ename, dname, loc from emp e , dept d where e.deptno = d.deptno;

-- deptno를 select를 넣었더니 ambiguous(모호하다) 에러가 뜬다
-- 이유는? dept 컬럼은 emp에도있고 dept에도 있어서 어디 테이블의 deptno를 보여달라는건지 모호하다고 에러가 뜬다 
select empno, ename, deptno, dname, loc from emp e , dept d where e.deptno = d.deptno; 
-- 각각의 테이블의 소속을 명확하게 밝혀주면 에러가 뜨지 않는다 
-- 조인 후 emp 테이블만 조회
select e.* from emp e, dept d where e.deptno = e.deptno;
-- emp, dept를 조인하여 empno, ename, deptno, dname, loc조회
-- (단, 급여가 2500 이상인 사원만 조회하고, 조회결과는 사원이름 기준으로 오름차순 정렬해라)
select e.empno, e.ename, e.deptno, d.dname, d.loc from emp e , dept d 
				where e.deptno = d.deptno and e.sal >= 2500 order by e.ename asc; 
                
-- 최저 급여를 받는 사람이 누구인가?
select * from emp order by sal asc ;
-- 1. 최저급여 값이 얼마인지
select min(sal) from emp; 
-- 2. 최저급여 값을 받는 사람이(최저급여 값과 sal값이 일치하는) 누구인지 조회
select * from emp where sal = 800; 
-- 원래는 두번의 과정을 수행해야만 최저급여 받는 사람이 누구인지를 알수있다

-- 서브쿼리 적용
select * from emp where sal = (select min(sal) from emp); 
-- 연습 
-- 최고 급여를 받는 사원 정보 조회
select * from emp where sal = (select max(sal) from emp); 

-- allen 의 급여값
select sal from emp where ename = 'allen'; 
select sal from emp where sal> 1600;

-- allen 보다 높은 급여를 받는 사원 조회 (allen의 급여는 1600)
select * from emp where sal > (select sal from emp where ename = 'allen');

/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/

  -- 1. clark 보다 늦게 입사한 사원 조회
  -- clark의 입사일 
  select hiredate from emp where ename = 'clark'; -- 1981-06-09
  select * from emp where hiredate > (select hiredate from emp where ename = 'clark');
  
 -- 2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
select * from emp where deptno = 20;
select avg(sal) from emp;
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);
select * from emp where sal > (select avg(sal) from emp) and deptno = 20;

select * from emp where sal > avg(sal); -- 이거 안되는 이유는 avg(sal)가 어디 테이블인지 불분명해서 안된다 
 
 -- 3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
 -- 서브쿼리에서는 약어가 안먹혀서 e.sal을 하면 안됨
 select * from emp e, dept d 
			where e.deptno = d.deptno and e.deptno = 20 and e.sal > (select avg(sal) from emp);
            
create table member1(
	id bigint, -- pk
    member_email varchar(20),
    member_password varchar(10)
);

-- 문제가 생길 가능성이 적은 식 
insert into member1(id, member_email, member_password) values(1,'member1@email.com','1111');

-- 모든 컬럼에 데이터를 저장한다면 컬럼이름 생략 가능하다
insert into member1 values(2,'member2@email.com','2222');

-- 짝이 안맞으면 에러가 뜬다  
insert into member1 values(3,'member2@email.com'); -- 에러뜸 error 1136

-- 두개의 컬럼에만 데이터를 넣고싶다면
-- 특정 컬럼에만 값을 넣고 싶은 경우
insert into member1(id, member_email) values(3,'member2@email.com');

-- 테이블 만들 때 지정한 크기보다 큰 값을 저장할 때 에러가 뜬다
-- member_password varchar(10)로 지정했는데 크기를 넘길경우
insert into member1 values(2,'member2@email.com','2222222222222'); -- 에러뜸 error 1406

-- 해당 컬럼에 null 지정 가능 
insert into member1 values(5,null,'22222222'); 
insert into member1 values(null,null,'22222222'); 
select * from member1;

create table member2(
	id bigint not null, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20),
    member_password varchar(10)
);

-- 테이블의 구조를 볼수있는 명령어
desc member2;

insert into member2(id, member_email, member_password) values(1,'member1@email.com','1111');
-- id 컬럼에 null을 지정할 수 없다  error 1048
insert into member2(id, member_email, member_password) values(null,'member1@email.com','1111');

insert into member2(id, member_email, member_password) values(2,null,'1111');
insert into member2(id, member_email, member_password) values(3,'member2@email.com',null);
select * from member2;

create table member3(
	id bigint not null unique, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20) not null,
    member_password varchar(10) not null
);

desc member3;
insert into member3(id, member_email, member_password) values(1,'member1@email.com','1111');

-- id컬럼에 unique를 지정해놔서 똑같은 값을 지정할 수 없다
-- error 1062
insert into member3(id, member_email, member_password) values(1,'member1@email.com','1111');

insert into member3(id, member_email, member_password) values(2,'member1@email.com','1111');

create table member4(
	id bigint not null unique, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20) not null unique,
    member_password varchar(10) not null
);

insert into member4(id, member_email, member_password) values(1,'member1@email.com','1111');

-- unique를 이메일에 지정해놔서 에러가 뜬다 error 1062
insert into member4(id, member_email, member_password) values(2,'member1@email.com','1111');

insert into member4(id, member_email, member_password) values(3,'member2@email.com','1111');
insert into member4(id, member_email, member_password) values(4,'member2@email.com','1111');

select * from member4;

create table member5(
	id bigint not null unique, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime
);

insert into member5(id, member_email, member_password, member_created_date) values(4,'member2@email.com','1111',sysdate());
insert into member5(id, member_email, member_password) values(5,'member3@email.com','1111');

select * from member5;

create table member6(
	id bigint not null unique, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now() -- now는 현재시간을 알려줌 
);

-- date를 따로 안써도 default를 지정해놔서 알아서 값이 들어간다 
insert into member6(id, member_email, member_password) values(5,'member3@email.com','1111');
insert into member6(id, member_email, member_password) values(6,'member4@email.com','1111');

select * from member6;

create table member7(
	id bigint primary key, -- null일 수 없음 / 제약 조건 지정함 
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now() -- now는 현재시간을 알려줌 
);
insert into member7(id, member_email, member_password) values(6,'member1@email.com','1111');

-- pk를 지정해줘서 중복값을 넣으면 안됨 error뜬다 !
insert into member7(id, member_email, member_password) values(6,'member2@email.com','1111');

create table member8(
	id bigint, 
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now(),  
    constraint pk_member8 primary key(id)  -- id 컬럼에 pk를 지정하겠다
);
insert into member8(id, member_email, member_password) values(6,'member2@email.com','1111');
insert into member8(id, member_email, member_password) values(7,'member3@email.com','1111');

select * from member8;

-- 제약 조건 확인
select * from information_schema.table_constraints;

-- 참조관계
-- 게시판과 댓글의 관계

drop table board1; -- 테이블 삭제 -- 만들지 않은 테이블이면 오류가 뜬다 
drop table if exists board1; -- 경고가 뜨게 함  
-- 보통 이 문장으로 많이 쓴다 이유는 테이블 만들기 전에 drop를 먼저해라 있든 없든 혹시나 모르니까 미리 깔금하게 지우고 가자 하는데 테이블 여러개를 한방에 만드는데
-- if exists를 안쓰고 drop하면 에러가 떠서 그냥 멈춰 버리니깐 if exists를 쓰는게 훨씬 안전하다 (에러를 줄인다)
-- 보통 테이블을 만들기 전에 드랍을 먼저 쓴다(테이블을 만들고 전체 실행 할때 드랍도 포함될수 있으니까 위에다가 씀)

-- 부모 테이블
create table board1(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자 unique를 걸면 한명의 작성자는 하나의 글밖에 못써서 붙이면 안됨
    board_contents varchar(500), -- 내용
    constraint pk_board1 primary key(id)
);

-- 댓글 테이블: 댓글은 존재하는 게시글에만 작성 가능하며,
-- 게시글의 글번호(id)를 참조하는 관계로 정의
drop table if exists comment1;

-- 자식 테이블
create table comment1(
	id bigint, -- 댓글번호
    comment_writer varchar(20) not null, -- 댓글 작성자 
    comment_contents varchar(200), -- 댓글 내용
    board1_id bigint, -- 어떤 게시글의 작성된 댓글인지 글번호 정보가 필요함
    
    -- 댓글테이블(comment1)의 pk지정
    constraint pk_comment1 primary key(id),
    
    -- 참조관계 지정을 위해 comment1 테이블의 board1_id 컬럼을
    -- board1 테이블의 id 컬럼을 참조하는 관계로 정의함 
    -- 이 문장으로 인해 부모 자식 관계가 맺어질 수 있음 문장 꼭 필요!
    -- references 뒤에는 board1(id) 는 참조대상이다  테이블이름(컬럼이름)
    constraint fk_comment1 foreign key(board1_id) references board1(id)
);

-- 참조관계를 만들고 부모테이블을 지우려고하면 에러가 뜬다
-- 자식 테이블을 먼저 지우고 부모 테이블을 지워야된다 
-- 나중에는 자식이있더라고 부모를 지울수 있는 옵션이 있지만 아직 안배움 

-- 보드 데이터 추가
insert into board1(id, board_writer, board_contents)
	values(1,'writer1','contents1');
insert into board1(id, board_writer, board_contents)
	values(2,'writer2','contents2');
insert into board1(id, board_writer, board_contents)
	values(3,'writer3','contents3');
insert into board1(id, board_writer, board_contents)
	values(4,'writer4','contents4');
select * from board1;

-- 댓글 데이터 추가

-- board1_id컬럼에 들어가는 값은 어떤 게시글에 댓글을 쓸것인가이다 
-- 참조하는 컬럼에 들어가는 데이터는 부모 테이블에 있는 값만 사용이 가능하다는 얘기!!(중요☆)

-- 1번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(1,'c writer1','c contents1',1);
    
-- 1번 게시글에 대한 2번째 댓글 (1번째 댓글의 작성자랑 동일)
-- id는 pk라 동일하게 할수가 없다(댓글번호)

insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(2,'c writer1','c contents2',1);
    
-- 1번 게시글에 대한 3번째 댓글 
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(3,'c writer2','c contents3',1);
    
-- 2번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(4,'c writer3','c contents3',2);
    
-- 5번 게시글에 대한 댓글 (5번 게시글이 없으니깐 에러가 뜰것임)
insert into comment1(id, comment_writer, comment_contents, board1_id)
	values(5,'c writer3','c contents3',5);
    
select * from comment1;

select * from board1;
-- 부모 데이터 삭제
-- 1,2번 게시글에는 댓글이 있고, 3,4번 게시글에는 댓글이 없는 상황에서..부모 데이터 삭제해보자 

-- select, delete, update를 사용 할 땐  where절을 많이 쓰게 됨(보통 조건에 pk값으로 달아야함)

-- 3번 게시글 삭제
delete from board1 where id = 3; -- 자식값(댓글)이 안달려있으니깐 삭제가 가능하다
-- 2번 게시글 삭제
delete from board1 where id = 2; -- 데이터들도 부모 자식 관계가 맺어져서 삭제가 불가능하다 /자식 데이터 부터 삭제해야 가능함 

-- 2번 게시글에 작성된 댓글 삭제(댓글번호 3번 데이터)
-- 댓글을 삭제 후 게시글을 삭제하는것은 가능하다!
delete from comment1 where id = 4;

-- 부모 데이터 삭제시 자식 데이터도 함께 삭제
-- 부모테이블 생성
drop table if exists board2;
create table board2(
	id bigint,
    board_writer varchar(20) not null,
    board_contents varchar(500),
    constraint pk_board2 primary key(id)
);

-- 자식 테이블 생성
drop table if exists comment2;
create table comment2(
	id bigint, 
    comment_writer varchar(20) not null, 
    comment_contents varchar(200), 
    board2_id bigint, 

    constraint pk_comment2 primary key(id),
	-- on delete cascade: 부모데이터 삭제 시 자식데이터 함께 삭제되는 특징이있다
    constraint fk_comment2 foreign key(board2_id) references board2(id) on delete cascade
);
/* 문제
 게시글 4개 작성
 1,2번 게시글에 댓글 작성
 3번 게시글 삭제
 2번 게시글 삭제
*/

-- 게시글 4개 작성
insert into board2(id, board_writer, board_contents)
	values(1, 'writer 1', 'contents 1');
insert into board2(id, board_writer, board_contents)
	values(2, 'writer 2', 'contents 2');
insert into board2(id, board_writer, board_contents)
	values(3, 'writer 3', 'contents 3');
insert into board2(id, board_writer, board_contents)
	values(4, 'writer 4', 'contents 4');

select * from board2;

-- 1,2번 게시글에 댓글 작성
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(1, 'c writer 1', 'c contents 1',1);
insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(2, 'c writer 2', 'c contents 2',2);
select * from comment2;

-- 3번 게시글 삭제
delete from board2 where id = 3;
select * from board2;

-- 2번 게시글 삭제
-- 테이블을 생성 했을 때 on delete cascade속성을 사용해서 댓글이 달린 게시글이어도 같이 삭제가되서 에러가 뜨지 않음 
-- on delete cascade는 데이터에 대해서 삭제하는 옵션이다.(테이블 삭제 아님)
delete from board2 where id = 2;
select * from board2;
select * from comment2;

-- on deletee set null

-- 부모 테이블 생성
drop table if exists board3;
create table board3(
	id bigint,
    board_writer varchar(20) not null,
    board_contents varchar(500),
    constraint pk_board3 primary key(id)
);

-- 자식 테이블 생성
drop table if exists comment3;
create table comment3(
	id bigint, 
    comment_writer varchar(20) not null, 
    comment_contents varchar(200), 
    board3_id bigint, 

    constraint pk_comment3 primary key(id),
	-- on delete set null: 자식 데이터는 유지되지만 참조 컬럼은 null로 바뀜 
    constraint fk_comment3 foreign key(board3_id) references board3(id) on delete set null
);
/* 문제
 게시글 4개 작성
 1,2번 게시글에 댓글 작성
 3번 게시글 삭제
 2번 게시글 삭제
*/

-- 게시글 4개 작성
insert into board3(id, board_writer, board_contents)
	values(1, 'writer 1', 'contents 1');
insert into board3(id, board_writer, board_contents)
	values(2, 'writer 2', 'contents 2');
insert into board3(id, board_writer, board_contents)
	values(3, 'writer 3', 'contents 3');
insert into board3(id, board_writer, board_contents)
	values(4, 'writer 4', 'contents 4');

select * from board3;

-- 1,2번 게시글에 댓글 작성
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(1, 'c writer 1', 'c contents 1',1);
    insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(2, 'c writer 2', 'c contents 2',1);
insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(3, 'c writer 3', 'c contents 3',2);
select * from comment3;

-- 3번 게시글 삭제
delete from board3 where id = 3;
select * from board3;

-- 2번 게시글 삭제
-- on delete set null : 부모 테이블을 삭제해서 자식 테이블의 board3_id의 번호가 null이 뜬다
-- 예시) 블로그 작성후 회원이 탈퇴하면 블로그 글은 남아있는데 회원은 회원탈퇴되었다고 하는 경우 
delete from board3 where id = 2;
select * from board3;
select * from comment3;

-- 수정 쿼리
-- 1번 게시글 내용을 안녕하세요로 수정
select * from board3;
update board3 set board_contents = '안녕하세요' where id = 1;

-- 4번 게시글 작성자를 작성자4, 내용을 곧 점심시간 으로 수정
-- 여러개의 컬럼을 같이 수정할 때는 and가 아닌 쉼표로 쓴다!
-- (여러개의 조건을 정할 땐 and, or을 사용)
update board3 set board_writer='작성자4' , board_contents = '곧 점심시간' where id = 4;

-- id 컬럼에 자동 번호 적용하기 
-- id 컬럼은 데이터를 추가할때마다 하나씩 값이 올라가는 컬럼이니깐,,
drop table if exists board4;
create table board4(
	id bigint auto_increment,
    board_writer varchar(20) not null,
    board_contents varchar(500),
    -- auto_increment를 적용하고 싶으면 그 해당 컬럼은 pk로 지정이 되야된다!
	constraint pk_board4 primary key(id)
);

-- id컬럼에 값을 입력하지 않아도 데이터를 추가할 떄 순차적으로 값이 적용된다
insert into board4(board_writer, board_contents)
	values('writer 1', 'contents 1');
insert into board4(board_writer, board_contents)
	values('writer 2', 'contents 2');
    
select * from board4;





-- --------- 오후 수업 -----------
drop table if exists book;
create table book(
	id bigint auto_increment,
    b_bookname varchar(20) not null,
    b_publisher varchar(50) not null,
    b_price bigint,
	constraint pk_book primary key(id)
);

drop table if exists customer;
create table customer(
	id bigint auto_increment,
    c_name varchar(20) not null,
    c_address varchar(50) not null,
    c_phone varchar(20),
	constraint pk_customer primary key(id)
);

drop table if exists orders;
create table orders(
	id bigint auto_increment,
    customer_id bigint,
    book_id bigint,
    o_saleprice bigint,
    o_orderdate date,
	constraint pk_orders primary key(id),
    -- constraint 뒤에 쓰는 제약조건 이름은 중복되면 안된다 
    constraint fk_orders_b foreign key(book_id) references book(id),
    constraint fk_orders_c foreign key(customer_id) references customer(id)
);

insert into book(b_bookname, b_publisher, b_price)
	values('축구의 역사', '굿스포츠',7000);
insert into book(b_bookname, b_publisher, b_price)
	values('축구스카우팅 리포트', '나무수',13000);
insert into book(b_bookname, b_publisher, b_price)
	values('축구의 이해', '대한미디어',22000);
insert into book(b_bookname, b_publisher, b_price)
	values('배구 바이블', '대한미디어',35000);
insert into book(b_bookname, b_publisher, b_price)
	values('피겨 교본', '굿스포츠',8000);
insert into book(b_bookname, b_publisher, b_price)
	values('피칭 단계별기술', '굿스포츠',6000);
insert into book(b_bookname, b_publisher, b_price)
	values('야구의 추억', '이상미디어',20000);
insert into book(b_bookname, b_publisher, b_price)
	values('야구를 부탁해', '이상미디어',13000);
insert into book(b_bookname, b_publisher, b_price)
	values('올림픽 이야기', '삼성당',7500);
insert into book(b_bookname, b_publisher, b_price)
	values('olympic champions', 'pearson',13000);

select * from book;

insert into customer(c_name, c_address, c_phone)
	values('손흥민', '영국 런던','000-5000-0001');
insert into customer(c_name, c_address, c_phone)
	values('김연아', '대한민국 서울','000-6000-0001');
insert into customer(c_name, c_address, c_phone)
	values('김연경', '중국 상하이','000-7000-0001');
insert into customer(c_name, c_address, c_phone)
	values('류현진', '캐나다 토론토','000-8000-0001');
insert into customer(c_name, c_address, c_phone)
	values('이강인', '스페인 마요르카',null);
    
select * from customer;

insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(1, 1,6000,str_to_date('2021-07-01','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(1, 3,21000,str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(2, 5,8000,str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(3, 6,6000,str_to_date('2021-07-04','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(4, 7,20000,str_to_date('2021-07-05','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(1, 2,12000,str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(4, 8,13000,str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(3, 10,12000,str_to_date('2021-07-08','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(2, 10,7000,str_to_date('2021-07-09','%Y-%m-%d'));
insert into orders(customer_id, book_id, o_saleprice, o_orderdate)
	values(3, 8,13000,str_to_date('2021-07-10','%Y-%m-%d'));

select * from orders;

-- 1. 모든 도서의 가격과 도서명 조회 
select b_bookname, b_price from book;

-- 2. 모든 출판사 이름 조회 
select b_publisher from book;

-- 2.1 중복값을 제외한 출판사 이름 조회 
select distinct b_publisher from book;

-- 3. BOOK테이블의 모든 내용 조회 
select * from book;

-- 4. 20000원 미만의 도서만 조회 
select * from book where b_price < 20000;

-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price >= 10000 and b_price <= 20000;
select * from book where b_price between 10000 and 20000;

-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회 
select * from book where b_publisher = '굿스포츠' or b_publisher = '대한미디어';
select * from book where b_publisher in('굿스포츠','대한미디어');

-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname  like '%축구%';

-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname  like '_구%';

-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_price >= 20000 and b_bookname like '%축구%';

-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
select * from book order by b_bookname desc;

-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc, b_bookname asc;

-- 12. 주문 도서의 총 판매액 조회 
use db_dbclass;
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where customer_id = 1;
-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 
select avg(o_saleprice), max(o_saleprice), min(o_saleprice) from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회
select customer_id, count(id), sum(o_saleprice) from orders group by customer_id;
-- 16. 가격이 8,000원 이상인(그룹바이 하기전 where 조건) 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상(having사용) 구매한 고객만) 
-- 8000원 이상 도서 두권 이상 구매한 고객만 고객별 주문 도서의 총 수량을 조회해라 (8000원 이하는 포함하지 않음)
select customer_id, count(id) from orders where o_saleprice >= 8000 group by customer_id having count(*) >= 2;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select sum(o_saleprice) from orders where customer_id = 2;
-- 18. 김연아 고객이 구매한 도서의 수
select count(id) from orders where customer_id = 2;
-- 19. 서점에 있는 도서의 총 권수
select count(id) from book;
-- 20. 출판사의 총 수 
select b_publisher from book; 
select distinct b_publisher from book;
select count(distinct b_publisher) as '출판사 개수' from book;
-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select * from orders where o_orderdate between '2021-07-04' and '2021-07-07';
select * from orders where o_orderdate >= '2021-07-04' and  o_orderdate <= '2021-07-07';
select * from orders where o_orderdate >= str_to_date('2021-07-04','%Y-%m-%d') and  o_orderdate <= str_to_date('2021-07-07','%Y-%m-%d');
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select * from orders where o_orderdate not between '2021-07-04' and '2021-07-07';
select * from orders where o_orderdate < '2021-07-04' or  o_orderdate >'2021-07-07';
select * from orders where o_orderdate < str_to_date('2021-07-04','%Y-%m-%d') or  o_orderdate > str_to_date('2021-07-07','%Y-%m-%d');

-- 23. 고객, 주문 테이블 조인하여 고객번호 순으로 정렬
select * from customer c, orders o where c.id = o.customer_id order by c.id , o.id;
select * from customer c inner join orders o on c.id = o.customer_id order by c.id , o.id;

-- 24. 고객이름(CUSTOMER), 고객이 주문한 도서 가격(ORDERS) 조회 
select c.c_name, o.o_saleprice from customer c, orders o where c.id = o.customer_id;

-- 25. 고객별(GROUP)로 주문한 도서의 총 판매액(SUM)과 고객이름을 조회하고 조회 결과를 가나다 순으로 정렬 
select c.c_name ,sum(o.o_saleprice) from customer c, orders o 
								where c.id = o.customer_id group by customer_id order by c.c_name;

-- 26. 고객명과 고객이 주문한 도서명을 조회(3테이블 조인)
select c.c_name, b.b_bookname from customer c, book b, orders o 
								where c.id = o.customer_id and b.id = o.book_id;

-- 27. 2만원(SALEPRICE) 이상 도서를 주문한 고객의 이름과 도서명을 조회 
select c.c_name, b.b_bookname from customer c, book b, orders o 
								where c.id = o.customer_id and b.id = o.book_id and o.o_saleprice >= 20000;

-- 28. 손흥민 고객의 총 구매액과 고객명을 함께 조회
select c.c_name,sum(o.o_saleprice) from customer c, orders o 
								where c.id = o.customer_id and c.c_name ='손흥민';

-- 29. 손흥민 고객의 총 구매수량과 고객명을 함께 조회
select c.c_name,count(*) from customer c, orders o 
								where c.id = o.customer_id and c.c_name ='손흥민';

-- 30. 가장 비싼 도서의 이름을 조회 
select * from book order by b_price desc;
select max(b_price) from book;
select b_bookname from book where b_price = 35000;
select b_bookname from book where b_price = (select max(b_price) from book);

-- 30추가문제. 구매한 책들중 가장 비싼 책 이름을 조회해라 
select * from orders;
select max(o_saleprice) from orders; -- (3번책)가장 비싼 책 가격
select * from book; -- 3번 책은 축구의 이해
select b.b_bookname from book b, orders o 
					where b.id = o.book_id 
							and o.o_saleprice = (select max(o_saleprice) from orders);

-- 31. 책을 구매한 이력이 있는 고객의 이름을 조회
select c_name from customer where id=1 or id=2 or id=3 or id=4;
select c_name from customer where id in(1,2,3,4);
select c_name from customer where id in(select customer_id from orders);
select distinct c_name from customer c, orders o where c.id = o.customer_id;

-- 32. 도서의 가격(PRICE)과 판매가격(SALEPRICE)의 차이가 가장 많이 나는 주문 조회 
select * from orders;
select * from book;
select b.b_price - o.o_saleprice from book b, orders o where b.id = o.book_id; -- 차이
select max(b.b_price - o.o_saleprice) from book b, orders o where b.id = o.book_id; -- 가장 큰 차이 
select * from book b, orders o where b.id = o.book_id 
	and b.b_price - o.o_saleprice = 
					(select max(b.b_price-o.o_saleprice) from book b, orders o where b.id = o.book_id);

-- 33. 주문목록 고객별 평균 구매 금액이 / 주문목록 도서의 판매 평균 금액 보다 높은 고객의 이름 조회 
select avg(o_saleprice) from orders; -- 전체 주문 평균 판매금액 11800원
select c.c_name , avg(o_saleprice) from customer c , orders o where c.id = o.customer_id group by c.c_name; -- 고객별 평균 구매금액

select c.c_name from customer c, book b, orders o 
		where c.id = o.customer_id and b.id = o.book_id 
				group by c.c_name 
						having avg(o_saleprice) > (select avg(o_saleprice) from orders);

-- 34. 고객번호가 5인 고객의 주소를 대한민국 인천으로 변경 
update customer set c_address = '대한민국 인천' where id = 5;
select * from customer;

-- 35. 김씨 성을 가진 고객이 주문한 총 판매액 조회
select c.c_name, o.o_saleprice from customer c, book b, orders o where c.id = o.customer_id and b.id = o.book_id;
select id from customer where c_name like '김%';
select sum(o_saleprice) from orders where customer_id=2 or customer_id =3;
select sum(o_saleprice) from  orders where customer_id in(2,3);
select sum(o_saleprice) from orders where customer_id in(select id from customer where c_name like '김%');
select sum(o.o_saleprice) from customer c, book b, orders o
		where c.id = o.customer_id and b.id = o.book_id and c.c_name like '김%';
        
 -- 테이블 구조 변경(alter)
 -- create로 만든건 alter로 수정하고 drop로 지운다!
 create table student(
	id bigint,
    s_name varchar(20),
    s_mobile int
 );
-- 기존 컬럼에 제약조건을 추가하려면
alter table student add constraint primary key(id);
desc student;
-- 기존 컬럼에 타입을 변경하려면
alter table student modify s_mobile varchar(30);
-- 새로운 컬럼 추가하려면
alter table student add s_major varchar(30);
-- 컬럼 이름 변경하려면
alter table student change s_mobile s_phone varchar(30);
-- 컬럼 삭제하려면
alter table student drop s_major;

-- alter을 쓰기도 하지만 그냥 새로운 테이블을 만드는게 훨 깔끔




-- ------------ 연습 문제----------------
-- member_table 테이블 (회원정보 테이블)
drop table if exists member_table;
create table member_table(
	id bigint auto_increment,
    member_email varchar(50) not null unique,
    member_name varchar(20) not null,
    member_password varchar(20) not null,
    constraint pk_member_table primary key(id)
);
select * from member_table;

-- category_table 테이블 (카테고리 테이블)
drop table if exists category_table;
create table category_table(
	id bigint auto_increment ,
    category_name varchar(20) not null unique,
    constraint pk_category_table primary key(id)    
);

-- board_table 테이블 (게시판 테이블)
drop table if exists board_table;
create table board_table(
	id bigint auto_increment,
    board_title varchar(50) not null,
    board_writer varchar(20) not null, -- 사용자가 로그인한 입력값
    board_contents varchar(500),
    board_hits int default 0, -- 조회수
    board_created_time datetime default now(),
    board_updated_time datetime on update now(), -- 게시글에 최종 수정시간 
-- 게시글을 처음 쓸땐 null , 게시글에 수정이 발생하면 수정시간을 기록함
-- on update : 업데이트가 발생 했을때 그 현재 시간을 기록하라는 명령 
    board_file_attached int default 0, -- 파일 첨부여부
    -- 파일 첨부여부를 따져서 나중에 화면 출력에서 차이를 보여줄수 있음(스프링이랑 연결할 때 배운다)
    -- 파일이 없으면 0, 있으면 1
    member_id bigint,
    category_id bigint,
    
    constraint pk_board_table primary key(id),   
    -- constraint 뒤에 쓰는 제약조건 이름은 중복되면 안된다 
    constraint fk_board_table_m foreign key(member_id) references member_table(id) on delete cascade, -- 부모 삭제하면 자식도 함께 삭제
    constraint fk_board_table_c foreign key(category_id) references category_table(id) on delete set null -- 부모 삭제해도 자식 null뜨게끔
);

-- board_file_table 테이블 (첨부 파일 테이블)
-- 실제 파일이 db에 담기는게 아니고 별도 공간에 저장을 하고 db에는 해당 파일의 이름만 저장을한다 
drop table if exists board_file_table;
create table board_file_table(
	id bigint auto_increment,
    original_file_name varchar(100), -- 사용자가 업로드한 파일의 이름
    stored_file_name varchar(100), -- 관리용 파일 이름(파일이름 생성 로직은 backend에서)
    -- 예를 들어, 증명사진.jpg를 올렸다 라고 한다면  15615491216844841651-중명사진.jpg 아무수나 붙여서 파일이름으로 정해서 저장한다 
    -- 만약 사용자가 다시 파일을 볼땐 사용자가 올렸던 파일이름 증명사진.jpg만 보여진다
	board_id bigint,
    
    constraint pk_board_file_table primary key(id),
    constraint fk_board_file_table foreign key(board_id) references board_table(id) on delete cascade
);

-- comment_table 테이블(댓글 테이블)
drop table if exists comment_table;
create table comment_table(
	id bigint auto_increment,
    comment_writer varchar(20) not null,
    comment_contents varchar(200) not null,
    comment_created_time datetime default now(),
    board_id bigint, -- 어떤 게시글에 쓰여지는지
    member_id bigint, -- 누가 댓글을 쓰는건지 두가지를 동시에 참조해야된다
    constraint pk_comment_table primary key(id),
    constraint fk_comment_table_b foreign key(board_id) references board_table(id) on delete cascade,
    constraint fk_comment_table_m foreign key(member_id) references member_table(id) on delete cascade
);

-- good_table 테이블( 좋아요 테이블)
drop table if exists good_table;
create table good_table(
	id bigint auto_increment,
    comment_id bigint, -- 어떤 댓글에 좋아요를 했나
    member_id bigint, -- 누가 좋아요를 눌렀나 
    constraint pk_good_table primary key(id),
    constraint fk_good_table_c foreign key(comment_id) references comment_table(id) on delete cascade, -- 댓글이 지워지면 좋아요 정보도 함께 삭제된다
    constraint fk_good_table_m foreign key(member_id) references member_table(id) on delete cascade -- 회원정보가 지워지면 좋아요 정보도 함께 삭제된다
);


-- --------2023.04.03 오전 수업 ---------------
-- 회원 기능

-- 1. 회원가입 (실제론 프론드에서 백엔드를 걸쳐서 db로 넘어올값)
insert into member_table(member_email, member_name,member_password)
	values('aaaa@naver.com', '바나나', '1111');
insert into member_table(member_email, member_name,member_password)
	values('bbbb@naver.com', '딸기', '2222');
insert into member_table(member_email, member_name,member_password)
	values('cccc@naver.com', '키위', '3333');

-- 2. 이메일 중복체크 
-- 기존 가입된 이메일로 가입하려고 한다면 표에 나옴
select member_email from member_table where member_email = 'aaaa@naver.com';
-- 기존 가입되어 있지 않은 이메일로 가입하려고 한다면 표에 안뜸
-- member_email에서 없는 아이디면 표에 뜨지 않는다
select member_email from member_table where member_email = 'dddd@naver.com';

-- 3. 로그인(사용자가 화면에서 이메일 비밀번호를 입력해서 값을 넣었다 라는 전제하에 생각해보자)
select * from member_table where member_email = 'aaaa@naver.com' and member_password ='1111';
select * from member_table where member_email = 'bbbb@naver.com' and member_password ='2222';
-- **이메일이랑 비밀번호 둘중에 하나라도 틀리면 조회결과가 안나온다**
select * from member_table where member_email = 'aaaa@naver.com' and member_password ='1261';

-- 4. 전체 회원 목록 조회 
select * from member_table;

-- 5. 특정 회원만 조회 
select * from member_table where id = 3; -- 아이디로 조회하는 경우
select * from member_table where member_email = 'aaaa@naver.com'; -- 이메일로 조회하는 경우 

-- 6. 회원정보 수정화면 요청 
--  바꿀수없는 정보와 바꿀수 있는 정보가 뜬다(아이디 변경 x, 비번, 신상정보 변경 o)
-- 기존에 회원이 가입했던 정보를 화면에다 띄워주자!
-- (수정로직은 항상 손이 많이간다, db에 가서 저장된 정보화면 가져와서 띄워ㅓ주고 사용자가 수정을하면 다시 db에 정보를 저장한다_)
select * from member_table where member_email = 'aaaa@naver.com';

-- 7. 회원정보 수정 처리(비밀번호 변경) 
update member_table set member_password = '5555', member_name = '따알기' where id=1; -- 조건을 아이디 값으로 해줘야된다 

-- 8. 회원 삭제 또는 탈퇴 
delete from member_table where id = 3; 

-- 게시글 카테고리 
-- 게시판 카테고리는 자유게시판, 공지사항, 가입인사 세가지가 있음.
insert into category_table(category_name)
	values('자유게시판');
insert into category_table(category_name)
	values('공지사항');
insert into category_table(category_name)
	values('가입인사');
select * from category_table order by id;

-- 게시판 기능 
-- 1. 게시글 작성(파일첨부 x) 3개 이상 
-- 아이디가 1번 회원이 자유게시판 글 2개, 공지사항 글 1개 작성 
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('mysql', '은','즐거워',1,1);
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('c언어', '는','재밌어',1,1);   
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('C++', '은','즐거워',1,2);
    
-- 아이디가 2번 회원이 자유게시판 글 3개 작성
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('가', '나','다',2,1);
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('라', '마','바',2,1);   
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('아', '자','차',2,1);
    
-- 아이디가 3번 회원이 가입인사 글 1개 작성 
insert into board_table(board_title, board_writer,board_contents, member_id,category_id)
	values('라', '리','라',3,3);

-- 1.1. 게시글 작성(파일첨부 o)
-- 2번 회원이 파일있는 자유게시판 글 2개 작성
-- 파일이 첨부되면 어떤 게시글에 쓴 파일인지 게시글 번호가 필요하다
insert into board_table(board_title, board_writer,board_contents, board_file_attached,member_id,category_id)
	values('뇨', '뇨','뇨',1,1,1);
    select * from board_table;
insert into board_file_table(original_file_name, stored_file_name, board_id) 
	values('뇨.jpg', '515654651-뇨.jpg',8);
	alter table board_file_table change original_file_name original_file_name varchar(10);
    select * from board_file_table; 
insert into board_table(board_title, board_writer,board_contents, board_file_attached,member_id,category_id)
	values('졸리네요 커피', '뇨','뇨',1,2,1);
    select * from board_table;
insert into board_file_table(original_file_name, stored_file_name, board_id) 
	values('아메리카노.jpg', '515654651-아메리카노.jpg',9);
     select * from board_file_table; 
insert into board_table(board_title, board_writer,board_contents, board_file_attached,member_id,category_id)
	values('오후수업', '하기','실타',1,2,1);
    select * from board_table;
insert into board_file_table(original_file_name, stored_file_name, board_id) 
	values('오후수업.jpg', '515654651-오후수업.jpg',9);
insert into board_table(board_title, board_writer,board_contents, board_file_attached,member_id,category_id)
	values('뇨뇨뇨뇨', '뇨뇨','실뉴뉴뉴',1,2,1);
    select * from board_table;
insert into board_file_table(original_file_name, stored_file_name, board_id) 
	values('뇨뇨뇨뇨.jpg', '515654651-뇨뇨뇨뇨.jpg',11);
     select * from board_file_table; 
-- 게시글 목록 조회 
-- 2.1 전체글 목록 조회
select * from board_table;
-- 2.2 자유게시판 목록 조회 
select * from board_table where category_id =1;
-- 2.3 공지사항 목록 조회 
select * from board_table where category_id =2;
-- 2.4 목록 조회시 카테고리 이름도 함께 나오게 조회
select * from board_table b, category_table c where b.category_id = c.id order by b.id;


-- 조회가 한번 발생하면 조회수가 하나씩 올라가야된다 
-- 3. 2번 게시글 조회 (조회수 처리 필요함)
-- 게시글을 누를때마다 조회수가 올라간다
-- 업데이트를 하면 조회할 때 마다 업데이트 시간이 바껴서 조금 애매함 (고민필요) 
update board_table set board_hits  = board_hits + 1 where id = 2;
select * from board_table where id = 2;

-- 3.1. 파일 첨부된 게시글 조회 (게시글 내용과 파일을 함께)
update board_table set board_hits  = board_hits + 1 where id in (8,9,10);
-- (1) 조인활용 방법
select * from board_table a, board_file_table b where a.id = b.board_id and a.id in (8,9,10);
-- (2) 쿼리 두번 수행방법 
select * from board_table where id in (8,9,10);
select * from board_file_table where board_id in(8,9,10);

-- 4. 1번 회원이 자유게시판에 첫번째로 작성한 게시글의 제목, 내용 수정
select * from board_table;
update board_table set board_title = '수정제목', board_contents = '수정내용' where id = 1;
-- 5. 2번 회원이 자유게시판에 첫번째로 작성한 게시글 삭제 
delete from board_table where id = 4;


-- 7. 페이징 처리(한 페이지당 글 3개씩)
-- 쿼리는 간단하지만 개념이 중요하다 ! 
select * from board_table;
select * from board_table order by id desc;
-- limit a.b 
-- a는 
-- b는 화면에 몇개를 뜨게 할건지
select * from board_table order by id desc limit 0,3; -- 1
select * from board_table order by id desc limit 1,2; -- 2
select * from board_table order by id desc limit 2,2; -- 3
select * from board_table order by id desc limit 3,3;
select * from board_table order by id desc limit 6,3;
select * from board_table order by id desc limit 0,5;
select * from board_table order by id desc limit 2,5;
select * from board_table order by id desc limit 2,10; -- 3번째 꺼부터 10개를 보여주는건데 10가 없어서 안나옴

-- 페이징을 쓰는 이유는 한화면에 모든걸 보여주기엔 양이 너무 많아서 몇개씩 잘라서 보여준다 
-- 7.1. 첫번째 페이지
-- 7.2. 두번째 페이지
-- 7.3. 세번째 페이지 
-- 정렬기준은 조회수, 한페이지당 글 5개식 볼 때 1페이지
select * from board_table order by board_hits desc limit 0,5;
-- 전체 글 갯수
select count(id) from board_table; -- 페이징 처리 할 땐 전체글이 몇개인지 알아야 한페이지당 몇개씩 페이징 할지 정할 수 있다 
-- 게시글 개수: 10개 , 한페이지당 4개씩:필요한 페이지갯수 3개, 한페이지당 3개씩: 필요한 페이지갯수 4개 

select * from board_table;
-- 8. 검색(글제목 기준)
-- 8.1 검색결과를 오래된 순으로 조회 
select * from board_table where board_title like '%뇨%' order by id asc;

-- 8.2 검색결과를 조회수 내림차순으로 조회 
select * from board_table where board_title like '%뇨%' order by board_hits desc;
-- 8.3 검색결과 페이징 처리(검색결과 중 첫 페이지(한페이지 당 글 2개씩 나온다고 가정))
select * from board_table where board_title like '%뇨%' order by id asc limit 0,2;


create table comment_table(
	id bigint auto_increment,
    comment_writer varchar(20) not null, -- 댓글을 쓰는 사용자의 이메일값
    comment_contents varchar(200) not null,
    comment_created_time datetime default now(),
    board_id bigint, -- 어떤 게시글에 쓰여지는지
    member_id bigint, -- 누가 댓글을 쓰는건지 두가지를 동시에 참조해야된다
    constraint pk_comment_table primary key(id),
    constraint fk_comment_table_b foreign key(board_id) references board_table(id) on delete cascade,
    constraint fk_comment_table_m foreign key(member_id) references member_table(id) on delete cascade
);

-- 댓글 기능 
-- 1. 댓글 작성 
-- 1.1. 1번 회원이 1번 게시글에 댓글 작성 
-- 
insert into comment_table(comment_writer, comment_contents, board_id, member_id)
	values('aaaa@naver.com','안녕',1,1);

-- 1.2. 2번 회원이 1번 게시글에 댓글 작성 
insert into comment_table(comment_writer, comment_contents, board_id, member_id)
	values('bbbb@naver.com','안녕2',1,2);
-- 2. 댓글 조회
select * from board_table where id=1;
select * from comment_table where board_id =1;
select * from board_table b,comment_table c where b.id=c.board_id;

-- 3. 댓글 좋아요 
-- 3.1. 1번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭
insert into good_table(comment_id,member_id)
	values(2,1);
-- 실제 좋아요를 만들땐 한계정당 하나의 게시글에 한번만 누를수 있다(좋아요를 한게 있다면 좋아요를 이미 했으니깐 취소, 없었다면 좋아요를 하게끔)
-- 좋아요 하기전 체크해줘야된다
select id from good_table where comment_id =2 and member_id=1;
-- 좋아요를 한적이 있다면 좋아요 취소(비어있는하트로 보여진다)
delete from good_table where id=1;
select *  from good_table;

-- 3.2. 3번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭 
insert into good_table(comment_id,member_id)
	values(2,3);

-- 4. 댓글 조회시 좋아요 갯수도 함께 조회
select count(id) from good_table where comment_id=2; 
select count(id) from good_table where comment_id=1; 
select * from good_table;







-- 과정평가형 문제 연습

-- char 13이면 딱 13칸 항상 유지 ,속도가 빠름 
-- varchar 들어가는 사이즈에 따라서 공간이 유동적 , 최대 사이즈는 정해져있지만 2글자만 들어가있으면 2개만 써도됨 공간 절약 
-- 투표이력 테이블 생성 
drop table if exists tbl_vote_202005;
create table tbl_vote_202005(
    v_jumin char(13) not null primary key, -- 주민번호
    v_name varchar(20), -- 성명
    m_no char(1),  -- 후보번호
    v_time char(4), -- 투표시간
    v_area char(20), -- 투표장소
    v_confirm char(1) -- 유권자 확인
    );
select * from tbl_vote_202005;    
-- 투표이력 데이터 저장
insert into tbl_vote_202005 values ('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');

insert into tbl_vote_202005 values ('00010130024', '오유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('02010140024', '최유권', '3', '1330', '제2투표장', 'Y');



-- 후보자 테이블 생성
drop table if exists tbl_member_202005;
create table tbl_member_202005(
    m_no char(1) not null primary key, -- 후보번호
    m_name varchar(20), -- 성명
    p_code char(2), -- 소속정당 
    p_school char(1), -- 최종학력
    m_jumin char(13), -- 주민번호
    m_city varchar(20) -- 지역구
    );
select * from tbl_member_202005;    
-- 후보자 데이터 저장
insert into tbl_member_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

-- 정당 테이블 생성
drop table if exists tbl_party_202005;
create table tbl_party_202005(
    p_code char(2) not null primary key, -- 정당코드
    p_name varchar(20), -- 명칭
    p_indate date, -- 등록연월일
    p_reader varchar(20), -- 대표자
    p_tel1 char(3), -- 전화번호1
    p_tel2 char(4), -- 전화번호2
    p_tel3 char(4) -- 전화번호3
    );
select * from tbl_party_202005;
-- 정당 데이터 저장    
insert into tbl_party_202005 values ('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values ('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

-- 후보 조회 화면
-- 1번 후보자 정보 조회
-- 후보자, 정당 테이블을 조인 해야된다 
select * from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;
-- 2번 필요한 정보만 조회(컬럼이름 한글로)
select m_no as '주민번호', m_name as '성명', p_name as '소속정당', p_school as '학력'
								,m_jumin as '주민번호', m_city as '지역구', p_tel1,p_tel2,p_tel3 as '대표전화' 
												from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;
-- 3번 학력 항목은 1-> 고졸, 2-> 학사, 3-> 석사, 4-> 박사로 출력되도록 한다 
select p_school from tbl_member_202005;
select p_school,
	case	
		when p_school = '1' then '고졸'
		when p_school = '2' then '학사'
		when p_school = '3' then '석사'
		when p_school = '4' then '박사'
		else '없음' -- when 조건 말고 다른 값이 있을 땐 없음이라고 표현하자 
    end as '학력'
    from tbl_member_202005;
    
-- 4번 2번이랑 3번이랑 합쳐보자

select m_no as '주민번호', m_name as '성명', p_name as '소속정당',	
        case	
			when p_school = '1' then '고졸'
			when p_school = '2' then '학사'
			when p_school = '3' then '석사'
			when p_school = '4' then '박사'
			else '없음' -- when 조건 말고 다른 값이 있을 땐 없음이라고 표현하자 
		end as '학력'
								,m_jumin as '주민번호', m_city as '지역구', p_tel1,p_tel2,p_tel3 as '대표전화' 
												from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;

-- 5번 주민 번호에 대시(-) 표시 하기 
-- 잘라내기 구글링으로 찾아보기 
-- substr() 이용
-- 주민번호 총 13자리 
-- 앞 6자리 잘라내기
select substr(m_jumin, 1, 6) from tbl_member_202005;
-- 뒤 7자리 잘라내기
select substr(m_jumin, 7, 7) from tbl_member_202005;
-- 6자리-7자리 연결하기 
-- concat() 이용
select substr(substr(v_jumin, 1, 6), 1, 2) from tbl_vote_202005;

-- 6번 4.5번 합쳐보자 
select m_no as '주민번호', m_name as '성명', p_name as '소속정당',	
        case	
			when p_school = '1' then '고졸'
			when p_school = '2' then '학사'
			when p_school = '3' then '석사'
			when p_school = '4' then '박사'
			else '없음' -- when 조건 말고 다른 값이 있을 땐 없음이라고 표현하자 
		end as '학력',
        concat(substr(m_jumin, 1, 6),'-',substr(m_jumin, 7, 7)) as '주민번호',
						m_city as '지역구', p_tel1,p_tel2,p_tel3 as '대표전화' 
									from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;
                                    
-- 7번 대표 전화 이어붙이기
select p_tel1,p_tel2,p_tel3 from tbl_party_202005;

select concat(p_tel1,'-',p_tel2,'-',p_tel3) as '대표전화'from tbl_party_202005;

-- 8번 6.7번 합쳐보자(최종 완성본)

select m_no as '주민번호', 
	   m_name as '성명', 
       p_name as '소속정당',	
        case	
			when p_school = '1' then '고졸'
			when p_school = '2' then '학사'
			when p_school = '3' then '석사'
			when p_school = '4' then '박사'
			else '없음' -- when 조건 말고 다른 값이 있을 땐 없음이라고 표현하자 
		end as '학력',
        concat(substr(m_jumin, 1, 6),'-',substr(m_jumin, 7, 7)) as '주민번호',
		m_city as '지역구', 
        concat(p_tel1,'-',p_tel2,'-',p_tel3) as '대표전화'
		from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;


-- 후보자 등수 화면 조회 
select * from tbl_vote_202005;
select m_no,count(m_no) from tbl_vote_202005 group by m_no;
select m_no,count(m_no) from tbl_vote_202005 where v_confirm = 'Y' group by m_no;

select m.m_no as '후보번호', m.m_name as '성명', count(v.m_no) as '총투표건수'
	from tbl_vote_202005 v, tbl_member_202005 m
    where v.m_no=m.m_no and v.v_confirm='Y' 
    group by m.m_no, m.m_name
    order by count(v.m_no) desc, m.m_name asc;

-- 투표 검수 조회 화면 
-- 년월일 잘라야되고. 9면 앞에 19를 붙여야됨(샐년월일)
-- 원칙: 오늘날짜를 기준으로 생일이 지났나 안지났나
-- 문제에선 년도 기준으로 만나이를 따져라 2023년 기준 (99년생은 만 24세)
select * from tbl_vote_202005;
select count(*) from tbl_vote_202005;
select v_name as '성명' from tbl_vote_202005;
select v_jumin as '생년월일'  from tbl_vote_202005;
-- 주민번호 앞자리 6개
select substr(v_jumin, 1, 6) from tbl_vote_202005;
-- 6개중 앞에 두개 
select substr(substr(v_jumin, 1, 6), 1, 2) from tbl_vote_202005;
                        
select case
	when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin,1,6),1,2))
    else concat('19',substr(substr(v_jumin,1,6),1,2))
    end as '생년월일'
from tbl_vote_202005;

-- 6개중 중간 두개
select substr(substr(v_jumin, 1, 6), 3, 2) from tbl_vote_202005;
-- 6개중 끝네 두개
select substr(substr(v_jumin, 1, 6), 5, 2) from tbl_vote_202005;
-- 합치기 
select concat(case	
		when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
		else concat('19',substr(substr(v_jumin, 1, 6), 1, 2))
    end,'년',substr(substr(v_jumin, 1, 6), 3, 2),'월',substr(substr(v_jumin, 1, 6), 5, 2),'일생') as '생년월일'from tbl_vote_202005;

select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일'
                    from tbl_vote_202005;


-- 성별

select 
case
when substr(v_jumin,7,1) in (1,3) then '남'
else '여'
end as '성별'
from tbl_vote_202005;

-- 성명 생년웡일 성별 후보번호 투표시간 합치기
select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일',
				case
					when substr(v_jumin,7,1) in (1,3) then '남'
					else '여'
				end as '성별',
                m_no as '후보번호'
                    from tbl_vote_202005;


select * from tbl_vote_202005;
-- 투표시간 
select v_time from tbl_vote_202005;
select substr(v_time,1,2) from tbl_vote_202005;
select substr(v_time,3,4) from tbl_vote_202005;
select concat(substr(v_time,1,2),':',substr(v_time,3,4)) as '투표시간'from tbl_vote_202005;


-- 성명 생년웡일 성별 후보번호 투표시간 합치기
select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일',
				case
					when substr(v_jumin,7,1) in (1,3) then '남'
					else '여'
				end as '성별',
                m_no as '후보번호',
                concat(substr(v_time,1,2),':',substr(v_time,3,4)) as '투표시간'
                    from tbl_vote_202005;
                    
                    
-- 유권자 확인 
select * from tbl_vote_202005;
select v_confirm from tbl_vote_202005;
select case
	when  v_confirm ='Y' then '확인'
	else '미확인'
    end as '유권자확인'

from tbl_vote_202005;


-- 성명 생년웡일 성별 후보번호 투표시간 유권자확인 합치기
select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일',
				case
					when substr(v_jumin,7,1) in (1,3) then '남'
					else '여'
				end as '성별',
                m_no as '후보번호',
				concat(substr(v_time,1,2),':',substr(v_time,3,4)) as '투표시간',
                case
					when  v_confirm ='Y' then '확인'
					else '미확인'
				end as '유권자확인'
               
                    from tbl_vote_202005;
                    
                    
                    
                    
-- -- 선생님 풀이--
-- 주민번호 7번째 자리 1,2이면 1900년생 3,4이면 2000년생
-- 19인지 20인지
select v_jumin,
			case
				when substr(v_jumin,7,1) in ('1','2') then '19'
				when substr(v_jumin,7,1) in ('3','4') then '20'
			end as '년도 앞자리'
		from tbl_vote_202005; 

select concat(
	-- 앞자리 만들기
		case
			when substr(v_jumin,7,1) in ('1','2') then '19'
			when substr(v_jumin,7,1) in ('3','4') then '20'
		end,
		-- 년도 뒤 두자리 
        substr(v_jumin,1,2),'년',
        -- 월 두자리
		 substr(v_jumin,3,2),'월',
         -- 일 두자리 
		 substr(v_jumin,5,2),'일생') as '생년월일'
	from tbl_vote_202005; 

-- 만나이 계산 
-- 만나이 (현재 년도 - 태어난 년도)
-- 현재 시간 
select sysdate() from dual;
-- 현재 년도
select date_format(sysdate(),'%Y') from dual;
-- 정수 형태로 변환
select cast(date_format(sysdate(),'%Y') as unsigned) from dual;
-- 결과 조합하면 
select concat('만',cast(date_format(sysdate(),'%Y') as unsigned) - 2021,'세' )from dual;


select concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				-   -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이'
	from tbl_vote_202005;

-- 최종 합  
				
                
                
-- 성명 생년웡일 성별 후보번호 투표시간 유권자확인 합치기
select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',
                    substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',
                    substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일',
			concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				-   -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이',
				case
					when substr(v_jumin,7,1) in (1,3) then '남'
					else '여'
				end as '성별',
                m_no as '후보번호',
				concat(substr(v_time,1,2),':',substr(v_time,3,4)) as '투표시간',
                case
					when  v_confirm ='Y' then '확인'
					else '미확인'
				end as '유권자확인'
               
                    from tbl_vote_202005;
                    
                    
                    
                    
                    
-- view(뷰)
-- 가상테이블:빈번한 select 작업이 있을때 만들어놓는 작업

-- 뷰 생성함
create view vote_result as
select v_name as '성명' , 
		concat(
				case	
					when substr(substr(v_jumin, 1, 6), 1, 1) in ('0') then concat('20',substr(substr(v_jumin, 1, 6), 1, 2))
					else concat('19',substr(substr(v_jumin, 1, 6), 1, 2)) 
					end,
                    '년',
                    substr(substr(v_jumin, 1, 6), 3, 2),
                    '월',
                    substr(substr(v_jumin, 1, 6), 5, 2),
                    '일생') 
                    as '생년월일',
			concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				-   -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이',
				case
					when substr(v_jumin,7,1) in (1,3) then '남'
					else '여'
				end as '성별',
                m_no as '후보번호',
				concat(substr(v_time,1,2),':',substr(v_time,3,4)) as '투표시간',
                case
					when  v_confirm ='Y' then '확인'
					else '미확인'
				end as '유권자확인'
               
                    from tbl_vote_202005;
                    
select * from vote_result; -- 긴 쿼리문을 뷰로 만듬(실제 존재하는 테이블이 아니다 / 가상의 테이블)
                    
                    