CREATE TABLE CBOARD(
	BNUM INT PRIMARY KEY AUTO_INCREMENT,
	MID VARCHAR(20) NOT NULL,
	MNICKNAME VARCHAR(20) NOT NULL,
	BTITLE VARCHAR(50) NOT NULL,
	BCONTENT VARCHAR(500) NOT NULL,
	BCNT INT DEFAULT 0,
	BDATE VARCHAR(20) NOT NULL
);

SELECT * FROM USER_TABLES;

DROP TABLE CBOARD;
