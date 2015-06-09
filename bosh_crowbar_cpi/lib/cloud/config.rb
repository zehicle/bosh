# Copyright (c) 2015 RackN, Inc.
# Provisder under Apache 2 License

require 'forwardable'

module Bosh::Crowbar
  class Config

    class << self
      extend Forwardable
      def_delegators :@delegate, :db, :logger, :uuid, :uuid=, :task_checkpoint, :cpi_task_log
    end

    # @param [Bosh::Director::Config] config director config file
    def self.configure(config)
      @delegate = config
    end

  end
end
