FROM tomcat:9-jdk17

RUN useradd -ms /bin/bash jenkins
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy the WAR file from the target directory into Tomcat's webapps folder
COPY target/*.war /usr/local/tomcat/webapps/

# Apply permissions to the copied WAR file(s)
RUN chmod 755 /usr/local/tomcat/webapps/*.war

# Ensure Jenkins user owns the necessary files
RUN chown -R jenkins:jenkins /usr/local/tomcat/webapps

# Expose the Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
