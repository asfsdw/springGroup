SELECT * FROM customers;
SELECT * FROM books;
SELECT * FROM orders;
DROP TABLE customers;
DROP TABLE books;
DROP TABLE orders;

/* 도서 주문관리 프로젝트에 필요한 테이블 설계 */
/* 고객테이블 */
CREATE TABLE customers (
  custid   INT NOT NULL auto_increment PRIMARY KEY,	/* 고객 고유번호 */
  customer VARCHAR(20)  NOT NULL,			/* 고객명 */
  address  VARCHAR(30)  NOT NULL,			/* 고객주소 */
  phone    VARCHAR(15)  NOT NULL			/* 고객 연락처 */
);

/* 책정보 테이블 */
CREATE TABLE books (
  bookid    INT NOT NULL auto_increment  PRIMARY KEY,	/* 책 고유번호 */
  bookname  VARCHAR(30) NOT NULL,			/* 책이름 */
  publisher VARCHAR(20) NOT NULL,			/* 출판사명 */
  price     INT NOT NULL							/* 책가격(정가) */
);

/* 주문 테이블 */
CREATE TABLE orders (
  orderid   INT NOT NULL auto_increment PRIMARY KEY,	/* 주문 고유번호 */
  custid    INT NOT NULL,		/* 고객 고유번호(고객테이블의 고유번호이다.) */
  bookid    INT NOT NULL,		/* 책 고유번호(책테이블의 고유번호이다.) */
  saleprice	INT NOT NULL,		/* 실제 책 구입가격 */
  orderdate TIMESTAMP,			/* 책 주문 날짜 */
  FOREIGN KEY(custid) REFERENCES customers(custid) ON UPDATE RESTRICT,
  FOREIGN KEY(bookid) REFERENCES books(bookid) ON UPDATE RESTRICT
);

/* 자료파일 */
-- customers(고객정보)
INSERT INTO customers VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customers VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customers VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customers VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customers VALUES (5, '박세리', '대한민국 대전',  '001-0011-0012');
INSERT INTO customers VALUES (6, '이순신', '대한민국 아산',  '001-0009-0007');
INSERT INTO customers VALUES (7, '소나무', '대한민국 청주',  '000-1100-0050');

-- books(책정보)
INSERT INTO books VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO books VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO books VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO books VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO books VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO books VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO books VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO books VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO books VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO books VALUES(10, 'Olympic Champions', 'Pearson', 13000);
INSERT INTO books VALUES(11, '가나다', '삼성당', 17500);
INSERT INTO books VALUES(12, '포토샵CS6', '제우미디어', 25000);
INSERT INTO books VALUES(13, '아시안게임 이야기', '스포츠북', 19500);
INSERT INTO books VALUES(14, '우리들 이야기', '우리출판사', 5000);
INSERT INTO books VALUES(15, '서로 사랑하자', '이상미디어', 18000);
INSERT INTO books VALUES(16, '하나된 마음으로', '대한미디어', 21000);
INSERT INTO books VALUES(17, '나눌수 있을때', '나무수', 9000);
INSERT INTO books VALUES(18, '함박눈 내리는날', '이상미디어', 15000);
INSERT INTO books VALUES(19, '나보다 축구를', '굿스포츠', 23000);
INSERT INTO books VALUES(20, '시작했을때 한번더', '삼성당', 19000);

-- orders(주문정보) 데이터 생성
INSERT INTO orders VALUES (1, 1, 1, 6000, '2019-08-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-09-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2022-11-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 19000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 11000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2021-07-08');
INSERT INTO orders VALUES (9, 2, 10, 9000, '2017-05-09');
INSERT INTO orders VALUES (10, 3, 18, 13000, '2024-10-11');
INSERT INTO orders VALUES (11, 7, 15, 15000, '2025-06-17');
INSERT INTO orders VALUES (12, 7, 20, 16000, '2024-12-19');
INSERT INTO orders VALUES (13, 3, 19, 23000, '2025-06-30');
INSERT INTO orders VALUES (14, 1, 16, 17000, '2024-11-21');
INSERT INTO orders VALUES (15, 4, 15, 13000, '2025-05-12');
INSERT INTO orders VALUES (16, 7, 10, 13000, '2-09-24');
INSERT INTO orders VALUES (17, 1, 12, 23000, '2025-02-26');
INSERT INTO orders VALUES (18, 2, 11, 13000, '2024-09-16');
INSERT INTO orders VALUES (19, 4, 20, 13000, '2025-03-20');
INSERT INTO orders VALUES (20, 4, 15, 20000, '2025-04-26');
INSERT INTO orders VALUES (21, 7, 20, 17000, '2025-08-26');
INSERT INTO orders VALUES (22, 4, 17, 8000, '2025-08-26');

