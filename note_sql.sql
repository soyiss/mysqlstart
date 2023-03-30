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