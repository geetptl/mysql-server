FROM ubuntu:22.04

RUN apt update

RUN apt -y install gcc g++ make libc-dev cmake libssl-dev libtirpc-dev libncurses5-dev wget pkg-config bison

RUN wget -P /tmp/ https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz

RUN tar -xf /tmp/boost_1_77_0.tar.gz --directory /usr/local/

RUN mkdir build

RUN echo 'cd /build && cmake ../mysql-source/ -DWITH_BOOST=/usr/local/boost_1_77_0 -DWITH_SSL=system && make install' > /install.sh

RUN chmod +x /install.sh

