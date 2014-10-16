FROM debian:wheezy
MAINTAINER Ahmet Demir <ahmet2mir+github@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RELEASE wheezy
ENV SHELL /bin/bash
ENV VERSION 3.7.1-1puppetlabs1

RUN echo "deb http://ftp.fr.debian.org/debian $RELEASE main contrib non-free" > /etc/apt/sources.list;\
	echo "deb http://ftp.debian.org/debian/ $RELEASE-updates main contrib non-free" >> /etc/apt/sources.list;\
	echo "deb http://security.debian.org/ $RELEASE/updates main contrib non-free" >> /etc/apt/sources.list;\
	apt-get update


RUN apt-get install -y --no-install-recommends wget ca-certificates

RUN wget -q https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb -O /tmp/puppetlabs.deb;\
	dpkg -i /tmp/puppetlabs.deb;\
	apt-get update

RUN apt-get install -y --no-install-recommends puppet=$VERSION

COPY init.sh /init.sh
COPY conf/puppet.conf /etc/puppet/puppet.conf

CMD ["/bin/bash","/init.sh"]

