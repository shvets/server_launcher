require 'script_executor/base_provision'

class ServersProvision < BaseProvision
  # USER_LOCAL_BIN = "/usr/local/bin"

  def initialize parent_class, config_file_name=".servers.json", scripts_file_names=[]
    scripts_file_names.unshift(File.expand_path("servers_scripts.sh", File.dirname(__FILE__))) # make it first

    super
  end
end
