SELECT * FROM hakkwa; /*이름 오름차순*/
SELECT * FROM hakkwa ORDER BY code; /*코드 오름차순*/
SELECT * FROM hakkwa ORDER BY name DESC; /*이름 내림차순*/
DESC hakkwa;
DESC student;
DROP TABLE hakkwa;
DROP TABLE student;
show tables;

/*
 * 기본키(primary key)
 * 테이블을 대표하는 키. 중복을 허용하지 않는다.
 * 자동 인덱싱(검색속도 향상).
*/
create table test2 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	address varchar(50)
);

create table test3 (
	idx int not null,
	name varchar(20) not null,
	age int default 20,
	test3Code varchar(10) not null,
	primary key(name, test3Code)
);

/*
 * 중복 불가능 키(unique key)
 * primary key를 대신해서 중복을 허용하지 않을 때, 사용하는 키.
 * 자동 인덱싱.
*/
create table test4 (
	idx int not null auto_increment primary key,
	product varchar(20) not null,
	price int default 20,
	test4Code varchar(10) not null unique key
);

/*
 * 왜래키(foreign key)
 * 하나의 테이블에서 다른 테이블의 정보를 찾기 위해, 테이블간의 관계를 설정하기 위한 필드(키).
 * 주 테이블의 필드(키)는 중복될 수 없는 필드(키(primary, unique key))여야하고, 부 테이블의 필드(키)는 중복 가능하다.
 * 필드의 이름은 달라도 상관없다(어차피 foreign key(부테이블), references(주테이블)로 설정해주기 때문이다).
*/
create table test5 (
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	age int default 20,
	test4Code varchar(10) not null,
	foreign key(test4Code) references test4(test4Code)
);

insert into test4 values (default, '냉장고', 1000, 'N001');
insert into test4 values (default, '오디오', 500, 'A002');
insert into test4 values (default, '선풍기', 800, 'S001');
insert into test4 values (default, '에어컨', 1500, 'AI001');
insert into test4 values (default, '전자렌지', 850, 'JJ001');
insert into test4 values (default, '전기밥솥', 700, 'JG002');

insert into test5 values (default, '홍길동', 23, 'N001');
insert into test5 values (default, '홍길동', 23, 'N001');

/*--------------------------------------------------------------------------------*/

/*학과(hakkwa) 테이블*/
CREATE TABLE hakkwa (
	code INT NOT NULL PRIMARY KEY, /*학과코드*/
	name VARCHAR(20) NOT NULL, /*학과명*/
	UNIQUE KEY(name)
);

/*기본키(primary) 추가*/
ALTER TABLE hakkwa ADD PRIMARY KEY(code);
ALTER TABLE hakkwa DROP PRIMARY KEY;

/*유니크키(unique) 추가*/
ALTER TABLE hakkwa ADD UNIQUE KEY(name);
ALTER TABLE hakkwa DROP INDEX name;

INSERT INTO hakkwa VALUES(101, '컴퓨터공학과');
INSERT INTO hakkwa VALUES(102, '경영학과');
INSERT INTO hakkwa VALUES(103, '건축공학과');
INSERT INTO hakkwa VALUES(104, '토목공학과');
INSERT INTO hakkwa VALUES(105, '기계공학과');
INSERT INTO hakkwa VALUES(106, '영문과');
INSERT INTO hakkwa VALUES(107, '물리과');

