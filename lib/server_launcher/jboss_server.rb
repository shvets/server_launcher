require 'server_launcher/server'

class JBossServer < Server
  def fix
    "chmod +x #{app_server_home}/bin/*.sh"
  end

  def clean
    "rm -rf #{deploy_dir}/#{project_name}.war"
  end

  def stop
    #    #puts `#{app_server_home}/bin/jboss-admin.sh --connect command=:shutdown`
    "#{app_server_home}/bin/shutdown.sh -S"
  end

  def start
    #"LAUNCH_JBOSS_IN_BACKGROUND=true #{app_server_home}/bin/standalone.sh"

    ENV['JAVA_OPTS'] = '-server -Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'

    "#{app_server_home}/bin/run.sh > #{logfile} 2>&1 &"
  end

  def deploy
    result = ["cp #{warfile} #{deploy_dir}/#{project_name}.war"]

    result << "cp #{datasource_file_name} #{deploy_dir}/#{File.basename(datasource_file_name)}" if
        respond_to? :datasource_file_name

    result
  end

end


