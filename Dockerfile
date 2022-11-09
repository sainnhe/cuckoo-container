FROM docker.io/library/ubuntu:bionic

# Host
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    apt-transport-https \
    ca-certificates \
    python \
    python-pip \
    python-dev \
    libffi-dev \
    libssl-dev \
    python-virtualenv \
    python-setuptools \
    libjpeg-dev \
    zlib1g-dev \
    swig \
    mongodb \
    postgresql \
    libpq-dev \
    qemu-kvm \
    libvirt-bin \
    ubuntu-vm-builder \
    bridge-utils \
    python-libvirt \
    tcpdump \
    volatility \
    volatility-tools \
    swig \
    python-m2crypto \
    libguac-client-rdp0 \
    libguac-client-vnc0 \
    libguac-client-ssh0 \
    guacd

RUN adduser --disabled-password --gecos "" cuckoo \
    && groupadd pcap \
    && usermod -a -G pcap cuckoo \
    && chgrp pcap /usr/sbin/tcpdump \
    && setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump \
    && usermod -a -G libvirt cuckoo \
    && usermod -a -G libvirt-qemu cuckoo \
    && usermod -a -G libvirt-dnsmasq cuckoo

RUN pip install -U pip setuptools \
    && pip install -U cuckoo

RUN cuckoo \
    && sed -i \
    's/version_check = yes/version_check = no/' \
    /root/.cuckoo/conf/cuckoo.conf

# Guest
RUN apt install -y \
    uml-utilities \
    bridge-utils

CMD ["bash"]
WORKDIR /root/.cuckoo