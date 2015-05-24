# coding: utf-8
require File.expand_path('../lib/cloud/version', __FILE__)

version = Bosh::OpenCrowbar::VERSION

Gem::Specification.new do |s|
  s.name        = 'bosh_crowbar_cpi'
  s.version     = version
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'BOSH Opencrowbar CPI'
  s.description = "BOSH Opencrowbar CPI\n#{`git rev-parse HEAD`[0, 6]}"
  s.author      = 'RackN'
  s.homepage    = 'https://github.com/rackn/bosh'
  s.license     = 'Apache 2.0'
  s.email       = 'support@rackn.com'
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.3')

  s.files        = `git ls-files -- lib/*`.split("\n")
  s.require_path = 'lib'

  s.add_dependency 'bosh_common', "~>#{version}"
  s.add_dependency 'membrane',    '~>1.1.0'
  s.add_dependency 'logging',     '~>1.8.2'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-its'
end
