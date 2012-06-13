require 'meta_methods'

class Server
  include MetaMethods

  def initialize params
    define_attributes(:attr_reader, self, params, false)
  end

  def execute method_name
    puts "Target: '#{method_name}'."

    method = self.class.instance_method(method_name)

    result = method.bind(self).call()

    if result.kind_of? String
      commands = [result]
    else
      commands = result
    end

    commands.each do |command|
      puts "Executing '#{command}'..."

      execute_command(command)
    end
  end

  def execute_command(command)
    output = nil
    error = nil
    status = nil

    Open3.popen3(command) do |_, stdout, stderr|
      output = stdout.readlines
      error = stderr.readlines
      status = $?
    end

    puts "Output:\n #{output}" if output && output.size > 0
    puts "Error: #{error}" if error && error.size > 0
    puts "Status: #{status}" if status && status.to_s.to_i > 0
  end

end