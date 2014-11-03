$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'server_launcher/servers_provision'

class Servers < Thor
  @installer = ServersProvision.new self, ".servers.json"

  class << self
    attr_reader :installer
  end

end
