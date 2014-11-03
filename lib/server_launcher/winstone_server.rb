# require 'server_launcher/server'
#
# class WinstoneServer < Server
#
#   def start
#     "winstone --httpPort=#{port} --controlPort=#{control_port} --useSavedSessions --warfile=#{warfile} > #{logfile}
# 2>&1 &"
#   end
#
#   def start_exploded
#     "winstone --httpPort=#{port} --controlPort=#{control_port} --useSavedSessions --webroot=#{webroot} > #{logfile}
# 2>&1"
#   end
#
#   def stop
#     "winstone tool winstone.tools.WinstoneControl shutdown --host=#{host_name} --port=#{control_port}"
#   end
#
#   def reload
#     "winstone tool winstone.tools.WinstoneControl reload: --host=#{host_name} --port=#{control_port}"
#   end
#
# end