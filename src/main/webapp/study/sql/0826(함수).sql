show tables;

SELECT * FROM insa;

CREATE TABLE sungjuk (
	idx INT NOT NULL auto_increment PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	kor INT,
	eng INT,
	mat INT
);

INSERT INTO sungjuk VALUES(DEFAULT, '홍길동', 100, 90, 80);
INSERT INTO sungjuk VALUES(DEFAULT, '김말숙', 90, 100, 90);
INSERT INTO sungjuk VALUES(DEFAULT, '이기자', 70, 50, 100);
INSERT INTO sungjuk VALUES(DEFAULT, '오하늘', 90, 90, 70);
INSERT INTO sungjuk VALUES(DEFAULT, '김연아', 50, 70, 80);
INSERT INTO sungjuk VALUES(DEFAULT, '강감찬', 60, 80, 50);
INSERT INTO sungjuk VALUES(DEFAULT, '김 솔', 60, 80, 50);

/*집계합수(갯수:count(), sum(), avg())*/
SELECT count(idx) FROM sungjuk;
SELECT sum(kor), sum(eng), sum(mat) FROM sungjuk;
SELECT avg(kor), avg(eng), avg(mat) FROM sungjuk;

SELECT count(kor) AS korCnt, sum(kor) AS korSum, avg(kor) AS korAvg FROM sungjuk;

/*최대(max), 최소(min)*/
SELECT max(kor) AS korMax, min(kor) AS korMin FROM sungjuk;

/*문자열 결합(연결): CONCAT()*/
SELECT concat(max(kor),'점') AS korMax, concat(min(kor),'점') AS korMin FROM sungjuk;

/*출력용 형식(format)지정: format()*/
SELECT format(avg(kor),1), format(avg(eng),1), format(avg(mat),1) FROM sungjuk;
SELECT concat(format(avg(kor),1),'점'), format(avg(eng),1), format(avg(mat),1) FROM sungjuk;
SELECT '1234567', format('1234567', 0);

/*수치함수*/
SELECT 123.456 AS su;

/*반올림: round()*/
SELECT 123.456 AS su, round(123.456) AS res;
SELECT 123.456 AS su, round(123.456,1) AS res;
SELECT 123.456 AS su, round(123.456,2) AS res;
SELECT 129.456 AS su, round(129.456,-1) AS res;

/*버림(절작): truncate()*/
SELECT 123.456 AS su, truncate(123.456,0) AS res;
SELECT 123.456 AS su, truncate(123.456,1) AS res;
SELECT 123.456 AS su, truncate(123.456,2) AS res;
SELECT 129.456 AS su, truncate(129.456,-1) AS res;

/*무조건 올림:ceil(), 무조건 내림:floor()*/
SELECT 123.456 AS su, ceil(123.456) AS res;
SELECT 123.456 AS su, floor(123.456) AS res;

/*나머지: mod()*/
SELECT mod(10,3) AS na;

/*거듭제곱(지수승): power()*/
SELECT power(2,5) AS 2의5승;

/*숫자 리스트에서 가장 큰 값(greatest), 가장 작은 값(least)*/
SELECT greatest(15, 4, 21, 7, 9) AS max;
SELECT least(15, 4, 21, 7, 9) AS min;

/*문자함수*/
/*문자열의 길이: length() - 바이트단위*/
/*영문, 숫자 등 1바이트, 한글 3바이트, 이모지 4바이트*/
SELECT length('seoul');
SELECT length('서울');
SELECT length(name), length(kor) FROM sungjuk;

/*실제 문자갯수로 변환: char_length()*/
SELECT char_length('seoul');
SELECT char_length('서울');
SELECT char_length(name), char_length(kor) FROM sungjuk;

/*대문자(upper), 소문자(lower)*/
SELECT 'seOUL', upper('seOUL'), lower('seOUL');

/*문자열 발췌: substring(데이터, 시작위치(1~), 발퀘갯수)*/
SELECT '1234567890', substring('1234567890', 1, 5);
SELECT '1234567890', substring('1234567890', 2, 5);
SELECT '1234567890', substring('1234567890', -1, 1);
SELECT now(), substring(now(), 1, 10);
SELECT now(), substring(now(), 12, 20);

