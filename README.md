# ctf-xinetd
A docker image to hold pwn challenges in ctf war

## Introduction
This image contains xinetd to provide remote access services for pwn challenges, and also contains tcpdump to dump network traffics into pcap file.

Notice: 
1. we use a modified [xinetd](https://github.com/Asuri-Team/xinetd-kafel) version from our team to restrict syscalls called by xinetd services. ~~In order to use this feature, docker container must run with `--privileged` option.~~ No more `--privileged` needed now.
2. This docker image will produce docker volume each you create container from it. Better specify one using `-v your_dump_volume:/var/lib/tcpdump`.

## Usage
Please check Dockerfile.example

## Env Vars
| Key | Default Value | Description |
| --- | ------------- | ----------- |
| TCPDUMP_ENABLE | (empty) | Whether enable tcpdump or not |
| TCPDUMP_DIR | /var/lib/tcpdump | Directory to write dump files (name=capture-$timestr.pcap) |
| TCPDUMP_ROTATE_SEC | 600 | Rotate time interval of capture file |
| CTF_PORT | 20000 | Port to capture traffic from |

## CAUTION!
1. Please DO NOT use your own start CMD or entrypoint for this docker image. If you really need to change it, please check [phusion/baseimage](https://github.com/phusion/baseimage-docker) for more details.

