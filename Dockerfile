# "ported" to OpenShift 3 in restricted mode by Julien von Siebenthal <jsiebenthal@smart-tree.ch>
#
# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER Julien von Siebenthal <jsiebenthal@smart-tree.ch> 

USER root

RUN  yum -y update && yum clean all

COPY ./install.sh /tmp/install.sh

RUN /bin/sh /tmp/install.sh && rm -f  /tmp/install.sh

EXPOSE  5984

USER 997

WORKDIR /usr/local/couchdb/var/lib/couchdb

CMD ["/bin/bash", "-e", "/usr/local/couchdb/bin/couchdb", "start"]
