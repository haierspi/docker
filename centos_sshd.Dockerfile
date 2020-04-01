FROM centos:latest

##########################################################################
### add epel repository
RUN yum install  -y  net-tools
RUN yum install  -y  wget


# RUN wget  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# RUN wget  https://centos7.iuscommunity.org/ius-release.rpm

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://centos7.iuscommunity.org/ius-release.rpm

##########################################################################
# all yum installations here
RUN  yum install -y openssh-server

##########################################################################
# passwords 
RUN echo "root:password" | chpasswd


EXPOSE 22
CMD service sshd start;

