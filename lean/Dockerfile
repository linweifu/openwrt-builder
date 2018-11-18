FROM ubuntu:trusty

ENV OPENWRT_VERSION master
ENV OPENWRT_URL https://github.com/coolsnowwolf/lede.git
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update;\
    apt-get install -yqq ccache subversion git-core git \
    libncurses5-dev libz-dev libssl-dev zlib1g-dev lib32gcc1 libc6-dev-i386 libglib2.0-dev \
    p7zip p7zip-full bzip2 unzip \
    wget patch build-essential  \
    asciidoc binutils uglifyjs msmtp texinfo xmlto qemu-utils \
    gawk gcc-multilib flex gettext python2.7 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt git clone --depth 1 --branch "${OPENWRT_VERSION}" "${OPENWRT_URL}" openwrt &&\
    sudo -iu openwrt git config --global http.postBuffer 524288000 &&\
    sudo -iu openwrt openwrt/scripts/feeds update -a &&\
    sudo -iu openwrt openwrt/scripts/feeds install -a
VOLUME /home/openwrt/openwrt
USER openwrt
WORKDIR /home/openwrt/openwrt
CMD bash
