# mecab-ko-docker

Mecab Docker 이미지를 생성하기 위한 Dockerfile들입니다.

Mecab-ko의 설치는 https://bitbucket.org/eunjeon/mecab-ko-dic/src/master 를 참고하였습니다.

## Build

```sh
$ docker build -t cosmoquester/mecab .
$ docker build -t cosmoquester/mecab-python -f Dockerfile.python  . 
```

- 사용자 사전 추가를 위한 툴은 `/etc/mecab-ko-dic`에 들어있습니다.
