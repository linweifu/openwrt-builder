FROM ubuntu:trusty

ENV OPENWRT_VERSION v17.01.4
ENV OPENWRT_URL https://git.openwrt.org/openwrt/openwrt.git
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update;\
    apt-get install -yqq ccache subversion wget libssl-dev build-essential libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext unzip python2.7 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone --depth 1 --branch "${OPENWRT_VERSION}" "${OPENWRT_URL}" &&\
    sudo -iu openwrt git config --global http.postBuffer 524288000 &&\
    sudo -iu openwrt openwrt/scripts/feeds update 

VOLUME /home/openwrt
USER openwrt
WORKDIR /home/openwrt/openwrt
CMD bash
