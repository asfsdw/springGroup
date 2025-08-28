show tables;
DESC friend;
SELECT * FROM friend;
SELECT * FROM photo;
DROP TABLE friend;
DROP TABLE photo;

CREATE TABLE friend (
	idx INT NOT NULL auto_increment PRIMARY KEY,
	mid VARCHAR(20) NOT NULL,
	pwd VARCHAR(20) NOT NULL,
	nickName VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	age INT DEFAULT 20,
	gender CHAR(2) DEFAULT '여자',
	address VARCHAR(30),
	photo VARCHAR(100) DEFAULT null, /*시스템에 올라간 파일이름*/
	UNIQUE KEY(mid),
	UNIQUE KEY(nickName),
	FOREIGN KEY(photo) REFERENCES photo(serverName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE photo (
	idx INT NOT NULL auto_increment,	/*회원 사진 고유 번호*/
	originName VARCHAR(100) NOT NULL,	/*사진 파일의 원본 이름*/
	serverName VARCHAR(100) NOT NULL,	/*시스템에 올라간 파일 이름*/
	PRIMARY KEY(idx),
	UNIQUE KEY(serverName)
);

INSERT INTO friend VALUES (DEFAULT, 'admin', '1234', '관리맨', '관리자', 33, '남자', '서울');
UPDATE friend SET name = '오하늘' WHERE mid = 'ohn1234';
UPDATE friend SET photo = '012.jpg' WHERE idx = 13;

/*컬럼추가*/
ALTER TABLE friend ADD COLUMN photo VARCHAR(100) null;
/*컬럼삭제*/
ALTER TABLE friend DROP COLUMN photo;
/*폴리곤(FOREIGN)키 추가*/
ALTER TABLE friend ADD FOREIGN KEY(photo) REFERENCES photo(serverName);
/*폴리곤키 삭제*/
ALTER TABLE friend DROP FOREIGN KEY friend_ibfk_1;
