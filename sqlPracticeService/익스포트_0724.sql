--------------------------------------------------------
--  파일이 생성됨 - 금요일-7월-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence JSEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."JSEQ_NUM"  MINVALUE 10000 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10040 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ"  MINVALUE 1 MAXVALUE 20 INCREMENT BY 2 START WITH 11 CACHE 5 NOORDER  CYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_JNUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_JNUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SEQ_NUM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 221 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SOLVED_PROB_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SOLVED_PROB_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SUBMIT_LOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##ORA_USER"."SUBMIT_LOG_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 381 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table BBS
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."BBS" 
   (	"BBSID" NUMBER(*,0), 
	"BBSTITLE" VARCHAR2(50 BYTE), 
	"USERID" VARCHAR2(20 BYTE), 
	"BBSDATE" DATE DEFAULT SYSDATE, 
	"BBSCONTENT" VARCHAR2(2048 BYTE), 
	"BBSAVAILABLE" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table J_PROBLEM
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."J_PROBLEM" 
   (	"PROB_NUM" NUMBER, 
	"PROB_TITLE" VARCHAR2(100 BYTE), 
	"PROB_BODY" VARCHAR2(2000 BYTE), 
	"PROB_ANSWER" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."MEMBER" 
   (	"M_ID" VARCHAR2(15 BYTE), 
	"M_PW" VARCHAR2(15 BYTE), 
	"M_NAME" VARCHAR2(20 BYTE), 
	"M_EMAIL" VARCHAR2(30 BYTE), 
	"M_PHONE" VARCHAR2(15 BYTE), 
	"M_MESSAGE" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROBLEM
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."PROBLEM" 
   (	"PROB_NUM" NUMBER, 
	"PROB_TITLE" VARCHAR2(100 BYTE), 
	"PROB_BODY" VARCHAR2(1000 BYTE), 
	"PROB_ANSWER" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."QUESTION" 
   (	"M_ID" VARCHAR2(20 BYTE), 
	"PROB_NUM" NUMBER, 
	"QST_DATE" VARCHAR2(25 BYTE), 
	"QST_BODY" CLOB, 
	"QST_TITLE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("QST_BODY") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table QUESTION_COMMENT
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."QUESTION_COMMENT" 
   (	"Q_ID" VARCHAR2(20 BYTE), 
	"QC_ID" VARCHAR2(20 BYTE), 
	"PROB_NUM" NUMBER, 
	"QST_DATE" VARCHAR2(25 BYTE), 
	"QC_DATE" VARCHAR2(25 BYTE), 
	"QC_BODY" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."STUDENT" 
   (	"STU_NO" CHAR(9 BYTE), 
	"STU_NAME" VARCHAR2(12 BYTE), 
	"STU_DEPT" VARCHAR2(20 BYTE), 
	"STU_GRADE" NUMBER(1,0), 
	"STU_CLASS" CHAR(1 BYTE), 
	"STU_GENDER" CHAR(1 BYTE), 
	"STU_HEIGHT" NUMBER(5,2), 
	"STU_WEIGHT" NUMBER(5,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SUBMIT_LOG
--------------------------------------------------------

  CREATE TABLE "C##ORA_USER"."SUBMIT_LOG" 
   (	"SUB_NUM" NUMBER, 
	"M_ID" VARCHAR2(20 BYTE), 
	"PROB_NUM" NUMBER, 
	"SUB_ANSWER" VARCHAR2(1 BYTE), 
	"SUB_CODE" VARCHAR2(2000 BYTE), 
	"SUB_DATE" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View V_TRADE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##ORA_USER"."V_TRADE" ("T_SEQ", "P_CODE", "C_CODE", "T_DATE", "T_QTY", "T_COST", "T_TAX") AS 
  SELECT "T_SEQ","P_CODE","C_CODE","T_DATE","T_QTY","T_COST","T_TAX" FROM trade WHERE p_code = '401'
;
REM INSERTING into C##ORA_USER.BBS
SET DEFINE OFF;
Insert into C##ORA_USER.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE) values (4,'긴급 복구','admin',to_date('20/07/23','RR/MM/DD'),'정전',1);
Insert into C##ORA_USER.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE) values (6,'[필독] 공지사항','admin',to_date('20/07/23','RR/MM/DD'),'안읽어도됨',1);
Insert into C##ORA_USER.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE) values (5,'7월 23일 업데이트 내용 입니다.','admin',to_date('20/07/23','RR/MM/DD'),'테스트 케이스 추가',1);
Insert into C##ORA_USER.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE) values (7,'7월 24일 업데이트 내용입니다','admin',to_date('20/07/23','RR/MM/DD'),'글 수정 가능',1);
Insert into C##ORA_USER.BBS (BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSAVAILABLE) values (3,'7월 21일 업데이트 내용 입니다.','admin',to_date('20/07/23','RR/MM/DD'),'내용은 아래와 같습니다.
1. 글 삭제 가능',1);
REM INSERTING into C##ORA_USER.J_PROBLEM
SET DEFINE OFF;
Insert into C##ORA_USER.J_PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (10021,'multiply','a와 b가 매개변수로 주어지면 둘을 곱한 결과를 반환하는 solution 메서드를 작성하라.

public static int solution(int a,int b){
	int answer =0;

	return answer;
}','public class multiply{

	public static void main(String[] args) {
	
		int a=10,b=9;
		System.out.println(answer(a,b) == solution(a,b));
	}
	public static int answer(int a,int b){
		return a*b;
	}
	//solution
	
}');
Insert into C##ORA_USER.J_PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (10001,'plus_1toM','1에서 부터 M까지 더하는 함수를 작성하라
public static int solution(int m){
     int answer = 0;

     return answer; 
}','import java.util.Random;
import java.util.*;

public class plus_1toM {

	public static void main(String[] args) {
	
		int n,m;
		Random random= new Random();
		m = random.nextInt(1000);
		
		System.out.println(answer(m) == solution(m));
	}
	public static int answer(int m){
		return (m*(m+1))/2;
	}
	//solution
	
}');
Insert into C##ORA_USER.J_PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (10000,'plus','인풋으로 a,b를 받으면 a+b를 출력하는 아래의 함수를 작성하라.
public static int solution(int a, int b){
int answer = 0;
return ;
}','
public class plus {

	public static void main(String[] args) {
	
		int a=10,b=9;
		System.out.println(answer(a,b) == solution(a,b));
	}
	public static int answer(int a,int b){
		return a+b;
	}
	//solution
	
}
');
REM INSERTING into C##ORA_USER.MEMBER
SET DEFINE OFF;
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('admin','admin','admin','admin','admin','관리자 입니다.');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('chacha','chacha','chacha','chacha','chacha','나는 차승훈');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('123','123','123','123','123','나 321이야');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('test','test','test','test','test','상태 메세지 변경');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('star','star','star','star','star','5성');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('solar','solar','solar','solar','solar','기쁨');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('roh','12345','노승현','shtmdgus@gmail.com','010-1234-5678','기본 상태 메세지');
Insert into C##ORA_USER.MEMBER (M_ID,M_PW,M_NAME,M_EMAIL,M_PHONE,M_MESSAGE) values ('luna','luna','luna','luna','luna','배고픔');
REM INSERTING into C##ORA_USER.PROBLEM
SET DEFINE OFF;
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (161,'모든 학생을 출력하라.','student테이블의 모든 내용을 출력하라.

Select * from student','Select * from student');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (206,'[옥]으로 시작하는 이름','옥으로 시작하는 이름을 모두 출력하라, 이름은 STU_NAME, 테이블은 STUDENT1','select stu_name from student1 where stu_name like ''옥%''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (201,'[김]으로 시작하는 이름','김으로 시작하는 이름을 모두 출력하라, 이름은 STU_NAME, 테이블은 STUDENT1','select stu_name from student1 where stu_name like ''김%''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (122,'김씨 문제','이름이 김 씨 성을 가진 사람을 모두 출력하라
STUDENT 테이블에서 김시 썽을 가진 사람의 이름을 출력하라.

답: SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (123,'[나]로 끝나는 사람은?','STUDENT 테이블 이름이 나로 끝나는 사람을 모두 출력하라
이름 칼럼 = STUDENT_NAME

SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''');
Insert into C##ORA_USER.PROBLEM (PROB_NUM,PROB_TITLE,PROB_BODY,PROB_ANSWER) values (121,'STU_NAME 문제','STUDENT 테이블에서 STU_NAME 를 출력하라


답
SELECT STU_NAME FROM STUDENT
','SELECT STU_NAME FROM STUDENT');
REM INSERTING into C##ORA_USER.QUESTION
SET DEFINE OFF;
Insert into C##ORA_USER.QUESTION (M_ID,PROB_NUM,QST_DATE,QST_TITLE) values ('test',161,'20/07/23 15:03:20','질문입니다');
Insert into C##ORA_USER.QUESTION (M_ID,PROB_NUM,QST_DATE,QST_TITLE) values ('solar',161,'20/07/23 14:31:02','161번 질문합니다.');
Insert into C##ORA_USER.QUESTION (M_ID,PROB_NUM,QST_DATE,QST_TITLE) values ('test',161,'20/07/23 15:52:14','161번 질문입니다.');
Insert into C##ORA_USER.QUESTION (M_ID,PROB_NUM,QST_DATE,QST_TITLE) values ('star',123,'20/07/23 14:09:02','123번 못풀겠습니다.');
Insert into C##ORA_USER.QUESTION (M_ID,PROB_NUM,QST_DATE,QST_TITLE) values ('roh',121,'20/07/23 14:09:04','어떻게 접근해야 될까요');
REM INSERTING into C##ORA_USER.QUESTION_COMMENT
SET DEFINE OFF;
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('solar','solar',161,'20/07/23 14:31:02','20/07/23 14:31:27','없어요');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('test','test',161,'20/07/23 15:03:20','20/07/23 15:07:22','ㅎㅇㅎㅇ');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('test','test',122,'20/07/23 16:25:26','20/07/23 16:25:33','이렇게 푸세요.');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('star','roh',123,'20/07/23 14:09:02','20/07/23 14:09:47','저도 못풀었어요ㅠㅠㅠ방법좀..
');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('test','test',161,'20/07/23 15:03:20','20/07/23 15:04:08','이렇게 풀면 됩니다.');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('test','test',161,'20/07/23 15:52:14','20/07/23 15:52:24','없습니다.');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('roh','star',121,'20/07/23 14:09:04','20/07/23 14:13:08','싫어요 ㅎㅎ');
Insert into C##ORA_USER.QUESTION_COMMENT (Q_ID,QC_ID,PROB_NUM,QST_DATE,QC_DATE,QC_BODY) values ('test','test',123,'20/07/23 16:28:46','20/07/23 16:28:54','넵 알겠습니다.');
REM INSERTING into C##ORA_USER.STUDENT
SET DEFINE OFF;
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153075 ','옥한빛','기계',1,'C','M',177,80);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153088 ','이태연','기계',1,'C','F',162,50);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20143054 ','유가인','기계',2,'C','F',154,47);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20152088 ','조민우','전기전자',1,'C','M',188,90);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20142021 ','심수정','전기전자',2,'A','F',168,45);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20132003 ','박희철','전기전자',3,'B','M',null,63);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20151062 ','김인중','컴퓨터정보',1,'B','M',166,67);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20141007 ','진현무','컴퓨터정보',2,'A','M',174,64);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131001 ','김종헌','컴퓨터정보',3,'C','M',null,72);
Insert into C##ORA_USER.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131025 ','옥성우','컴퓨터정보',3,'A','F',172,63);
REM INSERTING into C##ORA_USER.SUBMIT_LOG
SET DEFINE OFF;
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (324,'chacha',122,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''김%''','20/07/23 14:18:58');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (327,'chacha',161,'T','Select * from student','20/07/23 14:19:40');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (328,'123',123,'T','SELECT * FROM STUDENT WHERE STU_NAME LIKE ''%나''','20/07/23 14:20:21');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (329,'123',123,'F','SELECT STU_NAME FROM STUDENT','20/07/23 14:20:42');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (339,'solar',181,'T','select stu_name from student1 where stu_name like ''옥%''','20/07/23 14:45:33');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (340,'solar',181,'T','select stu_name from student1 where stu_name like ''옥%%''','20/07/23 14:45:42');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (341,'solar',181,'F','select stu_name from student1 where stu_name like ''김%''','20/07/23 14:45:50');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (342,'test',10020,'F','public static int solution(int a,int b){
int answer =0;

return a*b;
}','20/07/23 14:54:16');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (322,'star',121,'F','SELECT * FROM STUDENT','20/07/23 14:18:18');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (323,'star',123,'T','SELECT STU_NAME FROM STUDENT WHERE STU_NAME LIKE ''%나''','20/07/23 14:18:26');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (350,'test',10022,'T','public static int solution(int N){
int answer =0;

return (N*(N+1))/2;
}','20/07/23 15:49:07');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (348,'test',10022,'T','public static int solution(int N){
int answer =0;
for(int i=1;i<=N;i++){
answer+=i;
}
return answer;
}','20/07/23 15:48:35');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (326,'chacha',10001,'T','public static int solution(int m){
int answer = 0;

return ((m)*(m+1))/2;
}','20/07/23 14:19:28');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (335,'solar',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a-b;
}','20/07/23 14:26:39');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (349,'test',10022,'F','public static int solution(int N){
int answer =0;

return N;
}
','20/07/23 15:48:45');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (336,'solar',10000,'T','public static int solution(int a, int b){
int answer = 0;
return a+b ;
}','20/07/23 14:26:46');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (337,'roh',10001,'F','public static int solution(int m){
int answer = 0;

return answer;
}','20/07/23 14:27:07');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (344,'test',10021,'F','public static int solution(int a,int b){
int answer =0;

return a/b;
}','20/07/23 14:56:10');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (330,'luna',10000,'F','public static int solution(int a, int b){
int answer = 0;
return a-b;
}','20/07/23 14:22:58');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (343,'test',10021,'T','public static int solution(int a,int b){
int answer =0;

return a*b;
}','20/07/23 14:56:00');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (331,'admin',10001,'F','public static int solution(int m){
int answer = 0;

return answer;
}','20/07/23 14:24:32');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (332,'test',161,'T','SELECT * FROM STUDENT','20/07/23 14:25:38');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (333,'test',161,'F','SELECT STU_NAME FROM STUDENT ORDER BY STU_NAME','20/07/23 14:25:42');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (338,'roh',10001,'T','public static int solution(int m){
int answer = 0;
for(int i=1;i<=m;i++){
 answer+=i;
}
return answer;
}','20/07/23 14:27:29');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (321,'star',121,'T','SELECT STU_NAME FROM STUDENT','20/07/23 14:18:07');
Insert into C##ORA_USER.SUBMIT_LOG (SUB_NUM,M_ID,PROB_NUM,SUB_ANSWER,SUB_CODE,SUB_DATE) values (325,'chacha',10000,'T','public static int solution(int a, int b){
int answer = 0;
return a+b;
}','20/07/23 14:19:08');
REM INSERTING into C##ORA_USER.V_TRADE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_QUESTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."PK_QUESTION" ON "C##ORA_USER"."QUESTION" ("M_ID", "PROB_NUM", "QST_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_QUESTION_COMMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."PK_QUESTION_COMMENT" ON "C##ORA_USER"."QUESTION_COMMENT" ("Q_ID", "QC_ID", "PROB_NUM", "QST_DATE", "QC_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index P_STU_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."P_STU_NO" ON "C##ORA_USER"."STUDENT" ("STU_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007403
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."SYS_C007403" ON "C##ORA_USER"."MEMBER" ("M_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007405
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."SYS_C007405" ON "C##ORA_USER"."SUBMIT_LOG" ("SUB_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000074968C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##ORA_USER"."SYS_IL0000074968C00004$$" ON "C##ORA_USER"."QUESTION" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."MEMBER" MODIFY ("M_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."MEMBER" MODIFY ("M_PW" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."MEMBER" ADD PRIMARY KEY ("M_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."QUESTION" MODIFY ("M_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION" MODIFY ("PROB_NUM" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION" MODIFY ("QST_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY ("M_ID", "PROB_NUM", "QST_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "C##ORA_USER"."QUESTION" MODIFY ("QST_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QUESTION_COMMENT
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("Q_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("QC_ID" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("PROB_NUM" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("QST_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("QC_DATE" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" MODIFY ("QC_BODY" NOT NULL ENABLE);
  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" ADD CONSTRAINT "PK_QUESTION_COMMENT" PRIMARY KEY ("Q_ID", "QC_ID", "PROB_NUM", "QST_DATE", "QC_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."STUDENT" ADD CONSTRAINT "P_STU_NO" PRIMARY KEY ("STU_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SUBMIT_LOG
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."SUBMIT_LOG" ADD PRIMARY KEY ("SUB_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."QUESTION" ADD CONSTRAINT "FK_QST_M_ID" FOREIGN KEY ("M_ID")
	  REFERENCES "C##ORA_USER"."MEMBER" ("M_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QUESTION_COMMENT
--------------------------------------------------------

  ALTER TABLE "C##ORA_USER"."QUESTION_COMMENT" ADD CONSTRAINT "FK_QC_Q_ID" FOREIGN KEY ("Q_ID")
	  REFERENCES "C##ORA_USER"."MEMBER" ("M_ID") ENABLE;
