-- 1. 데이터베이스 생성
DROP DATABASE IF EXISTS practice_db; -- practice_db이라는 데이터 베이스가 존재하면 삭제

CREATE DATABASE practice_db;

-- 2. 새로 만든 데이터 베이스에 접속 (특정 DB를 사용하겠다.)
\c practice_db

-- 3. 상품 테이블 생성
CREATE TABLE players
(
    -- 필드(행 이름) 타입 null 여부
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    uniform_num INT NOT NULL
);

-- 4. 상품 초기 데이터 입력
INSERT INTO players (name, uniform_num) VALUES
('김민우', 23),
('김지현', 77),
('이상민', 92);
