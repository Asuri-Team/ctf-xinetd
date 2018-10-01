FROM phusion/baseimage:0.9.22 as build-stage

WORKDIR /opt

RUN apt-get update && apt-get install -y wget bison flex build-essential unzip \
    && apt-get build-dep -y xinetd && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  


RUN wget https://github.com/google/kafel/archive/master.zip && unzip master.zip && rm master.zip && mv kafel-master kafel && \
    cd kafel && make 
    
RUN wget https://github.com/Asuri-Team/xinetd-kafel/archive/master.zip && unzip master.zip && rm master.zip && mv xinetd-kafel-master xinetd && \
    cd xinetd && ./configure --prefix=/usr --with-kafel=/opt/kafel --with-loadavg --with-libwrap && make 



FROM phusion/baseimage:0.9.22
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y --no-install-recommends wget netbase tcpdump xinetd && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/xinetd.d/*

COPY --from=build-stage /opt/xinetd/xinetd/xinetd /usr/sbin/xinetd


ADD xinetd.conf /etc/xinetd.conf
ADD pwn.kafel /etc/pwn.kafel
ADD banner_fail /etc/banner_fail
RUN mkdir -p /etc/service/xinetd && mkdir -p /etc/service/tcpdump
ADD xinetd.sh /etc/service/xinetd/run
ADD tcpdump.sh /etc/service/tcpdump/run
RUN chmod +x /etc/service/xinetd/run && chmod +x /etc/service/tcpdump/run

ADD ctf.xinetd.example /etc/xinetd.d/ctf

VOLUME /var/lib/tcpdump
