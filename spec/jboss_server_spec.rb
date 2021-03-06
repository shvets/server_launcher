require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'server_launcher/jboss_server'

describe JBossServer do

  before do
    jboss_version   = "6.1.0.Final"
    app_server_home = "#{ENV['HOME']}/jboss-#{jboss_version}"
    deploy_dir      = "#{app_server_home}/server/default/deploy"

    project_name = "test"
    warfile = "build/#{project_name}.war"

    logfile = "#{app_server_home}/server/default/log/server.log"

    @server = JBossServer.new(:app_server_home => app_server_home, :deploy_dir => deploy_dir,
                              :project_name => project_name, :warfile => warfile, :logfile => logfile)
  end

  it "should build fix command" do
    expect(@server.fix).to match /chmod \+x/
  end

  it "should build clean command" do
    expect(@server.clean).to match /rm -rf /
  end

  it "should build stop command" do
    expect(@server.stop).to match /shutdown.sh -S/
  end

  it "should build start command" do
    expect(@server.start).to match /bin\/run.sh/
  end

  it "should build deploy command" do
    expect(@server.deploy.first).to match /cp\s/
  end
end


