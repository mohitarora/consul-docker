FROM mohitarora/consul-no-ui

RUN yum -y install java-1.7.0-openjdk

RUN /bin/mkdir -p /application

ADD ./dropwizard-sample-1.0-SNAPSHOT.jar /application/dropwizard-sample-1.0-SNAPSHOT.jar

ADD ./sample.yml /application/sample.yml

# Add startup file
ADD ./app.sh /application/app.sh
RUN chmod +x /application/app.sh

# Expose consul ports
EXPOSE 8080

# Entry point of container
ENTRYPOINT ["/application/app.sh"]