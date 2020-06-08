FROM nginx
WORKDIR /usr/share/nginx/html/
RUN rm -rf *
ADD https://sample-html-naveen.s3-us-west-2.amazonaws.com/buson.zip /tmp/buson/buson.zip
ADD /tmp/buson/buson.zip /usr/share/nginx/html/
