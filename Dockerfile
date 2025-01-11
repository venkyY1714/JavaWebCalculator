
FROM tomcat:9-jdk17

LABEL maintainer="pudhvisurya996@gmail.com"

RUN useradd -ms /bin/bash jenkins

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chmod 755 /usr/local/tomcat/webapps/*.war

COPY target/*.war /usr/local/tomcat/webapps/

RUN chown -R jenkins:jenkins /usr/local/tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
