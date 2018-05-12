From asuri/ctf-xinetd:latest

# Clean up example file
RUN rm -fr /etc/xinetd.d/*

# Add prerequest files
RUN useradd -U -m ctf && mkdir -p /home/ctf
ADD ctf.bin /home/ctf/
ADD flag.txt /home/ctf/flag.txt
ADD ctf.xinetd.example /etc/xinetd.d/ctf

# Ensure file privileges are correct
RUN chmod 755 /home/ctf/ctf.bin \
    && chmod 444 /home/ctf/flag.txt

# Clean up temp files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV CTF_PORT 20000
EXPOSE 20000
