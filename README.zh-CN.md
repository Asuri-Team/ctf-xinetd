# ctf-xinetd
一个用于CTF线上赛运行PWN题目的Docker镜像

# 简介
这个镜像中包括了运行PWN题目的xinetd服务和用于记录流量的tcpdump服务。

注意: 我们使用了修改版的[xinetd](https://github.com/Asuri-Team/xinetd-kafel). 在这个版本的xinetd中，可以很方便的限制服务所可以调用的系统调用。

# 用法
查看Dockerfile.example了解更多

# 环境变量
| Key | Default Value | Description |
| --- | ------------- | ----------- |
| TCPDUMP_ENABLE | (empty) | 是否启用tcpdump |
| TCPDUMP_DIR | /var/lib/tcpdump | 记录流量的文件夹 (文件名=capture.pcap) |
| TCPDUMP_SPLIT_SIZE | 10m | 流量文件的分割大小 |
| CTF_PORT | 20000 | 记录流量的端口 |

# 注意!
1. 一定不要修改本image的ENTRYPOINT或CWD, 如果你确定你在做什么，请阅读 [phusion/baseimage](https://github.com/phusion/baseimage-docker) 的文档获取更多信息。

