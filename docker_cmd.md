## Docker CLI 명령어

Docker 실습 프로젝트 리포: https://github.com/IndieGameMaker/kant_docker

- Window 환경 설정
  sed -i '/PATHCONV\|CONV_EXCL/d' ~/.bashrc
  echo 'export MSYS_NO_PATHCONV=1' >> ~/.bashrc
  echo 'export MSYS2_ARG_CONV_EXCL="\*"' >> ~/.bashrc
  source ~/.bashrc

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

## Docker Volume

```sh
$ docker volume ls # 조회
$ docker volume create [볼륨명] # 생성
$ docker volume inspect [볼륨명] # 상세 정보 조회
```

- 컨테이너 생성시 볼륨을 연결하기

```sh
docker run -d --name my-pg -e POSTGRES_PASSWORD=admin1234 -p 5432:5432 -v pgdata:/var/lib/oistgresql postgres:18
```

## Docker Compose

- Docker Compose YAML 양식

```
services:                 # 실행할 컨테이너(서비스) 목록 — 필수
  서비스이름:              # 예: db, web (직접 정하는 이름)
    image: 이미지:태그      # 사용할 이미지
    container_name: 이름   # 컨테이너 이름 (생략 시 자동 생성)
    environment:           # 환경 변수 (-e)
      KEY: value
    ports:                 # 포트 연결 (-p) — 문자열로 감싸는 것을 권장
      - "호스트:컨테이너"
    volumes:               # 볼륨 연결 (-v)
      - 볼륨이름:컨테이너경로

volumes:                  # 사용할 볼륨 선언 (최상위)
  볼륨이름:
```

Mac 설정

```
COMPOSE_PATH="$(brew --prefix docker-compose)/lib/docker/cli-plugins/docker-compose"
mkdir -p ~/.docker/cli-plugins
rm -f ~/.docker/cli-plugins/docker-compose
ln -s "$COMPOSE_PATH" ~/.docker/cli-plugins/docker-compose
ls -l "$COMPOSE_PATH"
ls -l ~/.docker/cli-plugins/docker-compose
docker compose version
```

```sh
$ docker compose config
$ docker compose version
$ docker compose up -d
$ docker compose down
```

compose.yaml 파일을 기준으로 생성/삭제

datagrip 사용
