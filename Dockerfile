# iTopPlus
FROM jordan/icinga2
MAINTAINER BankiTopPlus


ENV DEBIAN_FRONTEND noninteractive
# Install packages
RUN apt-get -y update \
    && apt-get -y upgrade
RUN	apt-get -y install mailutils ssmtp
RUN apt-get --no-install-recommends -y install nagios-nrpe-plugin
COPY commands.conf /etc/icinga2/conf.d/commands.conf
COPY 192-168-1-126.conf /etc/icinga2/conf.d/
COPY bank.conf /etc/icinga2/conf.d/
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

EXPOSE 80 443 5665
