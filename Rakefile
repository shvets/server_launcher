#!/usr/bin/env rake

$LOAD_PATH.unshift File.expand_path("lib", File.dirname(__FILE__))

require "rspec/core/rake_task"
require "server_launcher/version"
require "gemspec_deps_gen/gemspec_deps_gen"

def version
  ZipDSL::VERSION
end

def project_name
  File.basename(Dir.pwd)
end

task :build do
  generator = GemspecDepsGen.new

  generator.generate_dependencies "#{project_name}.gemspec.erb", "#{project_name}.gemspec"

  system "gem build #{project_name}.gemspec"
end

task :release => :build do
  system "gem push #{project_name}-#{version}.gem"
end

RSpec::Core::RakeTask.new do |task|
  task.pattern = 'spec/**/*_spec.rb'
  task.verbose = false
end



#require File.expand_path('../config/application', __FILE__)
#
#JrubyRailsDemo::Application.load_tasks
#
#require 'interrupt_test'
#
#task :"chef:example" do
#  `chef-solo -c config/solo.rb -j config/node.json`
#end
#
#if RUBY_PLATFORM == "java"
#  $: << "vendor/gems/web_app_builder-1.0.0/lib"
#  $: << "vendor/gems/java_servers-1.0.0/lib"
#
#  require File.expand_path('../config/initializers/env_variables', __FILE__)
#
#  require 'web_app_builder/web_app_builder'
#  require 'winstone_server'
#  require 'tomcat_server'
#  require 'jboss_server'
#  require 'zip/zip'
#
#  builder = WebAppBuilder.new(".", "build")
#
#  task :default => [:"project:clean"]
#
#  namespace :project do
#    task :init do
#      builder.configure
#      ENV['RAILS_ENV'] = builder.config[:rails_env]
#    end
#
#    desc "Cleans the project"
#    task :clean do
#      # puts `rm -Rf build`
#      builder.clean
#      puts
#    end
#
#    task :prepare => [:init] do
#      builder.prepare
#      puts `mv build/oracle_jndi.yml config`
#      puts
#    end
#
#    task :war => [:prepare] do
#      builder.war
#      puts
#    end
#
#    task :"war:exploded" => [:prepare] do
#      builder.war
#      puts
#    end
#
#    task :warble => [:init] do
#      puts `warble`
#
#      Zip::ZipFile.open("#{builder.config[:project_name]}.war") do |zipfile|
#        zipfile.add("META-INF/context.xml", "build/context.xml")
#      end
#    end
#
#    desc "used for starting exploded web application"
#    task :"war:exploded" => [:prepare] do
#      builder.war_exploded
#      puts
#    end
#
#    task :"war:all" => [:clean, :war]
#
#    task :"exploded:all" => [:clean, :"war:exploded"]
#  end
#
#  namespace :winstone do
#    host         = ENV['HOST_NAME'] || "localhost"
#    port         = ENV['PORT'] || "3002"
#    control_port = ENV['CONTROL_PORT'] || "3000"
#
#    #builder.configure
#
#    #server = WinstoneServer.new(builder.config.merge(:host => host, :port => port,
#    #                            :warfile => "build/#{builder.config[:project_name]}.war", :webroot => "build/exploded",
#    #                            :logfile => "log/#{Rails.env}-winstone.log", :control_port => control_port))
#    #[:start, :start_exploded, :stop, :reload].each do |command|
#    #  task(command) do
#    #    server.execute command
#    #  end
#    #end
#  end
#
#  namespace :tomcat do
#    tomcat_version = "7.0.27"
#    tomcat_home    = ENV['TOMCAT_HOME'] || "#{ENV['HOME']}/apache-tomcat-#{tomcat_version}"
#    deploy_dir = "#{tomcat_home}/webapps"
#
#    #builder.configure
#
#    #server = TomcatServer.new(builder.config.merge(:app_server_home => tomcat_home, :deploy_dir => deploy_dir,
#    #                                               :project_name => 'ROOT',
#    #                                               :warfile => "#{builder.config[:project_name]}.war",
#    #                                               :logfile => "log/#{Rails.env}-tomcat.log"))
#    #[:fix, :clean, :start, :stop, :deploy].each do |command|
#    #  task(command) do
#    #    server.execute command
#    #  end
#    #end
#
#    task :all => [:"project:clean", :"project:prepare", :"project:warble", :stop, :clean, :deploy, :start]
#
#    task :restart => [:stop, :start]
#  end
#
#  namespace :jboss do
#    jboss_version   = "6.1.0.Final"
#    jboss_home      = "#{ENV['HOME']}/jboss-#{jboss_version}"
#    deploy_dir = "#{jboss_home}/server/default/deploy"
#
#    task :init do
#      builder.configure
#
#      ds_file_name = case builder.config[:rails_env]
#                       when 'development'
#                         "postgres-ds.xml"
#                       when 'production'
#                         "oracle-ds.xml"
#                       else
#                         "mysql-ds.xml"
#                     end
#
#      ENV['RAILS_ENV'] = builder.config[:rails_env]
#
#      @jboss_server = JbossServer.new(builder.config.merge(:app_server_home => jboss_home, :deploy_dir => deploy_dir,
#                                                           :datasource_file_name => "#{builder.build_dir}/#{ds_file_name}",
#                                                           :warfile => "build/#{builder.config[:project_name]}.war",
#                                                           :logfile => "#{jboss_home}/server/default/log/server.log"))
#    end
#
#    [:fix, :clean, :start, :stop, :deploy].each do |command|
#      task(command) do
#        Rake::Task[:"jboss:init"].invoke
#        @jboss_server.execute command
#      end
#    end
#
#    task :redeploy => [:"project:war:all", :clean, :deploy]
#
#    task :all => [:"project:war:all", :stop, :clean, :deploy, :start]
#
#    task :restart => [:stop, :start]
#  end
#
#  task :start do
#    puts `rails s`
#  end
#
#  task :start_staging do
#    puts `RAILS_ENV=staging rails s`
#  end
#
#  task :start_signoff do
#    puts `RAILS_ENV=signoff rails s`
#  end
#
#  task :start19 do
#    puts `JRUBY_OPTS=--1.9 rails s`
#  end
#
#  require 'tasks/rspec'
#  require 'tasks/db_tests'
#end


