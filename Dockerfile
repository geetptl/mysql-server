FROM alpine:latest

RUN apk update

RUN apk add binutils file gcc g++ make libc-dev fortify-headers patch cmake libressl-dev ncurses-dev bison libtirpc-dev rpcgen

RUN wget -P /tmp/ https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz

RUN tar -xf /tmp/boost_1_77_0.tar.gz --directory /usr/local/

RUN mkdir bld

RUN echo 'cd /bld && cmake ../mysql-source/ -DWITH_BOOST=/usr/local/boost_1_77_0 -DWITH_SSL=system' > /build.sh

RUN chmod +x /build.sh
