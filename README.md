# ServerLauncher - Convenient classes to manage servers from rake

## Installation

Add this line to your application's Gemfile:

    gem 'server_launcher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install server_launcher

## Usage

server = TomcatServer.new(:app_server_home => app_server_home, :deploy_dir => deploy_dir,
                           :project_name => project_name, :warfile => warfile, :logfile => logfile)

server.execute :start
server.execute :stop
server.execute :deploy


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request