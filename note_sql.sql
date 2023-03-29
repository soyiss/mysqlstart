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
