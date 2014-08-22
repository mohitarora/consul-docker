cd /etc/nginx/conf.d

cat > sample-app.conf <<_EOF_
server {
    listen *:80;
    server_name sample.test.com;
    access_log /var/log/nginx/sample-app.log;

    location / {
      proxy_pass          http://backend;
      proxy_read_timeout  90;
      proxy_connect_timeout  90;
      proxy_redirect  off;
      proxy_set_header        Host \$host;
      proxy_set_header        X-Real-IP \$remote_addr;
      proxy_set_header        X-Forwarded-For \$proxy_add_x_forwarded_for;
      proxy_set_header X-NginX-Proxy true;
      
    }
}
_EOF_

cat > backend-upstream.conf <<_EOF_
upstream backend {
      server localhost fail_timeout=10s;
}
_EOF_

echo "DONE!"