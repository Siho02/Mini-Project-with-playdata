Rem Copyright (c) 1990 by Oracle Corporation
Rem NAME
REM    UTLSAMPL.SQL
Rem  FUNCTION
Rem  NOTES
Rem  MODIFIED
Rem	gdudey	   06/28/95 -  Modified for desktop seed database
Rem	glumpkin   10/21/92 -  Renamed from SQLBLD.SQL
Rem	blinden    07/27/92 -  Added primary and foreign keys to EMP and DEPT
Rem	rlim	   04/29/91 -	      change char to varchar2
Rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
Rem	pritto	   04/04/91 -	      change SYSDATE to 13-JUL-87
Rem     Mendels	   12/07/90 - bug 30123;add to_date calls so language independent
Rem
rem
rem $Header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli Generic<base> $ sqlbld.sql
rem
SET TERMOUT OFF
SET ECHO OFF

rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
rem OATES:     Created: 16-Feb-83

rem 팀원 : 김수연, 이홍주, 조태익

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO MYMATH2 IDENTIFIED BY 1234;
ALTER USER MYMATH2 DEFAULT TABLESPACE USERS;
ALTER USER MYMATH2 TEMPORARY TABLESPACE TEMP;
CONNECT MYMATH2/1234

DROP TABLE Q_TABLE;
CREATE TABLE Q_TABLE(
	QSID NUMBER(5),
	MEMNO NUMBER(5),
	TITLE VARCHAR2(100),	
	CONTENT VARCHAR2(1000),
	GRADE VARCHAR2(20)
	);

INSERT ALL 
		INTO Q_TABLE VALUES (1, 3, '약수가 뭐에요?', '약수가 뭔지 모르겠어요. 알려주세요', '초4')
		INTO Q_TABLE VALUES (2, 1, '피타고라스 정리 질문', '피타고라스 정리 증명 과정이 잘 이해가 안됩니다..ㅠ', '중2')
SELECT * FROM DUAL;

DROP TABLE A_TABLE;
CREATE TABLE A_TABLE(
	ASID NUMBER(5),
	QSID NUMBER(5),
	MEMNO NUMBER(5),
	AN_TEXT VARCHAR2(1000)
	);
	
DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	MEMNO NUMBER(5),
	MNAME VARCHAR2(30),
	MID VARCHAR2(30),
	MPW VARCHAR2(30),
	BIRTH_DATE DATE
);
INSERT ALL
		INTO MEMBER VALUES (1, '이홍주', 'hongju123', '123hong', '2006-08-04')
		INTO MEMBER VALUES (2, '조태익', 'xodlrdl0219', 'pw1234', '2003-02-19')
		INTO MEMBER VALUES (3, '김수연', 'Kimmath', 'kimmath1234', '2010-04-10')
SELECT * FROM DUAL;

DROP TABLE BOOK;
CREATE TABLE BOOK(
	B_TITLE VARCHAR2(60),
	B_LEVEL VARCHAR2(6),
	B_COMPANY VARCHAR2(15),
	B_TYPE VARCHAR2(20),
	B_OBJECT VARCHAR2(10),
	B_COLOR VARCHAR2(10)
);
INSERT ALL
		INTO BOOK VALUES ('수학좀한다면_초_1', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('수학좀한다면_초_2', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('수학좀한다면_초_3', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('수학좀한다면_초_4', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('수학좀한다면_초_5', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('수학좀한다면_초_6', '상', '디딤돌', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_1', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_2', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_3', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_4', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_5', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('기본+응용_초_6', '중', '디딤돌', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_1', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_2', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_3', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_4', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_5', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('문제기본서쎈_초_6', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_1', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_2', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_3', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_4', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_5', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('라이트쎈_초_6', '중', '신사고', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_1', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_2', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_3', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_4', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_5', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎌파해법수학_초_6', '중', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_1', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_2', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_3', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_4', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_5', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('일등수학_초_6', '상', '천재교육', '기출문제집', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_1', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_2', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_3', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_4', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_5', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_초_6', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('최상위수학_중_1', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('최상위수학_중_2', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('최상위수학_중_3', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('투탑수학_중_1', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('투탑수학_중_2', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('투탑수학_중_3', '상', '디딤돌', '기출문제집', '복습', '단색')
		INTO BOOK VALUES ('교과서개념잡기_중_1', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('교과서개념잡기_중_2', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('교과서개념잡기_중_3', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_중_1', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_중_2', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념+유형_중_3', '중', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('우공비_중_1', '하', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('우공비_중_2', '하', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('우공비_중_3', '하', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎈_중_1', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎈_중_2', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('쎈_중_3', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('일품_중_1', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('일품_중_2', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('일품_중_3', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('체크체크_중1', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('체크체크_중2', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('체크체크_중3', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('수학의왕도_고_1', '하', 'EBS', '자습서', '수능', '단색')
		INTO BOOK VALUES ('수학의왕도_고_2', '하', 'EBS', '자습서', '수능', '단색')
		INTO BOOK VALUES ('수학의왕도_고_3', '하', 'EBS', '자습서', '수능', '단색')
		INTO BOOK VALUES ('올림포스_고_1', '상', 'EBS', '자습서', '내신', '단색')
		INTO BOOK VALUES ('올림포스_고_2', '상', 'EBS', '자습서', '내신', '단색')
		INTO BOOK VALUES ('올림포스_고_3', '상', 'EBS', '자습서', '내신', '단색')
		INTO BOOK VALUES ('전지적출제자시점_고_1', '중', 'EBS', '기출문제집', '내신', '단색')
		INTO BOOK VALUES ('전지적출제자시점_고_2', '중', 'EBS', '기출문제집', '내신', '단색')
		INTO BOOK VALUES ('전지적출제자시점_고_3', '중', 'EBS', '기출문제집', '내신', '단색')
		INTO BOOK VALUES ('개념해결의법칙_고_1', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념해결의법칙_고_2', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념해결의법칙_고_3', '하', '천재교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('유형해결의법칙_고_1', '중', '천재교육', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('유형해결의법칙_고_2', '중', '천재교육', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('유형해결의법칙_고_3', '중', '천재교육', '자습서', '복습', '컬러')
		INTO BOOK VALUES ('개념쎈_고_1', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념쎈_고_2', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('개념쎈_고_3', '중', '신사고', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('일품_고_1', '고', '신사고', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('일품_고_2', '고', '신사고', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('일품_고_3', '고', '신사고', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('내공의힘_고_1', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('내공의힘_고_2', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('내공의힘_고_3', '하', '비상교육', '개념서', '복습', '컬러')
		INTO BOOK VALUES ('만렙AM_고_1', '중', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('만렙AM_고_2', '중', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('만렙AM_고_3', '중', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('만렙PM_고_1', '상', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('만렙PM_고_2', '상', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('만렙PM_고_3', '상', '비상교육', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('씨리얼_고_1', '상', '디딤돌', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('씨리얼_고_2', '상', '디딤돌', '기출문제집', '수능', '단색')
		INTO BOOK VALUES ('씨리얼_고_3', '상', '디딤돌', '기출문제집', '수능', '단색')
SELECT * FROM DUAL;
COMMIT;

SET TERMOUT ON
SET ECHO ON
