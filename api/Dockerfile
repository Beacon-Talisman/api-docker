                                    
FROM centos/systemd

MAINTAINER "Tony Edwardson" <tonye@talisman.tech>

ARG ssh_prv_key
ARG ssh_pub_key

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



# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub



RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN echo "Host earth.beacon.co.uk\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config


RUN git clone git@github.com:Beacon-Talisman/tal-api.git /tal-api

WORKDIR /tal-api

RUN git checkout -b timesheets_new origin/timesheets_new 

RUN echo echo DANCER_ENVIRONMENT=docker >> ~/.bashrc
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
EXPOSE 3806

CMD ["/usr/sbin/init"]