/*학생정보(student) 테이블*/
CREATE TABLE student (
	idx INT NOT NULL auto_increment PRIMARY KEY, /*학생 고유번호*/
	name VARCHAR(20) NOT NULL, /*학생 이름*/
	age INT DEFAULT 20, /*학생 나이*/
	hakkwa_code INT NOT NULL, /*학과코드(외래키)*/
	FOREIGN KEY(hakkwa_code) REFERENCES hakkwa(code) ON UPDATE CASCADE ON DELETE RESTRICT 
);
CREATE TABLE student (
	idx INT NOT NULL auto_increment PRIMARY KEY, /*학생 고유번호*/
	name VARCHAR(20) NOT NULL, /*학생 이름*/
	age INT DEFAULT 20, /*학생 나이*/
	hakkwa_code INT, /*학과코드(외래키)*/
	FOREIGN KEY(hakkwa_code) REFERENCES hakkwa(code) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO student VALUES (DEFAULT, '홍길동', DEFAULT, 101);
INSERT INTO student VALUES (DEFAULT, '김말숙', 22, 102);
INSERT INTO student VALUES (DEFAULT, '이기자', 32, 102);
INSERT INTO student VALUES (DEFAULT, '소나무', 28, 103);
INSERT INTO student VALUES (DEFAULT, '오하늘', 24, 104);
INSERT INTO student VALUES (DEFAULT, '김연아', DEFAULT, 104);
INSERT INTO student VALUES (DEFAULT, '강감찬', 20, 103);
INSERT INTO student VALUES (DEFAULT, '홍길순', 19, 104);
INSERT INTO student VALUES (DEFAULT, '고인돌', 18, 105);
INSERT INTO student VALUES (DEFAULT, '손흥민', DEFAULT, 105);
INSERT INTO student VALUES (DEFAULT, '아톰맨', 27, 105);
INSERT INTO student VALUES (DEFAULT, '비톰맨', 31, 106);

SELECT * FROM hakkwa;
SELECT * FROM student;

SELECT * FROM hakkwa WHERE code=106;
SELECT * FROM student WHERE hakkwa_code=106;
SELECT * FROM student WHERE hakkwa_code=101;
SELECT * FROM student WHERE hakkwa_code=108;
SELECT * FROM student WHERE hakkwa_code=102;

DELETE FROM hakkwa WHERE code = 101;
DELETE FROM hakkwa WHERE code = 107;
DELETE FROM hakkwa WHERE code = 106;
DELETE FROM hakkwa WHERE code = 102;

UPDATE student SET hakkwa_code=101 WHERE name='비톰맨';
UPDATE hakkwa SET code=108 WHERE code=101;

/*현재 시스템(DBMS)에 존재하는 TABLE의 모든 제약조건 확인*/
SELECT * FROM information_schema.TABLE_CONSTRAINTS;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA='springgroup';

/*springgroup 데이터베이스의 student 테이블의 foreign key를 삭제.*/
ALTER TABLE student DROP FOREIGN KEY student_ibfk_1

/*--------------------------------------------------------------------------------*/

/*활용(join) 설정*/
/*일반 join: Inner Join = 내부 join = 교집합*/
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code;
SELECT * FROM hakkwa INNER JOIN student ON hakkwa.code = student.hakkwa_code ORDER BY hakkwa.name;
SELECT * FROM hakkwa INNER JOIN student WHERE hakkwa.code = student.hakkwa_code ORDER BY hakkwa.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT * FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code WHERE h.code = 105 ORDER BY h.name;
SELECT h.*, s.name FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT h.*, s.name AS 성명 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;
SELECT h.*, s.name AS 성명, s.age AS 나이 FROM hakkwa h INNER JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

/*Left Join, Left Outer Join: 왼쪽 테이블을 기준으로 오른쪽 테이블을 조합한다.*/
SELECT * FROM hakkwa h LEFT JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

/*Right Join, Right Outer Join: 오른쪽 테이블을 기준으로 왼쪽 테이블을 조합한다.*/
SELECT * FROM hakkwa h RIGHT JOIN student s ON h.code = s.hakkwa_code ORDER BY h.name;

/*Cross Join: 곱집합*/
SELECT * FROM hakkwa, student;

/*응용*/
SELECT * FROM hakkwa h, student s WHERE h.code = s.hakkwa_code; 
SELECT * FROM hakkwa h, student s WHERE h.code = s.hakkwa_code AND h.code = 105;

/*합집합: 완전외부조인(FULL Outer Join) MySQL에서는 지원하지 않는다.*/
/* SELECT * FROM hakkwa h FULL OUTER JOIN student s; 쓴다면 이렇게 쓴다.*/
/*MySQL에서는 UNION을 이용해 합집함의 개념으로 사용한다. Merge(병합)*/
/*해당 테이블의 필드명이 같으면 병합테이블로 만들어주지만, 필드명이 다를 경우, 왼쪽 테이블 기준으로 처리한다.*/
/*양 테이블의 column수가 맞아야한다.*/
SELECT * FROM hakkwa UNION SELECT hakkwa_code, name FROM student;
SELECT code FROM hakkwa UNION SELECT hakkwa_code FROM student;
SELECT code AS 코드 FROM hakkwa UNION SELECT hakkwa_code FROM student; /*왼쪽 기준이기 때문에 오른쪽에 AS를 줘도 바뀌지 않는다.*/
SELECT * FROM hakkwa UNION ALL SELECT hakkwa_code, name FROM student; /*중복자료까지 전부 출력*/
