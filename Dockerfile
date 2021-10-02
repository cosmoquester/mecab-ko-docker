FROM ubuntu:18.04 AS builder

RUN apt update && apt install -y gcc g++ make autoconf automake

COPY resources /tmp/resources

WORKDIR /tmp/resources

RUN tar zxvf mecab-0.996-ko-0.9.2.tar.gz \
    && cd mecab-0.996-ko-0.9.2 \
    && ./configure \
    && make \
    && make check \
    && make install

RUN ldconfig

RUN tar zxvf mecab-ko-dic-2.1.1-20180720.tar.gz \
    && cd mecab-ko-dic-2.1.1-20180720 \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install

FROM ubuntu:18.04

COPY --from=builder /usr/local/etc/mecabrc /usr/local/etc/mecabrc
COPY --from=builder /usr/local/lib /usr/local/lib
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /tmp/resources/mecab-ko-dic-2.1.1-20180720 /etc/mecab-ko-dic
RUN ldconfig
