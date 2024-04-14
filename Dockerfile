FROM debian:12.5

ADD docker.resolv.conf /etc/resolv.conf
RUN apt update && apt upgrade -y 
RUN apt install -y apt-transport-https ca-certificates
RUN sed -i 's/http/https/g' /etc/apt/sources.list.d/debian.sources
RUN apt update && apt upgrade -y 
RUN apt install -y vim sudo git ssh ansible python3-apt

RUN groupadd test
RUN useradd -rm -d /home/test -s /bin/bash -g test -G sudo -u 1001 test
RUN echo 'test:test' | chpasswd
USER test

WORKDIR /home/test

ENTRYPOINT [ "bash" ]
