#!/bin/sh

#######################################
[tomcat_fix]
# fix tomcat

chmod +x #{app_server_home}/bin/*.sh


#######################################
[tomcat_clean]
# clean tomcat

rm -rf #{deploy_dir}/#{project_name}
rm -f #{deploy_dir}/#{project_name}.war


#######################################
[tomcat_start]
# start tomcat

JAVA_OPTS='-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'

AAA="#{tomcat.app_server_home}"
echo $AAA
echo "alex"
echo "#{tomcat.app_server_home}"
echo #{app_server_home}/bin/startup.sh


#######################################
[tomcat_stop]
# stop tomcat

#{app_server_home}/bin/shutdown.sh


#######################################
[tomcat_deploy]
# deploy tomcat

cp #{warfile} #{deploy_dir}/#{project_name}.war


