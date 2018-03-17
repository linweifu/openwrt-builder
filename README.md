# openwrt-builder
openwrt-builder docker

from ubuntu:latest
docker run -it --name openwrtbuilder -v ./openwrt:/home/openwrt/openwrt openwrt-builder
openwrt default version chaos_calmer
