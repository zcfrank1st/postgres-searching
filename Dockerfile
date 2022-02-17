FROM postgres:14.2

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list \
    && rm -Rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get install -y wget \
    && apt-get install -y bzip2 \
    && apt-get install -y build-essential \
    && apt-get install -y git \
    && apt-get install -y postgresql-server-dev-14

RUN cd /opt \
    && wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2 \
    && tar xvjf scws-1.2.3.tar.bz2 \
    && cd /opt/scws-1.2.3 \
    && ./configure \
    && make install \
    && cd /opt \
    && git clone https://gitclone.com/github.com/amutu/zhparser.git \
    && cd zhparser\
    && make \
    && make install

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdata.sh /docker-entrypoint-initdb.d/initdata.sh