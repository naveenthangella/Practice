FROM centos:7
RUN yum install epel-release -y
RUN yum install unzip -y
RUN yum install nginx -y
WORKDIR /usr/share/nginx/html/
RUN rm -rf *
ADD https://sample-html-naveen.s3-us-west-2.amazonaws.com/buson.zip /tmp/buson/buson.zip
#RUN unzip /tmp/buson/buson.zip /usr/share/nginx/html/
CMD systemctl start nginx
