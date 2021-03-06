# -*- encoding: utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/lib/server_launcher/version')

Gem::Specification.new do |spec|
  spec.name          = "server_launcher"
  spec.summary       = %q{Convenient classes to manage servers from rake}
  spec.description   = %q{Convenient classes to manage servers from rake}
  spec.email         = "alexander.shvets@gmail.com"
  spec.authors       = ["Alexander Shvets"]
  spec.homepage      = "http://github.com/shvets/server_launcher"

  spec.files         = `git ls-files`.split($\)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.version       = ServerLauncher::VERSION

  spec.add_runtime_dependency "meta_methods", [">= 0"]
  spec.add_runtime_dependency "file_utils", [">= 0"]
  spec.add_development_dependency "gemspec_deps_gen", [">= 0"]
  spec.add_development_dependency "gemcutter", [">= 0"]
  
end

