CREATE TABLE CMEMBER(
   MID VARCHAR(20) PRIMARY KEY ,
   MPW VARCHAR(20) NOT NULL,
   MNAME VARCHAR(10) NOT NULL,
   MNICKNAME VARCHAR(20) NOT NULL,
   MADD VARCHAR(200) NOT NULL,
   MPHONE VARCHAR(20) NOT NULL,
   MEMAIL VARCHAR(100) NOT NULL,
   MROLE VARCHAR(20) NOT NULL
);

INSERT INTO CMEMBER VALUES('admin','aaaa1234','김수연','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','admin');
INSERT INTO CMEMBER VALUES('wook','aaaa1234','임환욱','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','일반회원');
INSERT INTO CMEMBER VALUES('ssu','aaaa1234','김수연','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','일반회원');
INSERT INTO CMEMBER VALUES('jun','aaaa1234','이향준','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','일반회원');
INSERT INTO CMEMBER VALUES('sun','aaaa1234','이준선','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','일반회원');
INSERT INTO CMEMBER VALUES('jong','aaaa1234','김종현','왕짱맨','서울시','010-111-112','rlatndus2005@naver.com','일반회원');
INSERT INTO CMEMBER VALUES('timo','timo1234','강사님','강사님','서울시','010-111-112','rlatndus2005@naver.com','admin');

DROP TABLE CMEMBER;
DROP TABLE CAR;
DROP TABLE CBOARD;
DROP TABLE CREPLY;


SELECT * FROM CMEMBER;
SELECT * FROM USER_TABLES;