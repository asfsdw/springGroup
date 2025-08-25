show tables;
SELECT * FROM board;

CREATE TABLE board (
	idx INT NOT NULL auto_increment,	/*번호*/
	mid VARCHAR(20) NOT NULL,	/*올린 사람 아이디*/
	nickName VARCHAR(20) NOT NULL,	/*올린 사람 닉네임*/
	title VARCHAR(100) NOT NULL,	/*제목*/
	content text NOT NULL,	/*내용*/
	hostIP VARCHAR(30) NOT NULL,	/*올린 사람 아이피*/
	openSW CHAR(2) DEFAULT 'OK',	/*공개여부(OK, NO)*/
	readNum INT DEFAULT 0,	/*조회수*/
	good INT DEFAULT 0,	/*좋아요*/
	wDate DATETIME DEFAULT now(),	/*올린 날짜*/
	complaint CHAR(2) DEFAULT 'NO',	/*신고여부(OK, NO)*/
	PRIMARY KEY(idx),
	FOREIGN KEY(mid) REFERENCES friend(mid),
	FOREIGN KEY(nickName) REFERENCES friend(nickName) ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO board VALUES(DEFAULT, 'admin', '관리맨', '게시판 서비스를 시작합니다.', '즐거운 게시판 생활되세요.', '192.168.50.53', DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

DROP TABLE board;