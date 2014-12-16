# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'xcode_manager/version'

Gem::Specification.new do |s|
  s.name        = 'xcode_manager'
  s.authors     = ['Stan Chang Khin Boon']
  s.email       = 'me@lxcid.com'
  s.license     = 'MIT'
  s.homepage    = 'http://github.com/lxcid/xcode_manager'
  s.version     = XcodeManager::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Xcode Manager'
  s.description = 'A framework for writing automated tasks that manages Xcode projects.'

  s.add_dependency 'shenzhen', '~> 0.10'
  #s.add_dependency 'version_kit', '~> 0.0.1' # VersionKit is not publish, thus its dependency will be added through bundler instead.

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

  s.files         = Dir['./**/*'].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
