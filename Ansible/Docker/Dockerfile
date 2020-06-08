FROM centos:7
RUN yum install epel-release -y
RUN yum install nginx -y
WORKDIR /usr/share/nginx/html/
RUN rm -rf *
ADD https://sample-html-naveen.s3-us-west-2.amazonaws.com/buson.zip /tmp/buson/
RUN unzip /tmp/buson/buson.zip .
RUN systemctl start nginx
