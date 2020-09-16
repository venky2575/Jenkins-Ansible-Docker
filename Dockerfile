FROM tomcat:8
#Copying Wars
COPY target/*.war /usr/local/tomcat/webapps/
