#!/bin/sh

if [ -z $TCPDUMP_ENABLE ]; then
    echo "Set TCPDUMP_ENABLE to enable packet capture."
    sv stop tcpdump
    sleep 1d
    exit 0
fi

TCPDUMP_DIR=/var/lib/tcpdump

if [ -z $TCPDUMP_ROTATE_SEC ]; then
    TCPDUMP_ROTATE_SEC=600
fi

if [ -z $CTF_PORT ]; then
    CTF_PORT=20000
fi

TCPDUMP_FILENAME="capture-%F-%H-%M-%S.pcap"

mkdir -p $TCPDUMP_DIR
echo "TCPDUMP: capture port: $CTF_PORT, rotate interval: ${TCPDUMP_ROTATE_SEC}s, capture filename: capture-\$time.pcap"
exec /usr/sbin/tcpdump -i eth0 port $CTF_PORT -U -w $TCPDUMP_DIR/$TCPDUMP_FILENAME -G $TCPDUMP_ROTATE_SEC


