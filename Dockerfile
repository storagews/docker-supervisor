FROM ubuntu:14.04
#
MAINTAINER Alexander Shevchenko <kudato@me.com>
#
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
# timezone
RUN mv /etc/localtime  /etc/localtime-old && \
	ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
# apt update and upgrade system
RUN apt-get update && apt-get -y upgrade
# setup locales
RUN apt-get install -y locales
# setup supervisor
RUN apt-get install -y supervisor && \
    touch /etc/supervisor/conf.d/supervisord.conf && \
    echo "[supervisord]" >> /etc/supervisor/conf.d/supervisord.conf && \
    echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisord.conf
RUN apt-get clean
# - >
#CMD ["/entrypoint.sh"]
# or
#CMD ["/usr/bin/supervisord"]
