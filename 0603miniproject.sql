Rem Copyright (c) 1990 by Oracle Corporation
Rem NAME
REM    UTLSAMPL.SQL
Rem  FUNCTION
Rem  NOTES
Rem  MODIFIED
Rem	gdudey	   06/28/95 -  Modified for desktop seed database
Rem	glumpkin   10/21/92 -  Renamed from SQLBLD.SQL
Rem	blinden   07/27/92 -  Added primary and foreign keys to EMP and DEPT
Rem	rlim	   04/29/91 -	      change char to varchar2
Rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
Rem	pritto	   04/04/91 -	      change SYSDATE to 13-JUL-87
Rem   Mendels	 12/07/90 - bug 30123;add to_date calls so language independent
Rem
rem
rem $Header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli Generic<base> $ sqlbld.sql
rem
SET TERMOUT OFF
SET ECHO OFF

rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
rem OATES:     Created: 16-Feb-83

rem 팀원 : 조태익, 이진의, 장동기, 류선영

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
CONNECT SCOTT/TIGER


DROP TABLE Broadcast;
CREATE TABLE Broadcast
       (BNAME VARCHAR2(50),
	BKIND VARCHAR2(50),
	BPERSON1 VARCHAR2(10),
	BPERSON2 VARCHAR2(10),
	BPERSON3 VARCHAR2(10),
	CONSTRAINT PK_Broadcast_BNAME PRIMARY KEY (BNAME));
	
INSERT INTO Broadcast VALUES 
	('무한도전', '예능', '유재석', '김연아', '서장훈');
INSERT INTO Broadcast VALUES 
	('해피투게더', '예능', '신동엽', '유재석', '이효리');
INSERT INTO Broadcast VALUES 
	('패밀리가 떴다', '예능', '유재석', '이효리', '윤종신');
INSERT INTO Broadcast VALUES 
	('런닝맨', '예능', '유재석', '지석진', '김종국');
INSERT INTO Broadcast VALUES 
	('슈가맨', '예능', '유재석', '산다라박', '유희열');
Insert into Broadcast VALUES 
	('범인은 바로 너!', '예능', '유재석', '안재욱', '김종민');
Insert into Broadcast VALUES 
	('유퀴즈온더블럭', '예능', '유재석', '조세호', NULL);
Insert into Broadcast VALUES 
	('놀면뭐하니?', '예능', '유재석', '지석진', '조세호');
Insert into Broadcast VALUES 
	('미운우리새끼', '예능', '신동엽', '김태우', '김신영');
Insert into Broadcast VALUES 
	('불후의 명곡', '예능', '신동엽', '서장훈', '김건모');
INSERT INTO Broadcast VALUES
	('나는 대한민국', '예능', '신동엽', '김연아', NULL);
INSERT INTO Broadcast VALUES
	('아는 형님', '예능', '강호동', '서장훈', '김희철');
INSERT INTO Broadcast VALUES 
	('골목식당', '예능', '백종원', '김성주', '금새록');
INSERT INTO Broadcast VALUES 
	('손세이셔널', '다큐', '손흥민', NULL, NULL);
INSERT INTO Broadcast VALUES 
	('스트리트푸드파이터', '다큐', '백종원', NULL, NULL);


DROP TABLE P_Job;
CREATE TABLE P_Job
	(
	JCODE NUMBER(3)	,
	JNAME VARCHAR2(20)  ,
	CONSTRAINT PK_P_JOB_JCODE PRIMARY KEY (JCODE)
	);
	
INSERT INTO P_Job VALUES (01, '방송인');
INSERT INTO P_Job VALUES (02, '운동선수');
INSERT INTO P_Job VALUES (03, '요리연구가');


DROP TABLE PERSONAL_INFO;
CREATE TABLE PERSONAL_INFO 
       (NAMECODE NUMBER(3),
	NAME VARCHAR2(10) ,
	BRITHYEAR NUMBER(4),
	GENDER CHAR(1) CONSTRAINT CH_PERSONAL_INFORMATION_GENDER CHECK (GENDER IN ('F', 'M')),
	JCODE NUMBER(2),
	MBTI VARCHAR2(4),
	WORK1 VARCHAR2(50),
	WORK2 VARCHAR2(50),
	WORK3 VARCHAR2(50),
	WIN VARCHAR2(50),
	CONSTRAINT PK_PERSONAL_INFO_NAMECODE PRIMARY KEY (NAMECODE),
	CONSTRAINT FK_PERSONAL_INFO_WORK1 FOREIGN KEY (WORK1) REFERENCES Broadcast(BNAME),
	CONSTRAINT FK_PERSONAL_INFO_WORK2 FOREIGN KEY (WORK2) REFERENCES Broadcast(BNAME),
	CONSTRAINT FK_PERSONAL_INFO_WORK3 FOREIGN KEY (WORK3) REFERENCES Broadcast(BNAME),
	CONSTRAINT FK_PERSONAL_INFO_JOB FOREIGN KEY (JCODE) REFERENCES P_Job(JCODE)
	);
	
INSERT INTO PERSONAL_INFO VALUES 
	(001, '유재석', 1972, 'M', 01, 'ISFP', '무한도전', '해피투게더', '유퀴즈온더블럭', '백상예술대상 TV부문 대상');
INSERT INTO PERSONAL_INFO VALUES 
	(002, '김연아', 1990, 'F', 02, 'ISTP', '무한도전', '런닝맨', '나는 대한민국', '밴쿠버 동계올림픽 싱글 금메달');
INSERT INTO PERSONAL_INFO VALUES
	(003, '신동엽', 1971, 'M', 01, 'INTJ', '해피투게더', '미운우리새끼','나는 대한민국', NULL);
INSERT INTO PERSONAL_INFO VALUES 
	(004, '서장훈', 1974, 'M', 01, 'INTJ', '아는 형님', '미운우리새끼', '무한도전', '백상예술대상 남자예능상');
INSERT INTO PERSONAL_INFO VALUES 
	(005, '손흥민', 1992, 'M', 02, 'ESTP', '아는 형님', '손세이셔널', NULL, '국제축구연맹 푸스카스상');
INSERT INTO PERSONAL_INFO VALUES
	(006, '백종원', 1966, 'M', 03, NULL, '골목식당', '스트리트푸드파이터', NULL, 'MBC방송연예대상 PD상');


COMMIT;


SET TERMOUT ON
SET ECHO ON