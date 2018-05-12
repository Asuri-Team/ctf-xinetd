# ctf-xinetd
A docker image to hold pwn challenges in ctf war

# Introduction
This image contains xinetd to provide remote access services for pwn challenges, and also contains tcpdump to dump network traffics into pcap file.

Notice: we use a modified xinetd version from our team to restrict syscalls called by xinetd services.

# Usage
Please check Dockerfile.example

# Env Vars
| Key | Default Value | Description |
| --- | ------------- | ----------- |
| TCPDUMP_ENABLE | (empty) | Whether enable tcpdump or not |
| TCPDUMP_DIR | /var/lib/tcpdump | Directory to write dump files (name=capture.pcap) |
| TCPDUMP_SPLIT_SIZE | 10m | Max size of single capture file |
| CTF_PORT | 20000 | Port to capture traffic from |

# CAUTION!
1. Please DO NOT use your own start CMD or entrypoint for this docker image. If you really need to change it, please check [phusion/baseimage](https://github.com/phusion/baseimage-docker) for more details.

