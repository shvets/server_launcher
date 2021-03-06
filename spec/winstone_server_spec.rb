
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'server_launcher/winstone_server'

describe WinstoneServer do

  before do
    host_name    = ENV['HOST_NAME'] || "localhost"
    port         = ENV['PORT'] || "3002"
    control_port = ENV['CONTROL_PORT'] || "3000"
    webroot = "build/exploded"

    project_name = "test"
    warfile = "build/#{project_name}.war"

    logfile = "logs/test-app.log"

    @server = WinstoneServer.new(:host_name => host_name, :port => port, :control_port => control_port,
                                 :webroot => webroot, :warfile => warfile, :logfile => logfile)
  end

  it "should build stop command" do
    expect(@server.stop).to match /winstone tool winstone.tools.WinstoneControl shutdown/
  end

  it "should build start command" do
    expect(@server.start).to match /--warfile=build\/test.war/
  end

  it "should build start_exploded command" do
    expect(@server.start_exploded).to match /--webroot=build\/exploded/
  end

  it "should build reload command" do
    expect(@server.reload).to match /reload: --host=localhost/
  end
end