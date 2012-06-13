require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'server_launcher/tomcat_server'

describe TomcatServer do

  before do
    tomcat_version = "7.0.27"
    app_server_home    = "/usr/local/Cellar/tomcat/#{tomcat_version}/libexec"
    deploy_dir = "#{app_server_home}/webapps"

    project_name = "test"
    warfile = "build/#{project_name}.war"

    logfile = "#{app_server_home}/logs/test-app.log"

    @server = TomcatServer.new(:app_server_home => app_server_home, :deploy_dir => deploy_dir,
                               :project_name => project_name, :warfile => warfile, :logfile => logfile)
  end

  it "should build fix command" do
    @server.fix.should =~ /chmod \+x/
  end

  it "should build clean command" do
    @server.clean.first.should =~ /rm -rf /
  end

  it "should build stop command" do
    @server.stop.should =~ /shutdown.sh/
  end

  it "should build start command" do
    @server.start.should =~ /bin\/startup.sh/
  end

  it "should build deploy command" do
    @server.deploy.should =~ /cp\s/
  end
end