/*특정 문자열 유무: instr()*/
/*있으면 위치를, 없으면 0을 반환*/
SELECT 'Welcom to Korea', instr('Welcom to Korea', 'o');
SELECT 'Welcom to Korea', instr('Welcom to Korea', 'z');
SELECT 'Welcom to Korea', instr('Welcom to Korea', ' ');

/*특정 문자를 기준으로 앞을 꺼내고, 특정문자를 포함한 뒤를 자른다.*/
SELECT substring_index('ab.cd.efg.h.ijkl.mn', '.', 1);
SELECT substring_index('ab.cd.efg.h.ijkl.mn', '.', 2);
SELECT substring_index('ab.cd.efg.h.ijkl.mn', '.', 3);

/*왼쪽(오른쪽)부터 지정길이만큼 문자 추출: left(), right(), mid()*/
SELECT 'abcdefg', left('abcdefg', 3), right('abcdefg', 3), mid('abcdefg', 3, 2);

/*공백지우기: trim(), ltrim(), rtrim()*/
SELECT ' s e o u l ', trim(' s e o u l '), ltrim(' s e o u l '), rtrim(' s e o u l ');

/*치환: replace()*/
SELECT 'Welcom to Korea', replace('Welcom to Korea', ' ', '_');

/*채우기: insert()*/
SELECT '가나다라마바사아', insert('가나다라마바사아', 2, 3, '***');
SELECT '가나다라마바사아', insert('가나다라마바사아', 2, 3, '*');

/*반복: repeat()*/
SELECT repeat('*', 10);
SELECT repeat('abc', 10);
SELECT repeat('abc/', 10);

/*날짜함수*/
SELECT now();
SELECT year(now()), month(now()), day(now());

SELECT name, ipsail FROM insa;
SELECT name, ipsail, month(ipsail), day(ipsail) FROM insa;
SELECT name, concat(year(ipsail),'년', month(ipsail),'월', day(ipsail),'일') FROM insa;
SELECT name, concat(year(ipsail),'-', month(ipsail),'-', day(ipsail)) FROM insa;

/*요일: 일요일(0), 월요일(1)*/
/*날짜 포맷 형식(date_format): y(년도 2자리), Y(년도 4자리), m:(월 두자리), M(월 문자로), d(일)*/
SELECT now();
SELECT date_format(now(), '%y-%c-%e');
SELECT date_format(now(), '%Y-%m-%d');
SELECT date_format(now(), '%y년 %c월 %e일');
SELECT date_format(now(), '%Y년 %m월 %d일');

SELECT ipsail, date_format(ipsail, '%y년 %c월 %e일') FROM insa;
SELECT ipsail, date_format(ipsail, '%Y년 %m월 %d일') FROM insa;

/*날짜연산: date_add(), to_days(), datediff(), timediff()*/
SELECT now(), date_add(now(), interval 1 day);
SELECT now(), date_add(now(), interval -1 day);
SELECT now(), date_add(now(), interval 24 hour);
SELECT now(), date_add(now(), interval 10 hour);
SELECT now(), date_add(now(), interval 1 month);
SELECT now(), date_add(now(), interval 1 year);

SELECT now(), now() - 1;
SELECT now(), to_days(now()) - to_days('2025-8-1');
SELECT name, ipsail, to_days(now()) - to_days(ipsail) AS 입사경과일 FROM insa;

SELECT datediff(now(), '2025-8-1');
SELECT wDate, datediff(now(), wDate) AS 게시글올린시간 FROM board;

SELECT timediff(now(), '2025-8-26 9:20');

/*시간차이(timestampdiff()): 시(hour), 분(minute), 초(second)*/
SELECT timestampdiff(hour, '2025-8-26 9:20', now());
SELECT timestampdiff(minute, '2025-8-26 9:20', now());
SELECT timestampdiff(second, '2025-8-26 9:20', now());

SELECT name, ipsail, timestampdiff(day, ipsail, now()) AS 입사경과시간 FROM insa;

/*마지막 일자 구하기:last_day()*/
SELECT last_day(now());
SELECT last_day('2025-2-5');
SELECT last_day('2024-2-5');