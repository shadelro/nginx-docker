# Specify base image
FROM centos

# Install base dependencies
ADD conf/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum update -y
RUN yum install -y nginx

# Configure nginx
RUN rm /etc/nginx/conf.d/*
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/vhost.conf /etc/nginx/conf.d/vhost.conf

# Create a "rails" user
RUN adduser --home=/web web

CMD /usr/sbin/nginx
