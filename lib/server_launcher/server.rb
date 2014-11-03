# require 'meta_methods/core'
# require 'file_utils'
#
# class Server
#   include MetaMethods::Core
#   include FileUtils
#
#   def initialize params={}
#     define_attributes(self, params)
#   end
#
#   def execute method_name, *args
#     puts "Target: '#{method_name}'."
#
#     method = self.class.instance_method(method_name)
#
#     if args.empty?
#       result = method.bind(self).call()
#     else
#       result = method.bind(self).call(args.join(" "))
#     end
#
#     if result.kind_of? String
#       commands = [result]
#     else
#       commands = result
#     end
#
#     commands.each do |command|
#       puts "Executing '#{command}'..."
#
#       output, error, status = *execute_command(command)
#
#       puts "Output:\n #{output.join(" ")}" if output && output.size > 0
#       puts "Error: #{error.join(" ")}" if error && error.size > 0
#       puts "Status: #{status}" if status && status.to_s.to_i > 0
#     end
#   end
#
# end