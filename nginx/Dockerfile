FROM mohitarora/consul

# Install nginx
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx

# Add a nginx proxy to route traffic to backend applications
ADD ./add-proxy.sh /tmp/add-proxy.sh
RUN chmod +x /tmp/add-proxy.sh
RUN /tmp/add-proxy.sh

# Add consul-watch so that dynamic backend applications gets registered with nginx
ADD ./consul-watch /bin/consul-watch
RUN chmod +x /bin/consul-watch

# Add consul watch config
ADD ./consul-watch-config /consul-watch/

# Expose consul ports
EXPOSE 80

# Entry point of container
ENTRYPOINT ["/consul-watch/watch.sh"]