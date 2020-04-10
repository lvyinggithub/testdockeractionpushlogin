FROM centos:centos7
RUN yum -y update
RUN yum -y update
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-12.noarch.rpm
RUN yum install -y expect redis-server ansible java-1.7.0-openjdk wget unzip openssh-clients gcc-c++ make ruby ruby-rdoc ruby-devel jq
RUN yum install -y gcc-c++ make
RUN yum install -y golang
RUN yum install -y docker

ADD . ./
# Create root2 account
RUN	useradd -d /root2 -m -s /bin/bash -U root2
ADD ./buildAndPushDocker.sh  /root2/buildAndPushDocker.sh
#ADD ./main.go  /root2/main.go
RUN chown -R root2:root2 /root2/buildAndPushDocker.sh
RUN chmod 777 /root2/buildAndPushDocker.sh
RUN chmod 777 /root2/*
USER	root2
WORKDIR /root2
ENTRYPOINT ["/root2/buildAndPushDocker.sh"]
#CMD ["/root2/buildAndPushDocker.sh"]
