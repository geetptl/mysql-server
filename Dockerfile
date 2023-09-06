FROM alpine:latest

RUN apk update

RUN apk add build-base

RUN apk add cmake

RUN apk add libressl-dev

RUN apk add ncurses-dev

RUN wget -P /tmp/ https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz

RUN tar -xf /tmp/boost_1_77_0.tar.gz --directory /usr/local/

RUN apk add bison

RUN apk add libtirpc-dev

RUN apk add rpcgen

RUN mkdir bld

RUN echo 'cd /bld && cmake ../mysql-source/ -DWITH_BOOST=/usr/local/boost_1_77_0 -DWITH_SSL=system' > /build.sh

RUN chmod +x /build.sh
