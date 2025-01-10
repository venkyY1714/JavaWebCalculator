#!/bin/bash

# Define the source and destination paths
SOURCE="/var/lib/jenkins/workspace/pipeline1/target/webapp-0.1.war"
DESTINATION="/opt/tomcat/webapps/"

# Copy the WAR file to the Tomcat webapps directory
echo "Copying WAR file to Tomcat webapps directory..."
cp "$SOURCE" "$DESTINATION"

# Change to the Tomcat bin directory
cd /opt/tomcat/bin || exit

# Start the Tomcat server
echo "Starting Tomcat server..."
sh startup.sh

echo "Process completed."
