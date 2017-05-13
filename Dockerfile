FROM centos:7

# MAINTAINER Sten Turpin <sten@redhat.com>

ENV REPORT_STATS yes

LABEL io.k8s.description="Serves the Riot interface for Matrix" \
      io.k8s.display-name="build matrix riot" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="matrix,riot,vector"

RUN yum install -y python && yum clean all -y

RUN cd /srv/ ; curl -qL https://github.com/vector-im/riot-web/releases/download/v0.9.8/vector-v0.9.8.tar.gz | tar xzf - ; mv vector-v0.9.8 riot

COPY start.sh /srv/

EXPOSE 8000

CMD ["/srv/start.sh" ]
