#!/bin/sh

#######################################
[tomcat_fix]
# fix tomcat server

chmod +x #{tomcat.home}/bin/*.sh


#######################################
[tomcat_clean]
# clean tomcat server

rm -rf #{tomcat.deploy_dir}/#{project.project_name}
rm -f #{tomcat.deploy_dir}/#{project.project_name}.war


#######################################
[tomcat_start]
# start tomcat server

JAVA_OPTS='-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'

#{tomcat.home}/bin/startup.sh


#######################################
[tomcat_stop]
# stop tomcat server

#{tomcat.home}/bin/shutdown.sh


#######################################
[tomcat_deploy]
# deploy web application into tomcat server

cp #{project.warfile} #{tomcat.deploy_dir}/#{project.project_name}.war


#######################################
[jboss_fix]
# fix jboss server

chmod +x #{jboss.home}/bin/*.sh


#######################################
[jboss_clean]
# clean jboss server

rm -rf #{jboss.deploy_dir}/#{project_name}.war


#######################################
[jboss_start]
# start jboss server

#"LAUNCH_JBOSS_IN_BACKGROUND=true #{app_server_home}/bin/standalone.sh"

JAVA_OPTS='-server -Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'

#{jboss.home}/bin/run.sh > #{jboss.logfile} 2>&1 &


#######################################
[jboss_stop]
# stop jboss server

#puts `#{jboss.home}/bin/jboss-admin.sh --connect command=:shutdown`

#{jboss.home}/bin/shutdown.sh -S

#######################################
[jboss_deploy]
# deploy web application into tomcat server

cp #{project.warfile} #{project.deploy_dir}/#{project.project_name}.war

cp #{jboss.datasource_file_name} #{project.deploy_dir}/#{File.basename(jboss.datasource_file_name)}


#######################################
[winstone_start]
# start winstone server

winstone --httpPort=#{winstone.port} --controlPort=#{winstone.control_port} --useSavedSessions --warfile=#{project.warfile} > #{winstone.logfile} 2>&1 &


#######################################
[winstone_start_exploded]
# start winstone server exploded

winstone --httpPort=#{winstone.port} --controlPort=#{winstone.control_port} --useSavedSessions --webroot=#{winstone.webroot} > #{winstone.logfile} 2>&1"


#######################################
[winstone_stop]
# stop winstone server

winstone tool winstone.tools.WinstoneControl shutdown --host=#{winstone.host_name} --port=#{winstone.control_port}"


#######################################
[winstone_reload]
# reload winstone server

winstone tool winstone.tools.WinstoneControl reload: --host=#{winstone.host_name} --port=#{winstone.control_port}"
