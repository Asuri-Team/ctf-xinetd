FROM phusion/baseimage:0.9.22

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y xinetd tcpdump \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm /etc/xinetd.d/*
    
ADD banner_fail /etc/banner_fail
RUN mkdir -p /etc/service/xinetd && mkdir -p /etc/service/tcpdump
ADD xinetd.sh /etc/service/xinetd/run
ADD tcpdump.sh /etc/service/tcpdump/run
RUN chmod +x /etc/service/xinetd/run && chmod +x /etc/service/tcpdump/run

ADD ctf.xinetd.example /etc/xinetd.d/ctf

