require 'server'

class TomcatServer < Server
  def fix
    "chmod +x #{app_server_home}/bin/*.sh"
  end

  def clean
    ["rm -rf #{deploy_dir}/#{project_name}*",
     "rm -f #{deploy_dir}/#{project_name}.war"]
  end

  def start
    ENV['JAVA_OPTS'] = '-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m'

    "#{app_server_home}/bin/startup.sh"
  end

  def stop
    "#{app_server_home}/bin/shutdown.sh"
  end

  def deploy
    "cp #{warfile} #{deploy_dir}/#{project_name}.war"
  end
end


