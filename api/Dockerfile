                                    
FROM centos/systemd

MAINTAINER "Tony Edwardson" <tonye@talisman.tech>

ARG github_username
ARG github_password

RUN yum -y install git
RUN yum -y install openssh-server
RUN yum -y install expat
RUN yum -y install expat-devel
RUN yum -y install libxml2
RUN yum -y install libxml2-devel
RUN yum -y install libxslt
RUN yum -y install libxslt-devel
RUN yum -y install wget
RUN yum -y install rsync
RUN yum -y install httpd
RUN yum -y install libaio
RUN yum -y install perl 
RUN yum -y install perl-local-lib
RUN yum -y install perl-App-cpanminus
RUN yum -y install perl-DBI
RUN yum -y install perl-DBD-MySQL
RUN yum -y install bzip2

# RUN git clone git@github.com:Beacon-Talisman/tal-api.git /tal-api
RUN git clone https://$github_username:$github_password@github.com/Beacon-Talisman/api-docker.git .

WORKDIR /tal-api

RUN git checkout -b vencuro_dev origin/vencuro_dev
RUN git pull

RUN echo export DANCER_ENVIRONMENT=docker >> ~/.bashrc
RUN perl -Mlocal::lib=/tal-api/perl5lib >> ~/.bashrc

COPY mariadb*.rpm /tal-api/
COPY setup_database.sh  /tal-api
COPY api_dev.sql.bz2 /tal-api

RUN yum -y install mariadb*.rpm
VOLUME talisman_data:/var/lib/mysql

RUN rm -rf /var/lib/mysql/*
RUN mkdir -p /var/lib/mysql/
RUN chown mysql:mysql /var/lib/mysql/
RUN systemctl enable mariadb
RUN echo 3000 > PORT
RUN yum -y update
RUN yum -y clean all

EXPOSE 3000
EXPOSE 3306

CMD ["/usr/sbin/init"]
