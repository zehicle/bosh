require File.expand_path('../../../spec/shared_spec_helper', __FILE__)

require 'cloud'
require 'logging'
require 'bosh/cpi'

# add the spec/lib to load path so we can find the dummy provider
$:.unshift(File.expand_path('../lib', __FILE__))

class CloudSpecConfig
  attr_accessor :db, :uuid

  def logger
    if @logger.nil?
      @logger = Logging.logger(STDOUT)
      @logger.level = :error
    end
    @logger
  end

  def uuid
    @uuid ||= self.class.name
  end
end

Bosh::OpenCrowbar::Config.configure(CloudSpecConfig.new)