/*-------------------------------------------------------------------*/

SELECT * FROM orders;
SELECT * FROM orders ORDER BY orderdate DESC;

/*1번 이상 구매한 책들의 정보(구매 날짜 내림차순), 중복된 책은 1번만 출력.*/
SELECT DISTINCT bookid FROM orders ORDER BY orderdate DESC;
SELECT DISTINCT bookid, orderid, orderdate FROM orders ORDER BY orderdate DESC;

SELECT * FROM orders GROUP BY bookid;
SELECT * FROM orders GROUP BY bookid ORDER BY orderdate DESC;

/*1번 이상 구매한 사람의 정보를 구매테잉블에서 확인*/
SELECT * FROM orders GROUP BY custid;

/*1번 이상 구매한 책의 정보(책제목 출력)*/
SELECT * FROM orders o, books b WHERE o.bookid = b.bookid;
SELECT * FROM orders o INNER JOIN books b ON o.bookid = b.bookid;
SELECT orders.*, books.bookname FROM orders INNER JOIN books ON orders.bookid = books.bookid;
SELECT o.*, b.bookname FROM orders o, books b WHERE o.bookid = b.bookid;

/*1번 이상 구매한 책들의 정보(주분번호, 주문날짜, 책이름, 정가, 실제구매가) 주문일자 내림차순*/
SELECT o.orderid,o.orderdate,b.bookname,b.price,o.saleprice FROM orders o, books b WHERE o.bookid = b.bookid ORDER BY orderdate DESC;

/*1번 이상 구매한 책들의 정보(주분번호, 주문날짜, 책이름, 정가, 실제구매가) 주문일자 내림차순(최근에 구매한 책 3권만 출력)*/
SELECT o.orderid,o.orderdate,b.bookname,b.price,o.saleprice FROM orders o, books b WHERE o.bookid = b.bookid ORDER BY orderdate DESC limit 3;

/*1번 이상 구매한 책들의 정보(주분번호, 주문날짜, 책이름, 정가, 실제구매가) 주문일자 내림차순(중복된 책은 1번만 출력)*/
SELECT o.orderid,o.orderdate,b.bookname,b.price,o.saleprice
	FROM orders o, books b
	WHERE o.bookid = b.bookid
	GROUP BY o.bookid
	ORDER BY orderdate DESC;

/*책을 구입한 사람의 이름, 책의 이름, 구매가격, 구매날짜*/
SELECT c.customer, b.bookname, o.saleprice, o.orderdate
	FROM orders o, customers c, books b
	WHERE o.bookid = b.bookid AND o.custid = c.custid
	ORDER BY orderdate DESC;
	
/*책을 구입한 사람의 이름, 책의 이름, 구매가격, 구매날짜(구매자가 구매한 책의 권수와 함께 출력)*/
SELECT c.customer, count(o.custid), b.bookname, o.saleprice, o.orderdate
	FROM orders o, customers c, books b
	WHERE o.bookid = b.bookid AND o.custid = c.custid
	GROUP BY c.customer
	ORDER BY orderdate DESC;
	
/*책을 구입한 사람의 이름, 책의 이름, 구매가격, 구매날짜(구매자가 구매한 책의 권수, 총 구매 금액, 구매 금액 평균 함께 출력)*/
SELECT c.customer, count(o.custid), b.bookname, format(o.saleprice,0), format(sum(o.saleprice),0), format(avg(o.saleprice),0), o.orderdate
	FROM orders o, customers c, books b
	WHERE o.bookid = b.bookid AND o.custid = c.custid
	GROUP BY c.customer
	ORDER BY orderdate DESC;

