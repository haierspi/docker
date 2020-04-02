FROM centos:7

RUN yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y update

##########################################################################
### add epel repository
RUN yum install  -y  net-tools
RUN yum install  -y  wget


# RUN wget  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN wget  https://centos7.iuscommunity.org/ius-release.rpm



##########################################################################
# all yum installations here
RUN  yum install -y openssh-server

##########################################################################
# passwords 
RUN echo "root:password" | chpasswd


EXPOSE 22
CMD systemctl restart  sshd.service;
RUN cat /etc/redhat-release

# docker build  -t haierspi/centos_latest_sshd:v1 -f centos_sshd.Dockerfile .


# docker run --privileged -d --name centos_centos7 -v D:/Dev/Dev.Data/www:/home/webApps centos:centos7 /sbin/init
