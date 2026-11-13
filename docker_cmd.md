## Docker CLI 명령어

### 컨테이너 실행(구동)/올린다/로드한다
```sh
docker run -d --name my-pg -e POSTGRES_PASSWORD=admin1234 -p 5432:5432 postgres:18

docker run -d --name my-pg \
-e POSTGRES_PASSWORD=admin1234 \
-p 5432:5432 postgres:18
```

### 컨테이너 목록 조회
```sh
docker ps
```

### 정지된 컨테이너 목록 조회
```sh
docker ps -a
```

### 외부 SQL 파일을 도커 컨테이너 내부로 복사
```sh
docker cp kant_shop.sql my-pg:/tmp/kant_shop.sql
```

- 1번째 방법
```sh
docker exec -it my-pg psql -U postgres -f //tmp/kant_shop.sql
```
-f 파일을 복사해서 실행한다


- 2번째 방법
```sh
docker exec -i my-pg psql -U postgres < kant_shop.sql
```

### 데이터베이스를 선택(지정) 접속
```sh
docker exec -it my-pg psql -U postgres -d kant_shop
docker exec -it my-pg psql -U postgres -d kant_shop -c "SELECT * FROM product" # 바로 조회
```

---

## 도커 볼륨
```sh
$ docker volume ls # 조회
$ docker volume create [볼륨명] # 생성
$ docker volume inspect [볼륨명] # 상세 정보 조회
```

- 컨테이너 생성시 볼륨을 연결하기
```sh
docker run -d --name my-pg -e POSTGRES_PASSWORD=admin1234 -p 5432:5432 -v pgdata:/var/lib/oistgresql postgres:18
```