/*책을 구입한 사람의 이름, 책의 이름, 구매가격, 구매날짜(구매자가 구매한 책의 권수, 총 구매 금액, 구매 금액 평균 함께 출력) 4권이상 산 사람만 출력*/
SELECT c.customer, count(o.custid), b.bookname, format(o.saleprice,0), format(sum(o.saleprice),0), format(avg(o.saleprice),0), o.orderdate
	FROM orders o, customers c, books b
	WHERE o.bookid = b.bookid AND o.custid = c.custid
	GROUP BY c.customer HAVING count(o.custid) >= 4
	ORDER BY orderdate DESC;
	
/*각 고객별로 주문한 도서의 총 판매액을 출력하되, 고객 이름순으로 출력하시오.*/
SELECT c.customer, format(sum(o.saleprice),0)
	FROM orders o, customers c
	WHERE o.custid = c.custid
	GROUP BY c.customer
	ORDER BY c.customer;
	
/*2025년 가장 많이 팔린 책의 이름, 출판사명, 말린 수 출력*/
SELECT b.bookname, b.publisher, count(o.bookid)
	FROM orders o, books b
	WHERE o.bookid = b.bookid AND year(orderdate) = '2025'
	GROUP BY b.bookname
	ORDER BY count(o.bookid) DESC;
	
/*-------------------------------------------------------------------*/

/*서브쿼리(sub Query): 하나의 SQL문장 안에 또다른 SQL문장을 포함시키는 것.*/
/*
 	서브쿼리는 괄호로 묶는다.
 	1.SELECT 컬럼명, (SELECT……) FROM 테이블명
 	2.SELECT 컬럼명, FROM (SELECT……)
 	3.SELECT 컬럼명, 테이블명 WHERE 필드명 = (SELECT……)
*/
/*도서를 1번이라도 구매한 적이 있는 고객명을 출력하시오.*/
SELECT c.customer, count(o.orderid) FROM orders o, customers c WHERE o.custid = c.custid GROUP BY c.customer;
SELECT customer FROM customers WHERE custid IN (SELECT custid FROM orders);

/*구매한 도서 중, 가장 비싼 도서명, 구매자 출력*/
SELECT saleprice FROM orders ORDER BY saleprice DESC limit 1;
SELECT (SELECT bookname FROM books WHERE bookid = orders.bookid) AS bookname, saleprice FROM orders ORDER BY saleprice DESC limit 1;

/*대한미디어 혹은 삼성당에서 구매한 고객의 이름*/
SELECT customer FROM customers;
SELECT publisher FROM books WHERE publisher = '대한미디어' OR publisher = '삼성당';

SELECT customer FROM customers
	WHERE custid IN (SELECT custid FROM orders
	WHERE orders.bookid IN (SELECT bookid FROM books WHERE publisher = '대한미디어' OR publisher = '삼성당'));
	
/*손흥민이 구매한 도서의 이름, 정가, 구매가격, 정가와 판매가격의 차를 출력.*/
SELECT c.customer AS 구매자, b.bookname AS 책이름, b.price AS 책가격, o.saleprice AS 구매가격, b.price - o.saleprice AS 할인액
	FROM orders o, books b, customers c
	WHERE o.bookid = b.bookid AND o.custid = c.custid AND c.customer = '손흥민';

/*고객의 이름과 고객별 구매액 합계 출력.*/
SELECT c.customer AS 구매자, sum(o.saleprice) AS 총구매액
	FROM orders o, customers c
	WHERE o.custid = c.custid
	GROUP BY c.customer;
	
/*도서의 가격과 판매가격의 차이가 가장 많은 주문 출력.*/
SELECT o.orderid AS 주문번호 FROM orders o, books b WHERE o.bookid = b.bookid ORDER BY b.price- o.saleprice DESC limit 1;

/*고객별 평균 구매액 출력.*/
SELECT c.customer AS 구매자, format(avg(o.saleprice),0) AS 평균구매액 FROM orders o, customers c WHERE o.custid = c.custid GROUP BY c.customer;

/*2025년 5월 1일 이후부터 최근까지 판매된 책의 이름과 판매금액 출력.*/
SELECT b.bookname AS 책이름, sum(o.saleprice) AS 총판매금액, count(o.bookid) AS 판매갯수, o.orderdate AS 판매날짜
	FROM orders o, books b
	WHERE o.bookid = b.bookid AND concat(year(o.orderdate),'-',month(o.orderdate),'-',day(o.orderdate)) >= '2025-5-1'
	GROUP BY b.bookname
	ORDER BY count(o.bookid) DESC;