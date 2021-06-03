### draft of project with oven

https://ovenapp.io/project/Kd6I9082xeB997OvPEFDiipZtintCRGf#vWifT


### table relation image
![MiniProjectTable02](https://user-images.githubusercontent.com/83528634/120614437-334ebe80-c492-11eb-9f77-f7b0386574f4.jpg)

SET TERMOUT OFF
SET ECHO OFF


GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
CONNECT SCOTT/TIGER

#### make a table
DROP TABLE BROADCAST;
CREATE TABLE BROADCAST
       (BNAME VARCHAR2(50),
	BKIND VARCHAR2(50),
	BPERSON1 VARCHAR2(10),
	BPERSON2 VARCHAR2(10),
	BPERSON3 VARCHAR2(10),
	CONSTRAINT PK_BROADCAST_BNAME PRIMARY KEY (BNAME));
	
#### data insert with INSERT INTO BROADCAST VALUES 


#### make table
DROP TABLE P_JOB;
CREATE TABLE P_JOB
	(
	JCODE NUMBER(3)	,
	JNAME VARCHAR2(20)  ,
	CONSTRAINT PK_P_JOB_JCODE PRIMARY KEY (JCODE)
	);
	
#### data insert with INSERT INTO P_JOB VALUES 


#### make a table
DROP TABLE PERSONAL_INFO;
CREATE TABLE PERSONAL_INFO 
       (NAMECODE NUMBER(3),
	NAME VARCHAR2(10) ,
	BRITHYEAR NUMBER(4),
	GENDER CHAR(1) CONSTRAINT CH_PERSONAL_INFO_GENDER CHECK (GENDER IN ('F', 'M')),
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

#### data insert with INSERT INTO PERSONAL_INFO VALUES
 
COMMIT;

SET TERMOUT ON
SET ECHO ON