require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'server_launcher/server'

class MyServer < Server
  def stop
    puts "Calling stop method without parameter."

    'ls'
  end
  def start param
    puts "Calling start method with parameter #{param}."

    param
  end
end

describe MyServer do

  it "should execute command without parameter" do
    subject.execute(:stop).should == ["ls"]
  end

  it "should execute command with parameter" do
    subject.execute(:start, "ls").should == ["ls"]
  end

end


