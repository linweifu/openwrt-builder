FROM ubuntu

ENV OPENWRT_VERSION chaos_calmer
ENV OPENWRT_URL https://git.openwrt.org/openwrt/svn-archive/openwrt.git
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update;\
    apt-get install -y subversion wget libssl-dev build-essential libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext unzip python2.7 sudo &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone -b "${OPENWRT_VERSION}" "${OPENWRT_URL}" &&\
    sudo -iu openwrt openwrt/scripts/feeds update &&\
    sudo -iu openwrt openwrt/scripts/feeds install -a 
VOLUME /home/openwrt
CMD sudo -iu openwrt bash
