#!/bin/sh

if [ -z $TCPDUMP_ENABLE ]; then
    echo "Set TCPDUMP_ENABLE to enable packet capture."
    sleep 1d
    exit 0
fi

if [ -z $TCPDUMP_DIR ]; then
    TCPDUMP_DIR=/var/lib/tcpdump
fi

if [ -z $TCPDUMP_SPLIT_SIZE ]; then
    TCPDUMP_SPLIT_SIZE=10m
fi

if [ -z $CTF_PORT ]; then
    CTF_PORT=20000
fi

mkdir -p $TCPDUMP_DIR
echo "TCPDUMP: capture port: $CTF_PORT, split size: $TCPDUMP_SPLIT_SIZE"
exec /usr/sbin/tcpdump -i eth0 port $CTF_PORT -w $TCPDUMP_DIR/capture.pcap -C $TCPDUMP_SPLIT_SIZE


