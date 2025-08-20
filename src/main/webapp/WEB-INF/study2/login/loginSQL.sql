show tables;
DESC friend;
SELECT * FROM friend;
DROP TABLE friend;

CREATE TABLE friend (
	idx INT NOT NULL auto_increment PRIMARY KEY,
	mid VARCHAR(20) NOT NULL,
	pwd VARCHAR(20) NOT NULL,
	nickName VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	age INT DEFAULT 20,
	gender CHAR(2) DEFAULT '여자',
	address VARCHAR(30),
	UNIQUE KEY(mid),
	UNIQUE KEY(nickName)
);

INSERT INTO friend VALUES (DEFAULT, 'admin', '1234', '관리맨', '관리자', 33, '남자', '서울');
