FROM ubuntu:16.04
MAINTAINER ccatlett2000@mctherealm.net

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y opendkim rsyslog \
  && touch /var/log/mail.log \
  && chown syslog:syslog /var/log/mail.log \
  && rm -rf /etc/opendkim/ \
  && rm -rf /etc/dkimkeys

ADD config/ /etc/opendkim/
ADD dkimkeys/ /etc/dkimkeys/

ADD start.sh /
RUN  chmod +x /start.sh
CMD ["/start.sh"]
